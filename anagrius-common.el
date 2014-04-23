(setq default-directory "~/")

(global-auto-revert-mode 1)

(require 'undo-tree)
(global-undo-tree-mode 1)

;; No bells and whistles

(setq visible-bell t)

;; Don't tell me a command is disabled

(setq disabled-command-function (lambda ()))

;; Disable C-z minimize, I HATES You!

(put 'suspend-frame 'disabled t)

(windmove-default-keybindings)

(global-hl-line-mode 1)
(set-face-foreground 'hl-line nil)
(set-face-attribute hl-line-face nil :underline nil)

(require 'projectile)

;; Note: if this doesn't work try adding "dummy" to the end of the list, run and try again. Sometimes it works..
(dolist (dir (list ".sass-cache" "resources/bower_components" "resources/public"))
    (add-to-list 'projectile-globally-ignored-directories dir))


(provide 'anagrius-common)
