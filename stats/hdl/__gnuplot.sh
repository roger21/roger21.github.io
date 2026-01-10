if ls hdl_20260106053234_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! HDL" ; else echo "no hdl_20260106053234_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed HDL :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/hdl/hdl_20260106053234_00_gnuplot.gp

sed -i "s/<title>hdl_20260106053234_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic Henry de Lesquen<\/title>/g" hdl_20260106053234_g1_counts_all.svg
sed -i "s/<title>hdl_20260106053234_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic Henry de Lesquen<\/title>/g" hdl_20260106053234_g2_evol_all.svg

rm hdl_20260106053234_00_data_*

