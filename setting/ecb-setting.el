;;; ecb-setting.el --- ecb config

;; Copyright 2012 Ofey
;;
;; Author:   Ofey  ofey.sunfei@gmail.com
;; Version:  ecb-setting.el,v 0.0 2012/04/30 04:30:59
;; Keywords: 
;; X-URL: not distributed yet
;; Time-stamp: <Ofey 04/30/2012 14:31:53>

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
;;   (require 'ecb-setting)

;;; Code:


(require 'ecb)

(setq ;ecb-auto-activate t 
ecb-tip-of-the-day nil 
inhibit-startup-message t 
ecb-auto-compatibility-check nil 
ecb-version-check nil)

(provide 'ecb-setting)


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; ecb-setting.el ends here



;; Local Variables: ;;
;; mode:Emacs-Lisp  ;;
;; coding:utf-8     ;;
;; comment-column:0 ;;
;; End:             ;;
