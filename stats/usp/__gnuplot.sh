if ls usp_20250111100933_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! USP" ; else echo "no usp_20250111100933_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed USP :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/usp/usp_20250111100933_00_gnuplot.gp

sed -i "s/<title>usp_20250111100933_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic US Politics<\/title>/g" usp_20250111100933_g1_counts_all.svg
sed -i "s/<title>usp_20250111100933_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic US Politics<\/title>/g" usp_20250111100933_g2_evol_all.svg

rm usp_20250111100933_00_data_*

