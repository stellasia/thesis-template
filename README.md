# thesis latex class

## Overview

See the thesis.pdf file in this repo for an overview of the generated document. 

- Custom title page with logos and jury members;
- Custom chapter heading and chapter quote;
- Hyperlinkss (internal and external);
- Minitoc at the begining of chapters;
- Bibliography with biber: 
    - back reference to page number where the ref is quoted; 
    - references organized by chapter;
        - a reference quoted in two chapters appears twice but with the same reference number
- A dedication environment

## Requirements 

- texlive-fonts-extra 
- texlive-latex-extra
- biber
- biblatex
- lineno.sty
- libertine.sty (?)

## Usage 

    \documentclass[11pt, twoside, openright]{thesis}

    %%%%%%%%%%%%%%
    %% All the following parameters are optional
    %%%%%%%%%%%%%%

    % Link to all project .bib
    \addbibresource{bib/theory.bib}
    \addbibresource{bib/atlas.bib}

    %% Title page
    \unilogo{figures/university.png}
    \lablogo{figures/lal.jpg}
    \title{The Thesis full title}
    \author{Estelle Scifo}
    \university{Université Paris Sud}
    \docschool{\'Ecole Doctorale PNC}
    \lab{Laboratoire de l'Accélérateur Linéaire}
    \field{Physique des Particules}
    \defensedate{11 juillet 2014}
    \serienumber{LAL 14-169}

    \njurymembers{5} % number of jury members
    % Warning; you can not use \textsc or \textbf in the \addjurymember command... 
    \addjurymember{1}{M.}{Prénom Nom}{Directeur de thèse}
    \addjurymember{2}{Mme.}{Prénom Nom}{Président du jury}
    \addjurymember{3}{M.}{Prénom Nom}{Rapporteur}
    \addjurymember{4}{Mme.}{Prénom Nom}{Rapporteur}
    \addjurymember{5}{M.}{Prénom Nom}{Examinateur}

    \begin{document}
     ... 
    \end{document}


## Compilation 

    pdflatex thesis.tex
    biber thesis
    pdflatex thesis.tex
