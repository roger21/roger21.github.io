if ls scr_20250111091319_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! SCR" ; else echo "no scr_20250111091319_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed SCR :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/scr/scr_20250111091319_00_gnuplot.gp

sed -i "s/<title>scr_20250111091319_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic des scripts<\/title>/g" scr_20250111091319_g1_counts_all.svg
sed -i "s/<title>scr_20250111091319_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic des scripts<\/title>/g" scr_20250111091319_g2_evol_all.svg

rm scr_20250111091319_00_data_*

