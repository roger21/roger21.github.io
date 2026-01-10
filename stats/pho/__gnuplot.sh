if ls pho_20260106140942_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! PHO" ; else echo "no pho_20260106140942_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed PHO :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/pho/pho_20260106140942_00_gnuplot.gp

sed -i "s/<title>pho_20260106140942_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du bistrot photonum<\/title>/g" pho_20260106140942_g1_counts_all.svg
sed -i "s/<title>pho_20260106140942_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du bistrot photonum<\/title>/g" pho_20260106140942_g2_evol_all.svg

rm pho_20260106140942_00_data_*

