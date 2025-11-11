if ls gil_20251031175954_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! GIL" ; else echo "no gil_20251031175954_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed GIL :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/gil/gil_20251031175954_00_gnuplot.gp

sed -i "s/<title>gil_20251031175954_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic des Gilets jaunes<\/title>/g" gil_20251031175954_g1_counts_all.svg
sed -i "s/<title>gil_20251031175954_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic des Gilets jaunes<\/title>/g" gil_20251031175954_g2_evol_all.svg

rm gil_20251031175954_00_data_*

