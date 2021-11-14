@echo off

"C:\Program Files\gnuplot\bin\gnuplot" D:\Documents\Devs\gittop\cov\cov_20211114160023_00_gnuplot.gpt

sed -i "s/<title>cov_20211114160023_01_counts<\/title>/<title>Le nombre de posts et de participants du topic COVID-19 au dimamche 14 novembre 2021 \xc3\xa0 16:00:23<\/title>/g" cov_20211114160023_01_counts.svg
sed -i "s/<title>cov_20211114160023_02_evol<\/title>/<title>L'\xc3\xa9volution du nombre de participants du topic COVID-19 au dimamche 14 novembre 2021 \xc3\xa0 16:00:23<\/title>/g" cov_20211114160023_02_evol.svg
sed -i "s/<title>cov_20211114160023_03_activite_month<\/title>/<title>L'activit\xc3\xa9 du topic COVID-19 par mois au dimamche 14 novembre 2021 \xc3\xa0 16:00:23<\/title>/g" cov_20211114160023_03_activite_month.svg
sed -i "s/<title>cov_20211114160023_04_activite_week<\/title>/<title>L'activit\xc3\xa9 du topic COVID-19 par semaine au dimamche 14 novembre 2021 \xc3\xa0 16:00:23<\/title>/g" cov_20211114160023_04_activite_week.svg
sed -i "s/<title>cov_20211114160023_05_activite_day<\/title>/<title>L'activit\xc3\xa9 du topic COVID-19 par jour au dimamche 14 novembre 2021 \xc3\xa0 16:00:23<\/title>/g" cov_20211114160023_05_activite_day.svg
del sed*

