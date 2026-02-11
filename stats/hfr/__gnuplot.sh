if ls hfr_20251211113722_00_data_* 1>/dev/null 2>&1 ; then echo "lessgo! HFR" ; else echo "no hfr_20251211113722_00_data file" ; exit 1 ; fi

/usr/bin/time -f "\tElapsed HFR :\t%E" /usr/bin/gnuplot /home/moi/devs/gittop/stats/hfr/hfr_20251211113722_00_gnuplot.gp

optipng /home/moi/devs/gittop/stats/hfr/hfr_20251211113722_*.png

rm hfr_20251211113722_00_data_*

