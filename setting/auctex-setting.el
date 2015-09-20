;;; auctex-setting.el --- 'auctex-setting'

;; Copyright 2011 Ofey
;;
;; Author:   Ofey  ofey.sunfei@gmail.com
;; Version:  auctex-setting.el,v 0.1 2011/11/13 12:19:56
;; Keywords: auctex setting
;; X-URL: not distributed yet
;; Time-stamp: <Ofey 05/25/2012 13:17:06>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;;

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'auctex-setting)

;;; Code:


(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)


;; minor modes
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; company-auctex settings
(require 'company-auctex)
(company-auctex-init)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cdlatex settings

;(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
;(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)

;; change the prefix key for math accents and font switching, you could do something like
;(setq cdlatex-math-modify-prefix [f7])
;(setq cdlatex-math-modify-prefix [f7])
;(setq cdlatex-math-symbol-prefix [f6])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LaTeX-mode-hook

(add-hook 'LaTeX-mode-hook #'LaTeX-install-toolbar)
(add-hook 'LaTeX-mode-hook #'rainbow-delimiters-mode)

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (LaTeX-math-mode)
            ;(turn-on-cdlatex)
            (turn-on-reftex)
            ;(auto-fill-mode)             ;i do not like auto line feed
            (outline-minor-mode)
            (flyspell-mode)
            (setq TeX-auto-save t)
            (setq TeX-PDF-mode t)         ;if turn it off, than default output dvi. use latex if use default engine
            (setq TeX-newline-function 'newline-and-indent) ;;newline and indent
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-engine 'xetex       ; use xelatex default. engine & other texing option can modify in tool box
                  TeX-show-compilation t  ; display compilation windows
                  )
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
            (setq TeX-parse-self t)
            ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; reftex-section
(setq reftex-plug-into-AUCTeX t)
(setq reftex-section-levels
     '(("part" . 0) ("chapter" . 1) ("section" . 2) ("subsection" . 3)
       ("frametitle" . 4) ("subsubsection" . 4) ("paragraph" . 5)
       ("subparagraph" . 6) ("addchap" . -1) ("addsec" . -2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set viewer. Pay attention to the system

(if macosx
    (setq TeX-view-program-list
          '(("Skim" "/Applications/Skim.app/Contents/MacOS/Skim %o")))
  )

(cond
 ((eq system-type 'darwin)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "Skim")
                                                 ))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setq-default TeX-master "master")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; customize command

 (setq my-tex-commands-extra (list
     (list "dvips" "dvips %s.dvi" 'TeX-run-command nil t)
     (list "ps2pdf" "ps2pdf %s.ps %s.pdf" 'TeX-run-command nil t)))
 (require 'tex)
 (setq TeX-command-list (append TeX-command-list my-tex-commands-extra))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'auctex-setting)


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; auctex-setting.el ends here



;; Local Variables: ;;
;; mode:Emacs-Lisp  ;;
;; coding:utf-8     ;;
;; comment-column:0 ;;
;; End:             ;;
