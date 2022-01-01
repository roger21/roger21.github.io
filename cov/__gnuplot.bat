@echo off

"C:\Program Files\gnuplot\bin\gnuplot" D:\Documents\Devs\gittop\cov\cov_20220101144711_00_gnuplot.gpt

sed -i "s/<title>cov_20220101144711_01_counts_all<\/title>/<title>Le nombre de posts et de participants all time du topic COVID-19 au samedi 1 janvier 2022 \xc3\xa0 14:47:11<\/title>/g" cov_20220101144711_01_counts_all.svg
sed -i "s/<title>cov_20220101144711_02_evol_all<\/title>/<title>L'\xc3\xa9volution du nombre de participants all time du topic COVID-19 au samedi 1 janvier 2022 \xc3\xa0 14:47:11<\/title>/g" cov_20220101144711_02_evol_all.svg
sed -i "s/<title>cov_20220101144711_03_activite_all_month<\/title>/<title>L'activit\xc3\xa9 all time par mois du topic COVID-19 au samedi 1 janvier 2022 \xc3\xa0 14:47:11<\/title>/g" cov_20220101144711_03_activite_all_month.svg
sed -i "s/<title>cov_20220101144711_04_activite_all_week<\/title>/<title>L'activit\xc3\xa9 all time par semaine du topic COVID-19 au samedi 1 janvier 2022 \xc3\xa0 14:47:11<\/title>/g" cov_20220101144711_04_activite_all_week.svg
sed -i "s/<title>cov_20220101144711_05_activite_all_day<\/title>/<title>L'activit\xc3\xa9 all time par jour du topic COVID-19 au samedi 1 janvier 2022 \xc3\xa0 14:47:11<\/title>/g" cov_20220101144711_05_activite_all_day.svg
del sed*

