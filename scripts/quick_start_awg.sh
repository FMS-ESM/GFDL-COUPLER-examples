#!/bin/bash
###<!-- QUICK START GUIDE:

# To checkout this xml (you should have done this already)
# .. module load fre/bronx-8
# .. module load git
# .. mkdir -p $home/awg/ulm
# .. cd $home/awg/ulm
# .. git clone -b awg_v20141222 http://gitlab.gfdl.noaa.gov/mdt/xml.git mdt_xml_v20141222

# Change YOURGROUPLETTER to your group, such as f, w, o...
###     <project>gfdl_YOURGROUPLETTER</project>

# To check out source code and compile:
# .. module load fre/bronx-8
# .. fremake -x awg_sit.xml -p ncrc2.intel -t openmp cm4p3_v20141222_sit
if [ 1 -eq 0 ]; then
  fremake -x awg_sit.xml -F -p ncrc2.intel -t openmp cm4p3_v20141222_sit
  #fremake -x awg_sit.xml -p ncrc2.intel -t openmp cm4p3_v20141222_sit
#<NOTE> : make succeeded for cm4p3_v20141222_sit.
elif [ 1 -eq 1 ]; then
# frerun -S -r basic -x awg_sit.xml -p ncrc2.intel -t openmp c96L48_am4a3_sit_2000climo
  frerun -r basic -x awg_sit.xml -p ncrc2.intel -t openmp c96L48_am4a3_sit_2000climo --overwrite
elif [ 1 -eq 0 ]; then
# To run regression test (with staging):
# .. frerun -S -r basic -x awg_sit.xml -p ncrc2.intel -t openmp c192L48_am4a3
# frerun -S -r basic -x awg_sit.xml -p ncrc2.intel -t openmp c192L48_am4a3
  frerun -r basic -x awg_sit.xml -p ncrc2.intel -t openmp c192L48_am4a3 --overwrite
fi


# To run a complete experiment (with automated database entry if MDBIswitch in "on"):
# .. frerun -x awg_sit.xml -p ncrc2.intel -t openmp c192L48_am4a3

# To run fredb after an experiment is finished to manually add it to the database:
# .. fredb-pp -x awg_sit.xml -p gfdl.ncrc2-intel -t openmp -n c192L48_am4a3

###-->


