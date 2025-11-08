if ls lrp_20251108081745_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! LRP" ; else echo "no lrp_20251108081745_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed LRP :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/lrp/lrp_20251108081745_00_gnuplot.gp

sed -i "s/<title>lrp_20251108081745_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic Les Républicains<\/title>/g" lrp_20251108081745_g1_counts_all.svg
sed -i "s/<title>lrp_20251108081745_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic Les Républicains<\/title>/g" lrp_20251108081745_g2_evol_all.svg

rm lrp_20251108081745_00_data_*

