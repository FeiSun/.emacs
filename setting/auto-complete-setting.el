;;; auto-complete-setting.el --- 'auto-complete'

;; Copyright 2011 Ofey
;;
;; Author:   Ofey  ofey.sunfei@gmail.com
;; Version:  auto-complete-setting.el,v 0.0 2011/11/09 12:08:56
;; Keywords: 
;; X-URL: not distributed yet
;; Time-stamp: <Ofey 12/07/2011 22:36:28>

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
;;   (require 'auto-complete-setting)

;;; Code:

(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/auto-complete/ac-dict")
(ac-config-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; metapost auto-complete

(defvar ac-source-metapost-symbol-list
       '((candidates . metapost-symbol-list)))

;; add metapost keyword to default ac-sources
(defun ac-metapost-mode-setup ()    
  (setq ac-sources
	(append '(ac-source-metapost-symbol-list)
	ac-sources)))

(add-hook 'metapost-mode-hook 'ac-metapost-mode-setup)
(add-to-list 'ac-modes 'metapost-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; metapost auto-complete

;; add metafont keyword to default ac-sources
(defvar ac-source-metafont-symbol-list
       '((candidates . metafont-symbol-list)))

(defun ac-metafont-mode-setup ()    
  (setq ac-sources
	(append '(ac-source-metafont-symbol-list)
	ac-sources)))

(add-hook 'metafont-mode-hook 'ac-metafont-mode-setup)
(add-to-list 'ac-modes 'metafont-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'auto-complete-setting)


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; auto-complete-setting.el ends here
