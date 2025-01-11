#!/usr/bin/env bash
if [ ! -d ".git" ]; then
	git init
fi

x=314
y=251
u=188

fl=0
cnt=0
do_something() {
	if [[ fl -eq 0 ]]; then
		echo "hui" > xyu
		fl=1
	else 
		rm xyu
		fl=0
	fi
}

drow() {
	# $1 - start
	# $2 - step
	# $2 - limit steps
	
	for ((i=0; i<$3;++i)); do
		tmp_date=$(date -d "-$(($1-(i*$2))) days")
		do_something
		git add .
		git commit -m "$((++cnt))" --date "$tmp_date"
	done
}

# x
drow $x 8 7
drow $((x-6)) 6 7

# y
drow $y 8 4
drow $((y-6)) 6 7

# й
drow $((u-1)) 1 6
drow $((u-(7*5)-1)) 1 6
drow $((u-6)) 6 6
drow $((u-(7*2))) 7 2 
