if ls zem_20220701230817_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo!" ; else echo "no zem_20220701230817_00_data file" ; exit 1 ; fi

/usr/bin/gnuplot /home/moi/devs/gittop/zem/zem_20220701230817_00_gnuplot.gpt

sed -i "s/<title>zem_20220701230817_01_counts_all<\/title>/<title>Le nombre de posts et de participants all time du topic Zemmour au vendredi 1 juillet 2022 à 23:08:17<\/title>/g" zem_20220701230817_01_counts_all.svg
sed -i "s/<title>zem_20220701230817_02_evol_all<\/title>/<title>L'évolution du nombre de participants all time du topic Zemmour au vendredi 1 juillet 2022 à 23:08:17<\/title>/g" zem_20220701230817_02_evol_all.svg

rm zem_20220701230817_00_data_*

