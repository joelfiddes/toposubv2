#!/bin/bash
source toposat.ini
find $wd/* -delete
exec > >(tee $wd/stdout.log) 2> >(tee $wd/stderr.log >&2)

#====================================================================
# Set up domain
#====================================================================
./setupDomain.sh

#====================================================================
# Retrieve ERA data
#====================================================================
./getERA2.sh

#====================================================================
# Run toposub
#====================================================================
./runTopoSUB.sh

#====================================================================
# Run toposcale
#====================================================================
./runTopoSCALE.sh

#====================================================================
# set up LSM
#====================================================================
./setupGeotopSim.sh

#====================================================================
# Run LSM
#====================================================================
./runLSM.sh

#====================================================================
# Informed sampling
#====================================================================
if [ $informSample == TRUE ]
then
	 ./informSample.sh
	 ./runTopoSCALE.sh
	 ./setupGeotopSim.sh
	 ./runLSM.sh

fi

#====================================================================
# Validate
#====================================================================
./validate.sh

#====================================================================
# Spatialise results
#====================================================================
./spatialise.sh


#====================================================================
# Data assimiliataion
#====================================================================
./getMODIS_SCA.sh TRUE #should be false but does not work yet

# run model
# spatialise results