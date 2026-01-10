if ls ukr2_20260106214004_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! UKR2" ; else echo "no ukr2_20260106214004_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed UKR2 :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/ukr/ukr2_20260106214004_00_gnuplot.gp

sed -i "s/<title>ukr2_20260106214004_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic Ukraine<\/title>/g" ukr2_20260106214004_g1_counts_all.svg
sed -i "s/<title>ukr2_20260106214004_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic Ukraine<\/title>/g" ukr2_20260106214004_g2_evol_all.svg

rm ukr2_20260106214004_00_data_*

