(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)

(defun helm-anagrius ()
  "Preconfigured `helm'."
  (interactive)
  (condition-case nil
      (if (projectile-project-root)
          (helm-projectile)
        ;; otherwise fallback to `helm-mini'
        (helm-mini))
    ;; fall back to helm mini if an error occurs (usually in `projectile-project-root')
    (error (helm-mini))))

(helm-mode 1)
(projectile-global-mode)

(global-set-key (kbd "C-c h") 'helm-anagrius)

(provide 'anagrius-helm)
