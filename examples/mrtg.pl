#!/usr/bin/env perl

# +--------------------------------------------------------------------------+
# | Licensed under the Apache License, Version 2.0 (the "License");          |
# | you may not use this file except in compliance with the License.         |
# | You may obtain a copy of the License at                                  |
# |                                                                          |
# |     http://www.apache.org/licenses/LICENSE-2.0                           |
# |                                                                          |
# | Unless required by applicable law or agreed to in writing, software      |
# | distributed under the License is distributed on an "AS IS" BASIS,        |
# | WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. |
# | See the License for the specific language governing permissions and      |
# | limitations under the License.                                           |
# +--------------------------------------------------------------------------+

use strict;
use warnings;

use TL1::Toolkit;

###########################################################################
# Local configuration data

my $username = "xxxx";
my $password = "xxxx";

# End of local configuration data
###########################################################################

if ($#ARGV != 2) {
	print "usuage: mrtg.pl hostname slot port\n";
	exit;
}
my $hostname = $ARGV[0];
my $slot = $ARGV[1];
my $port = $ARGV[2];

my $tl1 = TL1::Toolkit->new(
        hostname => $hostname,
        username => $username,
        password => $password,
        peerport => '23',
        slot  => $slot,
        port  => $port,
        verbose  => 0,
);

if ($tl1->open() == 0) {
	print STDERR "$0 Could not connect to $hostname\n";
	exit 1;
}

my $inoctets =  $tl1->get_inoctets();
if (!defined($inoctets)) {
	print STDERR "$0: retr_inoctets cmd failed on $hostname\n";
	$tl1->close();
	exit 1;
}

my $outoctets =  $tl1->get_outoctets();
if (!defined($outoctets)) {
	print STDERR "$0: outoctets cmd failed on $hostname\n";
	$tl1->close();
	exit 1;
}

# logout and disconnect
$tl1->close();

# generate MRTG output

print "$inoctets\n";
print "$outoctets\n";
print "Unknown\n";
print "$hostname\n";

exit 0;
