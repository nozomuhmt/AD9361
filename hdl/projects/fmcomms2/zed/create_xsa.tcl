# create_xsa.tcl

open_project fmcomms2_zed.xpr
reset_run impl_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
write_hw_platform -fixed -force -include_bit -file fmcomms2_zed.xsa
