#!/bin/tcsh -fx
#FRE scheduler-options
#PBS -d /lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec
#PBS -o /lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/
#PBS -N compile_cm4p3_v20141222_sit.csh
#PBS -l walltime=7200
#PBS -W umask=026
#PBS -l size=1
#PBS -S /bin/tcsh
#PBS -r y
#PBS -q eslogin
#PBS -l partition=es
#PBS -m a
#PBS -j oe
#PBS -E
#PBS -l qos=norm
#PBS -A gfdl_w

# Compile Script for Experiment 'cm4p3_v20141222_sit'
# ------------------------------------------------------------------------------
# The script created at 2015-02-05T18:03:43 via:
# /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake --force-compile --link --ncores=8 --platform=ncrc2.intel --target=openmp --walltime=120 --xmlfile=/autofs/na2_home2/Benjei.Tsuang/ulm/xml/awg/xml_v20141222_sit/awg_sit.xml cm4p3_v20141222_sit
# ------------------------------------------------------------------------------

set -r echoOn = $?echo

if ( $echoOn ) unset echo
echo "<NOTE> : Starting at $HOST on `date`"
if ( $echoOn ) set echo

unalias *

# ---------------- set environment

if ( $echoOn ) unset echo
source /lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/env.cshrc
if ( $echoOn ) set echo

# ---------------- write main Makefile

cat >/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/Makefile <<END
# Makefile for Experiment 'cm4p3_v20141222_sit'

include /ncrc/home2/fms/local/opt/fre-commands/bronx-9/site/ncrc/intel.mk

fms_cm4p3_v20141222_sit.x: coupler/libcoupler.a atmos_dyn/libatmos_dyn.a mom6/libmom6.a ice_sit/libice_sit.a atmos_phys/libatmos_phys.a ocean_shared/libocean_shared.a land_lad2/libland_lad2.a fms/libfms.a
<TAB>\$(LD) \$^ \$(LDFLAGS) -o \$@ 

fms/libfms.a:  FORCE
<TAB>make  OPENMP=on NETCDF=3  --directory=fms \$(@F) 

atmos_phys/libatmos_phys.a: fms/libfms.a FORCE
<TAB>make  OPENMP=on NETCDF=3  --directory=atmos_phys \$(@F) 

atmos_dyn/libatmos_dyn.a: atmos_phys/libatmos_phys.a fms/libfms.a FORCE
<TAB>make  OPENMP=on NETCDF=3  --directory=atmos_dyn \$(@F) 

ice_sit/libice_sit.a: fms/libfms.a FORCE
<TAB>make  OPENMP=on NETCDF=3  --directory=ice_sit \$(@F) 

land_lad2/libland_lad2.a: fms/libfms.a FORCE
<TAB>make  OPENMP=on NETCDF=3  --directory=land_lad2 \$(@F) 

mom6/libmom6.a: ocean_shared/libocean_shared.a fms/libfms.a FORCE
<TAB>make  OPENMP=on NETCDF=3 OPENMP="" --directory=mom6 \$(@F) 

ocean_shared/libocean_shared.a: fms/libfms.a FORCE
<TAB>make  OPENMP=on NETCDF=3  --directory=ocean_shared \$(@F) 

coupler/libcoupler.a: atmos_dyn/libatmos_dyn.a mom6/libmom6.a ice_sit/libice_sit.a ocean_shared/libocean_shared.a atmos_phys/libatmos_phys.a land_lad2/libland_lad2.a fms/libfms.a FORCE
<TAB>make  OPENMP=on NETCDF=3  --directory=coupler \$(@F) 

FORCE:

stage:
<TAB>install -d /lustre/f1/Benjei.Tsuang/ptmp/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec
<TAB>install -m 555 fms_cm4p3_v20141222_sit.x /lustre/f1/Benjei.Tsuang/ptmp/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec

clean:
<TAB>make  OPENMP=on NETCDF=3  --directory=fms clean
<TAB>make  OPENMP=on NETCDF=3  --directory=atmos_phys clean
<TAB>make  OPENMP=on NETCDF=3  --directory=atmos_dyn clean
<TAB>make  OPENMP=on NETCDF=3  --directory=ice_sit clean
<TAB>make  OPENMP=on NETCDF=3  --directory=land_lad2 clean
<TAB>make  OPENMP=on NETCDF=3 OPENMP="" --directory=mom6 clean
<TAB>make  OPENMP=on NETCDF=3  --directory=ocean_shared clean
<TAB>make  OPENMP=on NETCDF=3  --directory=coupler clean

localize:
<TAB>make  OPENMP=on NETCDF=3  --directory=fms localize
<TAB>make  OPENMP=on NETCDF=3  --directory=atmos_phys localize
<TAB>make  OPENMP=on NETCDF=3  --directory=atmos_dyn localize
<TAB>make  OPENMP=on NETCDF=3  --directory=ice_sit localize
<TAB>make  OPENMP=on NETCDF=3  --directory=land_lad2 localize
<TAB>make  OPENMP=on NETCDF=3 OPENMP="" --directory=mom6 localize
<TAB>make  OPENMP=on NETCDF=3  --directory=ocean_shared localize
<TAB>make  OPENMP=on NETCDF=3  --directory=coupler localize

distclean:
<TAB>rm -rf fms
<TAB>rm -rf atmos_phys
<TAB>rm -rf atmos_dyn
<TAB>rm -rf ice_sit
<TAB>rm -rf land_lad2
<TAB>rm -rf mom6
<TAB>rm -rf ocean_shared
<TAB>rm -rf coupler
<TAB>rm -f Makefile

END

# ---------------- create component Makefiles

cd /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src
list_paths -o pathnames_fms shared
cd /lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec
mkdir -p fms && pushd fms
mkmf -m Makefile -a /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src -p libfms.a -t /ncrc/home2/fms/local/opt/fre-commands/bronx-9/site/ncrc/intel.mk -c "-DINTERNAL_FILE_NML -g -traceback -Duse_libMPI -Duse_netCDF" -Imom6/src/MOM6/pkg/CVMix-src/include -Ishared/include -Ishared/mpp/include /lustre/f1/unswept/Benjei.Tsuang/GitHub/NOAA-GFDL-MOM6-examples/src/FMS/constants/constants.F90 /lustre/f1/unswept/Benjei.Tsuang/GitHub/NOAA-GFDL-MOM6-examples/src/FMS/interpolator/interpolator.F90 /lustre/f1/unswept/Benjei.Tsuang/GitHub/NOAA-GFDL-MOM6-examples/src/FMS/mpp/include/mpp_io_read.inc /lustre/f1/unswept/Benjei.Tsuang/GitHub/NOAA-GFDL-MOM6-examples/src/FMS/horiz_interp/horiz_interp_conserve.F90 pathnames_fms
popd

cd /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src
list_paths -o pathnames_atmos_phys atmos_param atmos_shared
cd /lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec
mkdir -p atmos_phys && pushd atmos_phys
mkmf -m Makefile -a /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src -p libatmos_phys.a -t /ncrc/home2/fms/local/opt/fre-commands/bronx-9/site/ncrc/intel.mk -c "-DINTERNAL_FILE_NML -g -traceback -DCLUBB" -o "-I/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/fms" -Imom6/src/MOM6/pkg/CVMix-src/include -Ishared/include -Ishared/mpp/include pathnames_atmos_phys
popd

cd /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src
list_paths -o pathnames_atmos_dyn atmos_coupled atmos_cubed_sphere
cd /lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec
mkdir -p atmos_dyn && pushd atmos_dyn
mkmf -m Makefile -a /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src -p libatmos_dyn.a -t /ncrc/home2/fms/local/opt/fre-commands/bronx-9/site/ncrc/intel.mk -c "-DINTERNAL_FILE_NML -g -traceback -DSPMD" -o "-I/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/atmos_phys -I/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/fms" -Imom6/src/MOM6/pkg/CVMix-src/include -Ishared/include -Ishared/mpp/include pathnames_atmos_dyn
popd

cd /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src
list_paths -o pathnames_ice_sit /autofs/na2_home2/Benjei.Tsuang/ulm/sit/src ice_param
cd /lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec
mkdir -p ice_sit && pushd ice_sit
mkmf -m Makefile -a /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src -p libice_sit.a -t /ncrc/home2/fms/local/opt/fre-commands/bronx-9/site/ncrc/intel.mk -c "-DINTERNAL_FILE_NML -g -traceback" -o "-I/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/fms" -Imom6/src/MOM6/pkg/CVMix-src/include -Ishared/include -Ishared/mpp/include pathnames_ice_sit
popd

cd /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src
list_paths -o pathnames_land_lad2 land_lad2
 
cat >Makefile.cpp <<EOF
CPPDEFS =
FRETARGET = prod-openmp
ifneq (\$(findstring hdf5,\${FRETARGET}),)
else
  CPPDEFS += -Duse_LARGEFILE
endif
EOF
echo vpath %.F90 `find $cwd/land_lad2 -type d` >> Makefile.cpp
echo cpp_land/%.f90: %.F90 >> Makefile.cpp
/bin/echo -e '\tcpp ${CPPDEFS} -C -v -I shared/include -o $@ $<' >> Makefile.cpp
mkdir -p cpp_land
foreach foo ( `find land_lad2 -type f -name \*.F90` )
  make -f Makefile.cpp cpp_land/$foo:t:r.f90
end
find cpp_land -type f -name \*.f90 > pathnames_land_lad2
        
cd /lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec
mkdir -p land_lad2 && pushd land_lad2
mkmf -m Makefile -a /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src -p libland_lad2.a -t /ncrc/home2/fms/local/opt/fre-commands/bronx-9/site/ncrc/intel.mk -c "-DINTERNAL_FILE_NML -g -traceback" -o "-I/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/fms" -Imom6/src/MOM6/pkg/CVMix-src/include -Ishared/include -Ishared/mpp/include pathnames_land_lad2
popd

cd /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src
list_paths -o pathnames_mom6 mom6/src/MOM6/config_src/dynamic mom6/src/MOM6/config_src/coupled_driver mom6/src/MOM6/src/*/ mom6/src/MOM6/src/*/*/
cd /lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec
mkdir -p mom6 && pushd mom6
mkmf -m Makefile -a /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src -p libmom6.a -t /ncrc/home2/fms/local/opt/fre-commands/bronx-9/site/ncrc/intel.mk -c "-DINTERNAL_FILE_NML -g -traceback -D_USE_GENERIC_TRACER -D_FILE_VERSION="'"`git-version-string $<`"'"" -o "-I/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/ocean_shared -I/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/fms" -Imom6/src/MOM6/pkg/CVMix-src/include -Ishared/include -Ishared/mpp/include pathnames_mom6
popd

cd /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src
list_paths -o pathnames_ocean_shared ocean_shared
cd /lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec
mkdir -p ocean_shared && pushd ocean_shared
mkmf -m Makefile -a /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src -p libocean_shared.a -t /ncrc/home2/fms/local/opt/fre-commands/bronx-9/site/ncrc/intel.mk -c "-DINTERNAL_FILE_NML -g -traceback" -o "-I/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/fms" -Imom6/src/MOM6/pkg/CVMix-src/include -Ishared/include -Ishared/mpp/include pathnames_ocean_shared
popd

cd /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src
list_paths -o pathnames_coupler /autofs/na2_home2/Benjei.Tsuang/ulm/sit/coupler
cd /lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec
mkdir -p coupler && pushd coupler
mkmf -m Makefile -a /ncrc/home2/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/src -p libcoupler.a -t /ncrc/home2/fms/local/opt/fre-commands/bronx-9/site/ncrc/intel.mk -c "-DINTERNAL_FILE_NML -g -traceback" -o "-I/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/atmos_dyn -I/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/mom6 -I/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/ocean_shared -I/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/land_lad2 -I/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/ice_sit -I/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/atmos_phys -I/lustre/f1/unswept/Benjei.Tsuang/awg/ulm/cm4p3_v20141222_sit/ncrc2.intel-prod-openmp/exec/fms" -Imom6/src/MOM6/pkg/CVMix-src/include -Ishared/include -Ishared/mpp/include pathnames_coupler
popd

# ---------------- adjust the main Makefile

cat Makefile | sed -e 's/<TAB>/\t/' > Makefile.$$ && mv -f Makefile.$$ Makefile

# ---------------- call make on the main Makefile

make  OPENMP=on NETCDF=3 fms_cm4p3_v20141222_sit.x

if ( $status == 0 ) then
  if ( $echoOn ) unset echo
  echo "<NOTE> : make succeeded for cm4p3_v20141222_sit."
  if ( $echoOn ) set echo
else
  if ( $echoOn ) unset echo
  echo "*ERROR*: make failed for cm4p3_v20141222_sit."
  if ( $echoOn ) set echo
  exit 1
endif

exit 0
