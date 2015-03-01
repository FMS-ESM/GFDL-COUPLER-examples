#!/bin/bash
#fremake -F -p ncrc2.intel -x $HOME/model/hindcast_cm25_lo_sstn/2012_TS/input_cm25_lo/hi9ndcast.xml awgp2
CWD=`pwd`
echo ${CWD}
if [ 1 -eq 0 ]; then
# /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -F -p ncrc2.intel -x ${CWD}/MOM6_CM_SIT.xml "MOM6_CM_libs_compile"
 /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -f -F -p ncrc2.intel -x ${CWD}/MOM6_CM_SIT.xml "MOM6_CM_libs_compile"
### ipo: warning #11010: file format not recognized for sis2/libsis2.a
### /opt/intel/composerxe-2011.5.220/compiler/lib/intel64/for_main.o: In function `main':
### /export/users/nbtester/efi2linux_nightly/branch-12_0/20110720_000000/libdev/frtl/src/libfor/for_main.c:(.text+0x38): undefined reference to `MAIN__'
elif [ 1 -eq 0 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -f -p ncrc2.intel -x ${CWD}/MOM6_CM_SIT.xml "MOM6_SIS_LAD2_CS_compile_libs"
### *FATAL*: Components with empty names aren't allowed
### *FATAL*: Unable to extract information about sources from the XML file!
elif [ 1 -eq 0 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -f -p ncrc2.intel -x ${CWD}/MOM6_CM_SIT.xml "MOM6_SIS_LAD2_FV_compile"
#<NOTE> : make succeeded for MOM6_SIS_LAD2_FV_compile.
elif [ 1 -eq 0 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -f -p ncrc2.intel -x ${CWD}/MOM6_CM_SIT.xml "MOM6_SIS_LAD2_CS_compile"
### <NOTE> : make succeeded for MOM6_SIS_LAD2_CS_compile.
elif [ 1 -eq 1 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -f -p ncrc2.intel -x ${CWD}/MOM6_CM_SIT.xml "MOM6_SIT_LAD2_CS_compile"
elif [ 1 -eq 0 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -f -p ncrc2.intel -x ${CWD}/MOM6_CM_SIT.xml "MOM6_SIS_LAD_FV_compile_libs"
### *FATAL*: Components with empty names aren't allowed
### *FATAL*: Unable to extract information about sources from the XML file!
elif [ 1 -eq 1 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -f -p ncrc2.intel -x ${CWD}/MOM6_CM_SIT.xml "MOM6_SIS_LAD_FV_compile"
### <NOTE> : make succeeded for MOM6_SIS_LAD_FV_compile.
elif [ 1 -eq 0 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -f -p ncrc2.intel -x ${CWD}/MOM6_CM_SIT.xml "MOM6_CM2_base"
#*FATAL*: The experiment 'MOM6_CM2_base' doesn't contain any components
#*FATAL*: Unable to extract information about sources from the XML file!
elif [ 1 -eq 0 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -f -p ncrc2.intel -x ${CWD}/MOM6_CM_SIT.xml "MOM6_CM2_base_dev"
### *FATAL*: The experiment 'MOM6_CM2_base_dev' doesn't contain any components
### *FATAL*: Unable to extract information about sources from the XML file!
elif [ 1 -eq 1 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -f -p ncrc2.intel -x ${CWD}/MOM6_CM_SIT.xml "MOM6_CM2G63L"
### *FATAL*: The experiment 'MOM6_CM2G63L' doesn't contain any components
### *FATAL*: Unable to extract information about sources from the XML file!
elif [ 1 -eq 0 ]; then
  nohup /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -f -F -p ncrc2.intel -x ${CWD}/MOM6_CM_SIT.xml hiram_s3 &> compile_hiram_s3.log&
#  nohup /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -F -p ncrc2.intel -x ${CWD}/MOM6_CM_SIT.xml hiram_s3 &> compile_hiram_s3.log&
#  /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -p ncrc2.intel -x ${CWD}/MOM6_CM_SIT.xml hiram_s3
elif [ 1 -eq 0 ]; then
  nohup /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -f -F -p ncrc2.intel -x ${CWD}/../xml/siena_201203/c360_hiram_amip.xml base_compile &> compile_c360_hiram_amip.log&
elif [ 1 -eq 0 ]; then
  nohup /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -f -F -p ncrc2.intel -x CM2.5_A_Control-1990.xml CM2.5_exec &> compile_CM2.5_exec.log&
elif [ 1 -eq 1 ]; then
  /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -K -F -p ncrc2.intel -x CM2.5_A_Control-1990_aqa.xml CM2.5_aqa_exec
  #nohup /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake -f -K -F -p ncrc2.intel -x CM2.5_A_Control-1990_aqa.xml CM2.5_aqa_exec &> compile_CM2.5_aqa_exec.log&
fi
