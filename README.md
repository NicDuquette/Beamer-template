# A Beamer template for teaching

This is a template for presentation slides in LaTeX/Beamer. It is designed
for teaching econometrics (math and coding). It does so using additional
tools outside of LaTeX to extend what can be done and add useful features.

This requires some additional setup! If you don't want an explanation and
want to just jump ahead to getting started, see [setup](#setup)

**WARNING**: This is a preliminary version of a Beamer template.
It's not done. Not even this
README is done. It probably has a lot of bugs. If I haven't emailed it to you
asking for your opinion about something specific, you probably shouldn't
touch it.

## Why should you use this very complicated way of making slides?

Just about any way to make things can be done two ways on a computer: the
direct way, or the automated way. Writing a document in a word processor is
direct: what you see is (mostly) what you get, and so creating the text in
Word means that when you've typed everything up, you're finished. The automated
way to write a document would mean typing your thoughts up in LaTeX or Markdown
or some other language that has to be compiled to get the finished product.
Creating documents from compiled markup is usually a slower way to write a
first draft, but a much faster system for documents that will be revised over
and over, because the same code base will automatically update formatting,
references, tables, figures, and other inputs.

This slide template makes aggressive use of document compilation to create
two different versions of the same slide deck, one for the classroom,
one for a student handout. This makes it simple to automatically change
the resulting output in ways that are appropriate for the two different
types of documents.

### Colors

One of the main differences between the classroom and handout versions
of the slide decks is colors. In a classroom, light on dark is often
easier to look at, especially on a projector. For a handout, which will
be read in brighter light or on paper, dark on light is probably better.



| Presentation mode | Handout mode |
| :--: | :--: |
| ![](markdown/slides_presentation1.jpg) | ![](markdown/slides_handout1.jpg) |


This includes special color names which will be implemented differently
in the two styles.


| Presentation colors | Handout colors |
| :--: | :--: |
| ![](markdown/slides_presentation2.jpg) | ![](markdown/slides_handout2.jpg) |



### Slides have layers, handouts don't

Overlays are enabled in the classroom slides, but not in the handouts.

| Overlays | No overlays |
| :--: | :--: |
| ![](markdown/slides_presentation3.jpg) | ![](markdown/slides_handout3.jpg) |

Similarly, a new environment, `solutionframe`, lets you reveal answers to in-class
exercises in the classroom version, while hiding them in the handouts.


### Code slides

Code can be added to the slides using an inline command (which inserts it
	as normal text), or as an entire slide that imports an external `.do` or
	`.py` file, colors its syntax, and adds a title.

| Python Presentation | Python Handout |
| :--: | :--: |
| ![](markdown/slides_presentation3.jpg) | ![](markdown/slides_handout3.jpg) |

Syntax highlighting relies on the minted package, which calls the pygmentize
Python module.

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


### Set your file path(s)


You may also want to change the locations of some subdirectories, in
which case you'll need to change two macro definitions in the preambles,
which look like this:

```latex
% File path to handout versions of tables and charts
\newcommand{\figpath}{../figs_light}				% Path to figures
\newcommand{\figboth}{../figs_both}				% Path to unchanging images
\newcommand{\tablepath}{../tables_tex}			% Path to tex-formatted tables
```

### Configure your image workflow

If you want to highlight code syntax, you will need to install Python 3
and Pygments. You will also need to copy the code styles included in
this template to your Pygments styles folder.

### Editing the slides

The Latex code is in the `slides-tex` folder. The main document is called
`slides.tex`. The other `.tex` files are supporting code.

### Making the slide decks

1. Run the shell script `make_slide_decks.sh` in the Terminal of your Mac or
Linux computer.
2. If you are using a Windows machine, install Ubuntu then return to step 1

## Things on my to-do list
1. Reduce the need to manually resize things like images
2. Clean up this readme
3. Clean up the Latex code more
4. Create examples of different plot themes in Stata and Python
5. Explain the color names in more detail up front
6. Automate things like resizebox
7. Put in some stuff about whhat this entire contraption is supposed to do
8. Add [beamer buttons][1]
9. Automate some of the setup with a script or make file

1: https://www.overleaf.com/learn/latex/Beamer_Presentations:_A_Tutorial_for_Beginners_(Part_3)%E2%80%94Blocks,_Code,_Hyperlinks_and_Buttons
