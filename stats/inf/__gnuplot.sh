if ls inf_20250111071606_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! INF" ; else echo "no inf_20250111071606_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed INF :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/inf/inf_20250111071606_00_gnuplot.gp

sed -i "s/<title>inf_20250111071606_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic infos insos<\/title>/g" inf_20250111071606_g1_counts_all.svg
sed -i "s/<title>inf_20250111071606_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic infos insos<\/title>/g" inf_20250111071606_g2_evol_all.svg

rm inf_20250111071606_00_data_*

