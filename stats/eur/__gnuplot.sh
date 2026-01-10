if ls eur_20260105201234_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! EUR" ; else echo "no eur_20260105201234_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed EUR :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/eur/eur_20260105201234_00_gnuplot.gp

sed -i "s/<title>eur_20260105201234_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic UE\/Europe<\/title>/g" eur_20260105201234_g1_counts_all.svg
sed -i "s/<title>eur_20260105201234_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic UE\/Europe<\/title>/g" eur_20260105201234_g2_evol_all.svg

rm eur_20260105201234_00_data_*

