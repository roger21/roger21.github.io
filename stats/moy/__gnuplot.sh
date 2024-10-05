if ls moy_20240104101535_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! MOY" ; else echo "no moy_20240104101535_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed MOY :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/moy/moy_20240104101535_00_gnuplot.gp

sed -i "s/<title>moy_20240104101535_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2023 du topic conflit au Moyen-Orient<\/title>/g" moy_20240104101535_g1_counts_all.svg
sed -i "s/<title>moy_20240104101535_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2023 du topic conflit au Moyen-Orient<\/title>/g" moy_20240104101535_g2_evol_all.svg

rm moy_20240104101535_00_data_*

