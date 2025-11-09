if ls soc_20251108202345_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! SOC" ; else echo "no soc_20251108202345_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed SOC :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/soc/soc_20251108202345_00_gnuplot.gp

sed -i "s/<title>soc_20251108202345_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic du Parti Socialiste<\/title>/g" soc_20251108202345_g1_counts_all.svg
sed -i "s/<title>soc_20251108202345_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic du Parti Socialiste<\/title>/g" soc_20251108202345_g2_evol_all.svg

rm soc_20251108202345_00_data_*

