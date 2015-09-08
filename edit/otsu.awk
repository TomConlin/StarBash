#! /usr/bin/awk -f 
# otsu.awk
# Tom Conlin  
# Otsu Method for finding the threshold of a partitioning
# to maximize the difference between sides of the partition.
# https://en.wikipedia.org/wiki/Otsu%27s_method 
# the values are expected to be numeric
# example :
# sort a list min to max generate histogram and find threshold value
# cut -f3  xyz.txt | sort -n | uniq -c  | otsu.awk

# store and accumulate the histogram
{   
	counts[NR] = $1;
	values[NR] = $2;
	rcount += $1;
	rvalue += $2; 
}
# scan the histogram left to right 
# recording the highest threshold which is taken as
# the most variance between clases  which implies the 
# least variance within the classes 
END {
	maxidx= 1;
	for (t=1; t<NR; t++) {
	 	lvalue+=values[t]; lcount+=counts[t]; 
	 	rvalue-=values[t]; rcount-=counts[t]; 
	 	lvmean = lvalue / lcount;
	 	rvmean = rvalue / rcount;
	 	lrdiff = lvmean - rvmean;
	 	thresh[t] = lrdiff * lrdiff * lcount * rcount;
		maxidx = thresh[t] > thresh[maxidx] ? t : maxidx;
	}
	print values[maxidx]
}