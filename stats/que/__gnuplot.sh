if ls que_20260106171750_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! QUE" ; else echo "no que_20260106171750_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed QUE :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/que/que_20260106171750_00_gnuplot.gp

sed -i "s/<title>que_20260106171750_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic des questions<\/title>/g" que_20260106171750_g1_counts_all.svg
sed -i "s/<title>que_20260106171750_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic des questions<\/title>/g" que_20260106171750_g2_evol_all.svg

rm que_20260106171750_00_data_*

