@echo off

"C:\Program Files\gnuplot\bin\gnuplot" D:\Documents\Devs\gittop\cov\cov_20211023141824_00_gnuplot.gpt

sed -i "s/<title>cov_20211023141824_01_counts<\/title>/<title>Le nombre de posts et de participants du topic COVID-19 au samedi 23 octobre 2021 \xc3\xa0 14:18:24<\/title>/g" cov_20211023141824_01_counts.svg
sed -i "s/<title>cov_20211023141824_02_evol<\/title>/<title>L'\xc3\xa9volution du nombre de participants du topic COVID-19 au samedi 23 octobre 2021 \xc3\xa0 14:18:24<\/title>/g" cov_20211023141824_02_evol.svg
sed -i "s/<title>cov_20211023141824_03_activite_month<\/title>/<title>L'activit\xc3\xa9 du topic COVID-19 par mois au samedi 23 octobre 2021 \xc3\xa0 14:18:24<\/title>/g" cov_20211023141824_03_activite_month.svg
sed -i "s/<title>cov_20211023141824_04_activite_week<\/title>/<title>L'activit\xc3\xa9 du topic COVID-19 par semaine au samedi 23 octobre 2021 \xc3\xa0 14:18:24<\/title>/g" cov_20211023141824_04_activite_week.svg
sed -i "s/<title>cov_20211023141824_05_activite_day<\/title>/<title>L'activit\xc3\xa9 du topic COVID-19 par jour au samedi 23 octobre 2021 \xc3\xa0 14:18:24<\/title>/g" cov_20211023141824_05_activite_day.svg
del sed*

