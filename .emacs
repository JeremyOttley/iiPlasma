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
(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init
  (progn
    (color-theme-sanityinc-tomorrow-blue)
    ))

;;------------------------------------------------------------------------------------------------------------------------

(use-package flyspell
  :diminish flyspell-mode
  :init
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (add-hook 'text-mode-hook 'flyspell-mode))

(use-package pdf-tools
  :defer 4
  :diminish pdf-tools-modes
  :init (pdf-tools-install)
  :bind ( :map pdf-view-mode-map
               ("n" . pdf-view-next-line-or-next-page)
               ("p" . pdf-view-previous-line-or-previous-page)
               ("C-n" . pdf-view-next-page-command )
               ("C-p" . pdf-view-previous-page-command)))

;; workaround for pdf-tools not reopening to last-viewed page of the pdf:
;; https://github.com/politza/pdf-tools/issues/18#issuecomment-269515117
(defun brds/pdf-set-last-viewed-bookmark ()
  (interactive)
  (when (eq major-mode 'pdf-view-mode)
    (bookmark-set (brds/pdf-generate-bookmark-name))))

(defun brds/pdf-jump-last-viewed-bookmark ()
  (bookmark-set "fake") ; this is new
  (when
      (brds/pdf-has-last-viewed-bookmark)
    (bookmark-jump (brds/pdf-generate-bookmark-name))))

(defun brds/pdf-has-last-viewed-bookmark ()
  (assoc
   (brds/pdf-generate-bookmark-name) bookmark-alist))

(defun brds/pdf-generate-bookmark-name ()
  (concat "PDF-LAST-VIEWED: " (buffer-file-name)))

(defun brds/pdf-set-all-last-viewed-bookmarks ()
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (brds/pdf-set-last-viewed-bookmark))))

(add-hook 'kill-buffer-hook 'brds/pdf-set-last-viewed-bookmark)
(add-hook 'pdf-view-mode-hook 'brds/pdf-jump-last-viewed-bookmark)
(unless noninteractive  ; as `save-place-mode' does
  (add-hook 'kill-emacs-hook #'brds/pdf-set-all-last-viewed-bookmarks))

;; Display page numbers
(define-pdf-cache-function pagelabels)

(add-hook 'pdf-view-mode-hook
          (lambda ()
            (setq-local mode-line-position
                        '(" ["
                          (:eval (nth (1- (pdf-view-current-page))
                                      (pdf-cache-pagelabels)))
                          "/"
                          (:eval (number-to-string (pdf-view-current-page)))
                          "/"
                          (:eval (number-to-string (pdf-cache-number-of-pages)))
                          "]"))))

;; [PDFTOOLS End]

(use-package try
  :diminish
  :defer 2)

(use-package image-file                 ; Visit images as images
  :init (auto-image-file-mode))

(use-package launch                     ; Open files in external programs
  :defer t)

; Terminal in emacs
(use-package multi-term
  :defer 2
  :diminish
  :commands multi-term)

(use-package eshell-prompt-extras
  :defer 2
  :diminish eshell-mode
  :config
  (with-eval-after-load "esh-opt"
    (autoload 'epe-theme-lambda "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
          eshell-prompt-function 'epe-theme-lambda)))

(use-package eshell-did-you-mean
  :defer 2
  :config (eshell-did-you-mean-setup))

(use-package eshell-git-prompt
  :defer 2
  :config (eshell-git-prompt-use-theme 'git-radar))

