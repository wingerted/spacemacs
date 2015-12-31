;; Pre extensions are loaded *before* the packages
(setq c-c++-pre-extensions '())

;; Post extensions are loaded *after* the packages
(setq c-c++-post-extensions
  '(
    google-c-style
    ))

;; Initialize the extensions
(defun c-c++/init-google-c-style ()
  (use-package google-c-style
    :init
    :config
    (add-hook 'c-mode-common-hook 'google-set-c-style)
    (add-hook 'c++-mode-common-hook 'google-set-c-style)))
