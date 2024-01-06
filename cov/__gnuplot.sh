if ls cov_20240103214732_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo!" ; else echo "no cov_20240103214732_00_data file" ; exit 1 ; fi

/usr/bin/gnuplot /home/moi/devs/gittop/cov/cov_20240103214732_00_gnuplot.gp

sed -i "s/<title>cov_20240103214732_01_counts_all<\/title>/<title>Le nombre de posts et de participants all time du topic COVID-19 au mercredi 3 janvier 2024 à 21:47:32<\/title>/g" cov_20240103214732_01_counts_all.svg
sed -i "s/<title>cov_20240103214732_02_evol_all<\/title>/<title>L'évolution du nombre de participants all time du topic COVID-19 au mercredi 3 janvier 2024 à 21:47:32<\/title>/g" cov_20240103214732_02_evol_all.svg
sed -i "s/<title>cov_20240103214732_03_activite_all_year<\/title>/<title>L'activité all time par an du topic COVID-19 au mercredi 3 janvier 2024 à 21:47:32<\/title>/g" cov_20240103214732_03_activite_all_year.svg
sed -i "s/<title>cov_20240103214732_04_activite_all_month<\/title>/<title>L'activité all time par mois du topic COVID-19 au mercredi 3 janvier 2024 à 21:47:32<\/title>/g" cov_20240103214732_04_activite_all_month.svg
sed -i "s/<title>cov_20240103214732_05_activite_all_week<\/title>/<title>L'activité all time par semaine du topic COVID-19 au mercredi 3 janvier 2024 à 21:47:32<\/title>/g" cov_20240103214732_05_activite_all_week.svg
sed -i "s/<title>cov_20240103214732_06_activite_all_day<\/title>/<title>L'activité all time par jour du topic COVID-19 au mercredi 3 janvier 2024 à 21:47:32<\/title>/g" cov_20240103214732_06_activite_all_day.svg

rm cov_20240103214732_00_data_*

