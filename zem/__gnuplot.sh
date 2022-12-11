if ls zem_20221211151903_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo!" ; else echo "no zem_20221211151903_00_data file" ; exit 1 ; fi

/usr/bin/gnuplot /home/moi/devs/gittop/zem/zem_20221211151903_00_gnuplot.gpt

sed -i "s/<title>zem_20221211151903_01_counts_all<\/title>/<title>Le nombre de posts et de participants all time du topic Zemmour au dimamche 11 décembre 2022 à 15:19:03<\/title>/g" zem_20221211151903_01_counts_all.svg
sed -i "s/<title>zem_20221211151903_02_evol_all<\/title>/<title>L'évolution du nombre de participants all time du topic Zemmour au dimamche 11 décembre 2022 à 15:19:03<\/title>/g" zem_20221211151903_02_evol_all.svg

rm zem_20221211151903_00_data_*

