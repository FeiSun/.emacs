;;; blackboard.el --- 'Blackboard Colour Theme for Emacs'

;; Copyright 2011 Ofey
;;
;; Author:   Ofey  ofey.sunfei@gmail.com
;; Version:  blackboard.el,v 0.2 2011/11/13 12:23:32
;; Keywords: color theme  blackboard
;; X-URL: not distributed yet
;; Time-stamp: <Ofey 03/15/2013 15:25:35> 

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
;;   (require 'blackboard)
;;   (color-theme-blackboard) 

;;; Code:


(eval-when-compile
  (require 'color-theme))

(defun color-theme-blackboard ()
  "Color theme by Ofey, created 2011-12-27"
  (interactive)
  (color-theme-install
   '(color-theme-blackboard
     ((background-color . "#0C1021")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "#A7A7A7") 
      (foreground-color . "LemonChiffon4")
      (mouse-color . "sienna1"))
     (default ((t (:background "#0C1021" :foreground "LemonChiffon4"))))
     (blue ((t (:foreground "blue"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:bold t))))
     (border-glyph ((t (nil))))

     (linum ((t (:foreground "firebrick"))))
     (fringe ((t (:foreground "LimeGreen" :background "#0C1021"))))

     ;; highlight 
     (highlight ((t (:background "#606060"))))
     ;(hl-line ((t (:background "#606060" :underline t))))
     ;;draw a line under current line
     (hl-line ((t (:background "#606060"))))
     (lazy-highlight ((t (:background "#606060" :foreground "white"))))
     ;(highlight-current-line ((t (:background "#464646"))))

     ;; mode-line
     (mode-line ((t (:background "#3f3f3f" :foreground "#c48821"
                                 :box (:color "#c48821" :line-width 1)))))
     (mode-line-buffer-id ((t (:foreground "gold"))))
     (mode-line-inactive ((t (:background "#4f4f4f" :foreground "#f0dfaf"
                                          :box (:color "#4f4f4f" :line-width 1)))))

     (region ((t (:background "#606060"))))

     (link ((t (:foreground "DodgerBlue" :underline t))))
     (link-visited ((t (:foreground "PaleVioletRed" :underline t))))
     
     (buffers-tab ((t (:background "#0C1021" :foreground "LemonChiffon4"))))


     ;; ecb faces
     (ecb-default-highlight-face ((t (:background "#0C1021" :foreground "ForestGreen"))))
     (ecb-history-bucket-node-dir-soure-path-face ((t (:background "#0C1021" :foreground "DarkCyan"))))

     
     ;; font-latex
     ;(font-latex-bold-face ((t (:inherit bold))))
     ;(font-latex-warning-face ((t (:inherit font-lock-warning))))
     (font-latex-sedate-face ((t (:foreground "DeepSkyBlue3" :weight bold))))
     (font-latex-title-4-face ((t (:inherit variable-pitch :weight bold))))
     
     ;; font lock
     (font-lock-builtin-face ((t (:foreground "LemonChiffon4"))))
     (font-lock-comment-face ((t (:italic t :foreground "OliveDrab"))))
     (font-lock-comment-delimiter-face
            ((t (:foreground "DarkOrange3" :weight bold))))
     (font-lock-constant-face ((t (:foreground "IndianRed"))))
     (font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
     (font-lock-doc-face ((t (:foreground "#8fb28f" :slant italic))))
     (font-lock-color-constant-face ((t (:foreground "#5f8700"))))
     (font-lock-function-name-face ((t (:foreground "#FF6400"))))
     (font-lock-keyword-face ((t (:foreground "#FBDE2D"))))
     (font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
     (font-lock-reference-face ((t (:foreground "SlateBlue"))))
     (font-lock-negation-char-face ((t (:foreground "#e0cf9f" :weight bold))))
     (font-lock-other-type-face ((t (:foreground "CornflowerBlue" :slant italic))))
     (font-lock-regexp-grouping-backslash ((t (:foreground "DarkGoldenrod"))))
     (font-lock-regexp-grouping-construct ((t (:foreground "red"))))
     (font-lock-special-keyword-face ((t (:foreground "DarkMagenta"))))
     (font-lock-exit-face ((t (:foreground "OrangeRed"))))
     (font-lock-other-emphasized-face
            ((t (:foreground "firebrick" :weight bold :slant italic))))
     (font-lock-string-face ((t (:foreground "LimeGreen" :slant italic))))
     (font-lock-type-face ((t (:foreground "#8DA6CE"))))
     (font-lock-variable-name-face ((t (:foreground "MediumAquamarine"))))
     (font-lock-warning-face ((t (:bold t :foreground "MediumPurple"))))
     (font-lock-pseudo-keyword-face ((t (:foreground "chocolate" :weight bold))))
     (font-lock-operator-face ((t (:foreground "DarkTurquoise"))))

     
     (gui-element ((t (:background "#D4D0C8" :foreground "black"))))
     
     
     (highline-face ((t (:background "SeaGreen"))))
     (italic ((t (nil))))
     (left-margin ((t (nil))))
     (text-cursor ((t (:background "yellow" :foreground "black"))))
     (toolbar ((t (nil))))
     (underline ((nil (:underline nil))))

    
     ;; rainbow-delimiters
     (rainbow-delimiters-depth-1-face ((t (:foreground "#93e0e3"))))
     (rainbow-delimiters-depth-2-face ((t (:foreground "#f0dfaf"))))
     (rainbow-delimiters-depth-3-face ((t (:foreground "#94bff3"))))
     (rainbow-delimiters-depth-4-face ((t (:foreground "#dca3a3"))))
     (rainbow-delimiters-depth-5-face ((t (:foreground "#8fb28f"))))
     (rainbow-delimiters-depth-6-face ((t (:foreground "#7cb8bb"))))
     (rainbow-delimiters-depth-7-face ((t (:foreground "#dfaf8f"))))
     (rainbow-delimiters-depth-8-face ((t (:foreground "#dc8cc3"))))
     (rainbow-delimiters-depth-9-face ((t (:foreground "#d0bf8f"))))
     (rainbow-delimiters-depth-10-face ((t (:foreground "#9fc59f"))))
     (rainbow-delimiters-depth-11-face ((t (:foreground "#94bff3"))))
     (rainbow-delimiters-depth-12-face ((t (:foreground "#8c5353"))))

     ;; speedbar
     (speedbar-button-face ((t (:foreground "grey33" :weight bold))))
     (speedbar-file-face ((t (:foreground "DarkOrange" :weight bold))))
     (speedbar-directory-face ((t (:foreground "brown4" :weight bold))))
     (speedbar-highlight-face ((t (:underline t))))
     (speedbar-tag-face ((t (:inherit font-lock-function-name))))
     

     
     (zmacs-region ((t (:background "snow" :foreground "blue"))))
     
     )))

;(provide-theme "color-theme-blackboard")

(defalias 'blackboard #'color-theme-blackboard)

(provide 'blackboard)


;;; blackboard.el ends here



;; Local Variables: ;;
;; mode:Emacs-Lisp  ;;
;; coding:utf-8     ;;
;; comment-column:0 ;;
;; End:             ;;
