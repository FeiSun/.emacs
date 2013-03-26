;;; misc-setting.el --- 'misc-setting'

;; Copyright 2011 Ofey
;;
;; Author:   Ofey  ofey.sunfei@gmail.com
;; Version:  misc-setting.el,v 0.2 2011/11/13 12:23:32
;; Keywords: misc setting
;; X-URL: not distributed yet
;; Time-stamp: <Ofey 03/17/2013 13:25:18> 

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
;;   (require 'misc-setting)

;;; Code:

;; Prefer a big5 font for han characters


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; key board / input method settings
;; win下默认系统语言环境为gbk,若设成utf-8,则打开系统的中文内容为乱码

(when (not (and is-after-emacs-23 window-system))
  (set-language-environment "UTF-8")     ;; prefer utf-8 for language settings
  )

(when  (and is-after-emacs-23 window-system)
  ;(prefer-coding-system 'utf-16)
  (setq file-name-coding-system 'chinese-iso-8bit)    ;; open the file with chinese file name
  )

(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)      ;; if used, chinese font will be abnormal
(set-selection-coding-system 'utf-8)
(set-input-method nil)                   ; no funky input for normal editing;
(setq read-quoted-char-radix 10)         ; use decimal, not octal

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; the modeline
;;

(require 'powerline)

(global-linum-mode t)
(column-number-mode t)
(size-indication-mode t)                 ;; show file size (emacs 22+)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; the minibuffer

(setq
  enable-recursive-minibuffers nil         ;;  allow mb cmds in the mb
  max-mini-window-height .25             ;;  max 2 lines
  minibuffer-scroll-window nil
  resize-mini-windows nil)

;; http://www.emacswiki.org/emacs/IcompleteMode
(icomplete-mode t)                       ;; completion in minibuffer
(setq 
  icomplete-prospects-height 1           ;; don't spam my minibuffer
  icomplete-compute-delay 0)             ;; don't wait
(require 'icomplete+ nil 'noerror)       ;; drew adams' extras

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ido-mode
;; http://www.emacswiki.org/cgi-bin/wiki/InteractivelyDoThings

(require 'ido) 
(ido-mode 'both) ;; for buffers and files
;(ido-mode t)

(setq
  ido-save-directory-list-file "~/.emacs.d/cache/ido.last"
  ido-ignore-buffers ;; ignore these guys
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"
     "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
  ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~src")
  ido-case-fold  t                 ; be case-insensitive
  ido-enable-last-directory-history t ; remember last used dirs
  ido-max-work-directory-list 30   ; should be enough
  ido-max-work-file-list      50   ; remember many
  ido-use-filename-at-point nil    ; don't use filename at point (annoying)
  ido-use-url-at-point nil         ; don't use url at point (annoying)
  ido-enable-flex-matching nil     ; don't try to be too smart
  ido-max-prospects 8              ; don't spam my minibuffer
  ido-confirm-unique-completion t) ; wait for RET, even with unique completion

;; when using ido, the confirmation is rather annoying...
(setq confirm-nonexistent-file-or-buffer nil)

;; increase minibuffer size when ido completion is active
(add-hook 'ido-minibuffer-setup-hook 
  (function
    (lambda ()
      (make-local-variable 'resize-minibuffer-window-max-height)
      (setq resize-minibuffer-window-max-height 1))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color theme

;(require 'color-theme)
;(require 'zenburn nil 'noerror)
;(color-theme-zenburn)
;(load  "zenburn-theme.el")

(require 'blackboard)
(color-theme-blackboard)

;(require 'color-theme-solarized)
;(eval-after-load "color-theme"
;  '(progn
     ;(color-theme-initialize)
     ;(color-theme-solarized-dark)
     ;(color-theme-blackboard)
;     ))

;(setq-default cursor-type '(hbar . 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; font setting

(create-fontset-from-fontset-spec
"-apple-monaco-medium-r-normal--12-*-*-*-*-*-fontset-monaco,
ascii:-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1,
chinese-gb2312:-apple-Microsoft Yahei-medium-normal-normal-12-*-*-*-*-p-0-iso10646-1,
latin-iso8859-1:-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1,
mule-unicode-0100-24ff:-apple-Monaco-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")

(setq default-frame-alist (append '((font . "fontset-monaco")) default-frame-alist))
(set-default-font "fontset-monaco")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; frame setting

;(menu-bar-mode -1)

(tool-bar-mode -1)                      ;; turn-off toolbar
(scroll-bar-mode -1)                    ;; turn off scroll bar

;;show buffer name in frame title
;(setq frame-title-format "Ofey@%b")
(setq-default
 frame-title-format
 '(:eval
   (format "%s@%s:%s"
           (or (file-remote-p default-directory 'user) user-login-name)
           (or (file-remote-p default-directory 'host) system-name)
           (file-name-nondirectory (or (buffer-file-name) default-directory)))))

(setq initial-scratch-message
  ";; scratch buffer created -- Ofey, happy hacking!\n")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; startup screen

(setq inhibit-startup-message t          ;; don't show ...    
  inhibit-startup-echo-area-message t)   ;; ... startup messages
(setq require-final-newline t)           ;; end files with a newline

;(mouse-avoidance-mode 'jump)             ;; mouse ptr when cursor is too close

;(setq cua-enable-cua-keys nil)           ;; only for rectangles
;(cua-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; scrolling

(setq ;; scrolling
  scroll-margin 3                        ;; do smooth scrolling, ...
  scroll-conservatively 100000           ;; ... the defaults ...
  scroll-up-aggressively 0               ;; ... are very ...
  scroll-down-aggressively 0             ;; ... annoying
  scroll-preserve-screen-position t)     ;; preserve screen pos with C-v/M-v 

(setq fringe-mode '(1 . 0))              ;; emacs 22+



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; full screen
;(global-set-key (kbd "C-c f") 'ns-toggle-fullscreen)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;If you enable Delete Selection mode, a minor mode, then inserting text while the mark is active causes the selected text to be deleted first. This also deactivates the mark. Many graphical applications follow this convention, but Emacs does not.

(delete-selection-mode 1)                ;; delete the sel with a keyp

(setq x-select-enable-clipboard t        ;; copy-paste should work ...
      )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; slick-copy: make copy-past a bit more intelligent
;; from: http://www.emacswiki.org/emacs/SlickCopy

(defadvice kill-ring-save (around slick-copy activate)
  "When called interactively with no active region, copy a single line instead."
  (if (or (use-region-p) (not (called-interactively-p)))
      ad-do-it
    (kill-new (buffer-substring (line-beginning-position)
				(line-beginning-position 2))
	      nil '(yank-line))
    (message "Copied line")))

(defadvice kill-region (around slick-copy activate)
  "When called interactively with no active region, kill a single line instead."
  (if (or (use-region-p) (not (called-interactively-p)))
      ad-do-it
    (kill-new (filter-buffer-substring (line-beginning-position)
				       (line-beginning-position 2) t)
	      nil '(yank-line))))
(defun yank-line (string)
  "Insert STRING above the current line."
  (beginning-of-line)
  (unless (= (elt string (1- (length string))) ?\n)
    (save-excursion (insert "\n")))
  (insert string))

;If you use slime-repl-mode (a mode for interacting with an external REPL), replace (line-beginning-position) with
;(if (eq major-mode 'slime-repl-mode)
;    slime-repl-input-start-mark
;  (line-beginning-position))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; search highlight

(setq search-highlight t                 ;; highlight when searching... 
  query-replace-highlight t)             ;; ...and replacing

(fset 'yes-or-no-p 'y-or-n-p)            ;; enable y/n answers to yes/no 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; hl-line: highlight the current line

;(when (fboundp 'global-hl-line-mode)
;  (global-hl-line-mode t)) ;; turn it on for all modes by default

;; http://www.emacswiki.org/emacs/HighlightCurrentLine
(require 'hl-line+)
(toggle-hl-line-when-idle 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq completion-ignore-case t           ;; ignore case when completing...
  read-file-name-completion-ignore-case t) ;; ...filenames too

(put 'narrow-to-region 'disabled nil)    ;; enable...
(put 'erase-buffer 'disabled nil)        ;; ... useful things
(file-name-shadow-mode t)                ;; be smart about filenames in mbuf

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; time stamp

(add-hook 'write-file-hooks 'time-stamp)
(eval-after-load "time-stamp"
  '(progn
     (setq ;; when there's "Time-stamp: <>" in the first 10 lines of the file
      time-stamp-active t        ; do enable time-stamps
      time-stamp-line-limit 20   ; check first 10 buffer lines for Time-stamp: <>
      time-stamp-format "%:u %02m/%02d/%04y %02H:%02M:%02S"))) ; date format

;(setq time-stamp-format "%:u %02m/%02d/%04y %02H:%02M:%02S")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; show-paren-mode allows one to see matching pairs of parentheses and other characters.
;; When point is on one of the paired characters, the other is highlighted.
;; http://www.emacswiki.org/cgi-bin/wiki/ShowParenMode

(when (fboundp 'show-paren-mode)
  (show-paren-mode t)
  (setq show-paren-style 'parenthesis
        show-paren-delay 0))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; indent

(setq-default indent-tabs-mode  nil)
(setq default-tab-width 4)
(setq tab-width 4)

;(setq c-basic-offset 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; kill-ring 

(setq kill-ring-max 800)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; backups
;;
(setq make-backup-files t ;; do make backups
      backup-by-copying t     ;; and copy them here
      backup-directory-alist '(("." . "~/.emacs.d/cache/backups")) 
      version-control t
      kept-new-versions 2
      kept-old-versions 5
      delete-old-versions t)

;; 设定不产生备份文件
;(setq-default make-backup-files nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; bookmarks
;;
(setq bookmark-default-file "~/.emacs.d/data/bookmarks" ;; bookmarks
      bookmark-save-flag 1)                             ;; autosave each change

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; spell check
;;
(setq-default ispell-program-name "aspell"
	      ispell-extra-args '("--sug-mode=ultra") ;; "ultra" is the fastest mode
	      ispell-dictionary "english") ;; if not, it will use "zh-cn",--->crash

;; open image file
;(setq auto-image-file-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; uniquify: unique buffer names

(require 'uniquify) ;; make buffer names more unique
(setq uniquify-buffer-name-style 'post-forward
      uniquify-separator ":"
      uniquify-after-kill-buffer-p t
      uniquify-ignore-buffers-re "^\\*")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ibuffer: Enhanced buffer

;; http://www.emacswiki.org/emacs/IbufferMode
(when (fboundp 'ibuffer)
  (global-set-key (kbd "C-x C-b") 'ibuffer))   ;; ibuffer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use super + arrow keys to switch between visible buffers

;; http://www.emacswiki.org/emacs/WindMove
(require 'windmove)
(windmove-default-keybindings 'control) ;; will be overridden
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; restore window configuration

;; http://www.emacswiki.org/emacs/WinnerMode
;(require 'winner)
;(setq winner-dont-bind-my-keys t) ;; winner conflicts with org
;(global-set-key (kbd "<s-left>")      'winner-undo)
;(global-set-key (kbd "<XF86Forward>") 'winner-redo)
;(global-set-key (kbd "<s-right>") 'winner-redo)
;(global-set-key (kbd "<XF86Back>") 'winner-undo)
;(winner-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; some misc other packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; template 

(require 'template)
;;here set the templates directory
(setq template-subdirectories '("~/.emacs.d/templates/"))
(template-initialize)
(setq template-auto-insert t)

;; 这样可以在 ido 中用 C-j , C-f 等方式创建 新文件时也可以触发模板调用了
(dolist (cmd '(ido-select-text ido-magic-forward-char
                               ido-exit-minibuffer))
  (add-to-list 'template-find-file-commands cmd))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://www.emacswiki.org/emacs/RainbowDelimiters

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(require 'rainbow-mode)
;(global-rainbow-mode)

(setq doc-view-ghostscript-program "D:/Program Files/gs/gs9.02/bin/gswin32c.exe")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tab bar

;; http://www.emacswiki.org/emacs/TabBarMode
;(require 'tabbar)
;(tabbar-mode)

;(require 'ctab)
;(ctab-mode t)
;; .h与.c/cpp一起显示
;(setq ctab-smart t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; minimap

;; http://www.emacswiki.org/emacs-en/MiniMap
(require 'minimap)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ModeLinePosition

;; http://www.emacswiki.org/emacs/ModeLinePosition
(require 'modeline-posn)
(setq modelinepos-column-limit 80)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; global keybindings
;;
(global-set-key (kbd "RET") 'newline-and-indent)


(provide 'misc-setting)


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; misc-setting.el ends here



;; Local Variables: ;;
;; mode:Emacs-Lisp  ;;
;; coding:utf-8     ;;
;; comment-column:0 ;;
;; End:             ;;
