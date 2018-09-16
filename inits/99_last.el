;;; 99_last.el --- last initialization               -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Shinsuke OTA

;; Author: Shinsuke OTA <ota@cns.s.u-tokyo.ac.jp>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(yas-global-mode 1)
(yatemplate-fill-alist)
(add-hook 'find-file-hooks 'auto-insert)

(electric-pair-mode t)

(provide '99_last)
;;; 99_last.el ends here
