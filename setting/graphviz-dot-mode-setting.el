;;; graphviz-dot-mode-setting.el --- 'graphviz-dot-mode-setting'

;; Copyright 2011 Ofey
;;
;; Author:   Ofey  ofey.sunfei@gmail.com
;; Version:  graphviz-dot-mode-setting.el,v 0.0 2011/11/29 06:06:51
;; Keywords: 
;; X-URL: not distributed yet
;; Time-stamp: <Ofey 04/29/2012 21:44:53>

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
;;   (require 'graphviz-dot-mode-setting)

;;; Code:


(require 'graphviz-dot-mode)

(require 'auto-complete)

(setq graphviz-dot-preview-extension "eps")

(eval-after-load 'graphviz-dot-mode
  '(progn
     (defvar ac-source-graphviz-attr
       '((candidates . graphviz-dot-attr-keywords)))
     (defvar ac-source-graphviz-value
       '((candidates . graphviz-dot-value-keywords)))
     (defvar ac-source-graphviz-colors
       '((candidates . graphviz-color-keywords)))
     ;; add graphviz keyword to default ac-sources
     (defun ac-dot-mode-setup ()    
       (setq ac-sources
	     (append '(ac-source-graphviz-attr ac-source-graphviz-value ac-source-graphviz-colors)
		    ac-sources )))
     (add-hook 'graphviz-dot-mode-hook 'ac-dot-mode-setup)
     (add-to-list 'ac-modes 'graphviz-dot-mode)
     ))

;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################



(provide 'graphviz-dot-mode-setting)

;;; graphviz-dot-mode-setting.el ends here



;; Local Variables: ;;
;; mode:Emacs-Lisp  ;;
;; coding:utf-8     ;;
;; comment-column:0 ;;
;; End:             ;;
