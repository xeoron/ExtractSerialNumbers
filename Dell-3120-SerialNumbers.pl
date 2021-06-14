#!/usr/bin/perl
# Name: Dell-3120-SerialNumbers.pl
# Author: Jason Campisi
# Date: 6/14/2021
# Version 0.1 
# Purpose: Harvest Dell 3120 Serial Numbers from text files that are at
# the beginning of the each line.
# Usage: ./Dell-3120-SerialNumbers.pl ./harvestSN.txt
# Repository: https://github.com/xeoron/ExtractSerialNumbers
# License: Released under GPL v3 or higher. Details here http://www.gnu.org/licenses/gpl.html

#Note Dell's 3120 SN's are 7 digits long

return if( scalar(@ARGV)<=0);

my $count=0;
foreach (<>){
     if ($_=~m /^(\w{7})\s/i ){
         print "$1\n";
         $count++;
     }
}

print "\nTotal Serial Numbers $count\n";