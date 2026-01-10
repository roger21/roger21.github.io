if ls cha_20260105170428_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! CHA" ; else echo "no cha_20260105170428_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed CHA :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/cha/cha_20260105170428_00_gnuplot.gp

sed -i "s/<title>cha_20260105170428_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic Charlie Hebdo<\/title>/g" cha_20260105170428_g1_counts_all.svg
sed -i "s/<title>cha_20260105170428_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic Charlie Hebdo<\/title>/g" cha_20260105170428_g2_evol_all.svg

rm cha_20260105170428_00_data_*

