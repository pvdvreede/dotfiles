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

(global-set-key (kbd "<escape>") 'keyboard-quit)
(global-set-key (kbd "C-q") 'save-buffers-kill-terminal)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(
    ;; File modes
    yaml-mode
    dockerfile-mode

    ;; Utils
    helm
    evil
    
    ;; Themes
    atom-one-dark-theme))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'yaml-mode)
(require 'dockerfile-mode)

(load-theme 'atom-one-dark t)

(require 'helm-config)
(defadvice helm-display-mode-line (after undisplay-header activate)
  (setq mode-line-format nil)
  (setq header-line-format nil))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-h") 'helm-mini)
(define-key helm-map (kbd "<escape>") 'keyboard-escape-quit)

(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd "C-p") 'helm-find-files)
