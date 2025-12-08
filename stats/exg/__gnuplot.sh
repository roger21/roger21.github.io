if ls exg_20251103095506_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! EXG" ; else echo "no exg_20251103095506_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed EXG :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/exg/exg_20251103095506_00_gnuplot.gp

sed -i "s/<title>exg_20251103095506_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic de l'extrême gauche<\/title>/g" exg_20251103095506_g1_counts_all.svg
sed -i "s/<title>exg_20251103095506_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic de l'extrême gauche<\/title>/g" exg_20251103095506_g2_evol_all.svg

rm exg_20251103095506_00_data_*

