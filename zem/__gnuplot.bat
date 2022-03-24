@echo off

if not exist "zem_20220321121041_00_data_*" exit /b

"C:\Program Files\gnuplot\bin\gnuplot" D:\Documents\Devs\gittop\zem\zem_20220321121041_00_gnuplot.gpt

sed -i "s/<title>zem_20220321121041_01_counts_all<\/title>/<title>Le nombre de posts et de participants all time du topic Zemmour au lundi 21 mars 2022 \xc3\xa0 12:10:41<\/title>/g" zem_20220321121041_01_counts_all.svg
sed -i "s/<title>zem_20220321121041_02_evol_all<\/title>/<title>L'\xc3\xa9volution du nombre de participants all time du topic Zemmour au lundi 21 mars 2022 \xc3\xa0 12:10:41<\/title>/g" zem_20220321121041_02_evol_all.svg
del sed*

del zem_20220321121041_00_data_*

