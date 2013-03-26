;; Keywords: slime-setting
;; Time-stamp: <Ofey 04/29/2012 10:36:05>

;; This  file is free  software; you  can redistribute  it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 3,
;; or (at your option) any later version.

;; This file is  distributed in the hope that  it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;; You  should have  received a  copy of  the GNU  General Public
;; License along with  GNU Emacs; see the file  COPYING.  If not,
;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301, USA.


;(set-language-environment "utf-8")

;(add-to-list 'load-path "~/.emacs.d/elisp/slime/")  ;or wherever you put it

;(setq inferior-lisp-program "/Applications/Clozure\ CL.app/Contents/MacOS/dx86cl64 -K utf-8")

(setq inferior-lisp-program "/usr/local/bin/ccl64 -K utf-8")

(require 'slime)
(setq slime-net-coding-system 'utf-8-unix)
(slime-setup '(slime-fancy))

(provide 'slime-setting)
