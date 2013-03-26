;;; CEDET-setting.el --- 'CEDET-setting' mode

;; Copyright 2011 Ofey
;;
;; Author:   Ofey  ofey.sunfei@gmail.com
;; Version:  CEDET-setting.el,v 0.1 2011/11/09 07:25:16
;; Keywords: CEDET config
;; X-URL: not distributed yet
;; Time-stamp: <Ofey 05/01/2012 16:18:21>

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
;;   (require 'CEDET-setting)

;;; Code:


(require 'cedet)

;; ede
(global-ede-mode t)        ;; Enable the Project management system


;(semantic-load-enable-minimum-features)
;(semantic-load-enable-code-helpers)
;(semantic-load-enable-guady-code-helpers)
;(semantic-load-enable-excessive-code-helpers)
;(semantic-load-enable-semantic-debugging-helpers)

;(require 'semantic-ia)

;(defconst cedet-user-include-dirs
;  (list ".." "../include" "../inc" "../common" "../public"
;        "../.." "../../include" "../../inc" "../../common" "../../public"))

(require 'semantic-c nil 'noerror)


;(let ((include-dirs cedet-user-include-dirs))
;  (mapc (lambda (dir)
;          (semantic-add-system-include dir 'c++-mode)
;          (semantic-add-system-include dir 'c-mode))
;        include-dirs))

(global-set-key (kbd "C-c j") 'semantic-ia-fast-jump)

(global-set-key  (kbd "C-S-j")
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

;; 在函数和声明和实现间跳转,在声明处再执行的话就会再跳回函数体
(define-key c-mode-base-map (kbd "C-c s") 'semantic-analyze-proto-impl-toggle)

(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)

;(enable-visual-studio-bookmarks)


;; 代码在头文件间跳转
(when (require 'eassist nil 'noerror)
  (setq eassist-header-switches
        '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
          ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
          ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
          ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
          ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
          ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
          ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
          ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
          ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
          ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
          ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
          ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
          ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
          ("c" . ("h"))
          ("m" . ("h"))
          ("mm" . ("h"))))
  (define-key c-mode-base-map [M-f12] 'eassist-switch-h-cpp))



;;;; TAGS Menu
;(defun my-semantic-hook ()
;(imenu-add-to-menubar "TAGS"))

;(add-hook 'semantic-init-hooks 'my-semantic-hook)

;;;; Semantic DataBase存储位置
(setq semanticdb-default-save-directory
      (expand-file-name "~/semanticdb"))

;; pulse setting
;(require 'pulse-setting)

;;代码折叠
;(require 'semantic/decorate/mode)


(provide 'CEDET-setting)


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; CEDET-setting.el ends here
