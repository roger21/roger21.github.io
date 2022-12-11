if ls cov_20221211142834_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo!" ; else echo "no cov_20221211142834_00_data file" ; exit 1 ; fi

/usr/bin/gnuplot /home/moi/devs/gittop/cov/cov_20221211142834_00_gnuplot.gpt

sed -i "s/<title>cov_20221211142834_01_counts_all<\/title>/<title>Le nombre de posts et de participants all time du topic COVID-19 au dimamche 11 décembre 2022 à 14:28:34<\/title>/g" cov_20221211142834_01_counts_all.svg
sed -i "s/<title>cov_20221211142834_02_evol_all<\/title>/<title>L'évolution du nombre de participants all time du topic COVID-19 au dimamche 11 décembre 2022 à 14:28:34<\/title>/g" cov_20221211142834_02_evol_all.svg
sed -i "s/<title>cov_20221211142834_03_activite_all_month<\/title>/<title>L'activité all time par mois du topic COVID-19 au dimamche 11 décembre 2022 à 14:28:34<\/title>/g" cov_20221211142834_03_activite_all_month.svg
sed -i "s/<title>cov_20221211142834_04_activite_all_week<\/title>/<title>L'activité all time par semaine du topic COVID-19 au dimamche 11 décembre 2022 à 14:28:34<\/title>/g" cov_20221211142834_04_activite_all_week.svg
sed -i "s/<title>cov_20221211142834_05_activite_all_day<\/title>/<title>L'activité all time par jour du topic COVID-19 au dimamche 11 décembre 2022 à 14:28:34<\/title>/g" cov_20221211142834_05_activite_all_day.svg

rm cov_20221211142834_00_data_*

