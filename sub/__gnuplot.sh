if ls sub_20230707110846_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo!" ; else echo "no sub_20230707110846_00_data file" ; exit 1 ; fi

/usr/bin/gnuplot /home/moi/devs/gittop/sub/sub_20230707110846_00_gnuplot.gpt

sed -i "s/<title>sub_20230707110846_01_counts_all<\/title>/<title>Le nombre de posts et de participants all time du topic du submersible disparu au vendredi 7 juillet 2023 à 11:08:46<\/title>/g" sub_20230707110846_01_counts_all.svg
sed -i "s/<title>sub_20230707110846_02_evol_all<\/title>/<title>L'évolution du nombre de participants all time du topic du submersible disparu au vendredi 7 juillet 2023 à 11:08:46<\/title>/g" sub_20230707110846_02_evol_all.svg
# sed -i "s/<title>sub_20230707110846_03_activite_all_year<\/title>/<title>L'activité all time par an du topic du submersible disparu au vendredi 7 juillet 2023 à 11:08:46<\/title>/g" sub_20230707110846_03_activite_all_year.svg
# sed -i "s/<title>sub_20230707110846_04_activite_all_month<\/title>/<title>L'activité all time par mois du topic du submersible disparu au vendredi 7 juillet 2023 à 11:08:46<\/title>/g" sub_20230707110846_04_activite_all_month.svg
sed -i "s/<title>sub_20230707110846_05_activite_all_week<\/title>/<title>L'activité all time par semaine du topic du submersible disparu au vendredi 7 juillet 2023 à 11:08:46<\/title>/g" sub_20230707110846_05_activite_all_week.svg
sed -i "s/<title>sub_20230707110846_06_activite_all_day<\/title>/<title>L'activité all time par jour du topic du submersible disparu au vendredi 7 juillet 2023 à 11:08:46<\/title>/g" sub_20230707110846_06_activite_all_day.svg

rm sub_20230707110846_00_data_*

