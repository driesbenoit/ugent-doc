%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Ghent University document class 
%    Created by DF Benoit, December 15, 2022
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ugent-doc}

% Required packages
\RequirePackage{kvoptions}
\RequirePackage{geometry}
\RequirePackage{calc} 
\RequirePackage{graphicx}
\RequirePackage{xcolor}

% ugent-doc specific options (kvoptions)
\SetupKeyvalOptions{family=ugd,prefix=ugd@} %UGentArticle

% Declare the class specific options
\DeclareStringOption[eb]{faculty}[eb]
\DeclareStringOption[en]{language}[en]
\DeclareStringOption[article]{doctype}[article]
\DeclareBoolOption[true]{sftitles} % Default: true
\ProcessKeyvalOptions*

% Pass options not specified above to the parent class
% \@unusedoptionlist is a macro in kvoptions
\LoadClass[\@unusedoptionlist]{\ugd@doctype}

% All sections, subsections and subsubsections in sans serif
\ifugd@sftitles
    \RequirePackage[sf]{titlesec}
\fi

% Define UGent colors
\input{colors.tex}

% Define new commands
\def\thetitle#1{\def\@thetitle{#1}}
\def\thesubtitle#1{\def\@thesubtitle{#1}}
\def\infoboxa#1{\def\@infoboxa{#1}}
\def\infoboxb#1{\def\@infoboxb{#1}}
\def\infoboxc#1{\def\@infoboxc{#1}}
\def\infoboxd#1{\def\@infoboxd{#1}}

% Initialize new commands as 'empty'
\def\@thetitle{}
\def\@thesubtitle{}
\def\@infoboxa{}
\def\@infoboxb{}
\def\@infoboxc{}
\def\@infoboxd{}

% Define lengths based on UGent document grid
% See: https://styleguide.ugent.be/basic-principles/grid-and-layout.html
\newlength{\longedge}
\setlength{\longedge}{\maxof{\paperheight}{\paperwidth}}
\newlength{\gridunit}
\setlength{\gridunit}{\longedge/28} %Divide long edge by 7 and next by 4
\newlength{\subpaperheight}
\setlength{\subpaperheight}{\paperheight-7\gridunit} %Type area: 3 units for faculty logo, 4 units for UGent logo
\newlength{\subpaperwidth}
\setlength{\subpaperwidth}{\paperwidth-\gridunit} %Left margin of 1 gridunit

% Define strut based on \gridunit
\newcommand{\mystrut}[1][-.5]{\rule[#1\gridunit]{0pt}{0pt}}

% Set default page layout
% Can be overwritten in preamble of document
\renewcommand{\baselinestretch}{1.15} % line spacing
\geometry{bottom=2.5cm,top=2.5cm,left=3cm,right=2cm} % margins

% Redefine the titlepage in accordance with UGent styleguide
\renewcommand\maketitle{\begin{titlepage}%
    \thispagestyle{empty} % by default, the pagestyle of title page is plain
    \newgeometry{top=0cm, bottom=0cm, left=0cm, right=0cm} % set special margins
    \setlength{\parindent}{0cm} % necessary to put minipages/boxes at extreme left of page  
    \setlength{\parsep}{0cm} % necessary to stack minipages/boxes without space
    \setlength{\fboxsep}{0cm} % no border around minipages/boxes
    \setlength{\parskip}{0cm}
    \setlength{\lineskip}{0cm}

    \ifugd@sftitles
        \sffamily % Titlepage in sans serif font
    \fi

    \includegraphics[height=3\gridunit]{./figures/\ugd@faculty-\ugd@language.pdf}%

    \makebox[\gridunit]{}% Left margin of 1 gridunit
    \colorbox{ugent-\ugd@faculty!30}{%
    %\colorbox{ugentwhite}{%
    \begin{minipage}[c][\subpaperheight][t]{\subpaperwidth}%
    	\vskip 5\gridunit % top margin within minipage
    	\hskip \gridunit % left margin of 1 within the colorbox 
        %\fbox{%
        \begin{minipage}{\subpaperwidth-2\gridunit} % tile minipage, right margin of 1
            \raggedright\bfseries\huge
            \textcolor{ugentblue}{\mystrut\@thetitle}\newline
            \Large\textcolor{ugentblue}{\@thesubtitle}
            \mystrut[1]
        \end{minipage}%}

        \vskip\fill % Push down to bottom of minipage

        \ifx\@infoboxa\empty\else % ony put box if not empty
            \hskip\gridunit % left margin of infobox
            %\fbox{%
            \begin{minipage}[b]{\subpaperwidth-3\gridunit} % right margin of 1
                \@infoboxa
            \end{minipage}%}

            \baselineskip0pt\mystrut
        \fi

        \ifx\@infoboxb\empty\else % ony put box if not empty
            \hskip\gridunit % left margin of infobox
            %\fbox{%
            \begin{minipage}[b]{\subpaperwidth-3\gridunit} % right margin of 1
                \@infoboxb
            \end{minipage}%}

            \baselineskip0pt\mystrut
        \fi

        \ifx\@infoboxc\empty\else % ony put box if not empty
            \hskip\gridunit % left margin of infobox
            %\fbox{%
            \begin{minipage}[b]{\subpaperwidth-3\gridunit} % right margin of 1
                \@infoboxc
            \end{minipage}%}

            \baselineskip0pt\mystrut
        \fi

        \ifx\@infoboxd\empty\else % ony put box if not empty
            \hskip\gridunit % left margin of infobox
            %\fbox{%
            \begin{minipage}[b]{\subpaperwidth-3\gridunit} % right margin of 1
                \@infoboxd
            \end{minipage}%}
        \fi

        \baselineskip0pt\mystrut[-1]
    \end{minipage}
    }%

    \includegraphics[height=4\gridunit]{./figures/ugent-\ugd@language.pdf}%
    \end{titlepage}
    \restoregeometry
}
