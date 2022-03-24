@echo off

if not exist "cul_20220108032316_00_data_*" exit /b

"C:\Program Files\gnuplot\bin\gnuplot" cul_20220108032316_00_gnuplot.gpt

sed -i "s/<title>cul_20220108032316_12_course_image<\/title>/<title>Le topic culture g\xc3\xa9n\xc3\xa9rale versus le topic images en nombre de posts en 2021<\/title>/g" cul_20220108032316_12_course_image.svg
sed -i "s/<title>cul_20220108032316_13_course_image_zoom<\/title>/<title>Le topic culture g\xc3\xa9n\xc3\xa9rale versus le topic images en nombre de posts zoom\xc3\xa9 en 2021<\/title>/g" cul_20220108032316_13_course_image_zoom.svg
del sed*

del cul_20220108032316_00_data_*

