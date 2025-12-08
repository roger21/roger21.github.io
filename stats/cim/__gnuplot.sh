if ls cim_20250114204141_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! CIM" ; else echo "no cim_20250114204141_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed CIM :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/cim/cim_20250114204141_00_gnuplot.gp

sed -i "s/<title>cim_20250114204141_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du cimetière des célébrités<\/title>/g" cim_20250114204141_g1_counts_all.svg
sed -i "s/<title>cim_20250114204141_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du cimetière des célébrités<\/title>/g" cim_20250114204141_g2_evol_all.svg

rm cim_20250114204141_00_data_*

