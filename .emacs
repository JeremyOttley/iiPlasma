;;; ----- package manager ----- ;;;
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize) ;; package configs

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package) ;; bootstraps use-package

;;; ----- evil mode ----- ;;;
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;;; ----- org mode ----- ;;;
(use-package org
  :ensure org-plus-contrib
  :pin org
  :defer 4
  :diminish org-mode-hook
  :bind ("C-c x c" . org-capture)
  ("C-c x l" . org-store-link)
  ("C-c x a" . org-agenda)
  ("C-c x b" . org-switchb)
  :config
  ;; (define-key global-map "\C-c xl" 'org-store-link)
  ;; (defbine-key global-map "\C-c xa" 'org-agenda)
  (setq org-log-done t)
  ;; make tab act as if it were issued in a buffer of the languageâ€™s major mode.
  (setq org-src-tab-acts-natively t)
  ;; enable spell-checking in org-mode.
  (add-hook 'org-mode-hook 'flyspell-mode))

;; bullets instead of a list of asterisks
(use-package org-bullets
  :defer 4
  :config
  ;; downward-pointing arrow instead of the usual ellipsis
  (setq org-ellipsis "⤵")
  (setq org-src-fontify-natively t)
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))

(use-package toc-org
  :config (add-hook 'org-mode-hook 'toc-org-enable))

(use-package htmlize
  :defer 4)

(use-package ox-twbs
  :defer 4)

;;; ----- projectile ----- ;;;
(use-package projectile
  :ensure t
  :init
  (setq projectile-require-project-root nil)
  :config
  (projectile-mode 1))

;;; ----- dashboard ----- ;;;
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "[ W E L C O M E ! ]")
(setq dashboard-startup-banner "~/.emacs.d/logo.png")

;;; ----- page break lines ----- ;;;
(use-package page-break-lines
  :ensure t
  :config
  (setq global-page-break-lines-mode t))


;;; ----- themes ----- ;;;
(use-package tao-theme 
:ensure t
:config
(load-theme 'tao-yin t))
