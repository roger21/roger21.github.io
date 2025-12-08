if ls lrm_20251030143511_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! LRM" ; else echo "no lrm_20251030143511_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed LRM :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/lrm/lrm_20251030143511_00_gnuplot.gp

sed -i "s/<title>lrm_20251030143511_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic LREM<\/title>/g" lrm_20251030143511_g1_counts_all.svg
sed -i "s/<title>lrm_20251030143511_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic LREM<\/title>/g" lrm_20251030143511_g2_evol_all.svg
sed -i "s/<title>lrm_20251030143511_g3_lrem_versus_politiques<\/title>/<title>Le topic LREM versus les topics politiques en nombre de posts en 2024<\/title>/g" lrm_20251030143511_g3_lrem_versus_politiques.svg

rm lrm_20251030143511_00_data_*

