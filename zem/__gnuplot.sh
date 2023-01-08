if ls zem_20230106195044_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo!" ; else echo "no zem_20230106195044_00_data file" ; exit 1 ; fi

/usr/bin/gnuplot /home/moi/devs/gittop/zem/zem_20230106195044_00_gnuplot.gpt

sed -i "s/<title>zem_20230106195044_01_counts_all<\/title>/<title>Le nombre de posts et de participants all time du topic Zemmour au vendredi 6 janvier 2023 à 19:50:44<\/title>/g" zem_20230106195044_01_counts_all.svg
sed -i "s/<title>zem_20230106195044_02_evol_all<\/title>/<title>L'évolution du nombre de participants all time du topic Zemmour au vendredi 6 janvier 2023 à 19:50:44<\/title>/g" zem_20230106195044_02_evol_all.svg

rm zem_20230106195044_00_data_*

