if ls pso_20251108202345_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! PSO" ; else echo "no pso_20251108202345_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed PSO :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/pso/pso_20251108202345_00_gnuplot.gp

sed -i "s/<title>pso_20251108202345_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic du Parti Socialiste<\/title>/g" pso_20251108202345_g1_counts_all.svg
sed -i "s/<title>pso_20251108202345_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic du Parti Socialiste<\/title>/g" pso_20251108202345_g2_evol_all.svg

rm pso_20251108202345_00_data_*

