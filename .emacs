(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; Built-ins
(electric-pair-mode)
(global-linum-mode)

;; Packages
(use-package evil
  :ensure t
  :config
  (evil-define-key 'normal neotree-mode-map (kbd "C-w h") 'evil-window-left)
  (evil-define-key 'normal neotree-mode-map (kbd "C-w j") 'evil-window-down)
  (evil-define-key 'normal neotree-mode-map (kbd "C-w k") 'evil-window-up)
  (evil-define-key 'normal neotree-mode-map (kbd "C-w l") 'evil-window-right)
  (use-package evil-surround :ensure t :config (global-evil-surround-mode)))
  (use-package evil-leader
    :ensure t
    :config
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key "<SPC>" 'helm-M-x)
    (evil-leader/set-key "t n" 'linum-mode nil)
    (evil-leader/set-key "g s" 'magit-status)
    (evil-leader/set-key "p f" 'helm-projectile)
    (evil-leader/set-key "b f" 'helm-mini)
    (evil-leader/set-key "f f" 'helm-find-files)
    (global-evil-leader-mode))
  (evil-mode 1)

(use-package helm
  :ensure t
  :config (helm-mode)
  :bind
  ("M-x" . 'helm-M-x))

(use-package magit
  :ensure t
  :config
  (use-package evil-magit :ensure t :config 'evil-magit))

(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  (use-package helm-projectile
    :ensure t
    :bind
    ("M-p" . 'helm-projectile)))
  
(use-package neotree
  :ensure t
  :config
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  :bind
  ("C-\\" . 'neotree-toggle))

(use-package company :ensure t)
(use-package company-go :ensure t)

(use-package go-mode
  :ensure t
  :config
  (add-hook 'go-mode-hook
    (lambda ()
      (set (make-local-variable 'company-backends) '(company-go))
      (company-mode))))

(use-package yaml-mode :ensure t)


;; Emacs customization. For package configuration use use-package above.
(add-to-list 'auto-mode-alist '("\\.sls\\'" . yaml-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum-format "%d ")
 '(frame-background-mode (quote dark))
 '(menu-bar-mode nil)
 '(package-selected-packages (quote (evil-mode evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "black" :foreground "lightgray"))))
 '(linum ((t (:foreground "white")))))
