/* @file `(file-name-nondirectory (buffer-file-name))`
 * @brief ${1:description}
 *
 * @date Create        : `(format-time-string "%Y-%02m-%02d %02H:%02M:%02S %Z")`
 *       Last Modified : 2019-05-15 11:38:43 JST (ota)
 * @author: `(identity user-full-name)` <`(identity user-mail-address)`>
 */
`
(progn
  (defun join (inputlist delim)
    (if (< 1 (length inputlist))
	(concat (car inputlist) delim (join (cdr inputlist) delim))
      (concat (car inputlist))))

  (defun list-validate (input)
    (setq input (mapcan (lambda (x) (if x (list (string-trim x)))) input))
    (setq input (mapcan (lambda (x) (if (< 0 (length x)) (list x))) input)))

  (defun declare-class-in-namespace (classname namespace-list)
    (if (< 0 (length namespace-list))
	(concat "namespace " (car namespace-list) " {\n"
		(declare-class-in-namespace classname (cdr namespace-list)) "}\n")
      (concat "class " classname ";\n")
      ))

  ;; interactive strings 
  (setq namespaces (read-string "namespaces (join with :: for recursive namespace)? " nil))
  (setq doInsertClassImp (yes-or-no-p "insert ClassImp ? "))

  ;; initialization for symbol values
  (setq classname (file-name-base (buffer-file-name)))
  (setq namespace-string nil)
  (setq classimp-string nil)

  ;; name space
  ;; name space
  (setq namespace-list (list-validate (split-string namespaces "::")))
  (when (< 0 (length namespace-list))
    (setq namespace-string (concat (join namespace-list "::") "::")))

  ;; class imp macro
  (when doInsertClassImp
    (setq classimp-string (format "ClassImp(%s%s)" namespace-string classname))
  )
   nil
)
`

#include "`(file-name-base (buffer-file-name))`.h"

`(symbol-value 'classimp-string)`

using `(symbol-value 'namespace-string)``(symbol-value 'classname)`;

`(symbol-value 'classname)`::`(symbol-value 'classname)`()
{
$0
}

`(symbol-value 'classname)`::~`(symbol-value 'classname)`()
{
}

