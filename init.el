;;; Ofey's dotemacs file  
;;; Time-stamp: <Ofey 11/23/2013 14:04:13> 
;;; On the way!

;;;personal info
(setq user-full-name "Ofey") 
(setq user-mail-address "ofey.sunfei@gmail.com") 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;set the default file path
;(setq default-directory "~/Document/")
;(setenv "HOME" "/Users/Ofey/emacs-conf")


(defconst my-emacs-path           "~/" "my emacs config file path")
(defconst my-emacs-lisps-path     (concat my-emacs-path ".emacs.d/elisp/") "downloaded elisp path")
(defconst my-emacs-setting-path   (concat my-emacs-path ".emacs.d/setting/") "elisp setting path")
;(defconst my-emacs-cedet-path   (concat my-emacs-path ".emacs.d/elisp/cedet/") "cedet path")


(defconst is-after-emacs-23  (<= 23 emacs-major-version) "judge version")
(defvar mswin (equal window-system 'w32) "Non-nil means windows system.")

;;note: mac port version use window-system == mac 
(defvar macosx (equal window-system 'ns) "Non-nil means Mac OSX.")

;; 覆盖自带的cedet
;(let ((default-directory my-emacs-cedet-path))
;      (setq load-path
;            (append
;             (let ((load-path (copy-sequence load-path))) ;; Shadow
;               (normal-top-level-add-subdirs-to-load-path))
;             load-path)))

;; recursively add the subdirectories of `my-emacs-lisps-path' to `load-path'
;; To have libraries in particular paths take precedence over other libraries elsewhere with the same name, put those paths at the begining of 'load-path'
;(let ((default-directory my-emacs-lisps-path))
;      (setq load-path
;            (append
;             (let ((load-path (copy-sequence load-path))) ;; Shadow
;              (append 
;                (copy-sequence (normal-top-level-add-to-load-path '(".")))
;                (normal-top-level-add-subdirs-to-load-path)))
;             load-path)))

(let ((default-directory my-emacs-lisps-path))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; recursively add the subdirectories of `my-emacs-setting-path' to `load-path'
(let ((default-directory my-emacs-setting-path))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;(setq mac-option-modifier 'meta)
;(setq mac-command-modifier 'hyper)


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/") 
("marmalade" . "http://marmalade-repo.org/packages/") 
("melpa" . "http://melpa.milkbox.net/packages/"))) 
;禁止elpa自动加载packages 

(setq package-enable-at-startup nil) 

;手动初始化之，如此elpa会将packages的路径加入load-path中

(package-initialize); 


(require 'init-exec-path)

;;;speed up launch
;(require 'eval-after-load)

(require 'misc-setting)

;; scroll one line at a time (less "jumpy" than defaults)
(setq
 mouse-wheel-scroll-amount '(1 ((shift) . 1)) ;; scroll one line at a time
                                        ;mouse-wheel-progressive-speed nil ;; don't acceleratescrolling
 mouse-wheel-follow-mouse 't ;; scroll window under mouse
 scroll-step 1 ;; scroll one line at a time
 scroll-margin 3
 scroll-up-aggressively 0.01
 scroll-down-aggressively 0.01
 scroll-conservatively 10000)


(require 'calendar-setting)

; mac fix path
;(require 'fixpath)

;http://www.emacswiki.org/emacs/GenericMode
(require 'generic-x)


;; auto-complete-setting
(require 'auto-complete-setting)

;; org mode setting
;(require 'org-mode-setting)

;;;common lisp (CCL) && slime
;(require 'slime-setting)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AUCTeX config

(eval-after-load "TeX-mode"
  '(progn
     (require 'auctex-setting)
    ))
;(require 'auctex-setting)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; metapost-mode setting

(require 'metapost-mode+)

(require 'julia-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cdedt setting

;(add-hook 'c-mode-common-hook (lambda ()
;  (require 'CEDET-setting)
;  (require 'ecb-setting)
;  ;;; any code dependent on having this file loaded
;))
;(require 'CEDET-setting)

;(require 'zjl-hl)
;(zjl-hl-enable-global-all-modes)

(require 'cc-dev-setting)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python dev setting

(require 'python-setting)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gnuplot mode setting
;; 注意,有两种
;(require 'gnuplot-setting)

;(require '.gnuplot-setting)

(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot-mode" t)
;;
;; Something like
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode))
      auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dot-mode setting

;(require 'graphviz-dot-mode-setting)

;; doc-mode setting
;(require 'doc-mode-setting)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 不用分离的frame显示speedbar
;; assoc package is obsolete
;; http://emacswiki.org/emacs/SpeedBar
;(require 'sr-speedbar)
;(setq sr-speedbar-right-side nil)
;(setq speedbar-show-unknown-files t)
;(global-set-key (kbd "s-b") 'sr-speedbar-toggle) ;; command (win) + b


;;AutoComplete stops working as soon as I enable Flymake. I'm using the development version. --TiagoCamargo
;;After loading auto-complete,
;(ac-flyspell-workaround)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((TeX-master . "MachineLearning")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
