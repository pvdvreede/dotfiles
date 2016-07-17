(blink-cursor-mode -1)

(setq initial-scratch-message "")
(setq inhibit-startup-message t)

(setq visible-bell nil)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)		      

(set-frame-font "Source Code Pro 12")

(setq-default mode-line-format nil)

(set-fringe-mode
 (/ (- (frame-pixel-width)
       (* 120 (frame-char-width))) 2))

(set-face-attribute
  'fringe nil
  :foreground (face-foreground 'default)
  :background (face-background 'default))

(setq pop-up-windows nil)
(setq x-select-enable-clipboard t)

(global-set-key (kbd "<escape>") 'keyboard-quit)
(global-set-key (kbd "C-q") 'save-buffers-kill-terminal)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

(use-package yaml-mode
	     :ensure t)

(use-package dockerfile-mode
	     :ensure t)

(use-package atom-one-dark-theme
	     :ensure t
	     :config
	     (load-theme 'atom-one-dark t))

(use-package helm
	     :commands
	     helm-M-x
	     helm-mini
	     :ensure t
	     :bind
	     (("M-x" . helm-M-x)
	      ("C-p" . helm-mini)
	      :map helm-map
	      ("<escape>" . keyboard-escape-quit))
	     :config
	     (progn
	       (defadvice helm-display-mode-line
		   (after undisplay-header activate)
		 (setq mode-line-format nil)
		 (setq header-line-format nil))))

(use-package evil
	     :ensure t
	     :init
	     (evil-mode 1)
	     :bind
	     (:map evil-normal-state-map
		   (";" . evil-ex)))
	     



