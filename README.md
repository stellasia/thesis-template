# thesis latex class

## Requirements 

- texlive-fonts-extra 
- texlive-latex-extra
- biber
- biblatex
- lineo.sty
- bbold.sty
- libertine.sty

## Usage 


    \documentclass[11pt, twoside, openright]{thesis}

    %%%%%%%%%%%%%%
    %% All the next parameters are optional
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

    \njurymembers{5}
    \addjurymember{1}{M.}{Prénom Nom}{Directeur de thèse}
    \addjurymember{2}{Mme.}{Prénom Nom}{Président du jury}
    \addjurymember{3}{M.}{Prénom Nom}{Rapporteur}
    \addjurymember{4}{Mme.}{Prénom Nom}{Rapporteur}
    \addjurymember{5}{M.}{Prénom Nom}{Examinateur}


## Compilation 

    pdflatex thesis.tex
    biber thesis.tex
    pdflatex thesis.tex
