/* @file `(file-name-nondirectory (buffer-file-name))`
 * @brief ${1:description}
 *
 * @date Create        : `(format-time-string "%Y-%02m-%02d %02H:%02M:%02S %Z")`
 *       Last Modified : 2019-05-15 11:05:47 JST (ota)
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
  (setq inherits (read-string "inherits? " nil))
  (setq doInsertClassDef (yes-or-no-p "insert class def?"))

  ;; initialization for symbol values
  (setq classname (file-name-base (buffer-file-name)))
  (setq namespace-string nil)
  (setq namespace-declare nil)
  (setq inherit-string nil)
  (setq include-string nil)
  (setq classdef-string nil)

  ;; name space
  (setq namespace-list (list-validate (split-string namespaces "::")))
  (when (< 0 (length namespace-list))
    (setq namespace-string (concat (join namespace-list "::") "::"))
    (setq namespace-declare (declare-class-in-namespace classname namespace-list)))
  

   ;; inherits
  (setq inherit-list (list-validate (split-string inherits ",")))
  (when inherit-list
    (setq inherit-string
      (format " : %s" (join (mapcan (lambda (x) (list (format "public %s" x))) inherit-list) ", ")))
    (setq include-string
      (join (mapcan (lambda (x) (list (format "#include \"%s.h\"" x))) inherit-list) "\n")))

  ;; class def macro
  (when doInsertClassDef
    (setq classdef-string (format "ClassDef(%s,1)" classname))
    )

   ;; guard
   (setq include-guard (upcase
		  (format "INCLUDE_GUARD_UUID_%04x%04x_%04x_4%03x_%04x_%06x%06x"
			  (random (expt 16 4))
			  (random (expt 16 4))
			  (random (expt 16 4))
			  (random (expt 16 3))
			  (+ (random (expt 2 14)) (expt 2 15))
			  (random (expt 16 6))
			  (random (expt 16 6)))))
   nil
)
`
#ifndef `(symbol-value 'include-guard)`
#define `(symbol-value 'include-guard)`

`(symbol-value 'include-string)`

`(symbol-value 'namespace-declare)`

class `(symbol-value 'namespace-string)`${2:`(symbol-value 'classname)`}`(symbol-value 'inherit-string)` {
public:
   $2();
   virtual ~$2();
$0
   `(symbol-value 'classdef-string)`
}; // end of $2

#endif // #ifndef `(symbol-value 'include-guard)`}
