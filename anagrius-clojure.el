(require 'ac-nrepl)

(require 'slamhound)

(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))


(require 'smartparens-config)
(sp-use-paredit-bindings)

(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'clojure-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)


(require 'clj-refactor)
(add-hook 'clojure-mode-hook
	  (lambda ()
	    (clj-refactor-mode 1)
	    (cljr-add-keybindings-with-prefix "M-\\")))


;; Kibit

(require 'compile)
(add-to-list 'compilation-error-regexp-alist-alist
             '(kibit "At \\([^:]+\\):\\([[:digit:]]+\\):" 1 2 nil 0))
(add-to-list 'compilation-error-regexp-alist 'kibit)

(defun kibit ()
  "Run kibit on the current project.
  Display the results in a hyperlinked *compilation* buffer."
  (interactive)
  (compile "lein kibit"))


;; Unmap all tests in the ns

(defun anagrius-clojure-unmap-tests ()
  "Unmaps all tests in the current ns."
  (interactive)
  (let* ((code "(doseq [[sym var] (ns-interns *ns*)]
                  (if (:test (meta var))
                    (ns-unmap *ns* sym)))")
         (result (plist-get (nrepl-send-string-sync code) :stdout)))
      (message "All Clojure Tests have been unmapped in this namespace.")))

(require 'clojure-test-mode)
(define-key clojure-test-mode-map (kbd "C-c c") 'anagrius-clojure-unmap-tests)


(provide 'anagrius-clojure)
