if ls cul_20230106091029_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo!" ; else echo "no cul_20230106091029_00_data file" ; exit 1 ; fi

/usr/bin/gnuplot /home/moi/devs/gittop/cul/cul_20230106091029_00_gnuplot.gp

sed -i "s/<title>cul_20230106091029_12_course_image<\/title>/<title>Le topic culture générale versus le topic images en nombre de posts en 2022<\/title>/g" cul_20230106091029_12_course_image.svg
sed -i "s/<title>cul_20230106091029_13_course_image_zoom<\/title>/<title>Le topic culture générale versus le topic images en nombre de posts zoomé en 2022<\/title>/g" cul_20230106091029_13_course_image_zoom.svg
sed -i "s/<title>cul_20230106091029_14_babylones_mayrde<\/title>/<title>Le nombre all time de laurekas et les babylones de mayrde du topic culture générale en 2022<\/title>/g" cul_20230106091029_14_babylones_mayrde.svg

rm cul_20230106091029_00_data_*

