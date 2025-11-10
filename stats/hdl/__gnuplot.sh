if ls hdl_20251110135527_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! HDL" ; else echo "no hdl_20251110135527_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed HDL :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/hdl/hdl_20251110135527_00_gnuplot.gp

sed -i "s/<title>hdl_20251110135527_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic Henry de Lesquen<\/title>/g" hdl_20251110135527_g1_counts_all.svg
sed -i "s/<title>hdl_20251110135527_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic Henry de Lesquen<\/title>/g" hdl_20251110135527_g2_evol_all.svg

rm hdl_20251110135527_00_data_*

