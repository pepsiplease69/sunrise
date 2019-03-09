#!/usr/bin/perl

use DateTime;
use DateTime::Duration;
use DateTime::Event::Sunrise;
use strict;

use IO::Async::Timer::Absolute;
use IO::Async::Loop;

use LWP::Simple;



my $today_dt = DateTime->today( time_zone => "local" );



# generating the DateTime::Event::Sunrise object
my $astro_Martinez  = DateTime::Event::Sunrise->new (
			altitude  => '-15',
			longitude => 0.000000,
                        latitude  => 0.000000
	   	      );



# generating the DateTime::Duration ojbect
my $rise_subtract_duration = DateTime::Duration->new (
				hours    => 0,
				minutes  => 5,
				seconds  => 0
			     );



# generating DateTime objects from a DateTime::Event::Sunrise object
my $sunrise_dt = $astro_Martinez->sunrise_datetime($today_dt);



# Coming up with the final DateTime ojbect
my $tmp1_dt = $sunrise_dt->clone;
$tmp1_dt->subtract_duration ( $rise_subtract_duration );
$tmp1_dt->set_time_zone( 'America/Los_Angeles');

print  "Date: " . $today_dt->datetime . "\n" .
       "Astronomical Twilight: " . $sunrise_dt->hms . "\n" .
       "Alarm: " . $tmp1_dt->hms . "\n\n\n";



# creating a timer and a loop ojbect
my $loop1  = IO::Async::Loop->new;
my $timer1 = IO::Async::Timer::Absolute->new(
		time      => $tmp1_dt->epoch(),
		on_expire => sub {
					get ( "http://10.0.1.187/cgi-bin/play.pl?file=zen" );
					get ( "http://10.0.1.187/cgi-bin/play.pl?file=twilight" );

					$loop1->stop;
				 },
		);




# setting the timer
$loop1->add ( $timer1 );
$loop1->run;

