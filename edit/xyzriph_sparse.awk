#! /usr/bin/awk -f
# RIPH remove isolated [HOT] pixels from a  xyz list (SPARSE OK)

# remove any isolated pixle
# xyzriph_sparse.awk stars_bright_only.tab > stars_bright_riph.tab

# only remove if isolated and at or above some limit
# xyzriph_sparse.awk -v"HOT=57112"  stars_bright_only.tab > stars_bright_riph.tab

{ 	a[$1,$2]=$3; b[$1,$2]=$0}

END{
	for (pixle in a) {
		if (HOT && (a[pixle] < HOT)){ 
			print b[pixle]
		} else {
			split(pixle,p,SUBSEP); 
		 	if( a[p[1]  ,p[2]-1]||a[p[1]  ,p[2]+1]||
		 		a[p[1]-1,p[2]]  ||a[p[1]+1,p[2]  ]||
		 		a[p[1]-1,p[2]-1]||a[p[1]+1,p[2]+1]||
		 		a[p[1]+1,p[2]-1]||a[p[1]-1,p[2]+1]){
				print b[pixle]
			}
		}
	}
}
