#! /bin/sh

# CREATE SLIDE DECKS

maindir="/Users/nicolasduquette/Documents/Beamer-template/"
cd "${maindir}/slides-tex"


# Loop over the filenames. Variable $i = the latex file
for i in slides #
do
		# Show: Which loop are we on?
	echo $i
	
		# Standard compile -> bib -> compile -> compile
		# \codeblockson{1} boolean will trigger the minted package (not draft mode)
	pdflatex -shell-escape "\PassOptionsToPackage{draft}{graphicx} \input{${i}.tex}"
	bibtex $i
	pdflatex -shell-escape "\PassOptionsToPackage{draft}{graphicx} \input{${i}.tex}"
	pdflatex -shell-escape "\def\codeblockson{1} \input{${i}.tex}"
	
		# Save the first output to useful locations/names
	cp "${i}.pdf" "${i}_presentation.pdf"
	mv "${i}.pdf" "${maindir}/Slides - Presentation/${i}_presentation.pdf"
	
		# Clear code styling
	rm _minted-slides/*
	
		# Compile twice passing the \ishandout boolean,
		# which will disable overlays and format for
		# screens not projectors
	pdflatex -shell-escape "\PassOptionsToPackage{draft}{graphicx} \def\ishandout{1} \input{${i}.tex}"
	pdflatex -shell-escape "\def\ishandout{1} \def\codeblockson{1} \input{${i}.tex}"
	
		# Move and rename the handout version
	cp ${i}.pdf ${i}_handout.pdf
	mv "${i}.pdf" "${maindir}/Slides - Handout/${i}_handout.pdf"
	
		# Clear code styling
	rm _minted-slides/*
	
done 


# Return to the shell directory
cd "${maindir}"

