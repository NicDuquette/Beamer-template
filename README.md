# A Beamer template for teaching

This is a preliminary version of a Beamer template. It's not done. Not even this
README is done. It probably has a lot of bugs. If I haven't emailed it to you
asking for your opinion about something specific, you probably shouldn't
touch it.

## Before you start
1. Change root directory in the shell script
2. Set file paths in the preambles
2. Set up Pygments
3. Add colors to graph workflow

If you want to highlight code syntax, you will need to install Python 3
and Pygments. You will also need to copy the code styles included in
this template to your Pygments styles folder.

## Editing the slides

The Latex code is in the `slides-tex` folder. The main document is called
`slides.tex`. The other `.tex` files are supporting code.

## Making the slide decks

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

1: https://www.overleaf.com/learn/latex/Beamer_Presentations:_A_Tutorial_for_Beginners_(Part_3)%E2%80%94Blocks,_Code,_Hyperlinks_and_Buttons
