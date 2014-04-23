(require 'web-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-enable-auto-pairing t)

(setq-default web-mode-markup-indent-offset 4)

(add-hook 'web-mode-hook 'turn-on-smartparens-strict-mode)

(provide 'anagrius-web)
