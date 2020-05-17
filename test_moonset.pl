#!/usr/bin/perl



use DateTime;
use IO::Async::Timer::Absolute;
use IO::Async::Loop;
use LWP::Simple;
use Astro::Coord::ECI;
use Astro::Coord::ECI::Moon;
use Astro::Coord::ECI::Utils qw{deg2rad};
use strict;
 



our ( $mylong );
our ( $mylat );
our ( $myalt );
require ( "/home/pi/sunrise/config.pl" );


my $test_dt = DateTime->new (
                                year     => 2020,
                                month    => 5,
                                day      => $ARGV[0],
                                hour     => 16,
                                minute   => 0,
                                second   => 0,
                                time_zone => "local"
                            );

print "date: ";
print $test_dt->mdy;

print " ";
print $test_dt->hms;

my $lat = deg2rad ($mylat);    # Radians
my $long = deg2rad ($mylong);  # Radians
my $alt = $myalt / 1000;        # Kilometers
my $moon = Astro::Coord::ECI::Moon -> new ();
my $sta = Astro::Coord::ECI ->
                        universal ( $test_dt->epoch() ) ->
                        geodetic ($lat, $long, $alt);
my ($moon_time, $rise) = $sta->next_elevation ($moon);
print "\tMoon @{[$rise ? 'rise' : 'set']} is ",
    scalar localtime $moon_time, "\t";



if ( $rise )
{
    print "rise next \t";
}
else
{
    print "set  next \t";
}


# generating DateTime objects from a DateTime::Event::Sunrise object
my $moonset_dt = DateTime->from_epoch ( epoch => $moon_time );
$moonset_dt->set_time_zone( 'local');

if ( ( $moonset_dt->hour < 16 )  ||
     ( $moonset_dt->hour > 21 ) )
{
    #  if moonset is occurring before 4pm or after 10pm (technically 9:59) then don't set alarm
    #  it goes to the next calendar day and starts reporting the prior day's moonset time
    print "moontime is out of bounds (16,21) exiting\n";
    exit;
}



#-------------------------------------------------------------






##################################################



print  "Date: " .  $moonset_dt->mdy . " " .
       "Alarm: " . $moonset_dt->hms . "\n" ;


my $loop2  = IO::Async::Loop->new;
my $timer2 = IO::Async::Timer::Absolute->new(
		time      => $moonset_dt->epoch(),
		on_expire => sub {
                    #get ( "http://10.0.1.187/cgi-bin/play.pl?file=zen" );
                    #get ( "http://10.0.1.187/cgi-bin/play.pl?file=airport_chime3" );
                    if ( $rise )
                    {
                        #get ( "http://10.0.1.187/cgi-bin/play.pl?file=moonrise" );
                    }
                    else
                    {
                        #get ( "http://10.0.1.187/cgi-bin/play.pl?file=moonset" );
                    }
					$loop2->stop;
				 },
		);

$loop2->add ( $timer2 );
$loop2->run;


