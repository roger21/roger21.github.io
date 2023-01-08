if ls ukr_20230106195014_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo!" ; else echo "no ukr_20230106195014_00_data file" ; exit 1 ; fi

/usr/bin/gnuplot /home/moi/devs/gittop/ukr/ukr_20230106195014_00_gnuplot.gpt

sed -i "s/<title>ukr_20230106195014_01_counts_all<\/title>/<title>Le nombre de posts et de participants all time du topic Ukraine au vendredi 6 janvier 2023 à 19:50:14<\/title>/g" ukr_20230106195014_01_counts_all.svg
sed -i "s/<title>ukr_20230106195014_02_evol_all<\/title>/<title>L'évolution du nombre de participants all time du topic Ukraine au vendredi 6 janvier 2023 à 19:50:14<\/title>/g" ukr_20230106195014_02_evol_all.svg

rm ukr_20230106195014_00_data_*

