# Version v0.1-0
The aim of this `ugent-doc` LaTeX class:
* A template that closely resembles the official [UGent MS Word cover templates](https://styleguide.ugent.be/templates/print.html#cover).
* The class does little more than creating a UGent titlepage and load the usual article or report class.
* Takes the faculty as input/option and loads corresponding logo and colors.
* Ease-of-use for the average LaTeX user.
* Similar theme options as the [UGent beamer theme](https://github.com/driesbenoit/ugent-beamer).
* Similar theme options as the [UGent letter theme](https://github.com/driesbenoit/ugent-letter).

Requires the packages kvoptions, geometry, calc, graphicx and xcolor.
Most likely these packages are already included in your LaTeX distribution (Miktex, Tex-Live).

Demo
----
Extended examples (still work in progress) are available. See the `example` folder.

Some example covers:

![](https://github.com/driesbenoit/ugent-doc/blob/master/example-screenshots/example3.png)
![](https://github.com/driesbenoit/ugent-doc/blob/master/example-screenshots/example6.png)

Download
========
Download the latest release by following [this](https://github.com/driesbenoit/ugent-doc/releases) link.

Installation
============
The theme is an addendum for LaTeX, hence it is assumed that you have a running LaTeX installation such as Tex-Live or MikTeX.

Once you have the files, all that is required for the theme to work is putting the files into a directory where LaTeX can find them. This boils down to mimicking the so called TDS (or TeX Directory Structure).

Ad-hoc installation 
-------------------
After downloading, copy the files named `ugent-doc.cls` together with all \*.pdf (logo) files from the figures folder, into *the same folder* as your LaTeX source file.
Note that the \*.cls file expects the the logo files to be in *the same directory* as your main \*.tex file.
**Not** in your `figures` or `images` folder where you store the figures you might use in your document.

Then load the ugent-doc class by writing:
```latex
\documentclass[12pt,a4paper,faculty=eb]{ugent-doc}
```
in the preamble of your document. For the faculty, you probably want to change 'eb' to the abbreviation of your own faculty (see below).

Global installation
-------------------
In case you're using your favorite flavor of Unix (and/or TeX Live) you need to have a local directory (this will probably be ~/texmf/) and you need to place all the files from the theme folder in the directory `~/texmf/tex/latex/mystyles/ugent-doc/`, finishing it by running texhash.

If on the other hand you're on Windows (probably MiKTeX) the walkthrough at [this url](http://docs.miktex.org/manual/localadditions.html) explains in detail how to create a local installation. Don't forget to Refresh FNDB as explained [here](http://docs.miktex.org/manual/configuring.html#fndbupdate).

A global installation has the advantage that you can keep your working directory clean: all files related to the class/template are stored in your global LaTeX directory (\*.cls, logo files, etc.).
Your working directory only contains the files related to the document you are writing (\*.tex files, images, \*.bib file, etc.).

Usage
=====
Refer to the extended examples (`example/exampleX.tex`) for an overview of the possibilities of the `ugent-doc` class.

Class options
-------------
The class options can be set as follows:
`\usepackage[optionshere]{ugent-doc}`

* `language=x`, where x is the language
  * `nl`: dutch (default)
  * `en`: english
* `faculty=x`, where x is the abbreviation of the faculty
  * `lw`: Faculty of Literature & Philosophy
  * `re`: Faculty of Law
  * `we`: Faculty of Science
  * `ge`: Faculty of Medicine and Health Sciences
  * `ea`: Faculty of Engineering and Architecture
  * `eb`: Faculty of Economics and Business Administration (default)
  * `di`: Faculty of Veterinary Medicine
  * `pp`: Faculty of Psychology and Educational Sciences
  * `bw`: Faculty of Bioscience Engineering
  * `fw`: Faculty of Pharmaceutical Sciences
  * `ps`: Faculty of Political and Social Sciences
* `doctype=x`, where x is the document class that is loaded
  * `article`: article class (default)
  * `report`: report class 
* `sftitles=x`, where x is either
  * `true`: the titlepage and all titles (chapters, sections, etc.) are typeset in sans serif, regular text in serif/roman (default)
  * `false`: the entire document is typeset in serif/roman

Note that the options for the underlying article or report class can still be passed in the usual way.

License
=======
This software is released under the [GNU GPL v3.0 License](https://www.gnu.org/licenses/gpl-3.0.en.html).

Contact
=======
If you are enjoying this theme please share it with your colleagues or friends!

Any suggestions, comments, criticism or appreciation are welcome!

