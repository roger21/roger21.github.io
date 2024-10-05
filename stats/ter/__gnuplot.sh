if ls ter_20240104124313_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! TER" ; else echo "no ter_20240104124313_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed TER :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/ter/ter_20240104124313_00_gnuplot.gp

sed -i "s/<title>ter_20240104124313_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2023 du topic terrorisme islamiste<\/title>/g" ter_20240104124313_g1_counts_all.svg
sed -i "s/<title>ter_20240104124313_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2023 du topic terrorisme islamiste<\/title>/g" ter_20240104124313_g2_evol_all.svg

rm ter_20240104124313_00_data_*

