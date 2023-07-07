if ls zem_20230707153505_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo!" ; else echo "no zem_20230707153505_00_data file" ; exit 1 ; fi

/usr/bin/gnuplot /home/moi/devs/gittop/zem/zem_20230707153505_00_gnuplot.gpt

sed -i "s/<title>zem_20230707153505_01_counts_all<\/title>/<title>Le nombre de posts et de participants all time du topic Zemmour au vendredi 7 juillet 2023 à 15:35:05<\/title>/g" zem_20230707153505_01_counts_all.svg
sed -i "s/<title>zem_20230707153505_02_evol_all<\/title>/<title>L'évolution du nombre de participants all time du topic Zemmour au vendredi 7 juillet 2023 à 15:35:05<\/title>/g" zem_20230707153505_02_evol_all.svg
sed -i "s/<title>zem_20230707153505_03_activite_all_year<\/title>/<title>L'activité all time par an du topic Zemmour au vendredi 7 juillet 2023 à 15:35:05<\/title>/g" zem_20230707153505_03_activite_all_year.svg
sed -i "s/<title>zem_20230707153505_04_activite_all_month<\/title>/<title>L'activité all time par mois du topic Zemmour au vendredi 7 juillet 2023 à 15:35:05<\/title>/g" zem_20230707153505_04_activite_all_month.svg
sed -i "s/<title>zem_20230707153505_05_activite_all_week<\/title>/<title>L'activité all time par semaine du topic Zemmour au vendredi 7 juillet 2023 à 15:35:05<\/title>/g" zem_20230707153505_05_activite_all_week.svg
sed -i "s/<title>zem_20230707153505_06_activite_all_day<\/title>/<title>L'activité all time par jour du topic Zemmour au vendredi 7 juillet 2023 à 15:35:05<\/title>/g" zem_20230707153505_06_activite_all_day.svg

rm zem_20230707153505_00_data_*

