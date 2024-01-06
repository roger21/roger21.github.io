if ls zem_20240104141243_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo!" ; else echo "no zem_20240104141243_00_data file" ; exit 1 ; fi

/usr/bin/gnuplot /home/moi/devs/gittop/zem/zem_20240104141243_00_gnuplot.gp

sed -i "s/<title>zem_20240104141243_01_counts_all<\/title>/<title>Le nombre de posts et de participants all time du topic Zemmour au jeudi 4 janvier 2024 à 14:12:43<\/title>/g" zem_20240104141243_01_counts_all.svg
sed -i "s/<title>zem_20240104141243_02_evol_all<\/title>/<title>L'évolution du nombre de participants all time du topic Zemmour au jeudi 4 janvier 2024 à 14:12:43<\/title>/g" zem_20240104141243_02_evol_all.svg
sed -i "s/<title>zem_20240104141243_03_activite_all_year<\/title>/<title>L'activité all time par an du topic Zemmour au jeudi 4 janvier 2024 à 14:12:43<\/title>/g" zem_20240104141243_03_activite_all_year.svg
sed -i "s/<title>zem_20240104141243_04_activite_all_month<\/title>/<title>L'activité all time par mois du topic Zemmour au jeudi 4 janvier 2024 à 14:12:43<\/title>/g" zem_20240104141243_04_activite_all_month.svg
sed -i "s/<title>zem_20240104141243_05_activite_all_week<\/title>/<title>L'activité all time par semaine du topic Zemmour au jeudi 4 janvier 2024 à 14:12:43<\/title>/g" zem_20240104141243_05_activite_all_week.svg
sed -i "s/<title>zem_20240104141243_06_activite_all_day<\/title>/<title>L'activité all time par jour du topic Zemmour au jeudi 4 janvier 2024 à 14:12:43<\/title>/g" zem_20240104141243_06_activite_all_day.svg

rm zem_20240104141243_00_data_*

