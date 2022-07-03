if ls cul_20220108032316_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo!" ; else echo "no cul_20220108032316_00_data file" ; exit 1 ; fi

/usr/bin/gnuplot /home/moi/devs/gittop/cul/cul_20220108032316_00_gnuplot.gpt

sed -i "s/<title>cul_20220108032316_12_course_image<\/title>/<title>Le topic culture générale versus le topic images en nombre de posts en 2021<\/title>/g" cul_20220108032316_12_course_image.svg
sed -i "s/<title>cul_20220108032316_13_course_image_zoom<\/title>/<title>Le topic culture générale versus le topic images en nombre de posts zoomé en 2021<\/title>/g" cul_20220108032316_13_course_image_zoom.svg

rm cul_20220108032316_00_data_*

