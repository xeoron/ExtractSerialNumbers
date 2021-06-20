#!/usr/bin/perl
# Name: harvestSerialNumbers.pl
# Author: Jason Campisi
# Date: 6/17/2021
# Version 0.1.2 
# Purpose: Harvest Serial Numbers by pattern at the start of a line
# Usage: ./harvestSerialNumbers.pl ./harvestSN.txt
# Repository: https://github.com/xeoron/ExtractSerialNumbers
# License: Released under GPL v3 or higher. Details here http://www.gnu.org/licenses/gpl.html

use strict;

 if( scalar(@ARGV)<=0 ){
     print "Usage: harvestSerialNumbers.pl ./List-to-extract-Serials.txt\n";
     exit;
 }

 my %patterns = (                           #regrep patterns
    
    Dell => qr/^(\w{7})\s/,	                #serial = 7  | Dell CB 3120, CB 3180, Latitude 3400/3410s,
    HPCB => qr/^(\w{10})\s/,                #serial = 10 | HP Chromebook 14AG5 
    Acer => qr/^(\w{22})\s/,	            #serial = 22 | Acerspin, CB 514
    #add more patterns here...

 );


my ($count, @serials)=(0, "");

foreach (<>){
    foreach my $p (keys %patterns){        #find a matching serial #   
        if ($_=~m /$patterns{$p}/i ){       
            $serials[$#serials++] =uc($1) . "\n";
            last;                           #only 1 value needs to match
        }
    }   
}


print sort { length $a <=> length $b } @serials ;  #sort small to large
print "\nTotal Serial Numbers $#serials\n";
exit;