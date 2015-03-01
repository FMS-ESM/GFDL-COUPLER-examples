#!/bin/bash

# Change YOURGROUPLETTER to your group, such as f, w, o...
#     <project>gfdl_YOURGROUPLETTER</project>

# To check out codes and compile:
# for target option "-t openmp", the default is prod-openmp
if [ 1 -eq 0 ]; then
  #module load fre/bronx-8
  #  fremake -x CH2_proto_sit.xml -p ncrc2.intel -t prod-openmp cm4p3_v20141222_sit_v0.6101 -f
  fremake -x CH2_proto_sit.xml -p ncrc2.intel -t prod-openmp cm4p3_v20141222_sit_v0.6101
#unset echo
#<NOTE> : make succeeded for cm4p3_v20141222_sit.
elif [ 1 -eq 0 ]; then
  # To run regression test (for the coupled experiment CH2_c192L48_hiram_sit_2000_touchstoneOcean, year 2000 forcing): 
# frerun -r basic -x CH2_proto_sit.xml -p ncrc2.intel -t prod-openmp CH2_c192L48_hiram_sit_2000_touchstoneOcean --overwrite
  frerun -r test -x CH2_proto_sit.xml -p ncrc2.intel -t prod-openmp CH2_c192L48_hiram_sit_2000_touchstoneOcean --overwrite 
elif [ 1 -eq 1 ]; then
  frerun -W -x CH2_proto_sit.xml -p ncrc2.intel -t prod-openmp "CH2iS_c96L48_hiram_2000"  -r test --overwrite
  frerun -W -x CH2_proto_sit.xml -p ncrc2.intel -t prod-openmp "CH2iS_c96L48_rkmp_2000"  -r test --overwrite
  frerun -W -x CH2_proto_sit.xml -p ncrc2.intel -t prod-openmp "CH2iS_c96L48_dpc_2000" -r test --overwrite
elif [ 1 -eq 1 ]; then
 frerun -r test -x CH2_proto_sit.xml -p ncrc2.intel -t prod-openmp "CH2iS_c96L48_hiram_2000" -r basic --unique
# frerun -r test -x CH2_proto_sit.xml -p ncrc2.intel -t prod-openmp "CH2iS_c96L48_hiram_2000" -r basic --overwrite
elif [ 1 -eq 0 ]; then
  frerun -r test -x CH2_proto_sit.xml -p ncrc2.intel -t prod-openmp "CH2iS_c96L48_rkmp_2000" -r test --overwrite
elif [ 1 -eq 1 ]; then
  frerun -r test -x CH2_dpc_sit.xml -p ncrc2.intel -t prod-openmp "CH2iS_c96L48_pc_2000" -r test --overwrite
# frerun -r test -x CH2_dpc_sit.xml -p ncrc2.intel -t prod-openmp "CH2iS_c96L48_pc_2000" -r basic --unique
# frerun -r test -x CH2_dpc_sit.xml -p ncrc2.intel -t prod-openmp "CH2iS_c96L48_pc_2000" -r basic --overwrite
elif [ 1 -eq 1 ]; then
  # To run a complete coupled experiment (with automated database entry if MDBIswitch in "on"):
  frerun -x CH2_proto_sit.xml -p ncrc2.intel -t prod-openmp CH2_c192L48_hiram_sit_2000_touchstoneOcean
elif [ 1 -eq 1 ]; then
  # To run fredb after an experiment is finished to manually add it to the database:
  fredb -x CH2_proto_sit.xml -p gfdl.ncrc2-intel -t prod-openmp -n CH2_c192L48_hiram_sit_2000_touchstoneOcean
elif [ 1 -eq 1 ]; then
  # To check what is the input data of this experiment:
  inputfiles -x CH2_proto_sit.xml -p ncrc2.intel
fi

