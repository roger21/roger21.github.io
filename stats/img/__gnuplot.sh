if ls img_20260106053326_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! IMG" ; else echo "no img_20260106053326_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed IMG :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/img/img_20260106053326_00_gnuplot.gp

sed -i "s/<title>img_20260106053326_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic images<\/title>/g" img_20260106053326_g1_counts_all.svg
sed -i "s/<title>img_20260106053326_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic images<\/title>/g" img_20260106053326_g2_evol_all.svg

rm img_20260106053326_00_data_*

