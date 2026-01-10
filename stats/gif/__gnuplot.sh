if ls gif_20260106012448_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! GIF" ; else echo "no gif_20260106012448_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed GIF :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/gif/gif_20260106012448_00_gnuplot.gp

sed -i "s/<title>gif_20260106012448_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic Gifs<\/title>/g" gif_20260106012448_g1_counts_all.svg
sed -i "s/<title>gif_20260106012448_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic Gifs<\/title>/g" gif_20260106012448_g2_evol_all.svg

rm gif_20260106012448_00_data_*

