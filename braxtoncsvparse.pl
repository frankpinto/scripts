#!bin\usr\perl
use strict;

open(FILE,'trillium.csv') || die "Couldn't open file";

my $track = 'Track.find(38)'."\n";
print $track;

my $line_number = 1;
while (my $line = <FILE>)
{
    if ($line =~ /^(\w+)\s*(\w+)\s*,\s*(\w+)\s*/)
    {
        my $performer = "p = Performer.find_or_create_by_first_name_and_last_name(:first_name => '$1', :last_name => '$2')\n";
        my $instrument = "i = Instrument.find_or_create_by_name(:name => '$3')\n";
        my $instruments = "t.track_instruments << TrackInstrument.create(:instrument_id => i.id, :performer_id => p.id)\n\n";
        print $performer,$instrument,$instruments;
    }
    else
    {
        print '#Take care of line ',$line_number,' separately'."\n";
    }
    $line_number++;
}
close FILE;
