if ls gsn_20260106015318_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! GSN" ; else echo "no gsn_20260106015318_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed GSN :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/gsn/gsn_20260106015318_00_gnuplot.gp

sed -i "s/<title>gsn_20260106015318_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic GSNALF<\/title>/g" gsn_20260106015318_g1_counts_all.svg
sed -i "s/<title>gsn_20260106015318_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic GSNALF<\/title>/g" gsn_20260106015318_g2_evol_all.svg

rm gsn_20260106015318_00_data_*

