;;; cc-dev-setting.el --- cc-dev-setting

;; Copyright 2012 Ofey
;;
;; Author:   Ofey  ofey.sunfei@gmail.com
;; Version:  cc-dev-setting.el,v 0.0 2012/04/30 08:06:50
;; Keywords: 
;; X-URL: not distributed yet
;; Time-stamp: <Ofey 03/16/2013 21:28:05>

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
;;   (require 'cc-dev-setting)

;;; Code:


;; smart compile
(require 'smart-compile)

;(add-to-list 'smart-compile-alist
;             '(("\\.c\\'" . "gcc -g -Wall -Werror -o %n %f")))
;(global-set-key (kbd "<f9>") 'smart-compile)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; C语言设置
(defun ofey-c-mode-hook ()
  (c-set-style "cc-mode"))
(add-hook 'c-mode-hook 'ofey-c-mode-hook)

;; C++设置
(defun ofey-c++-mode-hook ()
  (c-set-style "K&R"))
(add-hook 'c++-mode-hook 'ofey-c++-mode-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto complete
;; ac-source && ac-mode
(defun ac-cc-mode-setup ()    ; add  ac-source-semantic to default ac-sources
  (setq ac-sources
	(append '(ac-source-semantic ac-source-semantic-raw)
		ac-sources))
  )

(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'c++-mode-hook 'ac-cc-mode-setup)

(defun ofey-mode-common-hook()
  (require 'CEDET-setting)
  (require 'ecb-setting)
  (setq c-basic-offset 8) 
  )

(add-hook 'c-mode-common-hook 'ofey-mode-common-hook)

;(setq gdb-command-name "/usr/local/Cellar/gdb/7.5/bin/gdb")
;(defvar gud-gdb-command-name "/usr/local/Cellar/gdb/7.5/bin/gdb")
(setq gud-gdb-command-name "/usr/local/Cellar/gdb/7.5/bin/gdb -i=mi")

(provide 'cc-dev-setting)


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; cc-dev-setting.el ends here



;; Local Variables: ;;
;; mode:Emacs-Lisp  ;;
;; coding:utf-8     ;;
;; comment-column:0 ;;
;; End:             ;;
