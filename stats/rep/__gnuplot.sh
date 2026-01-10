if ls rep_20260106180925_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! REP" ; else echo "no rep_20260106180925_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed REP :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/rep/rep_20260106180925_00_gnuplot.gp

sed -i "s/<title>rep_20260106180925_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2025 du topic Les Républicains<\/title>/g" rep_20260106180925_g1_counts_all.svg
sed -i "s/<title>rep_20260106180925_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2025 du topic Les Républicains<\/title>/g" rep_20260106180925_g2_evol_all.svg

rm rep_20260106180925_00_data_*

