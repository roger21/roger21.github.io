if ls med_20260116194820_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! MED" ; else echo "no med_20260116194820_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed MED :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/med/med_20260116194820_00_gnuplot.gp

sed -i "s/<title>med_20260116194820_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic des médias<\/title>/g" med_20260116194820_g1_counts_all.svg
sed -i "s/<title>med_20260116194820_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic des médias<\/title>/g" med_20260116194820_g2_evol_all.svg

rm med_20260116194820_00_data_*

