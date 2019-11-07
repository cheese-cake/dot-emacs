;;; 72_cpp.el --- init for c++                       -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Shinsuke OTA

;; Author: Shinsuke OTA <ota@cns.s.u-tokyo.ac.jp>
;; Keywords: c

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

(defun c-mode-common-hooks ()
  (c-toggle-auto-hungry-state 1)
  (hs-minor-mode 1)
  (setq c-indent-level 3)
  (setq c-default-style "k&r")
  (setq c-basic-offset 3 indent-tabs-mode nil))

(setq auto-mode-alist (append '(("\\.h$" . c++-mode)) auto-mode-alist))

(add-hook 'c-mode-common-hook 'c-mode-common-hooks)
(add-hook 'c++-mode-hook 'c-mode-common-hooks)
(provide '72_cpp)
;;; 72_cpp.el ends here
