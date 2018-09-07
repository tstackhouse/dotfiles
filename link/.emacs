; MELPA package manager
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
; /MELPA package manager



(setq-default indent-tabs-mode t)		; use tabs for indentation, not spaces
(setq tab-width 2)				; display with a tab width of 2 by default
(defvaralias 'c-basic-offset 'tab-width)	; ensure consistency
(defvaralias 'cperl-indent-level 'tab-width)	; ensure consistency 
(setq vc-follow-symlinks nil)			; warn (but don't prompt) when opening files linked from VCS controllerd paths
;(smart-tabs-insinuate 'javascript)		; use smart tabs
