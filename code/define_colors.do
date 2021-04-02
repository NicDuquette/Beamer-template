global ishandout=1
if ${ishandout}==1 {					// Set globals this way if it's for a handout
	global xmono "black"				// Colors
	global xred=`""255 30 30""'
	global xgreen=`""0 158 85""'
	global xblue =`""0 114 178""'
	global xpurple=`""163 82 143""'
	global xyellow=`""240 228 66""'
	global xorange=`""213 111 62""'
	global xbrown=`""76 35 10""'
	global xbg "white"

	global xscheme "s1color"			// Twoway plot theme
	
	global figsave "../figs_light"		// Where to save the figure
} 
else {									// Classroom globals
	global xmono "white"
	global xred=`""255 81 81""'
	global xgreen=`""0 250 95""'
	global xblue=`""100 150 255""'
	global xpurple `""232 179 252""'
	global xyellow `""240 228 66""'
	global xorange `""255 140 33""'
	global xbrown `""144 67 19""'
	global xbg "black"
	global xscheme "s1rcolor"
	global figsave "../figs_dark"
}
