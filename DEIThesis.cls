% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "DEIThesis.cls",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, UniPD, Padua, Thesis, DEI",
%     docstring       = "Class for a DEI thesis."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{DEIThesis}[DEI Thesis Class]



% -- GENERAL SETUP --

% type
\LoadClass[12pt, a4paper, twoside, openright]{book}

% page geometry
\RequirePackage[
  headheight=2cm,
  top=3.5cm,
  bottom=3.5cm,
  outer=2.5cm,
  inner=3cm,
  footskip=1.5cm,
  footnotesep=1cm,
  twoside,
  a4paper
]{geometry}

% export in PDF/X, PDF/A, etc...
\RequirePackage{etoolbox}
\RequirePackage{colorprofiles}

% language, font and encodings
\RequirePackage{newpxtext,newpxmath}
\RequirePackage[T1]{fontenc}
\RequirePackage[english]{babel}



% -- USEFUL PACKAGES --

% spacings (\onehalfsize, \doublesize)
\RequirePackage{setspace}

% indent first line of paragraph
\RequirePackage{indentfirst}

% captions
\RequirePackage{caption}
\RequirePackage{subcaption}

% footnotes
\RequirePackage{footnote}
\RequirePackage[bottom]{footmisc}
\RequirePackage[a-2b,mathxmp]{pdfx}[\today]


% mathematics
\RequirePackage{amsmath}

% links
\RequirePackage{hyperref}
\RequirePackage{url}
\RequirePackage{footnotebackref}

% colors
\RequirePackage{color}

% graphics
\RequirePackage{graphicx}

% algoritms
\RequirePackage{algorithm}
%\RequirePackage{algorithmic}
\RequirePackage{algorithmicx}
\RequirePackage{algpseudocode}


% code snippets
\RequirePackage{listings}


% plots, drawings etc...
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows.meta}

% references
\RequirePackage[autostyle]{csquotes}
\RequirePackage[backend=biber]{biblatex}
\addbibresource{references.bib}

%tabeles
\RequirePackage[rgb]{xcolor}

\selectcolormodel{natural}
\RequirePackage{ninecolors}
\selectcolormodel{rgb}
\RequirePackage{tabularray}
\RequirePackage{makecell}
\RequirePackage{svg}


% -- DEFINITIONS --

% university
\def\university#1{\gdef\@university{#1}}

% master name
\def\mastername#1{\gdef\@mastername{#1}}

% academic Year
\def\academicYear#1{\gdef\@academicYear{#1}}

% student ID
\def\studentId#1{\gdef\@studentId{#1}}

% advisor
\def\advisor#1{\gdef\@advisor{#1}}

% co-advisor (if one)

% university of Padova color
\definecolor{UniPDColor}{RGB}{155, 0, 20}


% -- LINKS SETUP --

% set all links to black color
\hypersetup{
  colorlinks,
  citecolor=black,
  filecolor=black,
  linkcolor=black,
  urlcolor=black
}



% -- ITEMS AND ENUMARATIONS --

% reduce spacing for items and enumerations
\let\saveditemize=\itemize
\let\savedenditemize=\enditemize
\renewenvironment{itemize}
  {\begin{spacing}{0.5}\saveditemize}
  {\savedenditemize\end{spacing}}

\let\savedenumerate=\enumerate
\let\savedendenumerate=\endenumerate
\renewenvironment{enumerate}
  {\begin{spacing}{0.5}\savedenumerate}
  {\savedendenumerate\end{spacing}}

% italic for quotes
\let\savedquote\quote
\let\endsavedquote\endquote
\renewenvironment{quote}
    {\itshape\savedquote}
    {\endsavedquote}



% -- HEADERS AND FOOTERS --

% custom headers and footers
\RequirePackage{fancyhdr}

% custom title style
\RequirePackage{titlesec}

% remove headers and footers in blank pages
\RequirePackage{scrextend}

% box for titles
\RequirePackage{adjustbox}
\RequirePackage{verbatimbox}
\RequirePackage{tcolorbox}
\RequirePackage{wrapfig}
\RequirePackage{tabularx}




\newcommand{\infobox}[2]{
    \begin{wrapfigure}{r}{0pt}
        \begin{tcolorbox}[colframe=green!50!white,colback=white,width=#1]#2\end{tcolorbox}
    \end{wrapfigure}
}

% style for chapters
\titleformat{\chapter}[display]
{\Huge\filleft}
{
  \minsizebox{!}{70pt}{\colorbox{UniPDColor}{\color{white} \thechapter}}
}
{1.2ex}
{}

% style for sections
\titleformat{\section}[hang]
{\Large}
{
  \colorbox{UniPDColor}{\color{white} \thesection}
}
{1ex}
{\scshape}

% style for subsections
\titleformat{\subsection}[hang]
{\large}
{
  \colorbox{UniPDColor}{\color{white} \thesubsection}
}
{1ex}
{\scshape}

% style for subsubsections
\titleformat{\subsubsection}[hang]
{\normalsize}
{}
{0ex}
{\bfseries\scshape}

% remove line headers
\renewcommand{\headrulewidth}{0ex}

% style for headers and footers
\newcommand{\setfancyhf} {
  \fancyhf{}
  \fancyhead[RO]{{\footnotesize\leftmark}}
  \fancyhead[LE]{{\footnotesize\rightmark}}
  \fancyfoot[RE, LO]{}
  \fancyfoot[C]{\thepage}
}


\RequirePackage{relsize}
\RequirePackage{xspace}


\newcommand{\Rplus}{\protect\hspace{-.1em}\protect\raisebox{.35ex}{\smaller{\smaller\textbf{+}}}}
%\newcommand{\cpp}{\mbox{C\Rplus\Rplus}\xspace}
\newcommand{\cpp}{\texttt{C++}\xspace}


% -- FRONTMATTER --

\renewcommand{\frontmatter} {
    
  % set roman page numbering
  \pagenumbering{roman}

  % set page style
  \pagestyle{fancy}

  % create cover
  \maketitle

  % reset fancy headers
  \setfancyhf

  % set head witdth
  \setlength{\headwidth}{\textwidth}

  % custom titles
  \renewcommand{\listfigurename}{List of Figures}
  \renewcommand{\listtablename}{List of Tables}
  \renewcommand{\listalgorithmname}{List of Algorithms}
  \renewcommand{\lstlistingname}{Code} % Caption name of code snippets
  \renewcommand{\lstlistlistingname}{List of Code Snippets}
  \def\listacronymname{List of Acronyms}

  \def\abstractname{Abstract}
  \def\abstractnameit{Sommario}

  \renewcommand{\bibname}{Bibliography}

  \def\acknowledgmentsname{Acknowledgments}

  % insert dedication page
  \dedicationpage

  % insert abstract
  \abstractpage

  % insert table of contents
  \tableofcontents
  \cleardoublepage

  % insert list of figures
  \phantomsection
  \addcontentsline{toc}{chapter}{\listfigurename}
  \listoffigures
  \cleardoublepage

  % insert list of tables
  \phantomsection
  \addcontentsline{toc}{chapter}{\listtablename}
  \listoftables
  \cleardoublepage

  % insert list of algorithms
  \phantomsection
  \addcontentsline{toc}{chapter}{\listalgorithmname}
  \listofalgorithms
  \cleardoublepage

  % insert list of code snippets
  \phantomsection
  \addcontentsline{toc}{chapter}{\lstlistlistingname}
  \lstlistoflistings
  \cleardoublepage

  % insert list of abbreviations/acronyms

  \acronyms
}



% -- TITLE/COVER --

% insert watermark
\RequirePackage{watermark}

\renewcommand{\maketitle} {
  %set custom geometry
  \newgeometry{
    top=1.5cm,
    bottom=2cm,
    inner=2cm,
    outer=2cm,
    headheight=3.5cm,
    includehead,
    includefoot,
  }

  % set head witdth
  \setlength{\headwidth}{\textwidth}

  % set watermark
  \thiswatermark{
    \centering
    \put(-380,-700) {
      \includegraphics[width=1.4\linewidth]{res/unipdbg}
    }
  }

  % set academic year in footer
  \cfoot{\normalsize\textsc{Academic Year \\ \@academicYear}}

  % set brands in header
  \lhead{
    \includegraphics[height=3cm]{res/ltunipd}
  }
  \rhead{
    \includegraphics[height=3cm]{res/dei}
  }

  % content
  \begin{center}

    % master name
    \null \vspace{\stretch{2}}
    \normalsize\textsc{
      Master Thesis in \@mastername
    } \\

    % title
    \vspace{3ex}
    \LARGE\textbf{\@title} \\
    \vspace{\stretch{3}}

    % authors, advisors etc...
    \doublespacing

    \begin{flushleft}
      \small
      \textsc{Master Candidate} \hfill \textsc{Supervisor} \\
      \large{\textbf{\@author}} \hfill \large{\textbf{\@advisor}} \\
      \small
      \textbf{Student ID \@studentId} \hfill \textbf{\@university} \\
      % insert co-advisor if not empty

    \end{flushleft}

    \vspace{\stretch{1}} \null
  \end{center}

  % restore defaults
  \cleardoublepage
  \restoregeometry
  \onehalfspacing
}



% -- DEDICATION --

\newcommand{\dedicationpage} {
  % set empty style for this page (no headers and footers)
  \thispagestyle{empty}

  \phantomsection
  
  \null \vspace{\stretch{1}}

  \begin{flushright}
    \input{frontmatter/dedication}
  \end{flushright}

  \vspace{\stretch{4}} \null
  
  % insert pages for alignment
  \clearpage
}



% -- ACRONYMS/ABBREVIATIONS --

\RequirePackage{acronym}

% custom style for acronyms
\newcommand{\acronyms}{
  \phantomsection
  \addcontentsline{toc}{chapter}{\listacronymname}
  \chapter*{\listacronymname}
  \input{frontmatter/glossary}
  \cleardoublepage
}



% -- ABSTRACT --

\newenvironment{abstract}[1][en] {
  % get argument (en/it)
  \def\it{it}
  \def\arg{#1}

  \null \vfill
  \begin{center}
    \bfseries
    
    % set title in english or italian
    \ifx\arg\it
      \abstractnameit
    \else
      \abstractname
    \fi
  \end{center}
} {
  \vfill \null
}

\newcommand{\abstractpage} {
  % set empty style for this page (no headers and footers)
  \thispagestyle{empty}

  % english version
  \input{frontmatter/abstract}
  
  % italian version
  \clearpage
  \thispagestyle{empty}
  \input{frontmatter/sommario}
}



% -- MAIN MATTER --

\renewcommand{\mainmatter} {
  \cleardoublepage

  % reset page counter
  \setcounter{page}{1}

  % set arabic page numbering
  \pagenumbering{arabic}

  % reset chapter counter
  \setcounter{chapter}{0}
}



% -- BACKMATTER --

\renewcommand{\backmatter}{
  \cleardoublepage
  \phantomsection

  % add references
  \addcontentsline{toc}{chapter}{\bibname}
  \printbibliography
  
  \cleardoublepage
  \phantomsection

  % add acknowledgments
  \addcontentsline{toc}{chapter}{\acknowledgmentsname}
  \acknowledgments
}



% -- ACKNOWLEDGMENTS --
\newcommand{\acknowledgments} {
  \phantomsection
  \chapter*{\acknowledgmentsname}
  \input{frontmatter/thanks}
}


% -- CODE SNIPPETS --

% Colors for code snippets highlights
\definecolor{commentsColor}{RGB}{36, 161, 156}
\definecolor{lightBlue}{RGB}{48, 156, 140}
\definecolor{orangeG}{RGB}{255,140,0}
\definecolor{lightGray}{RGB}{150, 150, 150}
\definecolor{numColor}{RGB}{71, 96, 114}
\definecolor{stringColor}{RGB}{205, 63, 62}
\definecolor{kwColor}{RGB}{248, 6, 204}
\definecolor{bgCodeColor}{RGB}{255, 249, 249}

% Style of code snippets
\lstdefinestyle{obj} {
  commentstyle=\color{commentsColor},
  keywordstyle=\color{kwColor},
  numberstyle=\tiny\color{black},
  stringstyle=\color{stringColor},
  basicstyle=\ttfamily\footnotesize,
  breakatwhitespace=true,         
  breaklines=true,                 
  captionpos=b,                    
  keepspaces=true,                 
  numbers=left,                                                    
  showstringspaces=false,
  showtabs=false,                  
  tabsize=2
}

\lstdefinestyle{cpp}{
  numberstyle=\tiny\color{black},
  belowcaptionskip=1\baselineskip,
  breaklines=true,
  breakatwhitespace=true,
  numbers=left, 
  keepspaces=true,
  captionpos=b,  
  showstringspaces=false,
  basicstyle=\ttfamily\footnotesize,
  keywordstyle=\color{blue},
  commentstyle=\color{lightGray},
  rulecolor=\color{black},
  identifierstyle=\color{lightBlue},
  showtabs=false,
  tabsize=2,
  morekeywords={UFUNCTION,UPROPERTY,UCLASS,ELevelTick,FActorComponentTickFunction,FVector2D,FLinearColor,GENERATED_BODY,override,int32,TArray,FVector,DECLARE_DYNAMIC_DELEGATE_OneParam},
  stringstyle=\color{orangeG},
}

