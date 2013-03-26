%%% TEMPLATE.cls.tpl --- (>>>COMMENT<<<)

%% Author:  (>>>USER_NAME<<<)  (>>>AUTHOR<<<)
%% Version: (>>>FILE<<<),v 0.0 (>>>VC_DATE<<<)
%% Time-stamp: <Ofey 12/26/2011 21:31:57>

%%% Commentary:

%% (>>>1<<<)

%% Put this file into your TEXINPUTS.  A typical document looks like:
%%   \documentclass[OPTIONS]{(>>>FILE_SANS<<<)}
%%   \begin{document}
%%   (>>>2<<<)
%%   \end{document}

%% OPTIONS defaults to (>>>3<<<)

%%% Code:

\NeedsTeXFormat{LaTeX2e}(>>>POINT<<<)[1995/12/01]
\def\@rcs@ $#1Date: #2 #3$$#4Revision: #5$ {
   \ProvidesPackage{(>>>FILE_SANS<<<)}[#2 v#5(>>>COMMENT<<<)]}
\@rcs@ $Date: (>>>VC_DATE<<<) $$Revision: 0.0 $

\DeclareOption{(>>>4<<<)}{%%%
  }

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{(>>>5<<<)}
\ProcessOptions
\LoadClass[a4paper]{article}


%%%%##########################################################################
%%%%  Main code
%%%%##########################################################################

(>>>6<<<)


\endinput


%%% Local Variables: %%%
%%% mode:LaTeX       %%%
%%% coding:utf-8     %%%
%%% End:             %%%
