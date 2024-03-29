% author: Po-Hao Huang [https://github.com/Po-haoHuang]

% ----------------------------------------------------------------------------
% "THE CHOCOLATE-WARE LICENSE":
% Tz-Huan Huang wrote this file. As long as you retain this notice you
% can do whatever you want with this stuff. If we meet some day, and you think
% this stuff is worth it, you can buy me a chocolate in return Tz-Huan Huang
% ----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nctuthesis}[2016/08/03 Thesis template for National Chiao Tung University]

% Derived from book class
\DeclareRobustCommand{\@typeen}{Master}
\DeclareRobustCommand{\@typezh}{碩士}
\DeclareRobustCommand{\@classen}{Thesis}
\DeclareRobustCommand{\@classzh}{論文}
\DeclareOption{phd}{\gdef\@typeen{Doctoral}\gdef\@typezh{博士}\gdef\@classen{Dissertation}}
\DeclareOption{proposal}{\gdef\@typeen{Proposal for Doctoral}\gdef\@typezh{博士論文計畫提案書}\gdef\@classen{Dissertation}\gdef\@classzh{}}

\def\@doubleline{1.9}
\def\@onehalfline{1.62}
\DeclareRobustCommand{\@setspacing}{\setstretch{\@doubleline}}
\newif\ifzh
\zhfalse
\DeclareOption{zh}{\gdef\@setspacing{\setstretch{\@onehalfline}}\zhtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt,oneside]{book}

% Required packages
\RequirePackage[top=2.5cm,left=2.5cm,bottom=2.5cm,right=2.5cm]{geometry}
\RequirePackage{xeCJK}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{indentfirst}
\RequirePackage{tocloft} % for centering title
\RequirePackage[notbib]{tocbibind} % include ToC/LoF/LoT into ToC
\RequirePackage{titlesec} % for formatting title
\RequirePackage{titletoc} % for formatting toc
\RequirePackage{etoolbox} % for patchcmd
\RequirePackage{algorithm}

\RequirePackage{algpseudocode}

% Declarations
\DeclareRobustCommand{\university}[2]{\gdef\@universityen{#1}\gdef\@universityzh{#2}}
\DeclareRobustCommand{\college}[2]{\gdef\@collegeen{#1}\gdef\@collegezh{#2}}
\DeclareRobustCommand{\institute}[2]{\gdef\@instituteen{#1}\gdef\@institutezh{#2}}
\DeclareRobustCommand{\title}[2]{\gdef\@titleen{#1}\gdef\@titlezh{#2}}
\DeclareRobustCommand{\author}[2]{\gdef\@authoren{#1}\gdef\@authorzh{#2}}
\DeclareRobustCommand{\studentid}[1]{\gdef\@studentid{#1}}
\DeclareRobustCommand{\advisor}[2]{\gdef\@advisoren{#1}\gdef\@advisorzh{#2}}
\DeclareRobustCommand{\defenseyear}[2]{\gdef\@yearen{#1}\gdef\@yearzh{#2}}
\DeclareRobustCommand{\defensemonth}[2]{\gdef\@monthen{#1}\gdef\@monthzh{#2}}
\DeclareRobustCommand{\defenseday}[1]{\gdef\@day{#1}}
%\DeclareRobustCommand{\abstractname}[2]{\gdef\@abstractnameen{#1}\gdef\@abstractnamezh{#2}}
\DeclareRobustCommand{\abstractname}[2]{\gdef\@abstractnameen{#1}\gdef\@abstractnamezh{#2}}
\DeclareRobustCommand{\acknowledgements}[2]{\gdef\@acknowledgementsen{#1}\gdef\@acknowledgementszh{#2}}

\abstractname{Abstract}{摘要}
\acknowledgements{Acknowledgements}{Acknowledgements}

\DeclareRobustCommand{\clearpages}{\if@openright\cleardoublepage\else\clearpage\fi}

% \DeclareRobustCommand{\makecover}{
%   \begin{titlepage}
%     \vspace{1cm}
%     \begin{singlespace}
%     \begin{center}
%       \fontsize{18}{27}\selectfont
%       \@universityzh\@collegezh\@institutezh\par
%         \@typezh{}\@classzh\par
%       {\fontsize{14}{21}\selectfont
%         \@instituteen\par
%         \@collegeen\par}
%       {\fontsize{16}{24}\selectfont
%         \@universityen\par
%         \@typeen{} \@classen\par}
%       \vspace{\fill}
%       \@titlezh\par
%       \@titleen\par
%       \vspace{\fill}
%       \@authorzh\\
%       \@authoren\par
%       \vspace{2cm}
%       指導教授：\@advisorzh\\
%       Advisor: \@advisoren\par
%       \vspace{1.5cm}
%       中華民國 \@yearzh 年 \@monthzh 月\\
%       \@monthen, \@yearen
%     \end{center}
%     \end{singlespace}
%     \vspace{1cm}
%   \end{titlepage}
% }


% \DeclareRobustCommand{\makecertification}{
%   \clearpages
%   \begin{singlespace}
%   \begin{center}
%     \fontsize{24}{36}\selectfont\@universityzh\@typezh{}學位\@classzh\\
%     口試委員會審定書\par
%     \vspace{0.5cm}
%     {\fontsize{20}{30}\selectfont\@titlezh\par\@titleen\par}
%   \end{center}
%   \addcontentsline{toc}{chapter}{口試委員會審定書}
%   \vspace{1cm}
%   \fontsize{15}{24}\selectfont
% \hspace{30pt}本論文係\@authorzh{}君 (\@studentid)
% 在\@universityzh\@institutezh{}完成之\@typezh{}學位\@classzh，%
% 於民國 \@yearzh 年 \@monthzh 月 \@day 日%
% 承下列考試委員審查通過及口試及格，特此證明\par
%   \end{singlespace}
%   \vspace{\fill}
%   \begin{center}
%   \begin{doublespace}
%   \fontsize{15}{30}\selectfont
%   \begin{tabular}{p{2.75cm}p{12.5cm}}
%     \raisebox{30pt}{口試委員：} & \rule{11.5cm}{1pt} \\
%     & \rule{5cm}{1pt}\hspace{1.5cm}\rule{5cm}{1pt} \\
%     & \rule{5cm}{1pt}\hspace{1.5cm}\rule{5cm}{1pt} \\
%     & \rule{5cm}{1pt}\hspace{1.5cm}\rule{5cm}{1pt} \\
%     & \rule{5cm}{1pt}\hspace{1.5cm}\rule{5cm}{1pt} \\
%     \raisebox{5pt}{所\hspace{15pt}長：} & \rule{8.5cm}{1pt}
%   \end{tabular}
%   \end{doublespace}
%   \end{center}
%   \vspace*{-1cm}
% }

\newenvironment{quotationpage}[1]
  {\clearpages
   %\chapter*{\centerline{#1}}
   \addcontentsline{toc}{chapter}{#1}
   \quotation}
  {\endquotation}


\newenvironment{abstracten}{\begin{quotationpage}{\@abstractnameen}\begin{spacing}{\@doubleline}}{\end{spacing}\end{quotationpage}}
\newenvironment{abstractzh}{\begin{quotationpage}{\@abstractnamezh}\begin{spacing}{\@onehalfline}}{\end{spacing}\end{quotationpage}}
%\newenvironment{abstractzh}{\begin{quotationpage}{}\begin{spacing}{\@onehalfline}}{\end{spacing}\end{quotationpage}}
\newenvironment{acknowledgementsen}{\begin{quotationpage}{\@acknowledgementsen}\begin{spacing}{\@doubleline}}{\end{spacing}\end{quotationpage}}
\newenvironment{acknowledgementszh}{\begin{quotationpage}{\@acknowledgementszh}\begin{spacing}{\@onehalfline}}{\end{spacing}\end{quotationpage}}

\setcounter{tocdepth}{2}
\pagestyle{plain}
\@setspacing

% ToC, LoF, LoT centering settings with package tocloft
\renewcommand{\cftloftitlefont}{\hfill \Huge\bfseries}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cfttoctitlefont}{\hfil \Huge\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill \Huge\bfseries}
\renewcommand{\cftafterlottitle}{\hfill}

\titleformat{\chapter}[hang]{\bfseries}{\thechapter}{1em}{}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}} % dots for chapters
\titlecontents{chapter}[0em]{}{\makebox[1.5em][l]{\thecontentslabel}}{}{\cftdotfill{\cftdotsep}\contentspage}

\makeatletter
\patchcmd{\@chapter}{\addtocontents{lot}{\protect\addvspace{10\p@}}}{}{}{}
\patchcmd{\@chapter}{\addtocontents{lof}{\protect\addvspace{10\p@}}}{}{}{}
\makeatother

% value > 0
\def\xeCJKembold{0.4}

% hack into xeCJK, you don't need to understand it
\def\saveCJKnode{\dimen255\lastkern}
\def\restoreCJKnode{\kern-\dimen255\kern\dimen255}

% save old definition of \CJKsymbol and \CJKpunctsymbol for CJK output
\let\CJKoldsymbol\CJKsymbol
\let\CJKoldpunctsymbol\CJKpunctsymbol

% apply pdf literal fake bold
\def\CJKfakeboldsymbol#1{%
  \special{pdf:literal direct 2 Tr \xeCJKembold\space w}%
  \CJKoldsymbol{#1}%
  \saveCJKnode
  \special{pdf:literal direct 0 Tr}%
  \restoreCJKnode}
\def\CJKfakeboldpunctsymbol#1{%
  \special{pdf:literal direct 2 Tr \xeCJKembold\space w}%
  \CJKoldpunctsymbol{#1}%
  \saveCJKnode
  \special{pdf:literal direct 0 Tr}%
  \restoreCJKnode}
\newcommand\CJKfakebold[1]{%
  \let\CJKsymbol\CJKfakeboldsymbol
  \let\CJKpunctsymbol\CJKfakeboldpunctsymbol
  #1%
  \let\CJKsymbol\CJKoldsymbol
  \let\CJKpunctsymbol\CJKoldpunctsymbol}
\newcommand\zhbf[1]{\CJKfakebold{#1}}

% set Chinese version
\ifzh

  % set two-character indentation
  \setlength{\parindent}{2em}

  % Very Naive Chinese Number
  \DeclareRobustCommand{\naiveZhNum}[1]{
  \ifnum #1 = 1
  1
  \else \ifnum #1 = 2
  2
  \else \ifnum #1 = 3
  3
  \else \ifnum #1 = 4
  4
  \else \ifnum #1 = 5
  5
  \else \ifnum #1 = 6
  6
  \else \ifnum #1 = 7
  7
  \else \ifnum #1 = 8
  8
  \else \ifnum #1 = 9
  9
  \else
  #1
  \fi\fi\fi\fi\fi\fi\fi\fi\fi
  }
  %Control  Chapter format
  \titleformat{\chapter}[display]{\Huge\bfseries}{Chapter\naiveZhNum \thechapter}{1em}{}
  \titlecontents{chapter}[0em]{}{\makebox[4.5em][l]{Chapter \naiveZhNum  {\thecontentslabel}}}{}{\cftdotfill{\cftdotsep}\contentspage}

  %Control section
  \titleformat{\section}[block]{\Large\bfseries}{\thesection}{0.5em}{}
  \titleformat{\subsection}[block]{\large\bfseries}{\thesubsection}{0.5em}{}

  \floatname{Algorithm}{Algorithm}
  \renewcommand{\algorithmicrequire}{\textbf{Input：}}
  \renewcommand{\algorithmicensure}{\textbf{Output：}}


  \renewcommand{\contentsname}{Contents}
  \renewcommand{\listfigurename}{List of Figures}
  \renewcommand{\listtablename}{List of Tables}
  \renewcommand{\tablename}{Table}
  \renewcommand{\figurename}{Figure}
  \renewcommand{\bibname}{Reference}



  \DeclareRobustCommand{\@startappendix}{
  \titleformat{\chapter}{\centering\Huge\bfseries}{附錄 \thechapter}{1em}{}
  \titlecontents{chapter}[0em]{}{\makebox[4.1em][l]{附錄 \thecontentslabel}}{}{\cftdotfill{\cftdotsep}\contentspage}
  \appendix}
\else
  \DeclareRobustCommand{\@startappendix}{\appendix}
\fi
