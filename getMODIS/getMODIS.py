http://www.pymodis.org/scripts/modis_download.html
modis_download.py -u ftp://n5eil01u.ecs.nsidc.org -t h23v05 -s SAN/MOST -p MOD10A2.005 -A ~/data/modis/h23v05


modis_convert.py -s "( 1 0)" -e 32642 MOD10A2.A2008185.h23v05.005.2008196014145.hdf
