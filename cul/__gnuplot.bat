@echo off

"C:\Program Files\gnuplot\bin\gnuplot" cul_20211120193642_00_gnuplot.gpt

sed -i "s/<title>cul_20211120193642_14_course_image<\/title>/<title>Le topic culture g\xc3\xa9n\xc3\xa9rale versus le topic images en nombre de posts en 2020<\/title>/g" cul_20211120193642_14_course_image.svg
del sed*

