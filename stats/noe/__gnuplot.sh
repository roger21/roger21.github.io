if ls noe_20240104102712_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! NOE" ; else echo "no noe_20240104102712_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed NOE :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/noe/noe_20240104102712_00_gnuplot.gp

sed -i "s/<title>noe_20240104102712_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2023 du topic noël et jour de l'an<\/title>/g" noe_20240104102712_g1_counts_all.svg
sed -i "s/<title>noe_20240104102712_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2023 du topic noël et jour de l'an<\/title>/g" noe_20240104102712_g2_evol_all.svg

rm noe_20240104102712_00_data_*

