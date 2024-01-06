if ls ukr_20240104132857_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo!" ; else echo "no ukr_20240104132857_00_data file" ; exit 1 ; fi

/usr/bin/gnuplot /home/moi/devs/gittop/ukr/ukr_20240104132857_00_gnuplot.gp

sed -i "s/<title>ukr_20240104132857_01_counts_all<\/title>/<title>Le nombre de posts et de participants all time du topic Ukraine au jeudi 4 janvier 2024 à 13:28:57<\/title>/g" ukr_20240104132857_01_counts_all.svg
sed -i "s/<title>ukr_20240104132857_02_evol_all<\/title>/<title>L'évolution du nombre de participants all time du topic Ukraine au jeudi 4 janvier 2024 à 13:28:57<\/title>/g" ukr_20240104132857_02_evol_all.svg
sed -i "s/<title>ukr_20240104132857_03_activite_all_year<\/title>/<title>L'activité all time par an du topic Ukraine au jeudi 4 janvier 2024 à 13:28:57<\/title>/g" ukr_20240104132857_03_activite_all_year.svg
sed -i "s/<title>ukr_20240104132857_04_activite_all_month<\/title>/<title>L'activité all time par mois du topic Ukraine au jeudi 4 janvier 2024 à 13:28:57<\/title>/g" ukr_20240104132857_04_activite_all_month.svg
sed -i "s/<title>ukr_20240104132857_05_activite_all_week<\/title>/<title>L'activité all time par semaine du topic Ukraine au jeudi 4 janvier 2024 à 13:28:57<\/title>/g" ukr_20240104132857_05_activite_all_week.svg
sed -i "s/<title>ukr_20240104132857_06_activite_all_day<\/title>/<title>L'activité all time par jour du topic Ukraine au jeudi 4 janvier 2024 à 13:28:57<\/title>/g" ukr_20240104132857_06_activite_all_day.svg

rm ukr_20240104132857_00_data_*

