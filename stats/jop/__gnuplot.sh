if ls jop_20260106090124_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! JOP" ; else echo "no jop_20260106090124_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed JOP :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/jop/jop_20260106090124_00_gnuplot.gp

sed -i "s/<title>jop_20260106090124_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic des JO de Paris 2024<\/title>/g" jop_20260106090124_g1_counts_all.svg
sed -i "s/<title>jop_20260106090124_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic des JO de Paris 2024<\/title>/g" jop_20260106090124_g2_evol_all.svg

rm jop_20260106090124_00_data_*

