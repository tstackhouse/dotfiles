;(server-start)
;(global-font-lock-mode 1)

; Fix the backspace key.
(keyboard-translate ?\C-h ?\C-?)
(keyboard-translate ?\C-\\ ?\C-h)

; use a scrollwheel.
(progn
  (global-set-key [mouse-5] (lambda () (interactive) (scroll-up 3)))
  (global-set-key [mouse-4] (lambda () (interactive) (scroll-down 3)))
  (global-set-key [M-mouse-5] (lambda () (interactive) (scroll-up 20)))
  (global-set-key [M-mouse-4] (lambda () (interactive) (scroll-down 20)))
)

;do the tab key!
(setq-default tab-width 2)
;(setq-default indent-tabs-mode nil) ;??? - for TeX?

;psgml-mode enablers
(setq sgml-set-face t)
(setq sgml-auto-activate-dtd t)
(setq sgml-indent-data t)

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

                                        ;MELPA package manager
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
