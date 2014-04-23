(require 'highlight-symbol)


(setq-default indent-tabs-mode nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Highlight Symbols                                                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'highlight-symbol)

(add-hook 'prog-mode-hook 'highlight-symbol-mode)

(setq highlight-symbol-idle-delay 0.2)

(setq highlight-symbol-on-navigation-p nil)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Keybindingins                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Indent using RET (instead of just newline).

(add-hook 'prog-mode-hook
	  '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))


(global-set-key (kbd "s-r") 'replace-regexp)
(global-set-key (kbd "s-f") 'isearch-forward)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Whitespace                                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Delete Whitespace on save.
;; TODO: Look into more leient alternative that only,
;; delete if it way already clean when the file was loaded.


(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; Delete white space with ease M-SPC and M-S-SPC.


(defun pancake-delete-whitespace-except-one ()
  (interactive)
  (just-one-space -1))
(global-set-key (kbd "M-SPC") 'pancake-delete-whitespace-except-one)


(defun pancake-delete-whitespace ()
  (interactive)
  (just-one-space -1)
  (delete-backward-char 1))
(global-set-key (kbd "M-S-SPC") 'pancake-delete-whitespace)


(provide 'anagrius-prog)
