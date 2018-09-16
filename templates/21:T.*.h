/* @file `(file-name-nondirectory (buffer-file-name))`
 * @brief ${1:description}
 *
 * @date Create        : `(format-time-string "%Y-%02m-%02d %02H:%02M:%02S %Z")`
 *       Last modified : 
 * @author: `(identity user-full-name)` <`(identity user-mail-address)`>
 */
`
(progn
   ;; name space
   (setq namespace (read-string "namespace? " nil))
   (when (and (< 0 (length namespace)) (not (string-match "::$" namespace)))
   (setq namespace (concat namespace "::")))

   ;; inherits
   (setq inherits (read-string "inherits? " nil))
   (setq inherits-list (split-string inherits ","))
   (setq include-string nil)
   (when (< 0 (length inherits-list))
   	 (setq inherits-string (concat ": public " inherits))
	 (while inherits-list
	 	(setq include-string (format "#include \"%s.h\"" (car inherits-list)))
		(setq inherits-list (cdr inherits-list))))
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

class `(symbol-value 'namespace)`${2:`(file-name-base (buffer-file-name))`} `(symbol-value 'inherits-string)` {
public:
   $2();
   virtual $2~();
$0
}; // end of $2

#endif // #ifndef `(symbol-value 'include-guard)`}
