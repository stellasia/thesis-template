\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{thesis}[2015/06/22 Thesis class (E. Scifo), V1.0]

% base class = book 
\LoadClass[a4paper, 11pt]{book}

% packages 
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[english]{babel}

\RequirePackage{graphicx}
\RequirePackage[small, bf, up]{caption}
\renewcommand{\captionfont}{\it \small}

\RequirePackage{subfigure}

\RequirePackage[svgnames]{xcolor}

%% for tables
\RequirePackage{multirow}
\RequirePackage{multicol}

\RequirePackage[titletoc]{appendix}

\RequirePackage[left]{lineno} %% line numbers
\modulolinenumbers[5] %% numbers each 5 lines only


%% page geometry
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\pagestyle{fancy}
\geometry{a4paper, body={160mm,245mm}}


%% Toc at begining of chapter
\RequirePackage[]{minitoc}
\mtcsettitle{minitoc}{Chapter content}


%% Hyperref
\RequirePackage{hyperref} % hyperlink for easier navigation in the document
\hypersetup{
  backref=page,% add links into...
  pagebackref=true,%... references
  hyperindex=true, % add links in index
  colorlinks=true, % add colors to links
  breaklinks=true, % break line in long links
  urlcolor= blue, % hyperlink color
  linkcolor= blue, % external link color
  pdfpagelabels=true,
  plainpages=false,% use i, ii, iii... page numbers in pdf readers
  bookmarks=true, %
  pdfa = true,
}

\makeatletter
\renewcommand{\@chapapp}{Chapter}
\makeatother

\RequirePackage{nameref}  
\RequirePackage[
  backend=biber,
  refsegment=chapter,
  url=false,
  backref=true,
  sorting=none,
  autocite=plain,
  style=numeric-comp %% use numeric-comp instead of just numeric in order to have compact mutiple citations, ie [1-4] instead of [1,2,3,4]
]{biblatex}

%% http://tex.stackexchange.com/questions/69139/refsegment-in-biblatex-broken-since-update-to-tl2012
%% \defbibheading{subbibliography}{\section*{References for  Chapter~\ref{refsegment:\therefsegment}: \nameref{refsegment:\therefsegment}} }
\defbibheading{subbibliography}{\section*{References for  Chapter~\ref{refsegment:\therefsection\therefsegment}: \nameref{refsegment:\therefsection\therefsegment}} }

\DefineBibliographyStrings{english}{%
  backrefpage =  {{Cited on page}},% originally "cited on page"
  backrefpages = {Cited on pages},% originally "cited on pages"
}

\renewbibmacro*{pageref}{% http://tex.stackexchange.com/questions/76133/bibliography-backref-on-new-line-with-smaller-font-size
  \iflistundef{pageref}
    {}
    {\small \itshape \hfill {
       \ifnumgreater{\value{pageref}}{1}
         {\bibstring{backrefpages}\ppspace}
     {\bibstring{backrefpage}\ppspace}%
       \printlist[pageref][-\value{listtotal}]{pageref}}}}


%% Epigraph style
\RequirePackage{epigraph}
\renewcommand{\epigraphrule}{0.1pt} % bottom line width
\renewcommand{\textflush}{flushright}
\makeatletter
% Taken and updated from http://mirrors.ctan.org/macros/latex/contrib/epigraph/epigraph.dtx
\renewcommand{\@epitext}[1]{%
  \begin{minipage}{\epigraphwidth}\begin{\textflush} \hspace*{20pt} \itshape #1 \normalfont \\
      \ifdim\epigraphrule>\z@ \@epirule \else \vspace*{-.5\baselineskip} \fi
\end{\textflush}\end{minipage}}
\makeatother

%% Opening quotes
\RequirePackage{fancybox}
\newcommand*\openquote{\makebox(-15,-15){\scalebox{3}{``}}}
\newcommand*\closequote{\makebox(15,-15){\scalebox{3}{''}}}

\newcommand\chapQuote[2]{
  \vskip-0.5cm
  \begin{flushright}
    \boxput*(0.35,-0.9){
      \colorbox{white}{\textsc{#2}}}{
      %\setlength{\fboxsep}{6pt}
      %\cornersize{4}
      \setlength{\fboxsep}{4mm}
      \colorbox{white}{\begin{minipage}{0.6\textwidth}
          \openquote
          \itshape #1
          \closequote
      \end{minipage}}
    }
  \end{flushright}
  \vskip1cm
}


%% Dedication
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}

\newenvironment{dedication}
               {\cleardoublepage           % we want a new page
                 \thispagestyle{empty}% no header and footer
                 \vspace*{\stretch{1}}% some space at the top 
                 \itshape             % the text is in italics
                 \hspace{3cm}
                 \noindent%
                 \begin{minipage}{0.6\textwidth}
                   \noindent%
               }
               { \end{minipage}
                 \vspace{\stretch{3}} % space at bottom is three times that at the top
                 \cleardoublepage           % finish off the page
               }



%% customize chapter headings
%% Source : http://forum.mathematex.net/latex-f6/modification-du-style-de-chapitre-t7022.html
\makeatletter
\newlength{\chapter@number@width}
\def\@makechapterhead#1{%
  {\normalfont
    \setlength{\parindent}{0pt}%
    \vspace*{10pt}%
    \settowidth{\chapter@number@width}{%
      \hbox{\color{white}\Huge\bfseries
        \hspace{\dimexpr 1mm+3pt}%
        \thechapter
        \hspace{\dimexpr 1mm+3pt}%
    }}
    \hbox{%
      \vtop{%
        \hsize=\dimexpr\chapter@number@width+\tabcolsep+2\fboxrule+\tabcolsep
        \begin{tabular}[t]{@{}c}
          \scshape\strut\makebox[0pt]{\hspace{0pt plus 1 fill minus 1 fill}\@chapapp\hspace{0pt plus 1 fill minus 1 fill}} \\
          \fboxsep=0pt
          \colorbox{black}{\vbox{%
              \hbox{\vbox to \dimexpr 1mm+4pt{}}
              \hbox{\color{white}\Huge\bfseries
                \hspace{\dimexpr 1mm+3pt}%
                \thechapter
                \hspace{\dimexpr 1mm+3pt}%
              }
              \hrule height 0.4pt depth 0pt width 0pt
              \hbox{\vbox to 6pt{}}
              \hbox{\parbox{0pt}{\Huge\bfseries\vphantom{E}}}
          }}%
        \end{tabular}%
      }%
      \vtop{%
        \advance\hsize by -\dimexpr\chapter@number@width+2\fboxrule+\tabcolsep
        \hspace*{-0.5cm}\begin{tabular}[t]{c}
          \scshape\strut\vphantom{\@chapapp} \\
          \fboxsep=0pt
          \colorbox{white}{\vbox{%
              \hbox{\vbox to \dimexpr 1mm+3pt{}}
              \hbox{\LARGE\bfseries
                \hspace{\dimexpr 1mm+3pt}%
                \phantom{\thechapter}
                \hspace{\dimexpr 1mm+3pt}%
              }
              \hrule height 0.4pt depth 0pt width \hsize
              \hbox{\vbox to 6pt{}}
              \hbox{\hspace*{3pt}\parbox{\dimexpr\textwidth-2mm-6pt-\chapter@number@width-\tabcolsep-2\fboxrule-20pt}{\Huge\bfseries\scshape #1}}
          }}%
        \end{tabular}%
      }%
    }%
    \vspace{50pt}%
  }
}
\def\@makeschapterhead#1{%
  {\normalfont
    \setlength{\parindent}{0pt}%
    \vspace*{10pt}%
    \settowidth{\chapter@number@width}{%
      \hbox{\color{white}\LARGE\bfseries
        \hspace{\dimexpr 1mm+3pt}%
        \thechapter
        \hspace{\dimexpr 1mm+3pt}%
    }}
    \hbox{%
      \vtop{%
        \hsize=\dimexpr\chapter@number@width+\tabcolsep+2\fboxrule+\tabcolsep
        \begin{tabular}[t]{@{}c}
          \scshape\strut\makebox[0pt]{\hspace{0pt plus 1 fill minus 1 fill}\phantom{\@chapapp}\hspace{0pt plus 1 fill minus 1 fill}} \\
          \fboxsep=0pt
          \colorbox{black}{\vbox{%
              \hbox{\vbox to \dimexpr 1mm+3pt{}}
              \hbox{\color{white}\LARGE\bfseries
                \hspace{\dimexpr 1mm+3pt}%
                \phantom{\thechapter}%
                \hspace{\dimexpr 1mm+3pt}%
              }
              \hrule height 0.4pt depth 0pt width 0pt
              \hbox{\vbox to 6pt{}}
              \hbox{\parbox{0pt}{\Huge\bfseries\vphantom{E}}}
          }}%
        \end{tabular}%
      }%
      \vtop{%
        \advance\hsize by -\dimexpr\chapter@number@width+2\fboxrule+\tabcolsep
        \hspace*{-0.5cm}\begin{tabular}[t]{c}
          \scshape\strut\vphantom{\@chapapp} \\
          \fboxsep=0pt
          \colorbox{white}{\vbox{%
              \hbox{\vbox to \dimexpr 1mm+3pt{}}
              \hbox{\LARGE\bfseries
                \hspace{\dimexpr 1mm+3pt}%
                \phantom{\thechapter}
                \hspace{\dimexpr 1mm+3pt}%
              }
              \hrule height 0.4pt depth 0pt width \hsize
              \hbox{\vbox to 6pt{}}
              \hbox{\hspace*{20pt}\parbox{\dimexpr\textwidth-2mm-6pt-\chapter@number@width-\tabcolsep-2\fboxrule-30pt}{\Huge\bfseries\scshape #1}}
          }}%
        \end{tabular}%
      }%
    }%
    \vspace{50pt}%
  }
}
%% remove the top line : http://tex.stackexchange.com/questions/19738/why-doesnt-pagestyleempty-work-on-the-first-page-of-a-chapter
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}% original style: plain
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter}
\makeatother



%% customize title page
\RequirePackage{pgffor} 
\RequirePackage{etoolbox}

\makeatletter

\def\unilogo#1{\def\@unilogo{#1}}
\def\lablogo#1{\def\@lablogo{#1}}
\def\university#1{\def\@university{#1}}
\def\docschool#1{\def\@docschool{#1}}
\def\lab#1{\def\@lab{#1}}
\def\field#1{\def\@field{#1}}
\def\defensedate#1{\def\@defensedate{#1}}
\def\serienumber#1{\def\@serienumber{#1}}

\def\njurymembers#1{\def\@njurymembers{#1}}

\newcommand{\addjurymember}[4]{%
	\expandafter\gdef\csname @juryTitle#1\endcsname{#2}
	\expandafter\gdef\csname @juryName#1\endcsname{#3}
	\expandafter\gdef\csname @juryFunction#1\endcsname{#4}
}

\newtoks\@tabtoks
\newcommand\addtabtoks[1]{\global\@tabtoks\expandafter{\the\@tabtoks#1}}
\newcommand\eaddtabtoks[1]{\edef\mytmp{#1}\expandafter\addtabtoks\expandafter{\mytmp}}
\newcommand*\resettabtoks{\global\@tabtoks{}}
\newcommand*\printtabtoks{\the\@tabtoks}

\def\maketitle{%
  \thispagestyle{empty}
  \vspace*{-1.5cm}
  \hspace{-0.4cm}

  \begin{tabular}{p{5.5cm}p{6cm}p{6cm}}
    \ifdef{\@unilogo}{
      \includegraphics[height=2.5cm]{\@unilogo}}{} &
    \ifdef{\@lablogo}{
    \includegraphics[height=2.5cm]{\@lablogo}}{} & 
    \ifdef{\@serienumber}{
    \raisebox{3em}{\@serienumber}}{}
  \end{tabular}

  \begin{center} 
    \vskip1.5cm 
    
    \ifdef{\@university}{
      \textsc{\Huge \@university}}{~}\\[1cm]
    \ifdef{\@docschool}{
      \textsc{\LARGE \@docschool}}{~}\\[0.2cm]
    \ifdef{\@lab}{
      \textsc{\LARGE \@lab}}{~} \\[0.5cm]
    
    \ifdef{\@field}{
      \textsc{\LARGE Discipline : \@field}}{~}\\[1.5cm]
    
    \textsc{\Huge Thèse de doctorat}\\[0.5cm]
    
    {\Large Soutenue le
    \ifdef{\@defensedate}{
      \@defensedate}{\today}~par}\\[1.cm]
    
    \ifdef{\@author}{
      \textsc{\Huge \@author}}{~} \\[1cm]
    
    \vskip1.cm
    \begin{minipage}{0.95\textwidth}
      \Huge \bfseries \centering
      \@title
    \end{minipage}
    
    \vskip2.cm
    
    \resettabtoks
    \foreach \n in {1,...,\@njurymembers} {%
      \-\hspace{0.7cm}
      \eaddtabtoks{ {\csname @juryTitle\n\endcsname} }
      \eaddtabtoks{ {\csname @juryName\n \endcsname} }
      \addtabtoks{ & }
      \eaddtabtoks{({\csname @juryFunction\n \endcsname }) }
      \addtabtoks{ \\ }
    }%

    %% http://tlsflyleaf.onada.fr/down.php
    \ifnum \@njurymembers=0
    Jury members
    \else
    \begin{table}[h!] \large
      \begin{center}
        \begin{tabular}{*{2}{p{0.34\textwidth}}}          
          \printtabtoks
        \end{tabular}
      \end{center}
    \end{table}
    \fi
  \end{center}
}

\makeatother

