;;; gnuplot-setting.el --- gnuplot mode setting

;; Copyright 2011 Ofey
;;
;; Author:   Ofey  ofey.sunfei@gmail.com
;; Version:  gnuplot-setting.el,v 0.0 2011/12/07 03:39:46
;; Keywords: 
;; X-URL: not distributed yet
;; Time-stamp: <Ofey 12/09/2011 09:35:04>

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
;;   (require 'gnuplot-setting)

;;; Code:

(require 'gnuplot)

(if mswin
    (setq gnuplot-program "D:/Program Files/gnuplot/binary/gnuplot.exe"))

;; automatically open files ending with .gp or .gnuplot in gnuplot mode
(setq auto-mode-alist 
(append '(("\\.\\(gp\\|gnuplot\\)$" . gnuplot-mode)) auto-mode-alist))

(defvar gnuplot-symbol-list
  (append gp-math-functions
         gp-other-functions
	 gp-reserved-modifiers
	 gp-other-keywords
	 gp-term-types
	 gp-plot-types
	 gp-commands)
  "List of known symbols to complete in gnuplot mode.")

(defvar ac-source-gnuplot-symbol-list
       '((candidates . gnuplot-symbol-list)))

;; add metapost keyword to default ac-sources
(defun ac-gnuplot-mode-setup ()    
  (setq ac-sources
	(append '(ac-source-gnuplot-symbol-list)
	ac-sources)))

(add-hook 'gnuplot-mode-hook 'ac-gnuplot-mode-setup)
(add-to-list 'ac-modes 'gnuplot-mode)

(provide 'gnuplot-setting)


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; gnuplot-setting.el ends here



;; Local Variables: ;;
;; mode:Emacs-Lisp  ;;
;; coding:utf-8     ;;
;; comment-column:0 ;;
;; End:             ;;
