if ls lux2_20250111084206_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! LUX2" ; else echo "no lux2_20250111084206_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed LUX2 :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/lux/lux2_20250111084206_00_gnuplot.gp

sed -i "s/<title>lux2_20250111084206_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic Luxembourg<\/title>/g" lux2_20250111084206_g1_counts_all.svg
sed -i "s/<title>lux2_20250111084206_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic Luxembourg<\/title>/g" lux2_20250111084206_g2_evol_all.svg

rm lux2_20250111084206_00_data_*

