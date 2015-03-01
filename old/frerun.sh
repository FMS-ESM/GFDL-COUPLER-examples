#!/bin/bash
#fremake -F -p ncrc2.intel -x $HOME/model/hindcast_cm25_lo_sstn/2012_TS/input_cm25_lo/hi9ndcast.xml awgp2
CWD=`pwd`
echo ${CWD}
#frerun -q urgent -r basic -p ncrc2.intel -o -x  $HOME/model/hindcast_cm25_lo/input_cm25_lo/hindcast.xml CM2.5_lo_nudg_xiang
#frerun -q urgent -p ncrc2.intel -o -x  $HOME/model/hindcast_cm25_lo_sstn/input_cm25_lo/hindcast.xml cm_dpc_nudg
#frerun -S -q urgent -p ncrc2.intel -o -x  $HOME/model/hindcast_cm25_lo_sstn/input_cm25_lo/hindcast.xml cm_dpc_nudg_2011
#frerun -S -q urgent -p ncrc2.intel -o -x  $HOME/model/hindcast_cm25_lo_sstn/input_cm25_lo/hindcast.xml cm_gen_ens_20121001
#frerun -q urgent -p ncrc2.intel -o -x  $HOME/model/hindcast_cm25_lo_sstn/input_cm25_lo/hindcast.xml cm_gen_ens_20121014
#frerun -q urgent -p ncrc2.intel -o -x  $HOME/model/hindcast_cm25_lo_sstn/input_cm25_lo/hindcast.xml cm_hiram_nudg_2012
#frerun -q urgent -p ncrc2.intel -o -x  $HOME/model/hindcast_cm25_lo_sstn/input_cm25_lo/hindcast.xml cm_hiram_gen_ens_sandy
#frerun -S -q urgent -p ncrc2.intel -o -x  $HOME/model/hindcast_cm25_lo_sstn/input_cm25_lo/hindcast.xml cm_dpc_nudg_2012_gmax35 
#frerun -S -q urgent -p ncrc2.intel -o -x  $HOME/model/hindcast_cm25_lo_sstn/input_cm25_lo/hindcast.xml cm_gen_ens_gmax25_nudg_uvt_breed_slponly_oldcore_rmin400_mask10_20121021
# -r short
# -S: Submit
# -o: overwrite
#frerun -S -q urgent -p ncrc2.intel -o -x  $HOME/model/hindcast_cm25_lo_sstn/2012_TS/input_cm25_lo/hindcast.xml CM2.5_A_Control-1990_FLOR_B01
# -e: extended a run
#frerun -e -q urgent -p ncrc2.intel -x $HOME/model/hindcast_cm25_lo_sstn/2012_TS/input_cm25_lo/hindcast.xml CM2.5_A_Control-1990_FLOR_B01
#frerun -e -S -q urgent -p ncrc2.intel -x  $HOME/model/hindcast_cm25_lo_sstn/2012_TS/input_cm25_lo/hindcast.xml CM2.5_A_Control-1990_FLOR_B01
#frerun -o -S -q urgent -p ncrc2.intel -x  $HOME/model/hindcast_cm25_lo_sstn/2012_TS/input_cm25_lo/hindcast_5y.xml CM2.5_A_Control-1990_FLOR_B01
if [ 1 -eq 1 ]; then
 frerun -x awg_sit.xml -p ncrc2.intel -t prod "c96L48_am4a3" -r basic --overwrite
elif [ 1 -eq 0 ]; then
 frerun -x awg_sit.xml -p ncrc2.intel -t prod "MOM6_AM2_MOM6i_1deg" -r basic --overwrite
###WARNING: XML file line 500: the site 'olcf' is unknown
###         Known sites are 'gfdl-ws', 'gfdl', 'ncrc1', 'ncrc2', 'ncrc', 'nescc', 'alcf'
###WARNING: XML file line 504: the site 'olcf' is unknown
###         Known sites are 'gfdl-ws', 'gfdl', 'ncrc1', 'ncrc2', 'ncrc', 'nescc', 'alcf'
###WARNING: Option --partition=c1:c2 has been automatically added
###WARNING: Option --queue=batch has been automatically added
###WARNING: Option --transfer has been automatically added
###WARNING: The output staging type isn't defined - using the 'chained' one...
###WARNING: XML file line 500: the site 'olcf' is unknown
###         Known sites are 'gfdl-ws', 'gfdl', 'ncrc1', 'ncrc2', 'ncrc', 'nescc', 'alcf'
###WARNING: XML file line 504: the site 'olcf' is unknown
###         Known sites are 'gfdl-ws', 'gfdl', 'ncrc1', 'ncrc2', 'ncrc', 'nescc', 'alcf'
###WARNING: Variable 'initCond' has no value
###WARNING: Variable 'gridSpec' has no value
###WARNING: The 'make_exchange_reproduce' is .TRUE. in the 'xgrid_nml' namelist, which contradicts with absence of 'repro' in your targets
###TO SUBMIT => sleep 1; msub /lustre/f1/Benjei.Tsuang/ulm_mom6_2015.01.20/MOM6_AM2_MOM6i_1deg/ncrc2.intel-prod/scripts/run/MOM6_AM2_MOM6i_1deg_1x0m36d_30x1a_60x1o
###
## SUCCESSFULLY
elif [ 1 -eq 1 ]; then
 frerun -x awg_sit.xml -p ncrc2.intel -t prod "MOM6_CM4i_c96L48_am4a1r1_2000climo_noRTS" -r test --overwrite
## frerun -x awg_sit.xml -p ncrc2.intel -t prod "MOM6_CM4i_c96L48_am4a1r1_2000climo_noRTS" -r basic --overwrite
## FAILED
elif [ 1 -eq 1 ]; then
 frerun -x awg_sit.xml -p ncrc2.intel -t prod "MOM6_SIT_CM4i_c96L48_am4a1r1_2000climo_noRTS" -r test --overwrite
elif [ 1 -eq 1 ]; then
 frerun -x awg_sit.xml -p ncrc2.intel -t prod "MOM6_SIT_CM4i_c96L48_am4a1r1_2000climo_noRTS" -r basic --overwrite
elif [ 1 -eq 1 ]; then
 frerun -x awg_sit.xml -p ncrc2.intel -t prod "OM4_SIS_baseline_CM4exec_noRTS" -r basic --overwrite
#"OM4_SIS_baseline_CM4exec_noRTS"
elif [ 1 -eq 1 ]; then
 frerun -x awg_sit.xml -p ncrc2.intel -t prod "MOM6_CM2G63L" -r basic --overwrite
elif [ 1 -eq 1 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-7/bin/frerun -e -S -q urgent -p ncrc2.intel -x ${CWD}/awg_sit.xml MOM6_CM2G63L
elif [ 1 -eq 0 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-7/bin/frerun -e -q urgent -p ncrc2.intel -x ${CWD}/dpc.xml cm_dpc_na
elif [ 1 -eq 1 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-7/bin/frerun -e -S -q urgent -p ncrc2.intel -x ${CWD}/dpc.xml cm_dpc_na2002
elif [ 1 -eq 1 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-7/bin/frerun -e -S -q urgent -p ncrc2.intel -x ${CWD}/dpc.xml cm_dpc_na
elif [ 1 -eq 0 ]; then
  sleep 1; msub /ncrc/home2/Benjei.Tsuang/model/scripts/run/cm_dpc_na
fi
if [ 1 -eq 0 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-7/bin/frerun -e -W -S -q batch -p ncrc2.intel -x ${CWD}/cm_dpc_cntl.xml cm_dpc_cntl
elif [ 1 -eq 0 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-7/bin/frerun -e -W -q batch -p ncrc2.intel -x ${CWD}/dpc.xml cm_dpc_na
elif [ 1 -eq 0 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-7/bin/frerun -e -W -S -q batch -p ncrc2.intel -x ${CWD}/dpc.xml cm_dpc_na2002
elif [ 1 -eq 0 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-7/bin/frerun -e -W -S -q batch -p ncrc2.intel -x ${CWD}/dpc.xml cm_dpc_na
fi
if [ 1 -eq 0 ]; then
  sleep 1; msub /ncrc/home2/Benjei.Tsuang/model/scripts/run/cm_dpc_na
fi
