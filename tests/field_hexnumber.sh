# added 2015-03-01 by Rainer Gerhards
# This file is part of the liblognorm project, released under ASL 2.0
source ./exec.sh $0 "hexnumber field"
add_rule 'rule=:here is a number %num:hexnumber% in hex form'
execute 'here is a number 0x1234 in hex form'
assert_output_json_eq '{"num": "0x1234"}'

#check cases where parsing failure must occur
execute 'here is a number 0x1234in hex form'
assert_output_json_eq '{ "originalmsg": "here is a number 0x1234in hex form", "unparsed-data": "0x1234in hex form" }'
