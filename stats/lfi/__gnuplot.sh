if ls lfi_20251107141923_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! LFI" ; else echo "no lfi_20251107141923_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed LFI :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/lfi/lfi_20251107141923_00_gnuplot.gp

sed -i "s/<title>lfi_20251107141923_g1_counts_all<\/title>/<title>Le nombre de posts et de participants all time 2024 du topic LFI<\/title>/g" lfi_20251107141923_g1_counts_all.svg
sed -i "s/<title>lfi_20251107141923_g2_evol_all<\/title>/<title>L'évolution du nombre de participants all time 2024 du topic LFI<\/title>/g" lfi_20251107141923_g2_evol_all.svg

rm lfi_20251107141923_00_data_*

