%! TeX program = pdflatexpre

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simple Keynote
% LaTeX Class
% Version 1.0 (10/11/20)
%
% This class originates by:
% Vel and  Nicolas Diaz
%
% Authors:
% Muhammad Uliah Shafar
%
%
% Free License:
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simkey}[2020/11/10 Simart Class v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{beamer} % Load the base class


\usepackage{beamer_digiPH}
\usepackage[bahasai]{babel}


%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Use 8-bit encoding

\usepackage[protrusion=true, expansion=true]{microtype} % Better typography

\linespread{1.05} % Increase line spacing slightly; Palatino benefits from a slight increase by default

%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage{comment}
\usepackage{lipsum}

\usepackage{graphicx}
\graphicspath{{figures/}{../figures/}{../logos}}

%Position figure in beamer using textblock*
\usepackage[absolute,overlay]{textpos}
%\usepackage[texcoord,grid,gridunit=mm,gridcolor=red!10,subgridcolor=green!10]{eso-pic} %showgrid

\usepackage{setspace}
\usepackage{subfiles}

\usepackage{booktabs}
\usepackage{csquotes}
\usepackage{xcolor}


% Turn off the floating in article mode
\usepackage{float}

\usepackage{xspace}
\newcommand{\zB}{z.\,B.\xspace}
\usepackage{xfrac}
\UseCollection{xfrac}{plainmath}

% Config Slide Notes
\usepackage{pgfpages}

%\setbeamercovered{transparent}
\setbeamertemplate{note page}{\pagecolor{yellow!5}\insertnote}\usepackage{palatino}


\usepackage{multirow}
\usepackage{booktabs}
\usepackage{tabularx}
\usepackage{array} %Mostly formatting columns and spacing
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}} %centering elemen in table
\newcommand{\tabitem}{~~\llap{\textbullet}~~} % fake bullet itemize in table cell, don't use it on notes

\newcommand\boldblue[1]{\textcolor{blue}{\textbf{#1}}}
\newcommand\boldred[1]{\textcolor{red}{\textbf{#1}}}
\newcommand\boldwhite[1]{\textcolor{white}{\textbf{#1}}}

% Itemize
\usepackage{enumitem} %3 lines after this resolve bullet disappear and adjust spacing
\setitemize{label=\usebeamerfont*{itemize item}%
	\usebeamercolor[fg]{itemize item}
	\usebeamertemplate{itemize item},noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}


%----------------------------------------------------------------------------------------
%           SOMETHING ABOUT LABELING
%----------------------------------------------------------------------------------------


\makeatletter
\newenvironment{labeling}[2][]{%
	\def\sc@septext{#1}%
	\list{}{\settowidth{\labelwidth}{{%
					#2%
					\sc@septext%
				}}%
		\leftmargin\labelwidth \advance\leftmargin by \labelsep
		\let\makelabel\labelinglabel
	}%
}{%
	\endlist
}
\newcommand\labelinglabel[1]{%
	#1\hfil
	\sc@septext%
}
\makeatother

%----------------------------------------------------------------------------------------
%           New Environment/cmd
%----------------------------------------------------------------------------------------
%new block environemtn
\newenvironment{blockcolor}
{\begin{alertblock}
		}
		{

		\centering
		\includegraphics[width=2cm,trim={0cm 10cm 0cm 9cm}, clip]{figures/batik.png}
	\end{alertblock}
}

% Creating centering notes
\newcommand{\notes}[1]{\note{\vfill
		%    \begin{center}
		{#1}
		%    \end{center}
		\vfill
	}}

\newcommand{\boxes}[3]{\begin{tpblock}{#1}{#2} #3 \end{tpblock}}

%----------------------------------------------------------------------------------------
%           BLOCK
%----------------------------------------------------------------------------------------
\usepackage[most]{tcolorbox}
\newtcolorbox{tpblock}[3][]
{%
	code={%
			\usebeamercolor{block title}
			\colorlet{titlebg}{#2}
			\colorlet{titlefg}{#3}
			\usebeamercolor{block body alerted}
			\colorlet{bodybg}{#2}
			\colorlet{bodyfg}{#3}
		},
	enhanced,
	boxsep=0.25ex,
	arc=1.25ex,
	opacityframe=0,
	opacityback=.28,
	colbacktitle=titlebg,
	coltitle=titlefg,
	colback=bodybg,
	colupper=bodyfg,
	boxrule=0pt,
	#1
}

\makeatletter
\newbox\@bgblock
\newenvironment{bgblock}[2]{%
	\global\setbox\@bgblock=\vbox\bgroup%
	\unvbox\@bgblock%
	\vbox to0pt\bgroup\vskip#2\hbox to0pt\bgroup\hskip#1\relax%
}{\egroup\egroup\egroup}
\addtobeamertemplate{background}{\box\@bgblock}{}
\makeatother

%----------------------------------------------------------------------------------------
%           TIKZ PLOT CONFIGURATION
%----------------------------------------------------------------------------------------

% Paket zum Erstellen von Plots mit TikZ
\usepackage{pgfplots}
% immer die neueste Version benutzen
\pgfplotsset{compat=newest}
% Verbindung von Linien durch eine schräge Kante
\pgfplotsset{every axis/.append style={line join=bevel}}
% Formatvorlage für Präsentationen
\mode<beamer>{
	\pgfplotsset{
		beamer/.style={
				width=0.8\textwidth,
				height=0.45\textwidth,
				legend style={font=\scriptsize},
				tick label style={font=\footnotesize},
				label style={font=\small},
				max space between ticks=28,
			}
	}
}
\mode<handout>{
	\pgfplotsset{
		beamer/.style={
				width=0.8\textwidth,
				height=0.45\textwidth,
				legend style={font=\scriptsize},
				tick label style={font=\footnotesize},
				label style={font=\small},
				max space between ticks=25,
			}
	}
}
\mode<article>{
	\pgfplotsset{
		beamer/.style={
				width=0.8\textwidth,
				height=0.45\textwidth,
				max space between ticks=35,
			}
	}
}
% neue Größenvorlage für zwei Plots nebeneinander anlegen
\pgfplotsset{
	scriptsize/.style={
			width=0.34\textwidth,
			height=0.1768\textwidth,
			legend style={font=\scriptsize},
			tick label style={font=\scriptsize},
			label style={font=\footnotesize},
			title style={font=\footnotesize},
			every axis title shift=0pt,
			max space between ticks=25,
			every mark/.append style={mark size=7},
			major tick length=0.1cm,
			minor tick length=0.066cm,
		}
}
\pgfplotsset{
	small/.style={
			width=6.5cm,
			height=,
			tick label style={font=\footnotesize},
			label style={font=\small},
			legend style={font=\footnotesize},
			max space between ticks=30,
		}
}
% Legendeneintrage standardmäßig links ausrichten
\pgfplotsset{legend cell align=left}
% Hauptgitternetz zeichnen
\pgfplotsset{xmajorgrids}
\pgfplotsset{ymajorgrids}
% Anzahl der kleinen Teilstriche zwischen zwei großen Teilstrichen
%\pgfplotsset{minor x tick num={3}}
%\pgfplotsset{minor y tick num={3}}
% feines Gitternetz zeichnen
%\pgfplotsset{xminorgrids}
%\pgfplotsset{yminorgrids}
% nur nach den Achsen skalieren
\pgfplotsset{scale only axis}
% Farben wie in MATLAB definieren
\definecolor{matlab1}{rgb}{0,0,1}
\definecolor{matlab2}{rgb}{0,0.5,0}
\definecolor{matlab3}{rgb}{1,0,0}
\definecolor{matlab4}{rgb}{0,0.75,0.75}
\definecolor{matlab5}{rgb}{0.75,0,0.75}
\definecolor{matlab6}{rgb}{0.75,0.75,0}
\definecolor{matlab7}{rgb}{0.25,0.25,0.25}
% Farbreihenfolge wie in MATLAB definieren
\pgfplotscreateplotcyclelist{matlab}{
	{matlab1,solid},
	{matlab2,dashed},
	{matlab3,dashdotted},
	{matlab4,dotted},
	{matlab5,densely dashed},
	{matlab6,densely dashdotted},
	{matlab7,densely dotted}% dies unterdrückt einen Fehler
}
% Farbreihenfolge wie in MATLAB benutzen
\pgfplotsset{cycle list name=matlab}
% Farbreihenfolge von pgfplots benutzen
%\pgfplotsset{cycle list name=color list}
% nur Graustufen benutzen
%\pgfplotsset{cycle list name=linestyles}
% Strichstärke auf 1pt festlegen
\pgfplotsset{every axis plot/.append style={line width=1pt}}
% für deutsche Dokumente ein Komma benutzen
\addto\extrasngerman{\pgfplotsset{/pgf/number format/.cd,set decimal separator={{{,}}}}}
% ein halbes Leerzeichen als Tausendertrennzeichen benutzen
%\pgfplotsset{/pgf/number format/.cd,1000 sep={\,}}
% kein Tausendertrennzeichen verwenden
\pgfplotsset{/pgf/number format/.cd,1000 sep={}}
% Zahlen kleiner als 0.1 auch im fixed-Format ausgeben
\pgfplotsset{/pgf/number format/.cd,std=-2}
% neue Positionen für Legenden anlegen
\pgfplotsset{/pgfplots/legend pos/north/.style={/pgfplots/legend style={at={(0.50,0.97)},anchor=north}}}
\pgfplotsset{/pgfplots/legend pos/south/.style={/pgfplots/legend style={at={(0.50,0.03)},anchor=south}}}
\pgfplotsset{/pgfplots/legend pos/east/.style={/pgfplots/legend style={at={(0.97,0.50)},anchor=east}}}
\pgfplotsset{/pgfplots/legend pos/west/.style={/pgfplots/legend style={at={(0.03,0.50)},anchor=west}}}
\pgfplotsset{/pgfplots/legend pos/outer north/.style={/pgfplots/legend style={at={(0.50,1.03)},anchor=south}}}

% Paket für SI-Einheiten
\usepackage[binary-units]{siunitx}
% Brüche aktivieren
\sisetup{per-mode=fraction}
% Dezimaltrennzeichen abhängig von der Sprache
\addto\extrasngerman{\sisetup{output-decimal-marker={,}}}
\addto\extrasenglish{\sisetup{output-decimal-marker={.}}}
% Trennzeichen für Bereiche
\addto\extrasngerman{\sisetup{range-phrase={ bis~}}}
\addto\extrasenglish{\sisetup{range-phrase={ to~}}}


% Bibliography
\usepackage[round]{natbib}
\setcitestyle{open={(},close={)}}

% How to remove some pages from the navigation bullets in Beamer?
% siehe: https://tex.stackexchange.com/questions/37127/how-to-remove-some-pages-from-the-navigation-bullets-in-beamer
\makeatletter
\let\beamer@writeslidentry@miniframeson=\beamer@writeslidentry
\def\beamer@writeslidentry@miniframesoff{%
	\expandafter\beamer@ifempty\expandafter{\beamer@framestartpage}{}% does not happen normally
	{%else
		% removed \addtocontents commands
		\clearpage\beamer@notesactions%
	}
}
\newcommand*{\miniframeson}{\let\beamer@writeslidentry=\beamer@writeslidentry@miniframeson}
\newcommand*{\miniframesoff}{\let\beamer@writeslidentry=\beamer@writeslidentry@miniframesoff}
\makeatother
