;;; org-mode-setting.el --- 'org-mode-setting'

;; Copyright 2011 Ofey
;;
;; Author:   Ofey  ofey.sunfei@gmail.com
;; Version:  org-mode-setting.el,v 0.0 2011/11/30 10:47:06
;; Keywords: 
;; X-URL: not distributed yet
;; Time-stamp: <Ofey 11/08/2011 20:37:59>

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
;;   (require 'org-mode-setting)

;;; Code:

(provide 'org-mode-setting)

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

(require 'org-install)
(require 'ob-ditaa)

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
         (ditaa . t)
         (R . t)
         (python . t)
         (ruby . t)
         (gnuplot . t)
         (clojure . t)
         (sh . t)
         (ledger . t)
         (org . t)
         (plantuml . t)
         (latex . t))))

(setq org-ditaa-jar-path "~/.emacs.d/other_tools/ditaa0_9.jar")

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)


; Do not prompt to confirm evaluation
; This may be dangerous - make sure you understand the consequences
; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

;; Don't enable this because it breaks access to emacs from my Android phone
(setq org-startup-with-inline-images nil)

;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; org-mode-setting.el ends here



;; Local Variables: ;;
;; mode:Emacs-Lisp  ;;
;; coding:utf-8     ;;
;; comment-column:0 ;;
;; End:             ;;