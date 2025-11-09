if ls nat_20251109103334_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! NAT" ; else echo "no nat_20251109103334_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed NAT :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/nat/nat_20251109103334_00_gnuplot.gp

sed -i "s/<title>nat_20251109103334_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic du Rassemblement national<\/title>/g" nat_20251109103334_g1_counts_all.svg
sed -i "s/<title>nat_20251109103334_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic du Rassemblement national<\/title>/g" nat_20251109103334_g2_evol_all.svg

rm nat_20251109103334_00_data_*

