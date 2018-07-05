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
(use-package diminish
  :ensure t
  :config
  (diminish 'undo-tree-mode))

(use-package evil
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "C-w h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-w j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-w k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-w l") 'evil-window-right)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (use-package evil-surround :ensure t :config (global-evil-surround-mode)))
  (use-package evil-leader
    :ensure t
    :config
    (evil-leader/set-leader "<SPC>")                         ;; spacemacs rip-off

    (evil-leader/set-key "<SPC>" 'helm-M-x)                  ;; M-x alternative

    (which-key-add-key-based-replacements "<SPC> t" "toggle")
    (evil-leader/set-key "t n" 'linum-mode nil)              ;; toggle numbers

    (which-key-add-key-based-replacements "<SPC> c" "comment")
    (evil-leader/set-key "c l" 'comment-line)                ;; toggle line comment

    (which-key-add-key-based-replacements "<SPC> g" "git")
    (evil-leader/set-key "g s" 'magit-status)                ;; git status

    (which-key-add-key-based-replacements "<SPC> p" "project")
    (evil-leader/set-key "p f" 'helm-projectile)             ;; project find

    (which-key-add-key-based-replacements "<SPC> b" "buffer")
    (evil-leader/set-key "b f" 'helm-mini)                   ;; buffer find
    (evil-leader/set-key "b n" 'evil-next-buffer)            ;; buffer next
    (evil-leader/set-key "b p" 'evil-previous-buffer)        ;; buffer previous
    (evil-leader/set-key "b r" 'revert-buffer)               ;; buffer revert/reload

    (which-key-add-key-based-replacements "<SPC> w" "window")
    (evil-leader/set-key "w |" 'evil-window-vsplit)          ;; window vertical split
    (evil-leader/set-key "w -" 'evil-window-split)           ;; window horizontal split

    (which-key-add-key-based-replacements "<SPC> f" "files")
    (evil-leader/set-key "f f" 'helm-find-files)             ;; files find
    (global-evil-leader-mode))
  (evil-mode 1)

(use-package helm
  :ensure t
  :diminish helm-mode
  :config (helm-mode)
  :bind
  ("M-x" . 'helm-M-x))

(use-package magit
  :ensure t
  :diminish magit-mode
  :config
  (use-package evil-magit :ensure t :config 'evil-magit))

(use-package projectile
  :ensure t
  :diminish projectile-mode
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
  (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "|") 'neotree-enter-vertical-split)
  (evil-define-key 'normal neotree-mode-map (kbd "-") 'neotree-enter-horizontal-split)
  :bind
  ("C-\\" . 'neotree-toggle))

(use-package company :ensure t)
(use-package company-go :ensure t)
(use-package company-anaconda :ensure t)

(use-package go-mode
  :ensure t
  :config
  (add-hook 'go-mode-hook
    (lambda ()
      (set (make-local-variable 'company-backends) '(company-go))
      (company-mode))))

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.sls\\'" . yaml-mode)))

(use-package yasnippet
  :ensure t
  :config
  (evil-define-key 'insert yas-minor-mode-map (kbd "TAB") 'yas-expand)
  (setq yas-snippet-dirs
	'("~/.emacs.d/snippets")))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(frame-background-mode (quote dark))
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(linum-format "%d ")
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
 '(linum ((t (:foreground "white"))))
 '(mode-line ((t (:inherit default :foreground "white"))))
 '(mode-line-inactive ((t (:inherit default :foreground "cyan")))))
