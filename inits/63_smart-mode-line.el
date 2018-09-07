(defvar sml/no-confirm-load-theme t)
(defvar sml/theme 'light) ;; お好みで
(defvar sml/shorten-directory -1) ;; directory pathはフルで表示されたいので
(sml/setup)

;(require 'diminish)
;(eval-after-load "company" '(diminish 'company-mode) "Comp") ;; 自分でMinor Mode名を定義
;(eval-after-load "ivy" '(diminish 'ivy-mode)) ;; 非表示設定（この例だとivyがMinor Mode欄から消える）

(column-number-mode t) ;; 列番号の表示
(line-number-mode t) ;; 行番号の表示
