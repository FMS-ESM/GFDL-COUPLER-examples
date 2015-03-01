#!/bin/tcsh -f
# Checkout Script for Experiment 'MOM6_SIT_LAD2_CS_compile'
# ------------------------------------------------------------------------------
# The script created at 2015-02-04T09:18:36 via:
# /ncrc/home2/fms/local/opt/fre-commands/bronx-9/bin/fremake --force-checkout --force-compile --link --ncores=8 --platform=ncrc2.intel --target=prod --walltime=120 --xmlfile=/ncrc/home2/Benjei.Tsuang/ulm/xml/MOM6_CM_SIT.xml MOM6_SIT_LAD2_CS_compile
# ------------------------------------------------------------------------------

source $MODULESHOME/init/csh
echo Using source directory = /lustre/f1/unswept/Benjei.Tsuang/ulm_mom6_2015.01.20/MOM6_SIT_LAD2_CS_compile/src...
cd /lustre/f1/unswept/Benjei.Tsuang/ulm_mom6_2015.01.20/MOM6_SIT_LAD2_CS_compile/src

module avail git >& .git_avail
if (! -z .git_avail) then
    module load git
endif

unalias *

# ---------------- component 'coupler'
git clone --recursive -b ulm http://gitlab.gfdl.noaa.gov/fms/coupler.git


exit 0
