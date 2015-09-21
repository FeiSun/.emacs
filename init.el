;;; Ofey's dotemacs file
;;; Time-stamp: <Ofey 07/21/2015 12:58:37>
;;; On the way!

;;;personal info
(setq user-full-name "Ofey")
(setq user-mail-address "ofey.sunfei@gmail.com")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;set the default file path
;(setq default-directory "~/Document/")
;(setenv "HOME" "/Users/Ofey/emacs-conf")


(defconst my-emacs-path           "~/" "my emacs config file path")
(defconst my-emacs-plugins-path     (concat my-emacs-path ".emacs.d/plugins/") "downloaded elisp path")
(defconst my-emacs-setting-path   (concat my-emacs-path ".emacs.d/setting/") "elisp setting path")


(defconst is-after-emacs-23  (<= 23 emacs-major-version) "judge version")
(defvar mswin (equal window-system 'w32) "Non-nil means windows system.")

;;note: mac port version use window-system == mac
(defvar macosx (equal window-system 'ns) "Non-nil means Mac OSX.")


(let ((default-directory my-emacs-plugins-path))
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
                        ("melpa" . "http://melpa.org/packages/")))
;禁止elpa自动加载packages

(setq package-enable-at-startup nil)

;手动初始化之，如此elpa会将packages的路径加入load-path中

(package-initialize);
(require 'init-exec-path)

;;automatically install package if not exist
(setq my-package-list '(anaconda-mode async auctex cdlatex color-theme
                        color-theme-sanityinc-tomorrow company company-anaconda
                        company-auctex company-c-headers company-jedi
                        company-statistics concurrent ctable dash deferred
                        doc-mode epc epl flycheck git-commit git-gutter helm
                        helm-core highlight hl-line+ jedi-core magit modeline-posn
                        python-environment rainbow-delimiters rainbow-mode
                        smartparens window-numbering yasnippet))
(mapc #'package-install my-package-list)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; color theme
(require 'sanityinc-tomorrow-night-theme)

;;;speed up launch
;(require 'eval-after-load)

(require 'misc-setting)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm setting
(require 'helm)
(require 'helm-config)
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-autoresize-mode t)
(global-set-key (kbd "C-x b")   #'helm-mini)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "C-x C-m") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x C-r") #'helm-recentf)
(global-set-key (kbd "C-x r l") #'helm-filtered-bookmarks)
(global-set-key (kbd "M-y")     #'helm-show-kill-ring)
(global-set-key (kbd "M-s o")   #'helm-swoop)
(global-set-key (kbd "M-s /")   #'helm-multi-swoop)

(helm-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
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

; mac fix path
;(require 'fixpath)

;http://www.emacswiki.org/emacs/GenericMode
(require 'generic-x)


(add-hook 'python-mode-hook 'anaconda-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete-setting
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;(add-to-list 'company-backends 'company-anaconda)
;(add-to-list 'company-backends 'company-c-headers)
;(add-hook 'python-mode-hook 'anaconda-mode)

;; org mode setting
;(require 'org-mode-setting)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;window-numbering
(require 'window-numbering)
(window-numbering-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AUCTeX config

(eval-after-load "TeX-mode"
  '(progn
     (require 'auctex-setting)
    ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; smartparens-config
(require 'smartparens-config)
(smartparens-global-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(require 'yasnippet)
(yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;make yasnippet and company work nicer

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
    (backward-char 1)
    (if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (cond
   ((minibufferp)
    (minibuffer-complete))
   (t
    (indent-for-tab-command)
    (if (or (not yas/minor-mode)
        (null (do-yas-expand)))
    (if (check-expansion)
        (progn
          (company-manual-begin)
          (if (null company-candidates)
          (progn
            (company-abort)
            (indent-for-tab-command)))))))))

(defun tab-complete-or-next-field ()
  (interactive)
  (if (or (not yas/minor-mode)
      (null (do-yas-expand)))
      (if company-candidates
      (company-complete-selection)
    (if (check-expansion)
      (progn
        (company-manual-begin)
        (if (null company-candidates)
        (progn
          (company-abort)
          (yas-next-field))))
      (yas-next-field)))))

(defun expand-snippet-or-complete-selection ()
  (interactive)
  (if (or (not yas/minor-mode)
      (null (do-yas-expand))
      (company-abort))
      (company-complete-selection)))

(defun abort-company-or-yas ()
  (interactive)
  (if (null company-candidates)
      (yas-abort-snippet)
    (company-abort)))

(global-set-key [tab] 'tab-indent-or-complete)
(global-set-key (kbd "TAB") 'tab-indent-or-complete)
(global-set-key [(control return)] 'company-complete-common)

(with-eval-after-load 'company
(define-key company-active-map [tab] 'expand-snippet-or-complete-selection)
(define-key company-active-map (kbd "TAB") 'expand-snippet-or-complete-selection))

(define-key yas-minor-mode-map [tab] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)

(define-key yas-keymap [tab] 'tab-complete-or-next-field)
(define-key yas-keymap (kbd "TAB") 'tab-complete-or-next-field)
(define-key yas-keymap [(control tab)] 'yas-next-field)
(define-key yas-keymap (kbd "C-g") 'abort-company-or-yas)
