# A Beamer template for teaching

This is a template for presentation slides in LaTeX/Beamer. It is designed
for teaching econometrics (math and coding). It does so using additional
tools outside of LaTeX to extend what can be done and add useful features.

This requires some additional setup! If you don't want an explanation and
want to just jump ahead to getting started, see [setup](#setup).

If you want a nice-looking Beamer template that doesn't do all of this extra
stuff, look at [Paul Goldsmith-Pinkham's](https://github.com/paulgp/beamer-tips).

**WARNING**: This is a preliminary version of a Beamer template.
It's not done. Not even this
README is done. It probably has a lot of bugs. If I haven't emailed it to you
asking for your opinion about something specific, you probably shouldn't
touch it.

## What is this for?

This template compiles the same LaTeX markup in two different ways. One way
is designed for projection on a screen while delivering a classroom lecture.
The second way is designed for student handouts. This makes it very simple
to automatically change
the resulting output in ways that are appropriate for the two different
types of documents.

Some of the differences between the two versions include:
* Different color schemes are optimized for viewing on a projector vs. a small
	screen or printout.
* In the classroom, overlays are used to animate slides. On a handout,
	they're not.
* Hidden content, such as solutions to exercises, can be added to the classroom
	version only

There are also various tricks and custom commands in the template, such as
highlighted code blocks, fancy image handling, and custom buttons.


## <a name="setup"></a>Using this template

You need to be comfortable going beyond LaTeX for some parts of this template.
This section explains what you'll need and how to use these extra tools.

### What's in this directory?
+ *LaTeX Code*: The `/slides-tex/` folder contains the actual LaTeX used to
	create the slides.
	- `slides.tex` is the code for the actual slide deck itself. It also calls
		other files to help it compile:
	- `preamble_classroom.tex` and `preamble_handout.tex` are two different
		sets of preamble code that are imported into in the main LaTeX document
		to control its appearance and behavior if the slides are being
		compiled for a classroom projector or for a handout, respectively.
	- `preamble_general.tex` is additional preamble code imported into
		both versions; it is stored in a separate file to improve the
		main document's readability
	- `references.bib` is a BibTeX file for creating citations and bibliography
+ *Images*: There are three image directories, which allow the user to control
		which image is used in classroom mode and in handout mode.
	- The LaTeX macro `\figpath` will point to the directory `figs_dark`
		in classroom mode. So `\includegraphics{\figpath/mygraph.png}`
		will insert `figs_dark/mygraph.png` into the slides.
	- The LaTeX macro `\figpath` will point to the directory `figs_light`
		in handout mode. So `\includegraphics{\figpath/mygraph.png}`
		will insert `figs_light/mygraph.png` into the slides.
	- To insert different images with varying color profiles into different
		versions of the slides, place light and dark versions into the
		respective folders with the same filenames.
	- Put images that shouldn't change from one version of the slides to
		the other in the directory `figs_both` and use the macro `\figboth`.
		LaTeX will resolve `\includegraphics{\figboth/mypic.jpg`
		to insert `figs_both/mypic.jpg` into the slides.
+ *Tables*: LaTeX formatted tables (such as those automatically saved
		using `esttab` or `stargazer` or `pystout`) go here.
		The macro `\tablepath` will point to this directory
+ *Output*: The slides generated by the project will be sorted for you
	into `/Slides - Handout/` and `Slides - Presentation`
+ *Code*: Some example code is stored in the `code` directory. This isn't
		encoded into a LaTeX path, since in application you'll probably
		want to point to various locations on your machine.
+ *The Shell Script*: `make_slide_decks.sh` is the big shell script that
		compiles two versions of the slides. It is in the root directory.
+ *Pygments styles*: `mydark.py` and `mylight.py` are also stored in
	the root directory, and must be copied to the pygments styles folder
	before you begin.
+ Image files used in this README are stashed in `/markdown/`; you can
	ignore those.

### System requirements

The most recent version of this template was built and tested on a
computer running macOS 10.15.7, Python 3.8, pdfTeX 3.14159265-2.6-1.40.21 (TeX Live 2020),
and Pygments 2.6.1. You shouldn't need those exact things, but to do
everything in this repository you will need:
- A pretty-recent LaTeX distribution, probably [TeX Live](https://tug.org/texlive/).
- A computer that runs Unix-like shell scripts. Any recent Mac or Linux
	machine should work fine. On Windows, you'll have to figure out how to
	translate the short shell script that automates slide compilation.
- A fairly recent vintage of Python 3.x. This is only used for code highlighting,
	so you can reconfigure this to work without Python if you don't want
	to insert code examples into your slides. There should be no difference
	between Anaconda and other distributions.
- A fairly recent version of pygments, the code-syntax-higlighting library for
	Python. Again, you only need this for code-highlighting.

Before you start, you'll need to configure
1. Change file paths in the shell script and in the LaTeX preambles
2. Set up Pygments
3. Add colors to graph workflow


### Install Python and pygments

If you don't know which version of Python you want, you should probably use
[Anaconda](https://www.anaconda.com/products/individual), which is more
self-contained than other ways of getting Python. If you don't want
a lot of extra Python packages, you can install
[Miniconda](https://docs.conda.io/en/latest/miniconda.html)
instead, which leaves you to install the specific packages you want into a
minimal Python core.

If you picked a version of Anaconda that didn't come with pygments, you can
install it in your terminal or shell with the command

```shell
conda pygments
```

You can also install pygments using `pip`, but that can get complicated,
especially if you're using a version of macOS that includes Python 2 for
system processes; if you're a pip user, I'm going to assume you already know
how to install packages.


### Install the custom Pygments themes (or don't)

I supply two Pygments themes that match the color scheme used in the
slides. These are stored in the main directory and called `mylight.py` and
`mydark.py`. You must copy them to your Pygments styles folder for them
to work correctly.

First, find your active Pygments installation's `styles/` folder. This can take a little detective work.

If you know which python installation you're using, you can ask it to show you
where pygments is stored. For example, on my mac that uses Homebrew Python,
the command `python3` calls the appropriate Python distribution. If I
ask my terminal
```shell
python3 -m pip show pygments
```
then the terminal will return
```
Name: Pygments
Version: 2.6.1
Summary: Pygments is a syntax highlighting package written in Python.
Home-page: https://pygments.org/
Author: Georg Brandl
Author-email: georg@python.org
License: BSD License
Location: /Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/site-packages
Requires:
Required-by: stata-kernel, qtconsole, nbconvert, jupyter-console, ipython
```

From there, I can navigate to
`/Library/Frameworks/Python.framework/Versions/3.8/lib/python3.8/site-packages/pygments/styles/`
and copy the custom style files.

If you don't know which version of Python Beamer is using, the terminal command
```shell
which pygmentize
```
will get you in the general neighborhood; you'll probably have to navigate
your way up one or two levels of the directory tree until you get to the `lib`
folder. When you find `styles/`, paste copies of the custom style files.


**If you don't want to install the custom themes**, but you still want to
have colorful code, there is a fallback option. The preamble files for the
classroom and handout formats include alternative commands that use the
built-in *monokai* and *autumn* themes, respectively. For example,

```latex
\usemintedstyle{mylight}
%\usemintedstyle{autumn}

\newminted{python}{fontsize=\scriptsize,
                   gobble=4,
                   style=mylight
%                   style=autumn
                   }
\newminted{stata}{fontsize=\scriptsize,
                   gobble=0,
                   style=mylight,
%                   style=autumn,
                   framesep=3mm
                   }   
\newcommand{\stata}[1]{\mintinline{stata}{#1}}
\newcommand{\python}[1]{\mintinline{python}{#1}}


	% Whole-slide code block
\newcommand{\InsertStataFrame}[3][\footnotesize]{\begin{frame}\frametitle{#2} {#1 \inputminted[style=mylight,obeytabs=true,tabsize=4]{stata}{#3}}  \end{frame}}

\newcommand{\InsertPythonFrame}[3][\footnotesize]{\begin{frame}\frametitle{#2} {#1 \inputminted[style=mylight,obeytabs=true,tabsize=4]{python}{#3}} \end{frame}}
%
%\newcommand{\InsertStataFrame}[3][\footnotesize]{\begin{frame}\frametitle{#2} {#1 \inputminted[style=autumn,obeytabs=true,tabsize=4]{stata}{#3}}  \end{frame}}
%
%\newcommand{\InsertPythonFrame}[3][\footnotesize]{\begin{frame}\frametitle{#2} {#1 \inputminted[style=autumn,obeytabs=true,tabsize=4]{python}{#3}} \end{frame}}
```

To switch to the built-in style, comment out or delete the lines of that
call on the custom theme, and uncomment the lines using a built-in theme:

```latex
\usemintedstyle{autumn}

\newminted{python}{fontsize=\scriptsize,
                   gobble=4,
                   style=autumn
                   }
\newminted{stata}{fontsize=\scriptsize,
                   gobble=0,
                   style=autumn,
                   framesep=3mm
                   }   
\newcommand{\stata}[1]{\mintinline{stata}{#1}}
\newcommand{\python}[1]{\mintinline{python}{#1}}

	% Whole-slide code block
\newcommand{\InsertStataFrame}[3][\footnotesize]{\begin{frame}\frametitle{#2} {#1 \inputminted[style=autumn,obeytabs=true,tabsize=4]{stata}{#3}}  \end{frame}}

\newcommand{\InsertPythonFrame}[3][\footnotesize]{\begin{frame}\frametitle{#2} {#1 \inputminted[style=autumn,obeytabs=true,tabsize=4]{python}{#3}} \end{frame}}
```

### Set your file path(s)

To run the shell script that fully compiles both versions of the slides,
you'll need to edit it. Open `make_slide_decks.sh` and find the first line
of actual code,

```shell
maindir="/Users/nicolasduquette/Documents/Beamer-template/"
```

Change this variable definition to point to wherever you're storing the
template.

If you move or rename any of the subfolders, you'll need to change two
LaTeX macro definitions in the preambles,
which look like this:

```latex
% File path to handout versions of tables and charts
\newcommand{\figpath}{../figs_light}    % Path to figures
\newcommand{\figboth}{../figs_both}     % Path to unchanging images
\newcommand{\tablepath}{../tables_tex}  % Path to tex-formatted tables
```


### Making the slide decks

Once you've followed the setup steps above, everything should work. Run
`make_slide_decks.sh` in your Mac or Linux terminal, and everything ought
to work correctly.

### Editing the slides

The Latex code is in the `slides-tex` folder. The main document is called
`slides.tex`. The other `.tex` files are supporting code.

## Things on my to-do list
1. Reduce the need to manually resize things like images
2. Clean up this readme
3. Clean up the Latex code more
4. Create more code examples of color tweaks in seaborn
