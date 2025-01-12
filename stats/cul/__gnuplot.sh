if ls cul_20250111012354_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! CUL" ; else echo "no cul_20250111012354_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed CUL :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/cul/cul_20250111012354_00_gnuplot.gp

sed -i "s/<title>cul_20250111012354_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic culture générale<\/title>/g" cul_20250111012354_g1_counts_all.svg
sed -i "s/<title>cul_20250111012354_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic culture générale<\/title>/g" cul_20250111012354_g2_evol_all.svg
sed -i "s/<title>cul_20250111012354_g3_course_image<\/title>/<title>Le topic culture générale versus le topic images en nombre de posts en 2024<\/title>/g" cul_20250111012354_g3_course_image.svg
sed -i "s/<title>cul_20250111012354_g4_course_image_zoom<\/title>/<title>Le topic culture générale versus le topic images en nombre de posts zoomé en 2024<\/title>/g" cul_20250111012354_g4_course_image_zoom.svg
sed -i "s/<title>cul_20250111012354_g5_babylones_mayrde<\/title>/<title>Le nombre de laurekas et les babylones de mayrde all time 2024 du topic culture générale<\/title>/g" cul_20250111012354_g5_babylones_mayrde.svg

rm cul_20250111012354_00_data_*

