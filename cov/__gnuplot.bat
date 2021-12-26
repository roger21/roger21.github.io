@echo off

"C:\Program Files\gnuplot\bin\gnuplot" D:\Documents\Devs\gittop\cov\cov_20211226162813_00_gnuplot.gpt

sed -i "s/<title>cov_20211226162813_01_counts_all<\/title>/<title>Le nombre de posts et de participants all time du topic COVID-19 au dimamche 26 d\xc3\xa9cembre 2021 \xc3\xa0 16:28:13<\/title>/g" cov_20211226162813_01_counts_all.svg
sed -i "s/<title>cov_20211226162813_02_evol_all<\/title>/<title>L'\xc3\xa9volution du nombre de participants all time du topic COVID-19 au dimamche 26 d\xc3\xa9cembre 2021 \xc3\xa0 16:28:13<\/title>/g" cov_20211226162813_02_evol_all.svg
sed -i "s/<title>cov_20211226162813_03_activite_all_month<\/title>/<title>L'activit\xc3\xa9 all time par mois du topic COVID-19 au dimamche 26 d\xc3\xa9cembre 2021 \xc3\xa0 16:28:13<\/title>/g" cov_20211226162813_03_activite_all_month.svg
sed -i "s/<title>cov_20211226162813_04_activite_all_week<\/title>/<title>L'activit\xc3\xa9 all time par semaine du topic COVID-19 au dimamche 26 d\xc3\xa9cembre 2021 \xc3\xa0 16:28:13<\/title>/g" cov_20211226162813_04_activite_all_week.svg
sed -i "s/<title>cov_20211226162813_05_activite_all_day<\/title>/<title>L'activit\xc3\xa9 all time par jour du topic COVID-19 au dimamche 26 d\xc3\xa9cembre 2021 \xc3\xa0 16:28:13<\/title>/g" cov_20211226162813_05_activite_all_day.svg
del sed*

