;; -*- lexical-binding: t; -*-

;; Load any packages in ~/.config/emacs/lisp
(add-to-list 'load-path
  	     (expand-file-name "lisp" user-emacs-directory))

;; GNU and NonGNU repositories are enabled by default, so no need to specify.
(setq package-archives
  	     '(("melpa" . "https://melpa.org/packages/")
  	       ("gnu" . "https://elpa.gnu.org/packages/")
  	       ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))


(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

;; Always install if nto installed.
(setq use-package-always-ensure t)

(setq use-package-verbose t
      use-package-expand-minimally nil)

(electric-pair-mode t)
(electric-indent-mode 1)
(show-paren-mode 1)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 100)
(global-auto-revert-mode t)
(setq completions-format 'vertical)

(setq uniquify-buffer-name-style 'forward
      window-resize-pixelwise t
      frame-resize-pixelwise t
      load-prefer-newer t
      backup-by-copying t
      custom-file (expand-file-name "custom.el" user-emacs-directory))

(let ((backup-dir "/tmp/emacs/backups")
      (auto-saves-dir "/tmp/emacs/auto-saves"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
	auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
	auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
	tramp-backup-directory-alist `((".*" . ,backup-dir))
	tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t   ;; Don't delete hardlinks
      delete-old-versions t ;; Clean up backups
      version-control t     ;; Use version numbers on backups
      kept-new-versions 5   ;; Keep five new versions
      kept-old-versions 2)  ;; Keep two old versions

(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(setq
 ;; wr/font-mono "SFMono Nerd Font"
 wr/font-mono "JetBrainsMono Nerd Font"
 ;; wr/font-mono "Maple Mono Normal NL NF"
 wr/font-variable "SF Pro"
 wr/font-base-size 140

 ;; These need to be floating point in order for it to scale when
 ;; increasing / decreasing font size via keybinds.
 wr/font-mono-relative-size 1.0
 wr/font-variable-relative-size 1.0)

(set-face-attribute 'default nil
		    :font wr/font-mono
		    :height wr/font-base-size
		    :weight 'normal)
(set-face-attribute 'variable-pitch nil
		    :font wr/font-variable
		    :height wr/font-variable-relative-size
		    :weight 'normal)
(set-face-attribute 'fixed-pitch nil
		    :font wr/font-mono
		    :height wr/font-mono-relative-size
		    :weight 'normal)

;; This is needed for emacsclient apparently.
(add-to-list 'default-frame-alist
	     (cons 'font
		   (format "%s-%d" wr/font-mono (/ wr/font-base-size 10))))

(setq-default line-spacing nil)

(cond ((eq system-type 'darwin)
       ;; Mac
       (custom-set-variables
	'(mac-command-modifier 'meta)
	'(mac-option-modifier 'alt)
	'(mac-right-option-modifier 'super))
       (bind-key "M-0" 'wr/text-scale-reset)
       (bind-key "M-+" 'text-scale-increase)
       (bind-key "M-=" 'text-scale-increase)
       (bind-key "M--" 'text-scale-decrease)
       (use-package exec-path-from-shell
	   :config
	   (exec-path-from-shell-initialize))
       )

      ((eq system-type 'windows-nt)
       ;; Windows
       )

      ((eq system-type 'gnu/linux)
       ;; Linux
       ))

(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

(custom-set-variables '(show-trailing-whitespace t))

(fset 'yes-or-no-p 'y-or-n-p)

(setq switch-to-prev-buffer-skip-regexp '("\\*Messages\\*"
					  "\\*Warnings\\*"
					  "\\*Help\\*"
					  "\\*Completions\\*"
					  "\\*Compile-Log\\*"
					  "\\*Native-compile-Log"))

(defun wr/text-scale-reset ()
  (interactive)
  (text-scale-set 0))

(defun wr/open-config-org ()
  (interactive)
  (find-file "~/.config/emacs/config.org"))

(defun wr/tangle-and-reload-config ()
  (interactive)
  (message "Tangling file %s" (expand-file-name "config.org" user-emacs-directory))
  (org-babel-tangle-file (expand-file-name "config.org" user-emacs-directory))
  (load-file (expand-file-name "config.el" user-emacs-directory)))

(use-package ef-themes
  :vc (:url "https://github.com/protesilaos/ef-themes" :rev :newest)
  :init
  (ef-themes-take-over-modus-themes-mode 1)
  :config
  (setq modus-themes-italic-constructs nil)
  (modus-themes-load-theme 'ef-duo-light))

(use-package evil
  :demand t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump t)
  (setq evil-want-C-w-delete nil)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-respect-visual-line-mode t)
  (setq evil-kill-on-visual-paste nil)
  ;; (setq evil-undo-system undo-tree) ;; or undo-fu
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-commentary
  :config
  (evil-commentary-mode))

(use-package general
  :config
  (general-evil-setup))

(use-package which-key
  :init
  (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'bottom
	which-key-sort-order #'which-key-key-order-alpha
	which-key-sort-uppercase-first nil
	which-key-add-column-padding 1
	which-key-max-display-columns nil
	which-key-min-display-lines 6
	which-key-side-window-slot -10
	which-key-side-window-max-height 0.25
	which-key-idle-delay 0.8
	which-key-max-description-length 30
	which-key-allow-imprecise-window-fit t))
	;;which-key-separator "  "))

(use-package nerd-icons)

(use-package org
  :after nerd-icons
  :custom
  (org-directory "~/org")
  (org-log-done 'time)
  (org-startup-indented t)
  (org-log-into-drawer t)
  (org-special-ctrl-a/e t)
  (org-special-ctrl-k t)
  (org-confirm-babel-evaluate t)
  (org-src-fontify-natively t)
  (org-src-tab-acts-natively t)
  (org-hide-emphasis-markers t)
  (prettify-symbols-unprettify-at-point 'right-edge)
  (org-fontify-done-headline t)
  (org-fontify-whole-heading-line t)
  (org-tags-column 0)
  (org-list-indent-offset 2) ;; add a little extra indent to make it look good
  (x-underline-at-descent-line t)
  (org-todo-keywords '((sequence "TODO(t)"
				 "NEXT(n!/!)"
				 "WAITING(w@!/!)"
				 "|"
				 "DONE(d!)"
				 "CANCELED(c@!)")
                       (sequence "PROJECT(p)"
				 "IDEA(i)"
				 "NOTE(o)")))
  (org-todo-keyword-faces
   '(("AREA" . "DarkOrchid1")
     ("[AREA]" . "DarkOrchid1")))
  :custom-face
  (org-done ((nil (:strike-through t :foreground "#808080"))))
  (org-headline-done ((nil (:strike-through t :foreground "#808080"))))
  (org-document-title ((t (:height 1.1 :weight bold))))
  (org-level-1 ((t (:height 1.1 :weight bold :background "#F9D4A0" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (org-level-2 ((t (:height 1.1 :weight bold :background "#EDE4FC" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (org-level-3 ((t (:height 1.1 :weight bold :background "#FCE4C8" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (org-level-4 ((t (:height 1.1 :weight bold :background "#C8E0F0" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (org-level-5 ((t (:height 1.1 :weight bold :background "#FAD0B8" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (org-level-6 ((t (:height 1.1 :weight bold :background "#D4ECD4" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (org-level-7 ((t (:height 1.1 :weight bold :background "#F0C8E0" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (org-level-8 ((t (:height 1.1 :weight bold :background "#F5EAA0" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  :hook
  (org-mode . (lambda ()
            	(set-fontset-font t 'symbol (font-spec :family "Symbols Nerd Font Mono") nil 'prepend)
            	(set-fontset-font "fontset-default" 'unicode '("Symbols Nerd Font Mono"))
            	(setq prettify-symbols-alist '(("[ ]" . "󰄱" )
                                               ("[X]" . "󰱒")
                                               ("[-]" . "󰛲")))
            	(prettify-symbols-mode)))
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((ruby . t)
     (latex . t)
     (plantuml . t)
     (python . t)
     (shell . t)
     (dot . t)
     (org . t)))
  )


(with-eval-after-load 'org
  (setq org-structure-template-alist
        '(("c" . "center")
          ("ex" . "export")
          ("ea" . "export ascii")
          ("eh" . "export html")
          ("el" . "export latex")
          ("E" . "example")
          ("q" . "quote")
          ("s" . "src")
          ("1" . "src emacs-lisp")
          ("2" . "src java")
          ("v" . "verse"))))

(use-package toc-org
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

(use-package org-modern
  :custom
  (org-modern-label-border 0.1)
  (org-modern-star 'replace)
  ;;(org-modern-replace-stars "")
  (org-modern-replace-stars "     ")
  (org-modern-table-horizontal 3)
  (org-modern-checkbox '((?X . "󰱒")
			 (?- . "󰛲")
			 (?\s . "󰄱")))
  (org-modern-list '((?+ . "◦")
		     (?- . "•")
		     (?* . "•")))

  :custom-face
  (org-modern-label ((t (:inherit fixed-pitch :height 1.0 ))))
  :hook
  (org-mode . org-modern-mode))

(use-package org-appear
  :vc (:url "https://github.com/awth13/org-appear" :rev :newest)
  :after org
  :hook
  (org-mode . org-appear-mode))

(use-package org-contrib
  :config
  (require 'ox-extra)
  (ox-extras-activate '(ignore-headlines)))

(use-package ultra-scroll
  :vc (:url "https://github.com/jdtsmith/ultra-scroll" :rev :newest)
  :init
  (setq scroll-conservatively 3
        scroll-margin 0)
  :config
  (ultra-scroll-mode 1))

(use-package expand-region)

(use-package sudo-edit)

(use-package hydra
  :after evil
  :defer t)

(defun wr/evil-window-increase-width-five ()
  "Increase window width by 5"
  (interactive)
  (evil-window-increase-width 5))

(defun wr/evil-window-decrease-width-five ()
  "Decrease window width by 5"
  (interactive)
  (evil-window-decrease-width 5))

(defhydra hydra-window-resize ()
  "resize"
  ("<" wr/evil-window-decrease-width-five "-width")
  (">" wr/evil-window-increase-width-five "+width")
  ("-" evil-window-decrease-height "-height")
  ("_" evil-window-decrease-height "-height")
  ("+" evil-window-increase-height "+height")
  ("=" balance-windows "balance"))

(dolist (key '("<" ">" "-" "_" "+" "="))
  (define-key evil-window-map (kbd key) 'hydra-window-resize/body))

(with-eval-after-load 'general
  (general-define-key
   :states '(normal visual)
   "}" 'next-buffer
   "{" 'previous-buffer
   "M-;" 'evil-commentary
   "C-=" 'er/expand-region)

  (general-create-definer leader-keys
    :prefix "SPC"
    :global-prefix "C-S-SPC")

  (general-create-definer local-leader-keys
    :prefix "SPC m"
    :global-prefix "C-S-SPC m")

  (leader-keys
    :states '(normal visual insert emacs)
    :keymaps 'override
    "b" '(:ignore t :wk "buffer")
    "b b" '(switch-to-buffer :wk identity)
    "b i" '(ibuffer :wk identity)
    "b d" '(kill-current-buffer :wk identity)
    "b D" '(kill-buffer :wk identity)
    "b n" '(next-buffer :wk identity)
    "b p" '(previous-buffer :wk identity)
    "b r" '(revert-buffer :wk "reload buffer")

    "B" '(:ignore t :wk "bookmarks TODO")
    ;; Bb/BB list bookmarks
    ;; Bg list global bookmarks? (bookmarks that are always saved in config.org?)
    ;; Bt toggle bookmark
    ;; Bx clear non-global bookmarks?
    ;; Ba annotate bookmark?
    ;; Bj move down?
    ;; Bk move up?
    ;; Bn next bookmark?
    ;; Bp previous bookmark?


    "d" '(:ignore t :wk "dired TODO")
    "d d" '(dired :wk identity)

    "e" '(:ignore t :wk "eval")
    "e b" '(eval-buffer :wk identity)
    "e d" '(eval-defun :wk identity)
    "e e" '(eval-expression :wk identity)
    "e l" '(eval-last-sexp :wk identity)
    "e r" '(eval-region :wk identity)
    "e c" '(wr/tangle-and-reload-config :wk identity)

    "f" '(:ignore t :wk "find")
    "f f" '(find-file :wk identity)
    "f r" '(recentf-open-files :wk "recent files")
    "f u" '(sudo-edit-find-file :wk identity)
    "f U" '(sudo-edit :wk identity)
    "f 1" '(wr/open-config-org :wk "open config.org")
    ;; f g grep/ripgrep/ag

    "g" '(:ignore t :wk "git TODO")
    ;; gs magit
    ;; gb show branches
    ;; gB blame?
    ;; gBl blame line?
    ;; gc +commits
    ;; gcc show commits
    ;; gcb show branch commits
    ;; gf git file past versions?
    ;; gl git log all
    ;; gL git log branch

    "H" '(:ignore t :wk "help")
    "H f" '(describe-function :wk identity)
    "H F" '(describe-face :wk identity)
    "H v" '(describe-variable :wk identity)
    "H k" '(describe-key :wk identity)

    "n" '(:ignore t :wk "treemacs/nerdtree TODO")

    "o" '(:ignore t :wk "org TODO")

    "p" '(:ignore t :wk "harpoon TODO")

    "t" '(:ignore t :wk "terminal TODO")

    "w" '(:ignore t :wk "window")
    "w +" '(hydra-window-resize/body :wk "+height")
    "w -" '(hydra-window-resize/body :wk "-height")
    "w _" '(hydra-window-resize/body :wk "-height")
    "w <" '(hydra-window-resize/body :wk "-width")
    "w =" '(hydra-window-resize/body :wk "balance windows")
    "w >" '(hydra-window-resize/body :wk "+width")
    "w b" '(evil-window-bottom-right :wk identity)
    "w c" '(evil-window-delete :wk identity)
    "w d" '(evil-window-delete :wk identity)
    "w h" '(evil-window-left :wk identity)
    "w H" '(evil-window-move-far-left :wk identity)
    "w j" '(evil-window-down :wk identity)
    "w J" '(evil-window-move-very-bottom :wk identity)
    "w k" '(evil-window-up :wk identity)
    "w K" '(evil-window-move-very-top :wk identity)
    "w l" '(evil-window-right :wk identity)
    "w L" '(evil-window-move-far-right :wk identity)
    "w n" '(evil-window-new :wk identity)
    "w o" '(evil-window-other-windows :wk identity)
    "w p" '(evil-window-mru :wk identity)
    "w r" '(evil-window-rotate-downwards :wk identity)
    "w R" '(evil-window-rotate-upwards :wk identity)
    "w s" '(evil-window-split :wk identity)
    "w S" '(evil-window-split :wk identity)
    "w t" '(evil-window-top-left :wk identity)
    "w v" '(evil-window-vsplit :wk identity)
    "w w" '(evil-window-next :wk identity)
    "w W" '(evil-window-prev :wk identity)
    "w |" '(evil-window-set-width :wk identity)
    "w C-_" '(evil-window-set-height :wk identity)


    "." '(:ignore t :wk "multiple cursors TODO")
    ;; ./ select with regex
    ;; .. add cursor @ pos

    ";" '(:ignore t :wk "settings")
    "; l" '(display-line-numbers-mode :wk "toggle line numbers")
    "; RET" '(visual-line-mode :wk "toggle word wrap")
    ;; ;l toggle relative line numbers
    ;; ;L toggle line numbers
    ;; ;o toggle showing overlength (highlight characters past 80 char)
    ;; ;t +tabs/spaces
    ;; ;tt toggle between tabs and spaces
    ;; ;tc convert all to tabs / spaces
    ;; ;tw prompt for tab width
    ;; ;t1 set to 1 char tab width
    ;; ;t2 set to 1 char tab width
    ;; ;t3 set to 1 char tab width
    ;; ;t4 set to 1 char tab width
    ;; ;t8 set to 1 char tab width
    ;; ;w cycle between showing whitespace
    ;; ;SPC remove trailing spaces
    )


  (local-leader-keys
    :states '(normal visual insert emacs)
    :keymaps 'org-mode-map
    "#" '(org-insert-structure-template :wk "insert template")
    "y" '(org-store-link :wk identity)
    "p" '(org-insert-link :wk identity)))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (message "Emacs ready in %s with %d garbage collectios."
		     (format "%.2f seconds"
			     (float-time
			      (time-subtract after-init-time before-init-time)))
		     gcs-done)))
