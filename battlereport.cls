\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{battlereport}[2013/01/17]

\LoadClass{article}

\RequirePackage[english]{babel}
\RequirePackage{datetime}
\RequirePackage[margin=2cm]{geometry}
\RequirePackage{array}
\RequirePackage{paralist}
\RequirePackage{bbding}
\RequirePackage{titling}
\RequirePackage{longtable}

\ProcessOptions\relax
\DeclareOption* {\PassOptionsToClass{\CurrentOption}{article}}

\renewcommand{\arraystretch}{1.3}
\newcounter{vponecount}
\newcounter{vptwocount}
\setcounter{vponecount}{0}
\setcounter{vptwocount}{0}
\newcommand\vpone[2]{\addtocounter{vponecount}{#1}+#1\hspace{1ex}VP: #2}
\newcommand\vptwo[2]{\addtocounter{vptwocount}{#1}+#1\hspace{1ex}VP: #2}

\newcommand\playerone{Player 1}
\newcommand\playertwo{Player 2}

\setlength{\pltopsep}{0pt}
\setlength{\plpartopsep}{0pt}
\setlength{\plitemsep}{0pt}
\setlength{\plparsep}{0pt}
\setdefaultleftmargin{1pt}{}{}{}{}{}
\setdefaultitem{\PencilRightDown}{}{}{}
\newenvironment{report}{\begin{longtable}{l|p{0.35\linewidth}p{0.35\linewidth}}
  &\centering \playerone & \centering \playertwo \tabularnewline\hline}{Total & \centering \arabic{vponecount} VP & \centering \arabic{vptwocount} VP
\end{longtable}}
\newcounter{tworeportcount}%
\newcounter{threereportcount}%
\newcommand\prebattle[1]{Pre-battle &\multicolumn{2}{c}{\itshape #1}\tabularnewline\hline}
\newcommand\turn[3]{%
  \setcounter{tworeportcount}{0}%
  \setcounter{threereportcount}{0}%
  \@for\tmp:=#2\do{\addtocounter{tworeportcount}{1}}%
  \@for\tmp:=#3\do{\addtocounter{threereportcount}{1}}%
  Turn #1 &%
  \ifnum\c@tworeportcount=0 \else \begin{compactitem} \@for\tmp:=#2\do{\item \tmp}\end{compactitem} \fi %
  & \ifnum\c@threereportcount=0 \else \begin{compactitem}\@for\tmp:=#3\do{\item \tmp}\end{compactitem} \fi \tabularnewline\hline}

\title{Battle Report}
\date{\today}
\AtBeginDocument{\centering\begin{tabular}{m{0.3\linewidth}@{}m{0.4\linewidth}@{}m{0.3\linewidth}} & \centering\Huge\thetitle\\[2ex] \large\thedate & \end{tabular}\vspace{4ex}}



