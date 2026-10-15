%% faeng.cls, v1.0 Rodolfo Varraschim Rocha
%% Adaptado de eesc.cls - Copyright 2013 by Athila e Monaro
%%
%% 
%%
%% faeng: Modelo de Trabalho Acadêmico em conformidade com 
%% ABNT NBR 14724:2011. Esta classe estende as funcionalidades da classe
%% abnTeX2 elaborada de forma a adequar os parâmetros exigidos pelas 
%% normas da Faculdade de Engenharia da Universidade Federal de Mato Grosso/CUVG.
%% ------------------------------------------------------------------------
%% ------------------------------------------------------------------------

%%========================================================================
%% Identificação
%%========================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{faeng}[2019/02/03 v1.0 Classe FAENG]

%%========================================================================
%% Declaração de opções
%%========================================================================
%% Opções:
%% 	tcc:     Formata documento para TCC
%%	qualitcc:    Formata documento para qualificação de TCC
%% -----------------------------------------------------------------------
\DeclareOption{tcc/eq}{
\def\@tipotrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@worktype{Undergraduate Dissertation}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@curso{Engenharia Qu\'{i}mica}
\def\@course{Chemical Engineering}
}

\DeclareOption{qualitcc/eq}{
\def\@tipotrabalho{Qualifica\c{c}\~{a}o de Trabalho de Conclus\~{a}o de Curso}
\def\@worktype{Undergraduate Dissertation Qualification}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@curso{Engenharia Qu\'{i}mica}
\def\@course{Chemical Engineering}
}

\DeclareOption{tcc/em}{
\def\@tipotrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@worktype{Undergraduate Dissertation}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@curso{Engenharia de Minas}
\def\@course{Mining Engineering}
}

\DeclareOption{qualitcc/em}{
\def\@tipotrabalho{Qualifica\c{c}\~{a}o de Trabalho de Conclus\~{a}o de Curso}
\def\@worktype{Undergraduate Dissertation Qualification}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@curso{Engenharia de Minas}
\def\@course{Mining Engineering}
}

\DeclareOption{tcc/ec}{
\def\@tipotrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@worktype{Undergraduate Dissertation}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@curso{Engenharia de Computa\c{c}\~{a}o}
\def\@course{Computing Engineering}
}

\DeclareOption{qualitcc/ec}{
\def\@tipotrabalho{Qualifica\c{c}\~{a}o de Trabalho de Conclus\~{a}o de Curso}
\def\@worktype{Undergraduate Dissertation Qualification}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@curso{Engenharia de Computa\c{c}\~{a}o}
\def\@course{Computing Engineering}
}

\DeclareOption{tcc/et}{
\def\@tipotrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@worktype{Undergraduate Dissertation}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@curso{Engenharia de Transportes}
\def\@course{Transport Engineering}
}

\DeclareOption{qualitcc/et}{
\def\@tipotrabalho{Qualifica\c{c}\~{a}o de Trabalho de Conclus\~{a}o de Curso}
\def\@worktype{Undergraduate Dissertation Qualification}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@curso{Engenharia de Transportes}
\def\@course{Transport Engineering}
}

\DeclareOption{tcc/eca}{
\def\@tipotrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@worktype{Undergraduate Dissertation}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@curso{Engenharia de Controle e Automa\c{c}\~{a}o}
\def\@course{Control and Automation Engineering}
}

\DeclareOption{qualitcc/eca}{
\def\@tipotrabalho{Qualifica\c{c}\~{a}o de Trabalho de Conclus\~{a}o de Curso}
\def\@worktype{Undergraduate Dissertation Qualification}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@curso{Engenharia de Controle e Automa\c{c}\~{a}o}
\def\@course{Control and Automation Engineering}
}

\DeclareOption{qualitcc/eca}{
\def\@tipotrabalho{Qualifica\c{c}\~{a}o de Trabalho de Conclus\~{a}o de Curso}
\def\@worktype{Undergraduate Dissertation Qualification}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Trabalho de Conclus\~{a}o de Curso}
\def\@curso{Engenharia de Controle e Automa\c{c}\~{a}o}
\def\@course{Control and Automation Engineering}
}

%add para relatório
\DeclareOption{relatoriodisciplinaSD/eca}{
\def\@tipotrabalho{Relat\'orio}
\def\@worktype{Course Report}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Relat\'orio Acad\^emico}
\def\@curso{Engenharia de Controle e Automa\c{c}\~{a}o}
\def\@course{Control and Automation Engineering}
\def\@disciplina{Sistemas Digitais}
\def\@subject{Digital Systems}
}

%add para relatório
\DeclareOption{relatoriodisciplinaEletrotecnica/eca}{
\def\@tipotrabalho{Relat\'orio}
\def\@worktype{Course Report}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Relat\'orio Acad\^emico}
\def\@curso{Engenharia de Controle e Automa\c{c}\~{a}o}
\def\@course{Control and Automation Engineering}
\def\@disciplina{Eletrot\'ecnica}
\def\@subject{Digital Systems}
}

%add para relatório
\DeclareOption{relatoriodisciplinaPAA/eca}{
\def\@tipotrabalho{Relat\'orio}
\def\@worktype{Course Report}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Relat\'orio Acad\^emico}
\def\@curso{Engenharia de Controle e Automa\c{c}\~{a}o}
\def\@course{Control and Automation Engineering}
\def\@disciplina{Programa\c{c}\~{a}o para Automa\c{c}\~{a}o}
}

%add para relatório
\DeclareOption{relatoriodisciplinaCE/ec}{
\def\@tipotrabalho{Relat\'orio}
\def\@worktype{Course Report}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Trabalho Acad\^emico}
\def\@curso{Engenharia de Computa\c{c}\~{a}o}
\def\@course{Computing Engineering}
\def\@disciplina{Circuitos El\'etricos}
\def\@subject{Electrical Circuits}
}


%add para relatório
\DeclareOption{relatoriodisciplinaIA/ec}{
\def\@tipotrabalho{Relat\'orio}
\def\@worktype{Course Report}
\def\@nivelPos{Bacharel}
\def\@niveltrabalho{Trabalho Acad\^emico}
\def\@curso{Engenharia de Computa\c{c}\~{a}o}
\def\@course{Computing Engineering}
\def\@disciplina{Intelig\^encia Artificial}
\def\@subject{Artificial Intelligence}
}

\ProcessOptions\relax

%%=========================================================================
%% Herança da classe `abntex2' e inclusão de pacotes e arquivos necessários
%%========================================================================
\LoadClass[a4paper,12pt,oneside,openany]{abntex2}

%%=========================================================================
%% Herança da classe `abntex2' e inclusão de pacotes e arquivos necessários
%%=========================================================================
\RequirePackage{ae}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[alf,abnt-emphasize=bf,abnt-repeated-author-omit=yes,abnt-year-extra-label=yes]{abntex2cite}	%% Citações padrão ABNT
\RequirePackage{color}	%% Controle das cores
\RequirePackage{pifont}
\RequirePackage{lastpage}
\RequirePackage{pdfpages}
\RequirePackage{calc,graphicx}
\RequirePackage{etoolbox}
\RequirePackage{algorithm,algorithmic}
\RequirePackage{nomencl}
\RequirePackage{tikz}

\counterwithout{equation}{chapter}
\setsecnumdepth{subsubsection}
\settocdepth{subsection}

\newsubfloat{figure}

%% ---
%% Configurações de aparência do PDF final

%% alterando o aspecto da cor azul
\definecolor{blue}{RGB}{41,5,195}

%% informações do PDF
\hypersetup{
  %%backref=true,
  %%pagebackref=true,
  %%bookmarks=true,         		%% show bookmarks bar?
  %%pdftitle={\imprimirtitulo}, 
  %%pdfauthor={\imprimirautor},
  %%pdfsubject={\imprimirpreambulo},
  %%pdfkeywords={PALAVRAS}{CHAVES}{abnt}{abntex}{abntex2},
  %%pdfproducer={LaTeX with abnTeX2}, 	%% producer of the document
  %%pdfcreator={\imprimirautor},
  colorlinks=true,       		%% false: boxed links; true: colored links
  linkcolor=black,          	%% color of internal links
  citecolor=black,        		%% color of links to bibliography
  filecolor=magenta,      		%% color of file links
  urlcolor=black,
  %%bookmarksdepth=4,
}
%% ---
\newcommand{\rev}[1]{\textcolor{red}{[#1]}}
\renewcommand{\labelitemi}{\ding{111}}

%% Comandos de dados - título do documento em português e inglês
\providecommand{\imprimirtitulo}{}
\newcommand{\@engtitle}{}
\renewcommand{\titulo}[2]{\title{#1}\renewcommand{\imprimirtitulo}{#1} \renewcommand{\@engtitle}{#2}}

%% Comandos de dados - autor e autorbib
\newcommand{\@authorbib}{}
\providecommand{\imprimirautor}{}
\renewcommand{\autor}[2]{\author{#1}\renewcommand{\imprimirautor}{#1} \renewcommand{\@authorbib}{#2}}

%% --------------------------------
%% Definição Geral

\newcommand{\arquivofichacatalografica}{}
\newcommand{\inserirfichacatalografica}[1]{\renewcommand{\arquivofichacatalografica}{#1}}

\newcommand{\arquivofolhaaprovacao}{}
\newcommand{\inserirfolhaaprovacao}[1]{\renewcommand{\arquivofolhaaprovacao}{#1}}

\renewcommand{\maketitle}{%
  %% Capa
  \imprimircapa

  %% Ficha catalográfica
  \ifthenelse{\not\equal{\arquivofichacatalografica}{}}
  {
    \imprimirfolhaderosto*{}
    \begin{fichacatalografica}
      \includepdf[pages={1}]{\arquivofichacatalografica}
    \end{fichacatalografica}
  }
  {
    \imprimirfolhaderosto{}
  }

  %% Folha de aprovação
  \ifthenelse{\not\equal{\arquivofolhaaprovacao}{}}
  {
    \begin{folhadeaprovacao}
      \includepdf[pages={1}]{\arquivofolhaaprovacao}
    \end{folhadeaprovacao}
  }
  {
  }
}

%%========================================================================
%% Definição da capa, folha de rosto e folha de aprovação.
%%========================================================================
%% --- Definições de comprimento
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{120mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{120mm}

\instituicao
{%
  \centering
  \definecolor{c0a2470}{RGB}{10,36,112}
  \definecolor{cffffff}{RGB}{255,255,255}
  \begin{tikzpicture}[y=0.80pt, x=0.80pt, yscale=-1.200000, xscale=1.200000, inner sep=0pt, outer sep=0pt]
    \begin{scope}[shift={(-26.48882,-50.72659)}]
      \path[cm={{0.26458,0.0,0.0,0.26458,(26.48882,50.72659)}},fill=c0a2470,line
        width=0.274pt] (348.2969,495.5996) -- (348.2969,500.9082) --
      (351.1289,500.9082) -- (355.5996,511.3633) --
      (355.7578,512.4141)arc(274.466:283.200:101.225) -- (371.4492,513.8652) --
      (378.9414,505.3008) -- (385.6992,507.4883) -- (386.7109,518.8086) --
      (386.5605,519.7070)arc(292.723:301.488:101.225) -- (401.0078,526.0723) --
      (410.7891,520.2344) -- (416.5352,524.3984) -- (413.9902,535.4766) --
      (413.6074,536.2109)arc(310.778:319.559:101.225) -- (425.3359,546.7891) --
      (436.4473,544.2500) -- (440.6230,549.9805) -- (434.7676,559.7324) --
      (434.1738,560.3164)arc(328.506:337.292:101.225) -- (442.0527,573.9863) --
      (453.4062,574.9961) -- (455.6016,581.7324) -- (447.0117,589.2031) --
      (446.2852,589.5644)arc(346.231:355.036:101.225) -- (449.5215,605.0039) --
      (460.0078,609.4629) -- (460.0078,616.5469) -- (449.5215,621.0039) --
      (448.8203,621.1094)arc(4.546:13.372:101.225) -- (447.0117,636.8047) --
      (455.6016,644.2754) -- (453.4062,651.0117) -- (442.0527,652.0215) --
      (441.4941,651.9277)arc(22.812:31.680:101.225) -- (434.7676,666.2754) --
      (440.6230,676.0273) -- (436.4473,681.7578) -- (425.3359,679.2188) --
      (424.9082,678.9981)arc(40.825:49.729:101.225) -- (413.9902,690.5332) --
      (416.5352,701.6094) -- (410.7891,705.7734) -- (401.0078,699.9356) --
      (400.6621,699.5859)arc(58.601:67.519:101.225) -- (386.7109,707.1992) --
      (385.6992,718.5195) -- (378.9414,720.7090) -- (371.4492,712.1426) --
      (371.2031,711.6523)arc(76.377:85.290:101.225) -- (355.5996,714.6465) --
      (351.1289,725.0996) -- (348.2969,725.0996) -- (348.2969,730.4102) --
      (861.9082,730.4102) -- (861.9082,495.5996) -- (348.2969,495.5996) -- cycle;
      \begin{scope}[shift={(241.06554,-9.16804)},fill=cffffff,line width=0.066pt]
        \path[fill=cffffff,line width=0.066pt] (-83.8131,214.8977) --
        (-83.8131,212.6438) -- (-80.2452,212.6438) -- (-80.2452,212.0647) --
        (-84.4723,212.0647) -- (-84.4723,218.4522) -- (-83.8131,218.4522) --
        (-83.8131,215.4767) -- (-80.4590,215.4767) -- (-80.4590,214.8977) -- cycle;
        \path[fill=cffffff,line width=0.066pt] (-76.4144,216.4967) --
        (-73.5191,216.4967) -- (-72.7085,218.4522) -- (-72.0047,218.4522) --
        (-74.6951,212.0647) -- (-75.2385,212.0647) -- (-77.9289,218.4522) --
        (-77.2251,218.4522) -- cycle(-74.9668,213.0046) -- (-73.7641,215.9088) --
        (-76.1739,215.9088) -- cycle;
        \path[fill=cffffff,line width=0.066pt] (-69.0870,215.2585) .. controls
        (-69.0870,213.7752) and (-68.2808,212.5547) .. (-66.6149,212.5547) .. controls
        (-65.7908,212.5547) and (-65.2251,212.8220) .. (-64.8465,213.0714) --
        (-64.4946,212.5903) .. controls (-64.9623,212.2340) and (-65.6305,211.9757) ..
        (-66.6149,211.9757) .. controls (-68.6639,211.9757) and (-69.7641,213.4634) ..
        (-69.7641,215.2585) .. controls (-69.7641,217.0535) and (-68.6639,218.5413) ..
        (-66.6149,218.5413) .. controls (-65.6305,218.5413) and (-64.9623,218.2829) ..
        (-64.4946,217.9266) -- (-64.8465,217.4455) .. controls (-65.2251,217.6950) and
        (-65.7908,217.9622) .. (-66.6149,217.9622) .. controls (-68.2808,217.9622) and
        (-69.0870,216.7417) .. (-69.0870,215.2585) -- cycle;
        \path[fill=cffffff,line width=0.066pt] (-58.9400,217.9622) .. controls
        (-60.2540,217.9622) and (-60.8420,217.2050) .. (-60.8420,215.7217) --
        (-60.8420,212.0647) -- (-61.5012,212.0647) -- (-61.5012,215.7217) .. controls
        (-61.5012,217.5435) and (-60.6282,218.5413) .. (-58.9400,218.5413) .. controls
        (-57.2608,218.5413) and (-56.3833,217.5435) .. (-56.3833,215.7217) --
        (-56.3833,212.0647) -- (-57.0425,212.0647) -- (-57.0425,215.7217) .. controls
        (-57.0425,217.2050) and (-57.6349,217.9622) .. (-58.9400,217.9622) -- cycle;
        \path[fill=cffffff,line width=0.066pt] (-52.4723,212.0647) --
        (-53.1315,212.0647) -- (-53.1315,218.4522) -- (-49.1717,218.4522) --
        (-49.1717,217.8731) -- (-52.4723,217.8731) -- cycle;
        \path[fill=cffffff,line width=0.066pt] (-40.9400,215.2585) .. controls
        (-40.9400,213.4188) and (-41.8710,212.0647) .. (-44.0580,212.0647) --
        (-46.0981,212.0647) -- (-46.0981,218.4522) -- (-44.0580,218.4522) .. controls
        (-41.8710,218.4522) and (-40.9400,217.0981) .. (-40.9400,215.2585) --
        cycle(-45.4389,212.6438) -- (-44.0580,212.6438) .. controls
        (-42.2540,212.6438) and (-41.6171,213.7975) .. (-41.6171,215.2585) .. controls
        (-41.6171,216.7195) and (-42.2540,217.8731) .. (-44.0580,217.8731) --
        (-45.4389,217.8731) -- cycle;
        \path[fill=cffffff,line width=0.066pt] (-37.1850,216.4967) --
        (-34.2897,216.4967) -- (-33.4790,218.4522) -- (-32.7752,218.4522) --
        (-35.4656,212.0647) -- (-36.0090,212.0647) -- (-38.6994,218.4522) --
        (-37.9956,218.4522) -- cycle(-35.7373,213.0046) -- (-34.5346,215.9088) --
        (-36.9444,215.9088) -- cycle;
        \path[fill=cffffff,line width=0.066pt] (-24.7529,215.2585) .. controls
        (-24.7529,213.4188) and (-25.6839,212.0647) .. (-27.8709,212.0647) --
        (-29.9110,212.0647) -- (-29.9110,218.4522) -- (-27.8709,218.4522) .. controls
        (-25.6839,218.4522) and (-24.7529,217.0981) .. (-24.7529,215.2585) --
        cycle(-29.2518,212.6438) -- (-27.8709,212.6438) .. controls
        (-26.0669,212.6438) and (-25.4300,213.7975) .. (-25.4300,215.2585) .. controls
        (-25.4300,216.7195) and (-26.0669,217.8731) .. (-27.8709,217.8731) --
        (-29.2518,217.8731) -- cycle;
        \path[fill=cffffff,line width=0.066pt] (-21.0068,214.8977) --
        (-21.0068,212.6438) -- (-17.4389,212.6438) -- (-17.4389,212.0647) --
        (-21.6660,212.0647) -- (-21.6660,218.4522) -- (-17.3943,218.4522) --
        (-17.3943,217.8731) -- (-21.0068,217.8731) -- (-21.0068,215.4767) --
        (-17.6527,215.4767) -- (-17.6527,214.8977) -- cycle;
        \path[fill=cffffff,line width=0.066pt] (-4.5078,215.2585) .. controls
        (-4.5078,213.4188) and (-5.4388,212.0647) .. (-7.6258,212.0647) --
        (-9.6659,212.0647) -- (-9.6659,218.4522) -- (-7.6258,218.4522) .. controls
        (-5.4388,218.4522) and (-4.5078,217.0981) .. (-4.5078,215.2585) --
        cycle(-9.0067,212.6438) -- (-7.6258,212.6438) .. controls (-5.8219,212.6438)
        and (-5.1849,213.7975) .. (-5.1849,215.2585) .. controls (-5.1849,216.7195)
        and (-5.8219,217.8731) .. (-7.6258,217.8731) -- (-9.0067,217.8731) -- cycle;
        \path[fill=cffffff,line width=0.066pt] (-0.7617,214.8977) -- (-0.7617,212.6438)
        -- (2.8062,212.6438) -- (2.8062,212.0647) -- (-1.4209,212.0647) --
        (-1.4209,218.4522) -- (2.8508,218.4522) -- (2.8508,217.8731) --
        (-0.7617,217.8731) -- (-0.7617,215.4767) -- (2.5924,215.4767) --
        (2.5924,214.8977) -- cycle;
      \end{scope}
      \begin{scope}[shift={(241.06554,-9.16804)},fill=black,line width=0.056pt]
        \path[fill=cffffff,line width=0.056pt] (-82.5199,226.1991) --
        (-82.5199,224.4383) -- (-77.7219,224.4383) -- (-77.7219,222.5466) --
        (-84.6996,222.5466) -- (-84.6996,231.9331) -- (-77.6564,231.9331) --
        (-77.6564,230.0414) -- (-82.5199,230.0414) -- (-82.5199,228.0908) --
        (-78.0034,228.0908) -- (-78.0034,226.1991) -- cycle;
        \path[fill=cffffff,line width=0.056pt] (-76.4782,231.9331) --
        (-74.2985,231.9331) -- (-74.2985,225.6755) -- (-70.6460,231.9331) --
        (-67.8837,231.9331) -- (-67.8837,222.5466) -- (-70.0634,222.5466) --
        (-70.0634,228.8043) -- (-73.7159,222.5466) -- (-76.4782,222.5466) -- cycle;
        \path[fill=cffffff,line width=0.056pt] (-61.7635,230.3033) .. controls
        (-63.7272,230.3033) and (-64.5978,228.9679) .. (-64.5978,227.2399) .. controls
        (-64.5978,225.5118) and (-63.7272,224.1765) .. (-61.7635,224.1765) .. controls
        (-60.8406,224.1765) and (-59.8784,224.3532) .. (-59.0078,224.9358) --
        (-57.8950,223.4827) .. controls (-59.1518,222.4877) and (-60.5329,222.2848) ..
        (-61.7635,222.2848) .. controls (-65.2982,222.2848) and (-66.8430,224.6151) ..
        (-66.8430,227.2399) .. controls (-66.8430,229.8647) and (-65.2982,232.1950) ..
        (-61.7635,232.1950) .. controls (-60.2777,232.1950) and (-58.9292,231.9004) ..
        (-57.9539,231.0822) -- (-57.9539,226.3955) -- (-61.7897,226.3955) --
        (-61.7897,228.2217) -- (-59.9765,228.2217) -- (-59.9765,229.9433) .. controls
        (-60.4020,230.1593) and (-60.9257,230.3033) .. (-61.7635,230.3033) -- cycle;
        \path[fill=cffffff,line width=0.056pt] (-54.5305,226.1991) --
        (-54.5305,224.4383) -- (-49.7326,224.4383) -- (-49.7326,222.5466) --
        (-56.7103,222.5466) -- (-56.7103,231.9331) -- (-49.6671,231.9331) --
        (-49.6671,230.0414) -- (-54.5305,230.0414) -- (-54.5305,228.0908) --
        (-50.0140,228.0908) -- (-50.0140,226.1991) -- cycle;
        \path[fill=cffffff,line width=0.056pt] (-48.4889,231.9331) --
        (-46.3092,231.9331) -- (-46.3092,225.6755) -- (-42.6567,231.9331) --
        (-39.8944,231.9331) -- (-39.8944,222.5466) -- (-42.0741,222.5466) --
        (-42.0741,228.8043) -- (-45.7266,222.5466) -- (-48.4889,222.5466) -- cycle;
        \path[fill=cffffff,line width=0.056pt] (-32.3210,226.1991) --
        (-36.4121,226.1991) -- (-36.4121,222.5466) -- (-38.5918,222.5466) --
        (-38.5918,231.9331) -- (-36.4121,231.9331) -- (-36.4121,228.0908) --
        (-32.3210,228.0908) -- (-32.3210,231.9331) -- (-30.1413,231.9331) --
        (-30.1413,222.5466) -- (-32.3210,222.5466) -- cycle;
        \path[fill=cffffff,line width=0.056pt] (-26.3448,230.0938) --
        (-22.5614,230.0938) -- (-21.8414,231.9331) -- (-19.4915,231.9331) --
        (-23.3731,222.5466) -- (-25.5332,222.5466) -- (-29.4148,231.9331) --
        (-27.0649,231.9331) -- cycle(-24.4531,225.2958) -- (-23.2815,228.2675) --
        (-25.6248,228.2675) -- cycle;
        \path[fill=cffffff,line width=0.056pt] (-16.5918,231.9331) --
        (-16.5918,228.6996) -- (-14.9292,228.6996) -- (-13.1226,231.9331) --
        (-10.7857,231.9331) -- (-12.7495,228.4181) .. controls (-11.7741,227.9992) and
        (-10.8774,227.1941) .. (-10.8774,225.7213) .. controls (-10.8774,223.9998) and
        (-12.0229,222.5466) .. (-14.5692,222.5466) -- (-18.7715,222.5466) --
        (-18.7715,231.9331) -- cycle(-14.5692,224.4383) .. controls
        (-13.4367,224.4383) and (-13.0833,225.0405) .. (-13.0833,225.7213) .. controls
        (-13.0833,226.4020) and (-13.4367,227.0042) .. (-14.5692,227.0042) --
        (-16.5918,227.0042) -- (-16.5918,224.4383) -- cycle;
        \path[fill=cffffff,line width=0.056pt] (-9.7384,231.9331) -- (-7.5587,231.9331)
        -- (-7.5587,222.5466) -- (-9.7384,222.5466) -- cycle;
        \path[fill=cffffff,line width=0.056pt] (-3.7753,230.0938) -- (0.0081,230.0938)
        -- (0.7281,231.9331) -- (3.0780,231.9331) -- (-0.8036,222.5466) --
        (-2.9637,222.5466) -- (-6.8452,231.9331) -- (-4.4953,231.9331) --
        cycle(-1.8836,225.2958) -- (-0.7119,228.2675) -- (-3.0553,228.2675) -- cycle;
      \end{scope}
      \path[fill=c0a2470,even odd rule,line width=0.036pt] (118.6426,218.7554) ..
      controls (121.8758,218.7554) and (124.4979,216.1334) .. (124.4979,212.9001) ..
      controls (124.4979,209.6669) and (121.8758,207.0448) .. (118.6426,207.0448) ..
      controls (115.4094,207.0448) and (112.7873,209.6669) .. (112.7873,212.9001) ..
      controls (112.7873,216.1334) and (115.4094,218.7554) .. (118.6426,218.7554) --
      cycle(118.6426,215.5838) .. controls (120.1245,215.5838) and
      (121.3263,214.3820) .. (121.3263,212.9001) .. controls (121.3263,211.4182) and
      (120.1245,210.2164) .. (118.6426,210.2164) .. controls (117.1607,210.2164) and
      (115.9589,211.4182) .. (115.9589,212.9001) .. controls (115.9589,214.3820) and
      (117.1607,215.5838) .. (118.6426,215.5838) -- cycle;
      \path[fill=c0a2470,even odd rule,line width=0.036pt] (118.6426,203.1412) ..
      controls (124.0314,203.1412) and (128.4014,207.5113) .. (128.4014,212.9001) ..
      controls (128.4014,218.2889) and (124.0314,222.6590) .. (118.6426,222.6590) ..
      controls (113.2538,222.6590) and (108.8838,218.2889) .. (108.8838,212.9001) ..
      controls (108.8838,207.5113) and (113.2538,203.1412) .. (118.6426,203.1412) --
      cycle(108.8838,203.1413) -- (128.4014,203.1413) -- (128.4014,222.6589) --
      (108.8838,222.6589) -- cycle;
      \path[fill=c0a2470,even odd rule,line width=0.036pt] (118.6426,230.4660) ..
      controls (122.8243,230.4660) and (126.6644,229.0031) .. (129.6811,226.5625) --
      (107.6040,226.5625) .. controls (110.6208,229.0031) and (114.4609,230.4660) ..
      (118.6426,230.4660) -- cycle(132.3050,223.9387) .. controls
      (134.7458,220.9221) and (136.2085,217.0818) .. (136.2085,212.9001) .. controls
      (136.2085,208.7184) and (134.7456,204.8783) .. (132.3050,201.8616) --
      cycle(129.6811,199.2377) .. controls (126.6646,196.7969) and
      (122.8243,195.3342) .. (118.6426,195.3342) .. controls (114.4609,195.3342) and
      (110.6208,196.7971) .. (107.6040,199.2377) -- cycle(104.9802,201.8616) ..
      controls (102.5394,204.8781) and (101.0767,208.7184) .. (101.0767,212.9001) ..
      controls (101.0767,217.0818) and (102.5394,220.9222) .. (104.9802,223.9387) --
      cycle;
      \path[fill=c0a2470,even odd rule,line width=0.036pt] (118.6426,191.4307) ..
      controls (130.4978,191.4307) and (140.1120,201.0449) .. (140.1120,212.9001) ..
      controls (140.1120,224.7553) and (130.4978,234.3695) .. (118.6426,234.3695) ..
      controls (106.7874,234.3695) and (97.1732,224.7553) .. (97.1732,212.9001) ..
      controls (97.1732,201.0449) and (106.7874,191.4307) .. (118.6426,191.4307) --
      cycle(118.6426,187.5272) .. controls (132.6533,187.5272) and
      (144.0155,198.8894) .. (144.0155,212.9001) .. controls (144.0155,226.9108) and
      (132.6533,238.2731) .. (118.6426,238.2731) .. controls (104.6319,238.2731) and
      (93.2697,226.9108) .. (93.2697,212.9001) .. controls (93.2697,198.8894) and
      (104.6319,187.5272) .. (118.6426,187.5272) -- cycle;
    \end{scope}
  \end{tikzpicture}
  \par
  Universidade Federal de Mato Grosso -- UFMT
  \par
  Campus Universitário de Várzea Grande
  \par
  Faculdade de Engenharia
  \par
  \@curso
  \par
}

\preambulo{
  % \@tipotrabalho~apresentado à Faculdade de Engenharia como parte dos requisitos para a obtenção do título de \@nivelPos~em \@curso.
  \@tipotrabalho~elaborado como parte das atividades da disciplina \@disciplina, do curso de \@nivelPos~em \@curso, oferecida pela Faculdade de Engenharia.
}

%% ---
%% Impressão da Capa
\renewcommand{\imprimircapa}{%
  \thispagestyle{empty}
  \noindent
  \begin{capa}%
    \center
    \parbox[b]{\textwidth}
    {
      \centering
      \vbox to \titlepagewinvoffset
      {
        \scshape\imprimirinstituicao
        \vfill
        \@formataautorcapa
        \@formatatitulocapa
      }
    }

    \vfill
    \centerline{\imprimirlocal}
    \centerline{\imprimirdata}

  \end{capa}
}


\def\@formataautorcapa{%

  \parbox[b]{\titlepagewinwidth}
  {%
    \centering\vbox to \titlepagewinheight
    {%
      \vspace*{\fill}
      {\Large\textbf{\imprimirautor}}
      \vspace*{\fill}
    }
  }

}

\def\@formatatitulocapa{%

  \parbox[b]{\titlepagewinwidth}
  {%
    \centering\vbox to \titlepagewinheight
    {%
      \vspace*{\fill}
      {\Large{\textbf{\imprimirtitulo}}\par}
      \vspace*{\fill}
    }
  }

}
%% ---

%% ---
%% Conteudo padrao da Folha de Rosto

%% Comandos de dados - Área de concentração
%%\providecommand{\imprimirareaconcentracao}{}
%%\newcommand{\areaconcentracao}[1]{\title{#1}\renewcommand{\imprimirareaconcentracao}{Área de concentração: #1}}

\makeatletter

\renewcommand{\folhaderostocontent}{


  \newlength{\tampar}
  \setlength{\tampar}{0.5\textwidth}
  %%\newlength{\tamconcetracao}
  %%\settowidth{\tamconcetracao}{\imprimirareaconcentracao}
  \newlength{\tamorientador}
  \settowidth{\tamorientador}{\imprimirorientadorRotulo~\imprimirorientador}
  \newlength{\tamcoorientador}
  \settowidth{\tamcoorientador}{\imprimircoorientadorRotulo~\imprimircoorientador}

  %%\ifthenelse{\lengthtest{\tamconcetracao > \tampar}}{\setlength{\tampar}{\the\tamconcetracao}}{}
  \ifthenelse{\lengthtest{\tamorientador>\tampar}}{\setlength{\tampar}{\the\tamorientador}}{}
  \ifthenelse{\lengthtest{\tamcoorientador>\tampar}}{\setlength{\tampar}{\the\tamcoorientador}}{}


  \begin{center}


    \@formataautorcapa

    \@formatatitulocapa

    \abntex@ifnotempty{\imprimirpreambulo}
    {%
      \hspace*{\fill}
      \makebox[\tampar][l]
      {%
        \parbox[b]{\tampar}
        {
          \imprimirpreambulo
          \par

          {\imprimirorientadorRotulo~\imprimirorientador\par}
          \abntex@ifnotempty{\imprimircoorientador}{%
            {\imprimircoorientadorRotulo~\imprimircoorientador}%
          }%
        }
      }
      \vfill
    }%

    \centerline{\imprimirlocal}
    \centerline{\imprimirdata}
    %% Folha de aprovação
    \ifthenelse{\not\equal{\arquivofolhaaprovacao}{}}
    {
      \scriptsize\textbf{Trata-se da versão corrigida do \@niveltrabalho. A versão original se encontra disponível na UFMT/CUVG que aloja a Faculdade de Engenharia.}
    }
    {
    }
  \end{center}
}
%% ---


%% ---
%% Dedicatória
%% ---
\newcommand{\imprimirdedicatoria}[1]{
  \begin{dedicatoria}
    \vspace*{\fill}
    \centering
    \noindent
    \textit{#1}
    \vspace*{\fill}
  \end{dedicatoria}
}
%% ---

%% ---
%% Agradecimentos
%% ---
\newcommand{\imprimiragradecimentos}[1]{
  \begin{agradecimentos}
    #1
  \end{agradecimentos}
}
%% ---

%% ---
%% Epígrafe
%% ---
\newcommand{\imprimirepigrafe}[1]{
  \begin{epigrafe}
    \vspace*{\fill}
    \begin{flushright}
      \textit{#1}
    \end{flushright}
  \end{epigrafe}
}
%% ---


%%========================================================================
%% Listas e Sumário
%%========================================================================

%% ---
%% Lista de ilustrações
%% ---
\newcommand{\listailustracoes}{
  \pdfbookmark[0]{\listfigurename}{lof}
  \listoffigures*
  \cleardoublepage
}
%% ---

%% ---
%% Lista de tabelas
%% ---
\newcommand{\listatabelas}{
  \pdfbookmark[0]{\listtablename}{lot}
  \listoftables*
  \cleardoublepage
}
%% ---

%% ---
%% Lista de abreviaturas
%% ---
\newcommand{\listasiglas}[1]{
  \thispagestyle{empty}
  \pagestyle{empty}
  \pdfbookmark[0]{Lista de siglas}{Lista de siglas}
  \chapter*{Lista de siglas}
  \input{#1}
  \cleardoublepage
}

\floatname{algorithm}{Algoritmo}
\renewcommand{\listalgorithmname}{Lista de algoritmos}
\newcommand{\cftalgorithmname}{\algorithmname\space}
\newcommand{\listaalgoritmos}{
  \pdfbookmark[0]{\listalgorithmname}{loa}
  \thispagestyle{empty}
  \pagestyle{empty}
  \listofalgorithms
  \cleardoublepage
}

\renewcommand{\nompreamble}{\thispagestyle{empty}}
\renewcommand\nomname{Lista de símbolos}
\newcommand{\listasimbolos}{
  \thispagestyle{empty}
  \pagestyle{empty}
  \makenomenclature
  \pdfbookmark[0]{\nomname}{los}
  \printnomenclature
  \cleardoublepage
}
%% ---

%% ---
%% Sumário
%% ---
\newcommand{\sumario}{%
  \chapter*{\contentsname}
  \pdfbookmark[0]{\contentsname}{toc}
  \thispagestyle{empty}
  \pagestyle{empty}
  \@starttoc{toc}
  \cleardoublepage}
%% ---

%%========================================================================
%% Resumo e Abstract
%%========================================================================

%% ---
%% Resumo
%% ---
\renewenvironment{resumo}[1]
{%
  \gdef\@abstractkw{#1}
  \chapter*{Resumo}\par%
  \pdfbookmark[0]{Resumo}{Resumo}
  \@authorbib.~\textbf{\imprimirtitulo}. \pageref{LastPage}~p.~\@tipotrabalho~--~\@curso, Faculdade de Engenharia, Universidade Federal de Mato Grosso, Brasil, \imprimirdata.\par\vspace{6ex}
}%	
{
  \par\vspace{2ex}
  \vspace{0.5cm}
  \noindent\textbf{Palavras-chave:} \@abstractkw.
  \thispagestyle{empty}
  \cleardoublepage
}

%% ---

%% ---
%% Abstract
%% ---
\renewenvironment{abstract}[1]
{%
  \gdef\@abstractkw{#1}
  \chapter*{Abstract}\par%
  \pdfbookmark[0]{Abstract}{Abstract}
  \@authorbib.~\textbf{\@engtitle}. \pageref{LastPage}~p.~\@worktype~--~\@course, Engineering Faculty, Federal University of Mato Grosso, Brazil, \imprimirdata.\par\vspace{6ex}
}%	
{
  \par\vspace{2ex}
  \vspace{0.5cm}
  \noindent\textbf{Keywords:} \@abstractkw.
  \thispagestyle{empty}
  \cleardoublepage
}
%% ---

%%=======================================================================
%% Ajuste do cabeçalho e rodapé
%%=======================================================================

\makepagestyle{faengchaplast}
\makeevenhead{faengchaplast}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}
\makeoddhead{faengchaplast}{\ABNTEXfontereduzida\textit\rightmark}{}{\ABNTEXfontereduzida\thepage}
\makeheadrule{faengchaplast}{\textwidth}{\normalrulethickness}


\makepagestyle{faengpartlast}
\makeoddhead{faengpartlast}{}{}{\ABNTEXfontereduzida\thepage}
\makeevenhead{faengpartlast}{\ABNTEXfontereduzida\thepage}{}{}


\renewcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty} %% customizing chapter pagestyle
  \pagestyle{empty}
  \aliaspagestyle{cleared}{empty}
  \aliaspagestyle{part}{empty}
}
\renewcommand{\frontmatter}{\pretextual}


\renewcommand{\textual}{%
  \pagestyle{abntheadings}
  \aliaspagestyle{chapter}{abntchapfirst} %% customizing chapter pagestyle
  \aliaspagestyle{cleared}{faengchaplast}
  \aliaspagestyle{part}{faengchaplast}
  \nouppercaseheads
} %% Configura layout para elementos pós-textuais

\renewcommand{\postextual}{
  \pagestyle{abntheadings}
  \aliaspagestyle{chapter}{abntchapfirst}
  \aliaspagestyle{cleared}{faengchaplast}
  \aliaspagestyle{part}{faengpartlast}
  \aliaspagestyle{afterpart}{faengpartlast}

}
\renewcommand{\backmatter}{\postextual}

%% ---

%%=========================================================================
%% Nomes Constantes
%%=========================================================================
%%\renewcommand{\chaptername}{Capítulo}
%%\renewcommand{\partname}{Parte}

%%=========================================================================
%% Configurações
%%=========================================================================
%% --- 
\chapterstyle{madsen}

%% --- 
\renewcommand*{\figureautorefname}{Figura}
\renewcommand*\footnoteautorefname{Nota de Rodapé}%
\renewcommand*\itemautorefname{Item}%
\renewcommand*\tableautorefname{Tabela}%
\renewcommand*\partautorefname{Parte}%
\renewcommand*\appendixautorefname{Apêndice}%
\renewcommand*\chapterautorefname{Capítulo}%
\renewcommand*\sectionautorefname{Seção}%
\renewcommand*\subsectionautorefname{Subseção}%
\renewcommand*\subsubsectionautorefname{Subseção}%
\renewcommand*\paragraphautorefname{Parágrafo}%
\renewcommand*\subparagraphautorefname{Subparágrafo}%
\renewcommand*\FancyVerbLineautorefname{Linha}%
\renewcommand*\theoremautorefname{Teorema}%
\renewcommand*\pageautorefname{Página}%
%% --- 


%% ---
%% Fonte padrão section, subsection e subsubsection
\renewcommand{\ABNTEXchapterfont}{\huge\bfseries}

%% Tipo de trabalho para classe abntex2 (ficha catalográfica)
%% ---
\tipotrabalho{\@tipotrabalho}

%% --- 
%% Espaçamentos entre linhas e parágrafos 
%% --- 

%%% O tamanho do parágrafo é dado por:
%%\setlength{\parindent}{0.5cm}

%% Controle do espaçamento entre um parágrafo e outro:
%%\setlength{\parskip}{0.2cm}  % tente também \onelineskip

\renewcommand{\imprimirorientadorRotulo}{Docente}