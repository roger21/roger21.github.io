if ls dem_20251110014748_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! DEM" ; else echo "no dem_20251110014748_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed DEM :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/dem/dem_20251110014748_00_gnuplot.gp

sed -i "s/<title>dem_20251110014748_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic du Mouvement démocrate<\/title>/g" dem_20251110014748_g1_counts_all.svg
sed -i "s/<title>dem_20251110014748_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic du Mouvement démocrate<\/title>/g" dem_20251110014748_g2_evol_all.svg

rm dem_20251110014748_00_data_*

