%% iaeMM.cls, v-1.0 marcelomsp
%% Copyright 2012-2016 by abnTeX2 group at https://www.abntex.net.br/ 
%%
%% The Current Maintainer of this work is the ACE-E team, led
%% by Marcelo Silveira Pereira.
%%
%% This work consists of the file iaeMM.cls.

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Declaracao da classe abntex2 como uma extensao da classe memoir
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iaeMM}[2018/07/01]
\RequirePackage{ifthen}

% Opções de diagramação de sumários
% sumario=tradicional    : Sumário tradicional do LaTeX/Memoir
% sumario=abnt-6027-2012 : Sumário conforme recomendação da ABNT NBR 6027:2012
\newboolean{ABNTEXsumario-tradicional}     %true=titles of chapter/appendix in uppercase
\newboolean{ABNTEXsumario-abnt-6027-2012} 
\setboolean{ABNTEXsumario-tradicional}{false}
\setboolean{ABNTEXsumario-abnt-6027-2012}{true}
\DeclareOption{sumario=tradicional}{%
  \setboolean{ABNTEXsumario-tradicional}{true}%
  \setboolean{ABNTEXsumario-abnt-6027-2012}{false}}
\DeclareOption{sumario=abnt-6027-2012}{%
  \setboolean{ABNTEXsumario-abnt-6027-2012}{true}
  \setboolean{ABNTEXsumario-tradicional}{false}}
%
% Repassa demais opcoes a memoir	
%
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{memoir}%
}
\ProcessOptions\relax
\LoadClass{memoir}

% sumario=abnt-6027-2012 : Sumário conforme recomendação da ABNT NBR 6027:2012, que
%    soh pode ser usado com memoir v3.6k ou superior
%    \settocpreprocessor \changes{v3.6k}{2012/09/18}{Added}
\ifdefined\settocpreprocessor
\else
  \setboolean{ABNTEXsumario-tradicional}{true}
  \setboolean{ABNTEXsumario-abnt-6027-2012}{false}
\fi


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos para tratamento de opcoes proprias
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Comandos para controlar as opcoes de titulos com letras maiusculas 
% ---

% pacote que prove \MakeTextUppercase
\RequirePackage{textcase}

\newcommand{\ABNTEXchapterupper}[1]{\MakeTextUppercase{#1}}
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Pacotes adicionais e customizacoes gerais do memoir
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Do pacote de if/them/else
\newcommand{\abntex@ifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}
% ---

% ---
% Controla as referencias internas do PDF
\RequirePackage{hyperref}
\pdfstringdefDisableCommands{\def\\{, }\def\and{; }}
% ---

% ---
% Controla os bookmarks do PDF
\RequirePackage{bookmark}   			
% ---

% ---
% Hifenizacao e caracteres especiais portugues-brasil por padrao
% ---
\RequirePackage[brazil]{babel}
%
% Nomes constantes do abnTeX2 em portugues (definicoes padroes)
\newcommand{\folhaderostoname}{Folha de rosto}
\newcommand{\epigraphname}{Ep\'igrafe}
\newcommand{\dedicatorianame}{Dedicat\'oria}
\newcommand{\errataname}{Errata}
\newcommand{\agradecimentosname}{Agradecimentos}
\newcommand{\anexoname}{ANEXO}
\newcommand{\anexosname}{Anexos}
\newcommand{\apendicename}{AP\^ENDICE}
\newcommand{\apendicesname}{Ap\^endices}
\newcommand{\orientadorname}{Orientador:}
\newcommand{\coorientadorname}{Coorientador:}
\newcommand{\folhadeaprovacaoname}{Folha de Aprova\c{c}\~ao}
\newcommand{\resumoname}{Resumo} 
\newcommand{\listadesiglasname}{Lista de Abreviaturas e Siglas}
\newcommand{\listadesimbolosname}{Lista de S\'imbolos}
\newcommand{\fontename}{Fonte}
\newcommand{\notaname}{Nota}
%
\addto\captionsbrazil{% portugues-brasil
  %% ajusta nomes padroes do babel
  \renewcommand{\bibname}{Refer\^encias}
  \renewcommand{\indexname}{\'Indice}
  \renewcommand{\listfigurename}{Lista de Ilustra\c{c}\~{o}es}
  \renewcommand{\listtablename}{Lista de Tabelas}
  %% ajusta nomes usados com a macro \autoref
  \renewcommand{\pageautorefname}{p\'agina}
  \renewcommand{\sectionautorefname}{se{\c c}\~ao}
  \renewcommand{\subsectionautorefname}{se{\c c}\~ao}
  \renewcommand{\subsubsectionautorefname}{se{\c c}\~ao}
  \renewcommand{\paragraphautorefname}{se{\c c}\~ao}
}
\addto\captionsenglish{% ingles
  %% adjusts names from abnTeX2
  \renewcommand{\folhaderostoname}{Title Page}
  \renewcommand{\epigraphname}{Epigraph}
  \renewcommand{\dedicatorianame}{Dedication}
  \renewcommand{\errataname}{Errata Sheet}
  \renewcommand{\agradecimentosname}{Acknowledgements}
  \renewcommand{\anexoname}{ANNEX}
  \renewcommand{\anexosname}{Annex}
  \renewcommand{\apendicename}{APPENDIX}
  \renewcommand{\apendicesname}{Appendix}
  \renewcommand{\orientadorname}{Supervisor:}
  \renewcommand{\coorientadorname}{Co-supervisor:}
  \renewcommand{\folhadeaprovacaoname}{Approval}
  \renewcommand{\resumoname}{Abstract} 
  \renewcommand{\listadesiglasname}{List of Abbreviations and Acronyms}
  \renewcommand{\listadesimbolosname}{List of Symbols}
  \renewcommand{\fontename}{Source}
  \renewcommand{\notaname}{Note}
   %% adjusts names used by \autoref
  \renewcommand{\pageautorefname}{page}
  \renewcommand{\sectionautorefname}{section}
  \renewcommand{\subsectionautorefname}{section}
  \renewcommand{\subsubsectionautorefname}{section}
  \renewcommand{\paragraphautorefname}{section}
  \renewcommand{\chapterautorefname}{Chapter}
  \renewcommand{\figureautorefname}{Figure}
  \renewcommand{\tableautorefname}{Table}
  \renewcommand{\equationautorefname}{Equation}
}
% ---

% ---
% Customiza listas
\RequirePackage{enumitem}
% ---

% ---
% Pacote que permite realizar operacoes matematicas no codigo TeX
\RequirePackage{calc}
% ---

% ---
% Margens - NPA-IAE-30/2011-A
% ---
\setlrmarginsandblock{3cm}{1.5cm}{*}
\setulmarginsandblock{2cm}{2cm}{*}
\checkandfixthelayout
% ---

% ---
% Espacamento entre linhas - NPA-IAE-30/2011-A
\SingleSpacing

% O tamanho do parágrafo é dado por:
\setlength{\parindent}{2.5cm}

% Controle do espaçamento entre um parágrafo e outro:
\setlength{\parskip}{6pt}

\setlist[itemize]{leftmargin=\parindent+\labelsep,topsep = 6pt,itemsep = 0pt}
\setlist[enumerate]{leftmargin=\parindent+\labelsep,topsep = 6pt,itemsep = 0pt}

\setlength{\textfloatsep}{2\parskip plus \parskip}
\setlength{\floatsep}{2\parskip plus \parskip}
\setlength{\intextsep}{2\parskip plus \parskip}

% ---
% Ambiente para alineas e e subalineas (incisos)
% ABNT NBR 6024/2012 - 4.2 e 4.3
\newlist{alineas}{enumerate}{2}
\setlist[alineas,1]{label={\alph*)},topsep=0pt,itemsep=0pt,leftmargin=\parindent+\labelsep}%
\setlist[alineas,2]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}
\newlist{subalineas}{enumerate}{1}
\setlist[subalineas,1]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}%
\newlist{incisos}{enumerate}{1}
\setlist[incisos,1]{label={--},topsep=0pt,itemsep=0pt,leftmargin=*}%
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos publicos
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% ``Tamanho menor e uniforme'' ditada pela NBR 14724/2011 - 5.1
% ---
\newcommand{\ABNTEXfontereduzida}{\footnotesize}
\newcommand{\ABNTEXfontecitacao}{\small}
% ---

% ---
% Fontes padroes de part, chapter, section, subsection e subsubsection
\newcommand{\ABNTEXchapterfont}{\bfseries}
\newcommand{\ABNTEXchapterfontsize}{\LARGE}

\newcommand{\ABNTEXpartfont}{\ABNTEXchapterfont}
\newcommand{\ABNTEXpartfontsize}{\ABNTEXchapterfontsize}

\newcommand{\ABNTEXsectionfont}{\ABNTEXchapterfont}
\newcommand{\ABNTEXsectionfontsize}{\Large}

\newcommand{\ABNTEXsubsectionfont}{\normalfont}
\newcommand{\ABNTEXsubsectionfontsize}{\large}

\newcommand{\ABNTEXsubsubsectionfont}{\ABNTEXsubsectionfont}
\newcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}

\newcommand{\ABNTEXsubsubsubsectionfont}{\ABNTEXsubsectionfont}
\newcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e variaveis privados
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Comando para registro do bookmark interno
% ---
\newcounter{abntex@bookmarkcounter}
\setcounter{abntex@bookmarkcounter}{0}
\newcommand{\PRIVATEbookmarkthis}[1]{%
  \addtocounter{abntex@bookmarkcounter}{1}%
  \phantomsection\pdfbookmark[0]{#1}{chapterb\arabic{abntex@bookmarkcounter}}
}
% ---

% ---
% Comando que cria capitulos nao numerados ja com bookmark anotado
% ---
\newcommand{\pretextualchapter}[1]{%
  \addtocounter{abntex@bookmarkcounter}{1}%
  \PRIVATEbookmarkthis{#1}%
  \chapter*[#1]{#1}%
  }
\provideboolean{abntex@apendiceousecao}
\setboolean{abntex@apendiceousecao}{false}
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Configuracoes de layout
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Notas de rodape - footnotes - NBR 14724/2011 - 5.2.1 
\setlength{\footmarkwidth}{1.2em} % largura do footnotemark
\setlength{\footmarksep}{0em}
\footmarkstyle{\footnotesize{\textsuperscript{#1}}\hfill}

% tamanho da fonte do footnote
\renewcommand{\foottextfont}{\ABNTEXfontereduzida}
% ---

% ---
% Numeracao continua das figuras
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{equation}{chapter}
% ---

% ---
% Estilos de caption
% ---
\hangcaption
\newcommand{\ABNTEXcaptiondelim}{~\textendash~}
\newcommand{\ABNTEXcaptionfontedelim}{:~}
%\captionnamefont{\ABNTEXfontereduzida}
%\captiontitlefont{\ABNTEXfontereduzida}

% Para uso com pacotes subfig e caption dentro do memoir se estes forem carregados ou não.
% É necessário para que os comandos \IBGEtab e \fonte funcionem 
% independente do carregamento de pacotes externos ao memoir que tratam captions.

\newcommand{\IBGEtabfontsize}{\ABNTEXfontereduzida}
\AtBeginDocument{%
  % comandos auxiliares para manipular os captions dentro do comando \IBGEtab.
  \newcommand{\configurecaptions}{\captionstyle[\raggedright]{}}
  \newcommand{\configureseparator}{\captiondelim{\ABNTEXcaptiondelim}}
  % Define o comando \IBGEtab{}{}{} com caption e legenda da largura do conteúdo tabular, tabular*, etc
  % Parece funcionar com qualque pacote
  \newsavebox{\myptabbox}
  \newlength{\myptabboxwidth}
  
  \newlength{\ABNTcolumnwidth}
  \setlength{\ABNTcolumnwidth}{\tabcolsep}
  
  \newcommand{\IBGEtab}[3]{%
    \savebox{\myptabbox}{{\IBGEtabfontsize #2}}%
    \settowidth{\myptabboxwidth}{\usebox{\myptabbox}}%
    \centering%
    \parbox{\myptabboxwidth}{%
    \configurecaptions
    #1%
    \par%
    {\IBGEtabfontsize%
    #2%
    }%
    \par%
    #3}%
  }
  \let\ibgetab\IBGEtab  
}

% Define o comando \fonte que respeita as configurações de caption do memoir ou do caption
\makeatletter
\newcommand{\fonte}[2][\fontename]{%
  \M@gettitle{#2}%
  \memlegendinfo{#2}%
  \par
  \begingroup
     \@parboxrestore
     \if@minipage
       \@setminipage
     \fi
     \ABNTEXfontereduzida
     %\configureseparator
     \captiondelim{\ABNTEXcaptionfontedelim}
     \@makecaption{\ABNTEXfontereduzida #1}{\ignorespaces\ABNTEXfontereduzida #2}\par
  \endgroup
  \vspace*{-0.5\baselineskip}
  }
\makeatother

% Define o comando \notas que respeita as configurações de caption do memoir ou do caption
\makeatletter
\newcommand{\nota}[2][\notaname]{\fonte[#1]{#2}}
\makeatother


% Altera os comandos \configurecaptions e \configureseparator para trabalhar com 
% o pacote caption e amigos.
\AtEndPackage{caption}{
  \AtBeginDocument{%
    \DeclareCaptionLabelSeparator{barr}{\ABNTEXcaptiondelim}
    \DeclareCaptionFont{ABNTEXfontereduzida}{\ABNTEXfontereduzida}
      \captionsetup{format=hang,
                    labelseparator=barr,
                    %labelfont=ABNTEXfontereduzida,
                    %font=ABNTEXfontereduzida
                    }
      \renewcommand{\configurecaptions}{%
                  \captionsetup{justification=justified,%
                                singlelinecheck=false}}
      \renewcommand{\configureseparator}{\captionsetup{labelsep=colon}}
  }
}

\AtBeginDocument{
 \captiondelim{\ABNTEXcaptiondelim}
}
% ---

% -----
% Configuracoes do TOC
% -----
% nivel de profundidade (implementa o quinto nivel - subsubsubsection)
\setsecnumdepth{paragraph}
\settocdepth{paragraph}
\setcounter{tocdepth}{5}
\setcounter{secnumdepth}{5}
\maxsecnumdepth{paragraph}

% redefine os comandos *paragraph* para *subsubsubsection* ****
\newcommand{\subsubsubsection}{\paragraph}
\newcommand{\cftbeforesubsubsubsectionskip}{\cftbeforeparagraphskip}
\newcommand{\cftsubsubsubsectionfont}{\cftparagraphfont}
\newcommand{\setsubsubsubsecheadstyle}{\setparaheadstyle}

\setafterparaskip{1.0\onelineskip plus 0.5\onelineskip minus 0.2\onelineskip}
\setparaheadstyle{\normalfont\sffamily\raggedright}%

% lista de ilustracoes
\renewcommand{\cftfigurename}{\figurename\space} 
\renewcommand*{\cftfigureaftersnum}{\hfill\textendash\hfill}
 
% lista de tabelas  
\renewcommand{\cfttablename}{\tablename\space}
\renewcommand*{\cfttableaftersnum}{\hfill\textendash\hfill}	
 
% fonte das partes e do capitulo do TOC
\renewcommand{\tocheadstart}{\ABNTEXchapterfont}

% leaders para os capitulos
\renewcommand*{\cftchapterdotsep}{\cftdotsep}

% suprime espaço entre os itens de listings de diferentes capítulos 
\setlength{\cftbeforechapterskip}{0pt plus 0pt}
\renewcommand*{\insertchapterspace}{}

% macros para configurar o Sumário conforme 6027-2012 ou tradicional cft
\cftinsertcode{A}{}

\newlength{\cftlastnumwidth}
\setlength{\cftlastnumwidth}{\cftsubsubsectionnumwidth}
\addtolength{\cftlastnumwidth}{1em}

\newcommand{\tocprintchapter}{}
\newcommand{\tocinnonumchapter}{}
\newcommand{\tocprintchapternonum}{}
\newcommand{\tocpartapendices}{}
\newcommand{\tocpartanexos}{}

% insere o hifen no anexo/apendice do toc
\cftinsertcode{A}{\renewcommand{\cftchapteraftersnum}{\hfill\textendash\hfill}}

% No caso de Sumario (TOC) tradicional
\ifthenelse{\boolean{ABNTEXsumario-tradicional}}{}{} % essa linha não faz nada,
                                                     % mas se houver necessidade de alterar o comportamento
                                                     % do sumário tradicional altere aqui.

% No caso de Sumario (TOC) especifico da ABNT-6027-2012

\makeatletter
\ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{
  \settocpreprocessor{chapter}{%
  \let\tempf@rtoc\f@rtoc%
  \def\f@rtoc{%
  \texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
  }
  \settocpreprocessor{part}{%
  \let\tempf@rtoc\f@rtoc%
  \def\f@rtoc{%
  \texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
  }
}{}
\makeatother
%
\ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{%
  
  \cftsetindents{part}{0em}{\cftlastnumwidth}
  \cftsetindents{chapter}{0em}{\cftlastnumwidth}
  \cftsetindents{section}{0em}{\cftlastnumwidth}
  \cftsetindents{subsection}{0em}{\cftlastnumwidth}
  \cftsetindents{subsubsection}{0em}{\cftlastnumwidth}
  \cftsetindents{paragraph}{0em}{\cftlastnumwidth}
  \cftsetindents{subparagraph}{0em}{\cftlastnumwidth}
  %
  \renewcommand{\tocprintchapter}{%
    \addtocontents{toc}{\cftsetindents{chapter}{0em}{\cftlastnumwidth}}}
  %
  \renewcommand{\tocinnonumchapter}{%
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}%
    \cftinserthook{toc}{A}}
  %
  \renewcommand{\tocprintchapternonum}{%
    \addtocontents{toc}{\cftsetindents{chapter}{\cftlastnumwidth}{2em}}}
  %
  \renewcommand{\tocpartapendices}{%
    \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
    \cftinserthook{toc}{A}}
  %
  \renewcommand{\tocpartanexos}{%
    \addtocontents{toc}{\cftsetindents{part}{\cftlastnumwidth}{2em}}
    \cftinserthook{toc}{A}}
  %
  \setlength{\cftbeforechapterskip}{1em}
  %
  % Fontes das entradas do sumario
  %
  \renewcommand{\cftpartfont}{\bfseries\larger}
  %
  \renewcommand{\cftchapterfont}{\ABNTEXchapterfont}
  \renewcommand{\cftchapterpagefont}{\normalsize\cftchapterfont}
  %
  \renewcommand{\cftsectionfont}{\ABNTEXsectionfont}
  \renewcommand{\cftsectionpagefont}{\cftsectionfont}
  %
  \renewcommand{\cftsubsectionfont}{\ABNTEXsubsectionfont}
  \renewcommand{\cftsubsectionpagefont}{\cftsubsectionfont}
  %
  \renewcommand{\cftsubsubsectionfont}{\ABNTEXsubsubsectionfont}
  \renewcommand{\cftsubsubsectionpagefont}{\cftsubsubsectionfont}
  %
  \renewcommand{\cftparagraphfont}{\ABNTEXsubsubsubsectionfont}
  \renewcommand{\cftparagraphpagefont}{\cftparagraphfont}
  %
  % Ajusta entrada Referencias
  %
  \renewcommand{\bibsection}{%
    \chapter*{\bibname}
    \bibmark
    \ifnobibintoc\else
    \phantomsection
    \addcontentsline{toc}{chapter}{\texorpdfstring{\uppercase{\bibname}}{\bibname}}
    \fi
    \prebibhook
}
  
}{}

% Comando que simula a finalizacao de uma parte no bookmark e
% adiciona espaco de \part no sumario
\newcommand{\phantompart}{%
  \bookmarksetup{startatroot}%
  \phantomsection%
  \ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{%
    \addtocontents{toc}{\vspace{\cftbeforechapterskip}}}{%
    \addtocontents{toc}{\vspace{\cftbeforepartskip}}}%
}
% -----

% ---
% Configuracao dos titulos dos capitulos
% Novo estido do memoir 
% ABNT NBR 14724-2011 - 5.2.2-5.2.4; ABNT NBR 6024-2003 - 3.1-3.8
\provideboolean{abntex@innonumchapter}
\setboolean{abntex@innonumchapter}{true}
\makechapterstyle{abnt}{%
  \renewcommand{\chapterheadstart}{} 

  \ifx \chapternamenumlength \undefined
    \newlength{\chapternamenumlength}
  \fi

  % tamanhos de fontes de chapter e part	
  \setlength{\beforechapskip}{0pt}
  \renewcommand{\chaptitlefont}{\ABNTEXchapterfont\ABNTEXchapterfontsize}
  
  \renewcommand{\chapnumfont}{\chaptitlefont}
  \renewcommand{\parttitlefont}{\ABNTEXpartfont\ABNTEXpartfontsize}
  \renewcommand{\partnumfont}{\ABNTEXpartfont\ABNTEXpartfontsize}
  \renewcommand{\partnamefont}{\ABNTEXpartfont\ABNTEXpartfontsize}
  
  % tamanhos de fontes de section, subsection, subsubsection e subsubsubsection
  \setsecheadstyle{\ABNTEXsectionfont\ABNTEXsectionfontsize}
  \setsubsecheadstyle{\ABNTEXsubsectionfont\ABNTEXsubsectionfontsize}
  \setsubsubsecheadstyle{\ABNTEXsubsubsectionfont\ABNTEXsubsubsectionfontsize}
  \setsubsubsubsecheadstyle{\ABNTEXsubsubsubsectionfont\ABNTEXsubsubsubsectionfontsize}
  
  % impressao do numero do capitulo
  \renewcommand{\chapternamenum}{}
  
  % impressao do nome do capitulo
  \renewcommand{\printchaptername}{%
   \chaptitlefont
   \ifthenelse{\boolean{abntex@apendiceousecao}}{\appendixname}{}%
  }
    
  % impressao do titulo do capitulo
  \def\printchaptertitle##1{%
    \chaptitlefont%
    \ifthenelse{\boolean{abntex@innonumchapter}}{\centering\ABNTEXchapterupper{##1}}{%
    \ifthenelse{\boolean{abntex@apendiceousecao}}{%
        \centering%
        \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
        \ABNTEXchapterupper{##1}%
      }{%
        \settowidth{\chapternamenumlength}{\printchaptername\printchapternum\afterchapternum}%
        \parbox[t]{\columnwidth-\chapternamenumlength}{\ABNTEXchapterupper{##1}}}%
     }    
  }
       
  % impressao do numero do capitulo     	
  \renewcommand{\printchapternum}{%
     \tocprintchapter
     \setboolean{abntex@innonumchapter}{false}
     \chapnumfont%
     \space\thechapter\space%
     \ifthenelse{\boolean{abntex@apendiceousecao}}{%
       \tocinnonumchapter
       \ABNTEXcaptiondelim%
     }{} % else
  }
  \renewcommand{\afterchapternum}{}
  
  % impressao do capitulo nao numerado
  \renewcommand\printchapternonum{%
     \tocprintchapternonum
     \setboolean{abntex@innonumchapter}{true}%
    }
}
\chapterstyle{abnt}
% ---

% -----
% Declaracoes de cabecalhos 
% -----
% Cabecalho padrao
\makepagestyle{abntheadings}
\makeevenfoot{abntheadings}{}{\ABNTEXfontereduzida\thepage}{}
\makeoddfoot{abntheadings}{}{\ABNTEXfontereduzida\thepage}{}

% Cabecalho do inicio do capitulo
\makepagestyle{abntchapfirst}
\makeoddfoot{abntchapfirst}{}{\ABNTEXfontereduzida\thepage}{}
% ---

% ---
% Configura layout para elementos pre-textuais
\newcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty}% customizing chapter pagestyle
  \pagestyle{empty}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{empty}
}
\renewcommand{\frontmatter}{\pretextual} 

% por default, inicializa o documento com elementos \pretextuais
\AtBeginDocument{\pretextual}
% ---

% ---
% Configura layout para elementos textuais
\newcommand{\textual}{%
  \pagestyle{abntheadings}%
  \aliaspagestyle{chapter}{abntchapfirst}% customizing chapter pagestyle
  \nouppercaseheads%
  \bookmarksetup{startatroot}% 
}
\renewcommand{\mainmatter}{\textual}
% ---

% ---
% Configura layout para elementos pos-textuais
\newcommand{\postextual}{\phantompart}
\renewcommand{\backmatter}{\postextual}
% -----

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos de dados para CAPA e FOLHA DE ROSTO 
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% Comandos de dados - titulo do documento
\newcommand{\titulo}[1]{\title{#1}}
\newcommand{\imprimirtitulo}{\thetitle}

% Comandos de dados - autor (use \and para multiplos autores)
\newcommand{\autor}[1]{\author{#1}}
\newcommand{\imprimirautor}{\theauthor}

% Comandos de dados - data
\let\olddate\date
\renewcommand{\date}[1]{\AtBeginDocument{\olddate{#1}}}
\newcommand{\data}[1]{\date{#1}}
\newcommand{\imprimirdata}{\thedate}

% Comandos de dados - instituicao
\providecommand{\imprimirinstituicao}{}
\newcommand{\instituicao}[1]{\renewcommand{\imprimirinstituicao}{#1}}

% Comandos de dados - local
\providecommand{\imprimirlocal}{}
\newcommand{\local}[1]{\renewcommand{\imprimirlocal}{#1}}

% Comandos de dados - preambulo
\providecommand{\imprimirpreambulo}{}
\newcommand{\preambulo}[1]{\renewcommand{\imprimirpreambulo}{#1}}

% Comandos de dados - orientador
\providecommand{\imprimirorientadorRotulo}{}
\providecommand{\imprimirorientador}{}
\newcommand{\orientador}[2][\orientadorname]%
  {\renewcommand{\imprimirorientadorRotulo}{#1}%
   \renewcommand{\imprimirorientador}{#2}}

% Comandos de dados - coorientador
\providecommand{\imprimircoorientadorRotulo}{}
\providecommand{\imprimircoorientador}{}
\newcommand{\coorientador}[2][\coorientadorname]%
  {\renewcommand{\imprimircoorientadorRotulo}{#1}%
   \renewcommand{\imprimircoorientador}{#2}}

% Comandos de dados - tipo de trabalho
\providecommand{\imprimirtipotrabalho}{}
\newcommand{\tipotrabalho}[1]{\renewcommand{\imprimirtipotrabalho}{#1}}

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e ambientes de editoracao PRE-TEXTUAIS
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Ambiente para definicao da Capa
\newenvironment{capa}{\begin{titlingpage}}{\end{titlingpage}\cleardoublepage}
% ---

% ---
% Ficha catalografica (Dados internacionais de
% catalogação-na-publicacao)
\newenvironment{fichacatalografica}{%
    \thispagestyle{empty}
    \begin{SingleSpacing}
      \ABNTEXfontereduzida
}{%   
    \end{SingleSpacing}%
}%
% ---

% ---
% Errata
\newenvironment{errata}[1][\errataname]{%
   \pretextualchapter{#1}
  }{\cleardoublepage}
% ---

% ---
% Folha de aprovacao - NBR 14724/2011 - 4.2.1.3
\newenvironment{folhadeaprovacao}[1][\folhadeaprovacaoname]{%
   \clearpage%
   \PRIVATEbookmarkthis{#1}%
   \begin{Spacing}{1.0}
}{\end{Spacing}\cleardoublepage}   
% ---

% ---
% Dedicatoria
\newenvironment{dedicatoria}[1][]{%
   \ifthenelse{\equal{#1}{}}{%
    \PRIVATEbookmarkthis{\dedicatorianame}
    }{\pretextualchapter{#1}}
  }{\cleardoublepage}
% ---

% ---
% Agradecimentos
\newenvironment{agradecimentos}[1][\agradecimentosname]{%
   \pretextualchapter{#1}
  }{\cleardoublepage}
% ---

% ---
% Epigrafe
\newenvironment{epigrafe}[1][]{%
   \ifthenelse{\equal{#1}{}}{%
    \PRIVATEbookmarkthis{\epigraphname}
    }{\pretextualchapter{#1}}
  }{\cleardoublepage}
% ---

% ---
% Resumo e abstracts em diferentes idiomas - NBR 14724/2011

% altera as margens padrões do memoir para abstract caso nao seja article
\renewcommand{\abstracttextfont}{\normalfont\normalsize}
  
% A norma não diz nada sobre identação e separação entre parágrafos no abstract,
% porém o uso mostra que muitos abstracts são montados sem identação.
\AtBeginDocument{%
   \setlength{\absparindent}{0pt}
}

\newenvironment{resumo}[1][\resumoname]{%
   \PRIVATEbookmarkthis{#1}
   \renewcommand{\abstractnamefont}{\chaptitlefont}
   \renewcommand{\abstractname}{\ABNTEXchapterupper{#1}}
   \begin{abstract}
  }{\end{abstract}}
  
\newenvironment{resumoumacoluna}[1][\resumoname]{%
   \PRIVATEbookmarkthis{#1}
   \renewcommand{\abstractnamefont}{\chaptitlefont}
   \renewcommand{\abstractname}{\ABNTEXchapterupper{#1}}
   \begin{onecolabstract}
}{\end{onecolabstract}\cleardoublepage}
% ---

% ---
% Lista de abreviaturas e siglas
\newenvironment{siglas}{%
  \pretextualchapter{\listadesiglasname}
  \begin{symbols}
}{%
  \end{symbols}
  \cleardoublepage
}
% ---

% ---
% Lista de sembolos
\newenvironment{simbolos}{%
  \pretextualchapter{\listadesimbolosname}
  \begin{symbols}
}{%
  \end{symbols}
  \cleardoublepage
}
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e ambientes de editoracao APENDICES e ANEXOS
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Definicoes compartilhadas entre Apendices e Anexos
% ---
\makeatletter
\newcommand\@switch[1]{ \@writefile{toc}{\renewcommand*{\cftappendixname}{#1 \space}} }
\newcommand{\switchchapname}[1]{ \protected@write \@auxout {}{\string\@switch{#1} }}
\makeatother

\newcommand{\PRIVATEapendiceconfig}[2]{%
 \setboolean{abntex@apendiceousecao}{true}%
 \renewcommand{\appendixname}{#1}
 \ifthenelse{\boolean{ABNTEXsumario-abnt-6027-2012}}{
   \renewcommand{\appendixtocname}{\texorpdfstring{\uppercase{#2}}{#2}}
  }{%
  \renewcommand{\appendixtocname}{#2}} 
 \renewcommand{\appendixpagename}{#2}
 \switchchapname{#1}% Corrected from \switchapname -> \switchchapname
 \renewcommand*{\cftappendixname}{#1 \space}
}
% ---

% ---
% Apendices - comando 
\newcommand{\apendices}{%
 \PRIVATEapendiceconfig{\apendicename}{\apendicesname}
 \appendix
}
% Apendices - ambiente
\newenvironment{apendicesenv}{%
 \PRIVATEapendiceconfig{\apendicename}{\apendicesname}
 \begin{appendix}
}{
 \end{appendix}
 \setboolean{abntex@apendiceousecao}{false}
 \bookmarksetup{startatroot}
}
% ---

% ---
% Anexos - comando
\newcommand{\anexos}{%
 \cftinserthook{toc}{AAA}
 
 \PRIVATEapendiceconfig{\anexoname}{\anexosname}
 \appendix
 \renewcommand\theHchapter{anexochapback.\arabic{chapter}}
}
% Anexos - ambiente
\newenvironment{anexosenv}{%
 \cftinserthook{toc}{AAA}
 
 \PRIVATEapendiceconfig{\anexoname}{\anexosname}
 \begin{appendix}
 \renewcommand\theHchapter{anexochapback.\arabic{chapter}}
}{
 \end{appendix}
 \setboolean{abntex@apendiceousecao}{false}
 \bookmarksetup{startatroot}
}
% ---

% ---
% Imprime uma pagina de divisao no estilo parte
\newcommand{\partpage}{%
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{part}{\appendixtocname}%
  \appendixpage*
}

% atalhos para \partpage ou \appendixpage* 
\makeatletter
\newcommand{\partapendices}{%
\tocpartapendices%
\@ifstar{\appendixpage*}{\partpage}}

\newcommand{\partanexos}{%
\tocpartanexos%
\@ifstar{\appendixpage*}{\partpage}}
\makeatother
% ---


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% Comandos e ambientes de editoracao CITACAO, ASSINATURA
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Citacao direta com mais de 3 linhas - ABNT NBR 10520/2002 - 5.3
\newlength{\ABNTEXcitacaorecuo}% recuo de 4 cm da margem esquerda
\setlength{\ABNTEXcitacaorecuo}{1.5cm}

\newenvironment*{citacao}[1][default]
{%
	\ABNTEXfontecitacao%
	\addtolength{\leftskip}{\ABNTEXcitacaorecuo}
	\setlength{\parindent}{1.0cm}
    \vspace*{6pt}
	\indent
	\ifthenelse{\not\equal{#1}{default}}{\itshape\selectlanguage{#1}}{}%
}
% ---
  
% ---
% Comando \assinatura for signature
   % width of the line and text under the line
\newlength{\ABNTEXsignwidth}
\setlength{\ABNTEXsignwidth}{8cm}
   % thickness of the line
\newlength{\ABNTEXsignthickness}
\setlength{\ABNTEXsignthickness}{1pt}
   % ammount of space left between previous text and th signature line
\newlength{\ABNTEXsignskip}
\setlength{\ABNTEXsignskip}{0.7cm}
   % \assinatura{name} -> types a line with name under the line, centralized
   % \assinatura*{name} -> Creates the box with the line and name under
   %     it, but the box has no position assigned. However the line and the
   %     name are centralized with respect to each other.
\makeatletter
\newcommand{\assinatura}{\@ifstar{\ABNTEXsign}{\ABNTEXcsign}}
\makeatother
   % assinatura com estrela
\newcommand{\ABNTEXsign}[1]{%
  \parbox[t]{\ABNTEXsignwidth}{\SingleSpacing\vspace*{\ABNTEXsignskip}\centering%
  \rule{\ABNTEXsignwidth}{\ABNTEXsignthickness}\\%
  \nopagebreak #1\par}%
}
   % assinatura sem estrela
\newcommand{\ABNTEXcsign}[1]%
  {\begingroup\par\centering\ABNTEXsign{#1}\par\endgroup}  
% ---

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% IMPRESSOES PADROES DE CAPA E FOLHA DE ROSTO
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------

% ---
% Impressão da Capa
\newcommand{\imprimircapa}{%
\OnehalfSpacing
\begin{flushleft}
\begin{center}{
	\hspace{-1.5cm}MINISTÉRIO DA DEFESA \\
	\hspace{-1.5cm}COMANDO DA AERONÁUTICA\\
	\hspace{-1.5cm}\underline{INSTITUTO DE AERONÁUTICA E ESPAÇO} \\
	\hspace{-1.5cm}\Divisao \\
}\end{center}

\hspace{2cm}
\begin{minipage}[c][5cm][c]{10.8cm}
	\begin{center}
	\vspace*{2mm}
	- MEMORANDO TÉCNICO - \\
	\vspace*{3mm}
	\textbf{\Titulo} \\
	\end{center}
	\vfill
	\begin{flushright}
	\begin{small}
	\CodDiv \hfill	Cód.: \CodIAE \\
		Data: \Data    
	\end{small}
	\end{flushright}
\end{minipage}

Elaborado por: \\
\vspace*{12mm}
\parbox[c]{0.55\hsize}{\centering \Autori \\ \FuncaoAutori}

%\vspace*{12mm}
%\parbox[c]{0.55\hsize}{\centering \Autorii \\ \FuncaoAutorii}
%\vspace*{3mm}

{\color{black}
Revisado por:\\
\vspace*{12mm}
\parbox[c]{0.55\hsize}{\centering \Revisor \\ \FuncaoRevisor}

\vspace*{3mm}}

Aprovado por:\\
\vspace*{12mm}
\parbox[c]{0.55\hsize}{\centering \Aprovador \\ \FuncaoAprovador}
\vspace*{3mm}

\vfill
% Coloque os locais onde estão o original e as cópias deste documento
\noindent Original: \Original \\
Cópias: \Copias
\vspace{-0.2cm}
================================================== \\
Palavras-chave: \PalavrasChave \\
================================================== \\
\parbox[c]{\hsize}{\centering ARTICULAÇÃO}
Nível Superior: \nivelSuperior\\
Nível Inferior: \nivelInferior\\
==================================================
\end{flushleft}
\newpage
\SingleSpacing
}
% ---
\newcommand{\StringVolume}[1]
{
  \ifnum\TotalVolumes=1
    #1
  \else
    #1/\TotalVolumes
  \fi
}
% ---
% Impressão da FI
\newcommand{\imprimirfolhaidentificacao}{%
\OnehalfSpacing
\begin{flushleft}
	\begin{tabularx}{\textwidth}{|X|X|X|X|X|X|X|X|X|}
		\hline
		\multicolumn{1}{|>{\hsize=\dimexpr\hsize+1\tabcolsep+1\arrayrulewidth\relax}X|}{
			\parbox[c]{\hsize}{\centering \includegraphics[height=18.5mm]{iae_logo.png}}}
		&
		\multicolumn{5}{>{\hsize=\dimexpr5\hsize+8\tabcolsep+4\arrayrulewidth\relax}X}{
			\parbox[c]{\dimexpr0.94\hsize}{\centering \small{\textbf{FOLHA DE \\IDENTIFICAÇÃO DE DOCUMENTO \\(FI)}}}}
		&
		\multicolumn{3}{|>{\hsize=\dimexpr3\hsize+4\tabcolsep+2\arrayrulewidth\relax}X|}{
		\hspace*{-0.2cm}
		\begin{tabular}{l} 
			\footnotesize{1-DOC.N$\degree$:\CodDiv}\\ 
			\footnotesize{Código: \CodIAE}\vspace{6pt}\\
			\footnotesize{2-DATA: \Data}
		\end{tabular}}
		\\ \hline		
		
	\multicolumn{3}{|>{\hsize=\dimexpr3\hsize+4\tabcolsep+2\arrayrulewidth\relax}X|}{
		\begin{tabular}{l}
			\scriptsize{3-GRAU DE SIGILO} \\
			\hspace*{0.25cm} \footnotesize{\Sigilo} \\
			\hspace*{0.25cm} \footnotesize{} \\
		\end{tabular}}
		&
	\multicolumn{6}{>{\hsize=\dimexpr6\hsize+10\tabcolsep+5\arrayrulewidth\relax}X|}{
		\begin{tabular}{l}
			\scriptsize{5-PROJETO} \\
			\hspace*{0.25cm} \footnotesize{Código: \InicioCodigo} \\  %Código: 590 \\
			\hspace*{0.25cm} \footnotesize{Título: \Projeto}  %Título: VLS
		\end{tabular}}
	\\ \hline

	\multicolumn{3}{|>{\hsize=\dimexpr3\hsize+4\tabcolsep+2\arrayrulewidth\relax}X|}{
		\begin{tabular}{l}
			\scriptsize{4-ORIGEM}\\
			\hspace*{0.25cm} \footnotesize{\Origem}
		\end{tabular} }
	&
	\multicolumn{3}{>{\hsize=\dimexpr3\hsize+4\tabcolsep+2\arrayrulewidth\relax}X}{
		\begin{tabular}{l}
			\scriptsize{6-TIPO DE DOCUMENTO} \\
			\hspace*{0.25cm} \small{Memorando Técnico}
		\end{tabular}}
	&
	\multicolumn{3}{|>{\hsize=\dimexpr3\hsize+4\tabcolsep+2\arrayrulewidth\relax}X|}{
		\hspace*{-0.2cm}
		\begin{tabular}{l}
			\scriptsize{7-N$^{\circ}$ DE PÁGINAS} - \pageref{LastPage} \\
			\scriptsize{8-N$^{\circ}$ DE VOLUME}  - \StringVolume{\Volume}
		\end{tabular}}
	\\ \hline				
	\multicolumn{9}{|>{\hsize=\dimexpr9\hsize+16\tabcolsep+8\arrayrulewidth\relax}X|}{
		\begin{tabular}{l}
			\scriptsize{9-AUTOR(ES)} \\
			\hspace*{0.25cm} \small{\Autori} \\
			%\hspace*{0.25cm} \small{\Autorii}
		\end{tabular}}
	\\ \hline	
	\multicolumn{9}{|>{\hsize=\dimexpr9\hsize+16\tabcolsep+8\arrayrulewidth\relax}X|}{
		\begin{tabular}{l}
			\scriptsize{10-TÍTULO DO DOCUMENTO} \\
			\hspace*{0.25cm}
			\parbox[c]{\dimexpr0.94\hsize}{
				\small{\Titulo}}
		\end{tabular}}
	\\ \hline
	\multicolumn{9}{|>{\hsize=\dimexpr9\hsize+16\tabcolsep+8\arrayrulewidth\relax}X|}{
		\begin{tabular}{l}
			\scriptsize{11-PALAVRAS-CHAVE SUGERIDAS PELO AUTOR:} \\
			\scriptsize{EM INGLÊS:} \\
			\hspace*{0.25cm} \parbox[c]{\dimexpr0.94\hsize}{\small{\Keywords}} \\
			\scriptsize{EM PORTUGUÊS:} \\
			\hspace*{0.25cm} \parbox[c]{\dimexpr0.94\hsize}{\small{\PalavrasChave}}\\
			
	\end{tabular}}
	\\ \hline
	\multicolumn{9}{|>{\hsize=\dimexpr9\hsize+16\tabcolsep+8\arrayrulewidth\relax}X|}{
		\begin{tabular}{l}
			\scriptsize{12-PALAVRAS-CHAVE RESULTANTES DE INDEXAÇÃO:} \\
			\hspace*{0.25cm}
			\parbox[c]{\dimexpr0.94\hsize}{\small{\PalavrasChaveIndexacao}} \\		
	\end{tabular}}
	\\ \hline	
	\multicolumn{9}{|>{\hsize=\dimexpr9\hsize+16\tabcolsep+8\arrayrulewidth\relax}X|}{
		\begin{tabular}{l}
			\scriptsize{13-RESUMO} \\ [6pt]
			\hspace*{0.25cm}
			\parbox[c]{\dimexpr0.94\hsize}{\small{\Resumo}} \vspace{6pt} \\
			[24ex]
		\end{tabular}}
	\\ \hline
	\multicolumn{9}{|>{\hsize=\dimexpr9\hsize+16\tabcolsep+8\arrayrulewidth\relax}X|}{
		\begin{tabular}{l}
			\scriptsize{14-LOCAL DE ARQUIVAMENTO} \\
			\hspace*{0.25cm} \small{Original: \Original} \\
			\hspace*{0.25cm} \small{Cópias: \Copias} \\
		\end{tabular}}
	\\ \hline
	\multicolumn{9}{|>{\hsize=\dimexpr9\hsize+16\tabcolsep+8\arrayrulewidth\relax}X|}{
	
		\begin{tabular}{l}
			\scriptsize{15-OBSERVAÇÕES} \\
			\hspace*{0.25cm} \small{Arquivo Eletrônico: \ArquivoEletronico}\\
			\parbox[c]{\dimexpr0.94\hsize}{	\small{\Observacoes} \vspace{6pt}}
		\end{tabular} }
	\\ \hline
	\multicolumn{9}{|>{\hsize=\dimexpr9\hsize+16\tabcolsep+8\arrayrulewidth\relax}X|}{
		\begin{tabular}{l}
			\scriptsize{16-CÓDIGO DO SIGTEC:} \\
			\hspace*{0.25cm} \small{\CodSIGTEC} \\
		\end{tabular}  }
	\\ \hline
\end{tabularx}	
\end{flushleft}
\newpage
\SingleSpacing
}

\newcommand{\imprimirfolhadestinatarios}{%
\begin{flushleft}
	\begin{tabularx}{\textwidth}{|XX|XX|XXXXX|XX|XXX|}
		\hline
		\multicolumn{2}{|c|}{
			\raisebox{-.5\height}{\includegraphics[scale=0.1]{iae_logo.png}}}
		&
		\multicolumn{8}{c|}{
			 \small{\textbf{LISTA DE DESTINATÁRIOS}}}
		&
		\multicolumn{4}{l|}{
		\hspace*{-0.2cm}
		\begin{tabular}{l} 
			\footnotesize{PROJETO:}\\
			\hspace*{0.25cm} \footnotesize{\InicioCodigo}\\
			\footnotesize{DOC.N$\degree$:} \\
			\hspace*{0.25cm} \footnotesize{\CodIAE}\\
		\end{tabular}}
		\\ \hline
		\multicolumn{2}{|c|}{
			\footnotesize{CÓPIA N$^{\circ}$}}
		&
		\multicolumn{2}{c|}{
			\footnotesize{DESTINO}}
		&
		\multicolumn{10}{c|}{
			\footnotesize{RECEBIDO POR:}}
		\\ \hline
		\multicolumn{2}{|c|}{}
		&
		\multicolumn{2}{c|}{}
		&
		\multicolumn{5}{c|}{\footnotesize{NOME}}
		&
		\multicolumn{2}{c|}{\footnotesize{DATA}} 
		&
		\multicolumn{3}{c|}{\footnotesize{ASSINATURA}}
		\\ \hline
		\multicolumn{2}{|c|}{\footnotesize{001}}
		&
		\multicolumn{2}{c|}{\footnotesize{DLR}}
		&
		\multicolumn{5}{c|}{\footnotesize{ }}
		&
		\multicolumn{2}{c|}{\footnotesize{ }} 
		&
		\multicolumn{3}{c|}{\footnotesize{ }}
		\\ \hline
		\multicolumn{2}{|c|}{\footnotesize{002}}
		&
		\multicolumn{2}{c|}{\footnotesize{APJ}}
		&
		\multicolumn{5}{c|}{\footnotesize{ }}
		&
		\multicolumn{2}{c|}{\footnotesize{ }} 
		&
		\multicolumn{3}{c|}{\footnotesize{ }}
		\\ \hline
		\multicolumn{2}{|c|}{\footnotesize{003}}
		&
		\multicolumn{2}{c|}{\footnotesize{ACE}}
		&
		\multicolumn{5}{c|}{\footnotesize{ }}
		&
		\multicolumn{2}{c|}{\footnotesize{ }} 
		&
		\multicolumn{3}{c|}{\footnotesize{ }}
		\\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		& & & & & & & & & & & & & \\ \hline
		\multicolumn{14}{|l|}{\multirow{2}{*}{\footnotesize{FORMAS DE ACESSO AO DOCUMENTO:}}} \\
		\multicolumn{14}{|l|}{} \\ \hline
\end{tabularx}	
\end{flushleft}
\newpage
\SingleSpacing
}