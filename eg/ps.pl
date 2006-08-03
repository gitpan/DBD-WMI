#!/usr/bin/perl -w
package main;
use strict;
use Data::Dumper;

use DBI;
my $dbh = DBI->connect('dbi:WMI:');

my $sth = $dbh->prepare(<<WQL);
    SELECT * FROM Win32_Process
WQL

$sth->execute();
while (defined (my $row = $sth->fetchrow_arrayref())) {
    my $ev = $row->[0];
    print join "\t", $ev->{Caption}, $ev->{ExecutablePath};
    # $ev->{CommandLine}, 
    #print $ev->TargetInstance->Name;
    print "\n";
}
