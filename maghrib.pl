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







##################################################

# generating DateTime objects from a DateTime::Event::Sunrise object
my $sunset_dt  = $sun_Martinez->sunset_datetime($today_dt);

my $tmp2_dt = $sunset_dt->clone;
$tmp2_dt->set_time_zone( "local");

print  "Date: " . $today_dt->datetime . "\n" .
       "Alarm: " . $tmp2_dt->hms . "\n" .
       "Sunset: " . $sunset_dt->hms . "\n";


my $loop2  = IO::Async::Loop->new;
my $timer2 = IO::Async::Timer::Absolute->new(
        time      => $tmp2_dt->epoch(),
        on_expire => sub {
                    announce_sunset ( );
                    $loop2->stop;
                 },
        );

$loop2->add ( $timer2 );
$loop2->run;


