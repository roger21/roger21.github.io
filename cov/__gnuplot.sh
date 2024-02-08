if ls cov2_20240104020650_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! COV2" ; else echo "no cov2_20240104020650_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed COV2 :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/cov/cov2_20240104020650_00_gnuplot.gp

sed -i "s/<title>cov2_20240104020650_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2023 du topic COVID-19<\/title>/g" cov2_20240104020650_g1_counts_all.svg
sed -i "s/<title>cov2_20240104020650_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2023 du topic COVID-19<\/title>/g" cov2_20240104020650_g2_evol_all.svg

rm cov2_20240104020650_00_data_*

