if ls vrt_20260106233059_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! VRT" ; else echo "no vrt_20260106233059_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed VRT :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/vrt/vrt_20260106233059_00_gnuplot.gp

sed -i "s/<title>vrt_20260106233059_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic EELV<\/title>/g" vrt_20260106233059_g1_counts_all.svg
sed -i "s/<title>vrt_20260106233059_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic EELV<\/title>/g" vrt_20260106233059_g2_evol_all.svg

rm vrt_20260106233059_00_data_*

