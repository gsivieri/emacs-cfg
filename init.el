;; Load Theme
(add-hook 'emacs-startup-hook
  (lambda ()
    (load-theme 'wombat)))

;; Line Numbers
(global-linum-mode 1)

;; Tool Bar
(tool-bar-mode 0)

;; Fullscreen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Package Management
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
     '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

;; Automatic enable anaconda-mode in all Python buffers
(add-hook 'python-mode-hook 'anaconda-mode)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Projectile
(projectile-global-mode)

;; Neotree
(use-package neotree
  :ensure t
  :bind ([f8] . neotree-toggle))

;; Pyvenv
(use-package pyvenv
  :ensure t
  :config
  (pyvenv-activate "~/miniconda3/envs/npytevec"))

;; flycheck mode config
(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  (global-flycheck-mode))

;; Company to display pop-ups
(use-package company
  :ensure t)

(add-hook 'after-init-hook 'global-company-mode)

;; Company-Anaconda
(use-package company-anaconda
  :ensure t)

(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))


;; enable eldoc in your programming modes
(add-hook 'prog-mode-hook 'turn-on-eldoc-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; Hide-Show
(add-hook 'python-mode-hook' hs-minor-mode)
(global-set-key [f1] 'hs-toggle-hiding)

;; Tabbar
(use-package tabbar
  :ensure t
  :bind ([f2] . tabbar-mode))

;; Highlight TODOs
(font-lock-add-keywords 'python-mode
   '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))

;; Smartparens
(add-hook 'python-mode-hook 'smartparens-mode)
(add-hook 'python-mode-hook 'show-smartparens-mode)

;; Multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; backup in one place. flat, no tree structure
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

; Highlight trailing whitespaces
(add-to-list 'load-path "/path/to/highlight-chars")
(require 'highlight-chars)
(add-hook 'python-lock-mode-hook 'hc-highlight-tabs)
(add-hook 'python-mode-hook 'hc-highlight-trailing-whitespace)
