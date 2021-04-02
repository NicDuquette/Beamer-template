
	// An example graph
webuse auto, clear
twoway (scatter weight length if price<4000, mcolor(${xred}) mlcolor(${xmono}))					///
	(scatter weight length if price<4500 & price>=4000, mcolor(${xorange}) mlcolor(${xmono}))	///
	(scatter weight length if price<5000 & price>=4500, mcolor(${xyellow}) mlcolor(${xmono}))	///
	(scatter weight length if price<7000 & price>=6000, mcolor(${xgreen}) mlcolor(${xmono}))	///
	(scatter weight length if price<10000 & price>=7000, mcolor(${xblue}) mlcolor(${xmono}))	///
	(scatter weight length if price<12000 & price>=10000, mcolor(${xpurple}) mlcolor(${xmono}))	///
	(scatter weight length if price>=12000, mcolor(${xbrown}) mlcolor(${xmono}))				///
	, scheme(${xscheme}) legend(off)
graph display, xsize(16) ysize(9)	
graph export "${figsave}/auto.png", as(png) replace 

