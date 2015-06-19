#! /usr/bin/awk -f
# Tom Conlin 
# 2015 Apr 16
($2 != last){if(NR > 1){print ""};last=$2}
($2 == last){printf("%s ", $3)}

