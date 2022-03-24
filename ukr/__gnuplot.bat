@echo off

if not exist "ukr_20220321115546_00_data_*" exit /b

"C:\Program Files\gnuplot\bin\gnuplot" D:\Documents\Devs\gittop\ukr\ukr_20220321115546_00_gnuplot.gpt

sed -i "s/<title>ukr_20220321115546_01_counts_all<\/title>/<title>Le nombre de posts et de participants all time du topic Ukraine au lundi 21 mars 2022 \xc3\xa0 11:55:46<\/title>/g" ukr_20220321115546_01_counts_all.svg
sed -i "s/<title>ukr_20220321115546_02_evol_all<\/title>/<title>L'\xc3\xa9volution du nombre de participants all time du topic Ukraine au lundi 21 mars 2022 \xc3\xa0 11:55:46<\/title>/g" ukr_20220321115546_02_evol_all.svg
del sed*

del ukr_20220321115546_00_data_*

