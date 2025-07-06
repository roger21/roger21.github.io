if ls met_20250706132342_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! MET" ; else echo "no met_20250706132342_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed MET :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/met/met_20250706132342_00_gnuplot.gp

sed -i "s/<title>met_20250706132342_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic Météo<\/title>/g" met_20250706132342_g1_counts_all.svg
sed -i "s/<title>met_20250706132342_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic Météo<\/title>/g" met_20250706132342_g2_evol_all.svg

rm met_20250706132342_00_data_*

