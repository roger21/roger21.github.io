@echo off

"C:\Program Files\gnuplot\bin\gnuplot" foo_20211127011550_00_gnuplot.gpt

sed -i "s/<title>foo_20211127011550_41_foot_versus_covid<\/title>/<title>Le topic foot versus le topic COVID-19 en nombre de posts en 2020<\/title>/g" foo_20211127011550_41_foot_versus_covid.svg
del sed*

del foo_20211127011550_00_data_*

