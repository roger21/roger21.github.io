if ls foo_20220108035310_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo!" ; else echo "no foo_20220108035310_00_data file" ; exit 1 ; fi

/usr/bin/gnuplot /home/moi/devs/gittop/foo/foo_20220108035310_00_gnuplot.gpt

sed -i "s/<title>foo_20220108035310_41_foot_versus_covid<\/title>/<title>Le topic foot versus le topic COVID-19 en nombre de posts en 2021<\/title>/g" foo_20220108035310_41_foot_versus_covid.svg
sed -i "s/<title>foo_20220108035310_42_foot_versus_world<\/title>/<title>Le topic foot versus the world en nombre de posts en 2021<\/title>/g" foo_20220108035310_42_foot_versus_world.svg

rm foo_20220108035310_00_data_*
