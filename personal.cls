%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% new-aiaa.cls, v1.2, 2018/01/10
% Developed by Overleaf
% 
% This class file enables authors to prepare papers
% for submission to AIAA Technical Journals and
% Conferences.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
\ProvidesClass{personal}[2020/05/24, v1.0]

\RequirePackage{ifthen}

\newif\if@american
\newif\if@british
\DeclareOption{american}{\@americantrue}
\DeclareOption{british}{\@britishtrue}

\ExecuteOptions{}
\ProcessOptions\relax

\RequirePackage[l2tabu, orthodox]{nag} % https://ctan.org/pkg/nag %% In case I commit a cardinal sin of loading depreciated modules, or some dumb stuff that can be picked up (i.e use \centering instead of \begin{center}[...]\end{center})
\LoadClass[12pt]{memoir}
\setlength\footparindent{\parindent}
\setlength{\footmarkwidth}{0em}
\setlength{\footmarksep}{0em}
% \footmarkstyle{\makebox[\footparindent][l]{\textsuperscript{#1}}}

% Online fix for all fontenc-inputenc interactions and use of inputenc, to be honest i have no clue what these do.
\RequirePackage{iftex}
\ifPDFTeX
%   \RequirePackage[light]{kpfonts} %% Reenable newtx/newpx if kpfonts is disabled, amsmath included? but going to keep it in anyways
   \RequirePackage[T1]{fontenc}
   \RequirePackage[utf8]{inputenc} 
%   \RequirePackage{lmodern}
\else
   \ifXeTeX
     \RequirePackage{fontspec}
     %% Testing out stuff here
    %  \setmainfont{TeX Gyre Pagella}
    %  \RequirePackage[euler-digits,euler-hat-accent]{eulervm}
   \else 
     \RequirePackage{luatextra}
   \fi
   \defaultfontfeatures{Ligatures=TeX}
\fi

%% https://tex.stackexchange.com/questions/59702/suggest-a-nice-font-family-for-my-basic-latex-template-text-and-math        %%%%%% font suggestions!
\RequirePackage{blindtext}
\RequirePackage{microtype}

%%% TEXT FONTS
% \RequirePackage{newtxtext}
\RequirePackage{newpxtext}
%\RequirePackage{libertine}

%%% MATH PACKAGES INTERLUDE
\RequirePackage{amsmath}    %% https://ctan.org/pkg/amsmath?lang=en %% essential math package, check their userguide for content
\RequirePackage{mathtools}
\RequirePackage{amsfonts}   %% https://ctan.org/pkg/amsfonts %% An extended set of fonts for use in mathematics

%%% MATH FONTS
% \RequirePackage{newtxmath}
% \RequirePackage[vvarbb]{newpxmath}
\RequirePackage{eulervm}    %% i do not like the euler-hat-accent option
% \RequirePackage[frenchmath]{libertinust1math}

\RequirePackage[letterpaper,margin=2cm]{geometry}
\RequirePackage{enumitem}
\setlist{labelindent=\parindent,leftmargin=*,nosep}
\setlist[enumerate]{label={\arabic*)}}

\RequirePackage{titletoc}

% Control over footnotes
% \RequirePackage[flushmargin,hang,bottom]{footmisc} % bottom makes footnotes always go at the very bottom of the page. %% Removed as memoir has its own options
\RequirePackage{fancyhdr} % Provides extensive control over footers and headers % https://tex.stackexchange.com/questions/129829/warning-command-makecol-has-changed read the following link to see why the load order is this way instead of the other way.
\RequirePackage[hyphens]{url}
\ifxetex
    \RequirePackage[hyperfootnotes=false,xetex]{hyperref} % double reffing solution comes from: http://ctan.cs.uu.nl/macros/latex/contrib/footmisc/footmisc.pdf
\else
    \ifpdf
        \RequirePackage[hyperfootnotes=false,pdftex]{hyperref}
    \else
        \RequirePackage[hyperfootnotes=false,hypertex]{hyperref}
    \fi
\fi

\RequirePackage[blocks]{authblk}
\renewcommand{\Authfont}{\normalsize\upshape}
\renewcommand{\Affilfont}{\normalsize\itshape}
\setlength{\affilsep}{0pt}

\renewcommand{\maketitle}{%
  \begingroup
  \renewcommand\and{\\[\baselineskip]}
  \centering
  {\LARGE\bfseries\@title\par}
  \vskip2\baselineskip
  \@author\par
  \endgroup
  \vskip\baselineskip
  \setcounter{footnote}{0}
}

\RequirePackage[explicit]{titlesec}
\setcounter{secnumdepth}{3}
\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

\titleformat{\chapter}%[display] % [display] makes a new line
    {}
    {\fontsize{40}{40}\selectfont\thechapter}{20pt}{\bfseries\huge#1}[]
\titlespacing{\chapter}{0pt}{-10pt}{1\baselineskip}

\titleformat{\section}
  {\Large\bfseries}%\centering}
  {\Huge{\thesection}\space}{5pt}{#1}[]
\titlespacing{\section}{0pt}{0.5\baselineskip}{0pt}

\titleformat{\subsection}
  {\large\bfseries}
  {\thesubsection\space}{5pt}{#1}[]
\titlespacing{\subsection}{0pt}{0.5\baselineskip}{0pt}

\titleformat{\subsubsection}
%   {\large\itshape\singlespacing}
  {\large\bfseries}
  {\thesubsubsection\space}{5pt}{#1}[]
\titlespacing{\subsubsection}{0pt}{0.5\baselineskip}{0pt}

\RequirePackage{lettrine}
\setlength{\DefaultNindent}{0pt}

\setlength{\abovedisplayskip}{\baselineskip}
\setlength{\belowdisplayskip}{\baselineskip}
\setlength{\abovedisplayshortskip}{\baselineskip}
\setlength{\belowdisplayshortskip}{\baselineskip}

% \RequirePackage[sort&compress,numbers]{natbib}
% \bibliographystyle{apalike}
% \bibliographystyle{personal}
% \renewcommand{\bibfont}{\small}

% \RequirePackage{minted}     % https://ctan.org/pkg/minted %% Use this for code.
\if@american
    \RequirePackage[american]{babel}               % https://ctan.org/pkg/babel %% manages culturally-determined typographical (and other) rules for a wide range of languages 
    \RequirePackage[style=american]{csquotes}       % https://ctan.org/pkg/csquotes %% provides advanced facilities for inline and display quotations, check their documentation to find out how to quote properly        
    \RequirePackage[USenglish,style=iso]{datetime2} % https://www.ctan.org/pkg/datetime2 %% This package provides commands for formatting dates, times and time zones and redefines \today to use the same formatting style. By default uses ISO formatting described in ISO 8601 and DIN 5008.
\fi
\if@british
    \RequirePackage[UKenglish]{babel}
    \RequirePackage[style=british]{csquotes} 
    \RequirePackage[UKenglish,style=iso]{datetime2}
\fi

% Changing Figures, Tables, and Equations:
% --------------------
% Get the section number based on whether the next hierarchical section number "down" is 0 (credit to https://latex.org/forum/viewtopic.php?t=10134)
\newcommand{\getCurrentSectionNumber}{%
  \ifnum\c@section=0 %
  \thechapter
  \else
  \ifnum\c@subsection=0 %
  \thesection
  \else
  \ifnum\c@subsubsection=0 %
  \thesubsection
  \else
  \thesubsubsection
  \fi
  \fi
  \fi
}

\RequirePackage[tableposition=top, figurename=Figure]{caption}
% \renewcommand{\thefigure}{\getCurrentSectionNumber--\arabic{figure}}
% \renewcommand{\thetable}{\getCurrentSectionNumber--\arabic{table}}
% \renewcommand{\theequation}{\getCurrentSectionNumber--\arabic{equation}}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\renewcommand{\theequation}{\arabic{equation}}
\captionsetup*{font={small}, labelfont={sc, bf}, labelsep=quad}
\renewcommand{\arraystretch}{1.2}

\RequirePackage[backend=biber,natbib=true,style=numeric,sorting=none]{biblatex} % natbib has some cool commands like \citet, \citep which i really like.
\addbibresource{references.bib}

% TO DO:
% - Make the american, british thing a mandatory option
% - Reorganize this mess