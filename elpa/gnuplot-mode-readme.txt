Defines a major mode for editing gnuplot scripts.  I wanted to keep
it simpler than other modes -- just syntax hilighting, indentation,
and a command to plot the file.

Some of this code is adapted from a more full-featured version by
Bruce Ravel (available here http://xafs.org/BruceRavel/GnuplotMode;
CC license).

Thanks to everyone, including Christopher Gilbreth and Ralph Möritz,
for sending suggestions, improvements, and fixes.

Installation:

Use package.el. You'll need to add MELPA to your archives:

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

Configuration:

Add the following to your .emacs:

(require 'gnuplot)

specify the gnuplot executable (if other than /usr/bin/gnuplot)
(setq gnuplot-program "/sw/bin/gnuplot")

automatically open files ending with .gp or .gnuplot in gnuplot mode
(add-to-list 'auto-mode-alist
             '("\\.\\(gp\\|gnuplot\\)$" . gnuplot-mode) t)
