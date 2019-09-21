#!/usr/bin/perl

use DateTime;
use DateTime::Duration;
use DateTime::Event::Sunrise;
use strict;

use IO::Async::Timer::Absolute;
use IO::Async::Loop;

use LWP::Simple;




my $today_dt = DateTime->today( time_zone => "local" );
our ( $mylong );
our ( $mylat );
require ( "./config.pl" );



  my $sun_Martinez  = DateTime::Event::Sunrise->new (
                        longitude => $mylong,
                        latitude  => $mylat);




# generating the DateTime::Duration ojbect
my $set_add_duration = DateTime::Duration->new (
			hours    => 0,
			minutes  => 22,
			seconds  => 0
		      );





# generating DateTime objects from a DateTime::Event::Sunrise object
my $sunset_dt  = $sun_Martinez->sunset_datetime($today_dt);





# Coming up with the final DateTime ojbect
my $tmp2_dt = $sunset_dt->clone;
$tmp2_dt->add_duration ( $set_add_duration );
$tmp2_dt->set_time_zone( "local");

print  "Date: " . $today_dt->datetime . "\n" .
       "Sunset: " . $sunset_dt->hms . "\n" .
       "Alarm: " . $tmp2_dt->hms . "\n";




# creating a timer and a loop ojbect
my $loop2  = IO::Async::Loop->new;
my $timer2 = IO::Async::Timer::Absolute->new(
		time      => $tmp2_dt->epoch(),
		on_expire => sub {
					#get ( "http://10.0.1.187/cgi-bin/play.pl?file=Ezan_IsaAydin&gain=40" );
					#get ( "http://10.0.1.187/cgi-bin/play.pl?file=Adhan-AbadharHalwachi&gain=40" );
					#get ( "http://10.0.1.187/cgi-bin/play.pl?file=Adhan-MasjideKufa&gain=200" );
                    #get ( "http://10.0.1.187/cgi-bin/play.pl?file=Adhan-Shia&gain=70" );
                    announce_adhan ( );
					$loop2->stop;
				 },
		);



# setting the timer
$loop2->add ( $timer2 );
$loop2->run;


