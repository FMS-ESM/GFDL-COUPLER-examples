#!/bin/bash

# Change YOURGROUPLETTER to your group, such as f, w, o...
#     <project>gfdl_YOURGROUPLETTER</project>

# To check out codes and compile:
# for target option "-t openmp", the default is prod-openmp
if [ 1 -eq 0 ]; then
  #module load fre/bronx-8
  #  fremake -x CM4_proto_sit.xml -p ncrc2.intel -t prod-openmp cm4p3_v20141222_sit_v0.6101 -f
  fremake -x CM4_proto_sit.xml -p ncrc2.intel -t prod-openmp cm4p3_v20141222_sit_v0.6101
#unset echo
#<NOTE> : make succeeded for cm4p3_v20141222_sit.
elif [ 1 -eq 0 ]; then
  # To run regression test (for the coupled experiment CM4_c192L48_am4a3_sit_2000_touchstoneOcean, year 2000 forcing): 
# frerun -r basic -x CM4_proto_sit.xml -p ncrc2.intel -t prod-openmp CM4_c192L48_am4a3_sit_2000_touchstoneOcean --overwrite
  frerun -r test -x CM4_proto_sit.xml -p ncrc2.intel -t prod-openmp CM4_c192L48_am4a3_sit_2000_touchstoneOcean --overwrite
elif [ 1 -eq 1 ]; then
  frerun -r test -x CM4_proto_sit.xml -p ncrc2.intel -t prod-openmp "CM4iS_c96L48_am4a3_2000" -r test --unique
# frerun -r test -x CM4_proto_sit.xml -p ncrc2.intel -t prod-openmp "CM4iS_c96L48_am4a3_2000" -r basic --unique
# frerun -r test -x CM4_proto_sit.xml -p ncrc2.intel -t prod-openmp "CM4iS_c96L48_am4a3_2000" -r basic --overwrite
elif [ 1 -eq 1 ]; then
  # To run a complete coupled experiment (with automated database entry if MDBIswitch in "on"):
  frerun -x CM4_proto_sit.xml -p ncrc2.intel -t prod-openmp CM4_c192L48_am4a3_sit_2000_touchstoneOcean
elif [ 1 -eq 1 ]; then
  # To run fredb after an experiment is finished to manually add it to the database:
  fredb -x CM4_proto_sit.xml -p gfdl.ncrc2-intel -t prod-openmp -n CM4_c192L48_am4a3_sit_2000_touchstoneOcean
elif [ 1 -eq 1 ]; then
  # To check what is the input data of this experiment:
  inputfiles -x CM4_proto_sit.xml -p ncrc2.intel
fi

