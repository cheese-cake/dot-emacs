;;; 90_yasnippet.el --- init file for yasnippet      -*- lexical-binding: t; -*-

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
;; companyと競合するのでyasnippetのフィールド移動は "C-i" のみにする
(define-key yas-keymap (kbd "<tab>") nil)
(setq yas-snippet-dirs
      (list (expand-file-name "~/.emacs.d/snippets")  ;; 自作スニペット
        yas-installed-snippets-dir         ;; package に最初から含まれるスニペット
        ))
(yatemplate-fill-alist)
(add-hook 'find-file-hooks 'auto-insert)

(provide '90_yasnippet)
;;; 90_yasnippet.el ends here
