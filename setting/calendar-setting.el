;;; calendar-setting.el --- 'calendar-setting'

;; Copyright 2011 Ofey
;;
;; Author:   Ofey  ofey.sunfei@gmail.com
;; Version:  calendar-setting.el,v 0.0 2011/11/12 08:15:20
;; Keywords: 
;; X-URL: not distributed yet
;; Time-stamp: <Ofey 12/05/2011 20:16:14>

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
;;   (require 'calendar-setting)

;;; Code:

;; 让emacs能计算日出日落的时间，在 calendar 上用 S 即可看到
(setq calendar-latitude +39.54)
(setq calendar-longitude +116.28)
(setq calendar-location-name "北京")

;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])

(setq mark-diary-entries-in-calendar t) ; 标记calendar上有diary的日期

;; 去掉不关心的节日，设定自己在意的节日，在 calendar 上用 h 显示节日
(setq holiday-christian-holidays nil)
(setq holiday-hebrew-holidays nil)
(setq holiday-islamic-holidays nil)
(setq holiday-solar-holidays nil)
(setq holiday-general-holidays '((holiday-fixed 1 1 "元旦")
(holiday-fixed 2 14 "情人节")
(holiday-fixed 3 14 "白色情人节")
(holiday-fixed 4 1 "愚人节")
(holiday-fixed 5 1 "劳动节")
(holiday-float 5 0 2 "母亲节")
(holiday-fixed 6 1 "儿童节")
(holiday-float 6 0 3 "父亲节")
(holiday-fixed 7 25 "Ofey & Arline's Jubilee")
(holiday-fixed 8 3 "Ofey & Arline's Birthday")
(holiday-fixed 9 10 "教师节")
(holiday-fixed 10 1 "国庆节")
(holiday-fixed 12 25 "圣诞节")))

(provide 'calendar-setting)


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; calendar-setting.el ends here



;; Local Variables: ;;
;; mode:Emacs-Lisp  ;;
;; coding:utf-8     ;;
;; comment-column:0 ;;
;; End:             ;;
