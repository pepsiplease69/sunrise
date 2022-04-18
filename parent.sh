#!/bin/csh

while ( 1 )
    ~/sunrise/01-imsak.pl
    ~/sunrise/02-fajr.pl
    ~/sunrise/03-sunrise.pl
    ~/sunrise/04-zuhr.pl
    ~/sunrise/99-asr-start.pl
    ~/sunrise/99-asr-end.pl
    ~/sunrise/05-sunset.pl
    ~/sunrise/06-maghrib.pl
    ~/sunrise/wait_for_tomorrow.sh
end

