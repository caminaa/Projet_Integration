#! /bin/sh
# file: bashstar_test.sh

testPingTrue()
{
  variable=$(ping -c 10 -i 0.2 8.8.8.8 -q -w 1 | tail -n 1 | cut -d' ' -f4 | cut -d'/' -f2)
  assertTrue 'Ca doit retourner une valeur' "[ variable ]"
}

testPingFalse()
{
	variable=$(ping -c 10 -i 0.2 8 2>/dev/null)
	assertEquals \ '' \ ${variable}
}

testMonIpTrue()
{
 	variable=`ip route get 8.8.8.8 2>/dev/null | awk 'NR==1 {print $NF}' 2>/dev/null`
	assertEquals \ `ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1 }'` \ ${variable}
}

testMonIpFalse()
{
	ifconfig eth0 down
 	variable=`ip route get 8.8.8.8 2>/dev/null`
	ifconfig eth0 up
	assertEquals \ '' \ ${variable}
}


# load shunit2
. src/shunit2
