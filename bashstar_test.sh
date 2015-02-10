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

# load shunit2
. src/shunit2
