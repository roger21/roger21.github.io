if ls ins_20240104085349_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! INS" ; else echo "no ins_20240104085349_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed INS :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/ins/ins_20240104085349_00_gnuplot.gp

sed -i "s/<title>ins_20240104085349_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2023 du topic insomniaks<\/title>/g" ins_20240104085349_g1_counts_all.svg
sed -i "s/<title>ins_20240104085349_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2023 du topic insomniaks<\/title>/g" ins_20240104085349_g2_evol_all.svg

rm ins_20240104085349_00_data_*

