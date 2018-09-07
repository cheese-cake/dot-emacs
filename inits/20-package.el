;;; 20-package.el --- package                        -*- lexical-binding: t; -*-

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

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

(require 'cl)

(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    flycheck
    auctex
    markdown-mode
    org-mode
    ))

;;(let ((not-installed (loop for x in installing-package-list
;;                            when (not (package-installed-p x))
;;                            collect x)))
;;  (when not-installed
;;    (package-refresh-contents)
;;    (dolist (pkg not-installed)
;;        (package-install pkg))))
(provide '20-package)
;;; 20-package.el ends here
