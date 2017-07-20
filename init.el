;; Line Numbers
(global-linum-mode 1)

;; Tool Bar
(tool-bar-mode 0)

;; Fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; INSTALL PACKAGES
(require 'package)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
     '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Load Theme
(load-theme 'material t) ;; load material theme


(defvar myPackages
  '(better-defaults
    elpy
    flycheck
    material-theme))


;; Pyvenv
(use-package pyvenv
  :ensure t
  :config
  (pyvenv-activate "~/miniconda3/envs/npytevec"))

;; Elpy
(elpy-enable)

;; Syntax Checking
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Projectile
(projectile-global-mode)

;; Neotree
(use-package neotree
  :ensure t
  :bind ([f8] . neotree-toggle))

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

;; Hide-Show
(add-hook 'python-mode-hook' hs-minor-mode)
(global-set-key [f1] 'hs-toggle-hiding)

;; Smartparens
(add-hook 'python-mode-hook 'smartparens-mode)
(add-hook 'python-mode-hook 'show-smartparens-mode)

;; Tabbar
(use-package tabbar
  :ensure t
  :bind ([f2] . tabbar-mode))

;; Highlight TODOs
(font-lock-add-keywords 'python-mode
   '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
