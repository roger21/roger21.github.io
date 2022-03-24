@echo off

if not exist "foo_20220108035310_00_data_*" exit /b

"C:\Program Files\gnuplot\bin\gnuplot" foo_20220108035310_00_gnuplot.gpt

sed -i "s/<title>foo_20220108035310_41_foot_versus_covid<\/title>/<title>Le topic foot versus le topic COVID-19 en nombre de posts en 2021<\/title>/g" foo_20220108035310_41_foot_versus_covid.svg
sed -i "s/<title>foo_20220108035310_42_foot_versus_world<\/title>/<title>Le topic foot versus the world en nombre de posts en 2021<\/title>/g" foo_20220108035310_42_foot_versus_world.svg
del sed*

del foo_20220108035310_00_data_*

