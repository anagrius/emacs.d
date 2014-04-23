(require 'smartparens-config)


(defun anagrius-lisp ()
  (show-paren-mode 1)
  (turn-on-smartparens-strict-mode)
  (show-smartparens-mode t))


(add-hook 'lisp-mode-hook 'anagrius-lisp)
(add-hook 'emacs-lisp-mode-hook 'anagrius-lisp)


(defun anagrius-kill-current-sexp ()
  (interactive)
  (sp-backward-up-sexp)
  (sp-kill-sexp))


(defun anagrius-kill-top-sexp ()
  (interactive)
  (while (sp-backward-up-sexp))
  (sp-kill-sexp))

(define-key sp-keymap (kbd "M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-S-k") 'anagrius-kill-top-sexp)
(define-key sp-keymap (kbd "M-S-k") 'anagrius-kill-current-sexp)
(define-key sp-keymap (kbd "M-S-<down>") 'transpose-sexps)
(define-key sp-keymap (kbd "M-S-<up>") "\C-u\ -1\ \C-\M-t")

(provide 'anagrius-lisp)
