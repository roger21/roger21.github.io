if ls bli_20250110235119_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! BLI" ; else echo "no bli_20250110235119_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed BLI :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/bli/bli_20250110235119_00_gnuplot.gp

sed -i "s/<title>bli_20250110235119_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic blind test<\/title>/g" bli_20250110235119_g1_counts_all.svg
sed -i "s/<title>bli_20250110235119_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic blind test<\/title>/g" bli_20250110235119_g2_evol_all.svg

rm bli_20250110235119_00_data_*

