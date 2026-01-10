if ls upr_20260106224306_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! UPR" ; else echo "no upr_20260106224306_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed UPR :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/upr/upr_20260106224306_00_gnuplot.gp

sed -i "s/<title>upr_20260106224306_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic de l'UPR<\/title>/g" upr_20260106224306_g1_counts_all.svg
sed -i "s/<title>upr_20260106224306_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic de l'UPR<\/title>/g" upr_20260106224306_g2_evol_all.svg

rm upr_20260106224306_00_data_*

