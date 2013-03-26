;;; doc-mode-setting.el --- 'doc-mode-setting'

;; Copyright 2011 Ofey
;;
;; Author:   Ofey  ofey.sunfei@gmail.com
;; Version:  doc-mode-setting.el,v 0.0 2011/11/24 14:00:11
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
;;   (require 'doc-mode-setting)

;;; Code:

;; creation and editing of JavaDoc or Doxygen comment
(require 'doc-mode)

(add-hook 'c-mode-common-hook 'doc-mode)


(provide 'doc-mode-setting)


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; doc-mode-setting.el ends here



;; Local Variables: ;;
;; mode:Emacs-Lisp  ;;
;; coding:utf-8     ;;
;; comment-column:0 ;;
;; End:             ;;