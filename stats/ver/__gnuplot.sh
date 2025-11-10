if ls ver_20251110101727_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! VER" ; else echo "no ver_20251110101727_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed VER :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/ver/ver_20251110101727_00_gnuplot.gp

sed -i "s/<title>ver_20251110101727_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic EELV<\/title>/g" ver_20251110101727_g1_counts_all.svg
sed -i "s/<title>ver_20251110101727_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic EELV<\/title>/g" ver_20251110101727_g2_evol_all.svg

rm ver_20251110101727_00_data_*

