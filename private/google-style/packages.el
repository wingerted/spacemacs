;;; packages.el --- google-style Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq google-style-packages
    '(
      google-c-style
      ))

;; List of packages to exclude.
(setq google-style-excluded-packages '())

;; For each package, define a function google-style/init-<package-name>
;;
(defun google-style/init-google-c-style ()
  "Initialize my package"
  (use-package google-c-style
    :init
    (progn
        (add-hook 'c-mode-common-hook 'google-set-c-style)
        (add-hook 'c-mode-common-hook 'google-make-newline-indent)
        (add-hook 'c++-mode-common-hook 'google-set-c-style)
        (add-hook 'c++-mode-common-hook 'google-make-newline-indent)
      )))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
