if ls sub_20231220183304_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo!" ; else echo "no sub_20231220183304_00_data file" ; exit 1 ; fi

/usr/bin/gnuplot /home/moi/devs/gittop/sub/sub_20231220183304_00_gnuplot.gp

sed -i "s/<title>sub_20231220183304_01_counts_all<\/title>/<title>Le nombre de posts et de participants all time du topic submersible disparu au mercredi 20 décembre 2023 à 18:33:04<\/title>/g" sub_20231220183304_01_counts_all.svg
sed -i "s/<title>sub_20231220183304_02_evol_all<\/title>/<title>L'évolution du nombre de participants all time du topic submersible disparu au mercredi 20 décembre 2023 à 18:33:04<\/title>/g" sub_20231220183304_02_evol_all.svg
# sed -i "s/<title>sub_20231220183304_03_activite_all_year<\/title>/<title>L'activité all time par an du topic submersible disparu au mercredi 20 décembre 2023 à 18:33:04<\/title>/g" sub_20231220183304_03_activite_all_year.svg
sed -i "s/<title>sub_20231220183304_04_activite_all_month<\/title>/<title>L'activité all time par mois du topic submersible disparu au mercredi 20 décembre 2023 à 18:33:04<\/title>/g" sub_20231220183304_04_activite_all_month.svg
sed -i "s/<title>sub_20231220183304_05_activite_all_week<\/title>/<title>L'activité all time par semaine du topic submersible disparu au mercredi 20 décembre 2023 à 18:33:04<\/title>/g" sub_20231220183304_05_activite_all_week.svg
sed -i "s/<title>sub_20231220183304_06_activite_all_day<\/title>/<title>L'activité all time par jour du topic submersible disparu au mercredi 20 décembre 2023 à 18:33:04<\/title>/g" sub_20231220183304_06_activite_all_day.svg

rm sub_20231220183304_00_data_*

