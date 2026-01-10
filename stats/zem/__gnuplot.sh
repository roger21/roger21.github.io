if ls zem2_20260106233358_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! ZEM2" ; else echo "no zem2_20260106233358_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed ZEM2 :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/zem/zem2_20260106233358_00_gnuplot.gp

sed -i "s/<title>zem2_20260106233358_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic Zemmour<\/title>/g" zem2_20260106233358_g1_counts_all.svg
sed -i "s/<title>zem2_20260106233358_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic Zemmour<\/title>/g" zem2_20260106233358_g2_evol_all.svg

rm zem2_20260106233358_00_data_*

