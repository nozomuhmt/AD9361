/***************************************************************************//**
 *   @file   iio_trigger_example.c
 *   @brief  Implementation of IIO trigger example for eval-adis project.
 *   @author RBolboac (ramona.bolboaca@analog.com)
********************************************************************************
 * Copyright 2022(c) Analog Devices, Inc.
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *  - Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  - Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *  - Neither the name of Analog Devices, Inc. nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *  - The use of this software may or may not infringe the patent rights
 *    of one or more patent holders.  This license does not release you
 *    from the requirement that you obtain separate licenses from these
 *    patent holders to use this software.
 *  - Use of the software either in source or binary form, must be run
 *    on or directly connected to an Analog Devices Inc. component.
 *
 * THIS SOFTWARE IS PROVIDED BY ANALOG DEVICES "AS IS" AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, NON-INFRINGEMENT,
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL ANALOG DEVICES BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, INTELLECTUAL PROPERTY RIGHTS, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*******************************************************************************/

/******************************************************************************/
/***************************** Include Files **********************************/
/******************************************************************************/
#include "iio_trigger_example.h"
#include "no_os_print_log.h"
#include "common_data.h"

/******************************************************************************/
/********************** Macros and Constants Definitions **********************/
/******************************************************************************/
#define DATA_BUFFER_SIZE 400

/******************************************************************************/
/************************ Variable Declarations ******************************/
/******************************************************************************/
uint8_t iio_data_buffer[DATA_BUFFER_SIZE*14*sizeof(int)];

/******************************************************************************/
/************************ Functions Definitions *******************************/
/******************************************************************************/
/***************************************************************************//**
 * @brief IIO trigger example main execution.
 *
 * @return ret - Result of the example execution. If working correctly, will
 *               execute continuously function iio_app_run_with_trigs and will
 * 				 not return.
 ********************************************************************************/
int iio_trigger_example_main()
{
	int ret;
	struct adis_iio_dev *adis16505_iio_desc;
	struct iio_data_buffer data_buff = {
		.buff = (void *)iio_data_buffer,
		.size = DATA_BUFFER_SIZE*14*sizeof(int)
	};

	struct iio_hw_trig *adis16505_trig_desc;
	struct no_os_irq_ctrl_desc *adis16505_irq_desc;
	struct iio_app_desc *app;
	struct iio_app_init_param app_init_param = { 0 };

	ret = adis16505_iio_init(&adis16505_iio_desc, &adis16505_ip);
	if (ret)
		return ret;

	/* Initialize interrupt controller */
	ret = no_os_irq_ctrl_init(&adis16505_irq_desc, &adis16505_gpio_irq_ip);
	if (ret)
		goto err_irq_init;

	ret = no_os_irq_set_priority(adis16505_irq_desc, adis16505_gpio_trig_ip.irq_id,
				     1);
	if (ret)
		goto err_irq_set_prio;

	adis16505_gpio_trig_ip.irq_ctrl = adis16505_irq_desc;

	/* Initialize hardware trigger */
	ret = iio_hw_trig_init(&adis16505_trig_desc, &adis16505_gpio_trig_ip);
	if (ret)
		goto err_irq_set_prio;

	/* List of devices */
	struct iio_app_device iio_devices[] = {
		{
			.name = "adis16505-2",
			.dev = adis16505_iio_desc,
			.dev_descriptor = adis16505_iio_desc->iio_dev,
			.read_buff = &data_buff,
		}
	};

	/* List of triggers */
	struct iio_trigger_init trigs[] = {
		IIO_APP_TRIGGER(ADIS16505_GPIO_TRIG_NAME, adis16505_trig_desc,
				&adis_iio_trig_desc)
	};

	app_init_param.devices = iio_devices;
	app_init_param.nb_devices = NO_OS_ARRAY_SIZE(iio_devices);
	app_init_param.uart_init_params = adis16505_uart_ip;
	app_init_param.trigs = trigs;
	app_init_param.nb_trigs = NO_OS_ARRAY_SIZE(trigs);
	app_init_param.irq_desc = adis16505_irq_desc;

	ret = iio_app_init(&app, app_init_param);
	if (ret)
		goto err_iio_app_init;

	// update the reference to iio_desc
	adis16505_trig_desc->iio_desc = app->iio_desc;

	ret = iio_app_run(app);
	if (ret)
		goto iio_app_err;

	return 0;

iio_app_err:
	iio_app_remove(app);
err_iio_app_init:
	iio_hw_trig_remove(adis16505_trig_desc);
err_irq_set_prio:
	no_os_irq_ctrl_remove(adis16505_irq_desc);
err_irq_init:
	adis16505_iio_remove(adis16505_iio_desc);
	pr_info("Error!\n");
	return ret;
}
