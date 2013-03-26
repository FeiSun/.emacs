;;; pulse-setting.el --- 'pulse-setting'

;; Copyright 2011 Ofey
;;
;; Author:   Ofey  ofey.sunfei@gmail.com
;; Version:  pulse-setting.el,v 0.0 2011/11/11 05:11:31
;; Keywords: 
;; X-URL: not distributed yet
;; Time-stamp: <Ofey 04/26/2012 20:46:33>

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
;;   (require 'pulse-setting)

;;; Code:

(require 'pulse)

(setq pulse-command-advice-flag (if window-system 1 nil))

(defadvice goto-line (after pulse-advice activate)
  "Cause the line that is `goto'd to pulse when the cursor gets there."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice exchange-point-and-mark (after pulse-advice activate)
  "Cause the line that is `goto'd to pulse when the cursor gets there."
  (when (and pulse-command-advice-flag (interactive-p)
             (> (abs (- (point) (mark))) 400))
    (pulse-momentary-highlight-one-line (point))))
(defadvice find-tag (after pulse-advice activate)
  "After going to a tag, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice tags-search (after pulse-advice activate)
  "After going to a hit, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice tags-loop-continue (after pulse-advice activate)
  "After going to a hit, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice pop-tag-mark (after pulse-advice activate)
  "After going to a hit, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice imenu-default-goto-function (after pulse-advice activate)
  "After going to a tag, pulse the line the cursor lands on."
  (when pulse-command-advice-flag
    (pulse-momentary-highlight-one-line (point))))

(defadvice cua-exchange-point-and-mark (after pulse-advice activate)
  "Cause the line that is `goto'd to pulse when the cursor gets there."
  (when (and pulse-command-advice-flag (interactive-p)
             (> (abs (- (point) (mark))) 400))
    (pulse-momentary-highlight-one-line (point))))
(defadvice switch-to-buffer (after pulse-advice activate)
  "After switch-to-buffer, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice previous-buffer (after pulse-advice activate)
  "After previous-buffer, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice next-buffer (after pulse-advice activate)
  "After next-buffer, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice ido-switch-buffer (after pulse-advice activate)
  "After ido-switch-buffer, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))
(defadvice beginning-of-buffer (after pulse-advice activate)
  "After beginning-of-buffer, pulse the line the cursor lands on."
  (when (and pulse-command-advice-flag (interactive-p))
    (pulse-momentary-highlight-one-line (point))))

(provide 'pulse-setting)


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; pulse-setting.el ends here



;; Local Variables: ;;
;; mode:Emacs-Lisp  ;;
;; coding:utf-8     ;;
;; comment-column:0 ;;
;; End:             ;;
