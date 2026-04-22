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

;; (toggle-debug-on-error)
(setq use-package-verbose t
      use-package-expand-minimally nil)

;; (electric-pair-mode t) ; Replaced with smartparens
(electric-indent-mode 1)
(show-paren-mode 1)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 100)
(global-auto-revert-mode t)
(setq completions-format 'vertical)
(blink-cursor-mode 0)
(setq fill-column 80)
(setq display-fill-column-indicator-column 80)
(setq ring-bell-function 'ignore)
(setq vc-follow-symlinks t) ;; Don't prompt y/n for opening a symbolic link in a git repo
(column-number-mode 1) ;; show column # in modeline
(pixel-scroll-precision-mode) ;; should allow smooth scrolling over images in org mode

(setq uniquify-buffer-name-style 'forward
      window-resize-pixelwise t
      frame-resize-pixelwise t
      load-prefer-newer t
      backup-by-copying t
      global-auto-revert-non-file-buffers t ;; auto revert dired and ibuffer
      kill-do-not-save-duplicates t
      custom-file (expand-file-name "custom.el" user-emacs-directory))

(delete-selection-mode 1)

(dolist (mode '(prog-mode-hook))
  (add-hook mode (lambda ()
		   (display-fill-column-indicator-mode t))))

(setq word-wrap-by-category t)
(modify-category-entry ?/ ?| (standard-category-table))

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
       (setq dired-use-ls-dired nil) ;; ls --dired not supported on mac
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

(custom-set-variables '(show-trailing-whitespace nil)) ;; turns this off because it's annoying and sometimes I keep whitespacing in headings to make it look even

(fset 'yes-or-no-p 'y-or-n-p)

(setq switch-to-prev-buffer-skip-regexp '("\\*Messages\\*"
					  "\\*Warnings\\*"
					  "\\*Help\\*"
					  "\\*Completions\\*"
					  "\\*Compile-Log\\*"
					  "\\*Ibuffer\\*"
					  "\\*Native-compile-Log"))

;; Stop dired from spawning so many buffers when navigating
(setq dired-kill-when-opening-new-dired-buffer t)

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

(defun wr/org-add-trailing-space-to-headings ()
  "Ensures every org heading ends with a trailing space, unless it ends with a tag."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "^\\*+ " nil t)
      (end-of-line)
      (unless (or (eq (char-before) ?\s)
		  (eq (char-before) ?:))
	(insert " ")))))

(defun wr/scroll-half-page-down ()
  (interactive)
  (scroll-up (/ (window-height) 2)))

(defun wr/scroll-half-page-up ()
  (interactive)
  (scroll-down (/ (window-height) 2)))

(global-set-key (kbd "C-v") #'wr/scroll-half-page-down)
(global-set-key (kbd "M-v") #'wr/scroll-half-page-up)

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
  (org-fontify-done-headline nil)
  (org-fontify-whole-heading-line nil) ;; made the heading go across the whole line
  (org-cycle-separator-lines 1) ;; this ensures that collapsing all headings still keeps at least 1 space between headings
  (org-tags-column 0)
  ;; (org-list-indent-offset 2) ;; add a little extra indent to make it look good
  (org-list-indent-offset 0)
  (org-startup-with-inline-images t) ;; show inline images
  (x-underline-at-descent-line t)
  (org-todo-keywords '((sequence "TODO(t)"
 				 "NEXT(n!/!)"
 				 "WAITING(w@!/!)"
 				 "|"
 				 "DONE(d!)"
 				 "CANCELED(c@!)")
                       (sequence "INBOX(i)"
 				 "PROJECT(p)"
 				 "IDEA(I)"
 				 "NOTE(o)")))
  (org-todo-keyword-faces
   '(("INBOX" . "DarkOrchid1")
     ("PROJECT" . +org-todo-test)
     ("WAITING" :background "blue")))
  :custom-face
  ;;(org-done ((nil (:strike-through t :foreground "#808080"))))
  ;;(org-headline-done ((nil (:strike-through t :foreground "#808080"))))
  (org-document-title ((t (:height 1.1 :weight bold))))
  (org-level-1 ((t (:height 1.1 :weight bold :background "#F9D4A0" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (org-level-2 ((t (:height 1.1 :weight bold :background "#EDE4FC" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (org-level-3 ((t (:height 1.1 :weight bold :background "#FCE4C8" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (org-level-4 ((t (:height 1.1 :weight bold :background "#C8E0F0" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (org-level-5 ((t (:height 1.1 :weight bold :background "#FAD0B8" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (org-level-6 ((t (:height 1.1 :weight bold :background "#D4ECD4" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (org-level-7 ((t (:height 1.1 :weight bold :background "#F0C8E0" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (org-level-8 ((t (:height 1.1 :weight bold :background "#F5EAA0" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  ;; (org-level-1 ((t (:height 1.1 :weight bold :background "#F9D4A0" :foreground "#000000" ))))
  ;; (org-level-2 ((t (:height 1.1 :weight bold :background "#EDE4FC" :foreground "#000000" ))))
  ;; (org-level-3 ((t (:height 1.1 :weight bold :background "#FCE4C8" :foreground "#000000" ))))
  ;; (org-level-4 ((t (:height 1.1 :weight bold :background "#C8E0F0" :foreground "#000000" ))))
  ;; (org-level-5 ((t (:height 1.1 :weight bold :background "#FAD0B8" :foreground "#000000" ))))
  ;; (org-level-6 ((t (:height 1.1 :weight bold :background "#D4ECD4" :foreground "#000000" ))))
  ;; (org-level-7 ((t (:height 1.1 :weight bold :background "#F0C8E0" :foreground "#000000" ))))
  ;; (org-level-8 ((t (:height 1.1 :weight bold :background "#F5EAA0" :foreground "#000000" ))))
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
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
  )

;; redisplay images after executing code blocks
(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

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

(defface wr/org-modern-todo-todo
  '((t :height 1.1
	 :background "#FF9E9E" ;; red
       :foreground "#000000"
       :box (:line-width -1 :color "#000000")))
  "Todo todo face.")

(defface wr/org-modern-todo-next
  '((t :background "gray90" ;; gray
       :foreground "#000000"
       :box (:line-width -1 :color "#000000")))
  "Next todo face.")

(defface wr/org-modern-todo-waiting
  '((t :background "#FFAC63" ;; orange
       :foreground "#000000"
       :box (:line-width -1 :color "#000000")))
  "Waiting todo face.")

(defface wr/org-modern-todo-done
  '((t :background "#9EFFB0" ;; green
       :foreground "#000000"
       :box (:line-width -1 :color "#000000")))
  "Done todo face.")

(defface wr/org-modern-todo-canceled
  '((t :background "#C72626" ;; dark red
       :foreground "#FFFFFF"
       :box (:line-width -1 :color "#000000")))
  "Canceled todo face.")

(defface wr/org-modern-todo-inbox
  '((t :background "gold" ;; yellow
       :foreground "#000000"
       :box (:line-width -1 :color "#000000")))
  "Inbox todo face.")

(defface wr/org-modern-todo-project
  '((t :background "#D4BFFF" ;; purple
       :box (:line-width -1 :color "#000000")))
  "Project todo face.")

(defface wr/org-modern-todo-idea
  '((t :background "#BFFFF6" ;; cyan
       :box (:line-width -1 :color "#000000")))
  "Idea todo face.")

(defface wr/org-modern-todo-note
  '((t :background "#9ECDFF" ;; blue
       :box (:line-width -1 :color "#000000")))
  "Note todo face.")


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
  (org-modern-todo-faces
   '(("TODO" . wr/org-modern-todo-todo)
     ("NEXT" . wr/org-modern-todo-next)
     ("WAITING" . wr/org-modern-todo-waiting)
     ("DONE" . wr/org-modern-todo-done)
     ("CANCELED" . wr/org-modern-todo-canceled)
     ("INBOX" . wr/org-modern-todo-inbox)
     ("PROJECT" . wr/org-modern-todo-project)
     ("IDEA" . wr/org-modern-todo-idea)
     ("NOTE" . wr/org-modern-todo-note)))
  :custom-face
  (org-modern-label ((t (:inherit fixed-pitch :height 1.0))))
  (org-modern-tag ((t (:inherit fixed-pitch :foreground "#000000" :background "gray90" :height 1.0 :box (:line-width -1 :color "#000000")))))
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

(setq org-plantuml-jar-path (expand-file-name "~/lsp/plantuml-1.2026.2.jar"))

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

(use-package magit
  :defer t
  ;; :commands
  ;; (magit-status magit-get-current-branch)
  :custom
  ;; Open in the same window, not a different window
  ;;(magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
  ;; Show character level changes
  (magit-diff-refine-hunk 'all))

(use-package smartparens
  :hook (prog-mode text-mode markdown-mode org-mode)
  :config
  (require 'smartparens-config))

(use-package markdown-mode
  :defer t
  :mode ("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode)
  :init
  (setq markdown-italic-underscore t
    	markdown-gfm-additional-languages '("sh")
    	markdown-make-gfm-checkboxes-buttons t
    	;; markdown-hide-markup t
    	markdown-fontify-whole-heading-line t
    	markdown-fontify-code-blocks-natively t
	markdown-command "pandoc -f markdown -t html --mathjax --highlight-style=kate"
    	markdown-open-command (cond ((featurep :system 'macos) "open")
                                    ((featurep :system 'linux) "xdg-open"))
    	markdown-content-type "application/xhtml+xml"
    	markdown-css-paths '("https://cdn.jsdelivr.net/npm/github-markdown-css/github-markdown.min.css"
                             "https://cdn.jsdelivr.net/gh/highlightjs/cdn-release/build/styles/github-dark.min.css")
    	markdown-xhtml-header-content
    	(concat "<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>"
    		"<style> body { box-sizing: border-box; max-width: 740px; width: 100%; margin: 40px auto !important; padding: 0 10px; } </style>"
    		"<script id='MathJax-script' async src='https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js'></script>"
    		"<script src='https://cdn.jsdelivr.net/gh/highlightjs/cdn-release/build/highlight.min.js'></script>"
    		"<script>document.addEventListener('DOMContentLoaded', () => { document.body.classList.add('markdown-body'); document.querySelectorAll('pre[lang] > code').forEach((code) => { code.classList.add(code.parentElement.lang); }); document.querySelectorAll('pre > code').forEach((code) => { hljs.highlightBlock(code); }); });</script>")
    	;; Disabled to prevent accidentally clicking links while focusing Emacs
    	;; or a markdown buffer. We prefer keyboard-centric workflows anyway and
    	;; already have ffap or lookup commands for opening links at point (e.g.
    	;; gf or pressing RET on a link).
    	markdown-mouse-follow-link nil
        markdown-list-item-bullets '("•" "◦" "▸"))

  :custom-face
  (markdown-header-face-1 ((t (:height 1.1 :weight bold :background "#F9D4A0" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (markdown-header-face-2 ((t (:height 1.1 :weight bold :background "#EDE4FC" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (markdown-header-face-3 ((t (:height 1.1 :weight bold :background "#FCE4C8" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (markdown-header-face-4 ((t (:height 1.1 :weight bold :background "#C8E0F0" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (markdown-header-face-5 ((t (:height 1.1 :weight bold :background "#FAD0B8" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (markdown-header-face-6 ((t (:height 1.1 :weight bold :background "#D4ECD4" :foreground "#000000" :overline "#000000" :underline "#000000"))))
  (markdown-header-face ((t (:height 1.1 :weight bold :background "#F0C8E0" :foreground "#000000" :overline "#000000" :underline "#000000")))))

;; (set-flyspell-predicate! `(markdown-mode gfm-mode) #'+markdown-flyspell-word-p)
;; (set-lookup-handlers! '(markdown-mode gfm-mode)
;;                     ;; `markdown-follow-thing-at-point' may open an external program or a
;;                     ;; buffer. No good way to tell, so pretend it's async.
;;                     :file '(markdown-follow-thing-at-point :async t))

;; ;; Highly rust blocks correctly
;; (when (modulep! :lang rust)
;;   (add-to-list 'markdown-code-lang-modes '("rust" . rustic-mode)))

;; ;; Don't trigger autofill in code blocks (see `auto-fill-mode')
;; (setq-hook! 'markdown-mode-hook
;;   fill-nobreak-predicate (cons #'markdown-code-block-at-point-p
;;                                fill-nobreak-predicate))

;; ;; HACK: Prevent mis-fontification of YAML metadata blocks in `markdown-mode'
;; ;;   which occurs when the first line contains a colon in it. See
;; ;;   jrblevin/markdown-mode#328.
;; (defadvice! +markdown-disable-front-matter-fontification-a (&rest _)
;;   :override #'markdown-match-generic-metadata
;;   (ignore (goto-char (point-max))))

;; ;; HACK: markdown-mode calls a major mode without inhibiting its hooks, which
;; ;;   could contain expensive functionality. I suppress it to speed up their
;; ;;   fontification.
;; (defadvice! +markdown-optimize-src-buffer-modes-a (fn &rest args)
;;   :around #'markdown-fontify-code-block-natively
;;   (delay-mode-hooks (apply fn args)))

;; (map! :map markdown-mode-map
;;       :localleader
;;       "'" #'markdown-edit-code-block
;;       "o" #'markdown-open
;;       "p" #'markdown-preview
;;       "e" #'markdown-export
;;       (:when (modulep! +grip)
;;        "p" #'grip-mode)
;;       (:prefix ("i" . "insert")
;;        :desc "Table Of Content"  "T" #'markdown-toc-generate-toc
;;        :desc "Image"             "i" #'markdown-insert-image
;;        :desc "Link"              "l" #'markdown-insert-link
;;        :desc "<hr>"              "-" #'markdown-insert-hr
;;        :desc "Heading 1"         "1" #'markdown-insert-header-atx-1
;;        :desc "Heading 2"         "2" #'markdown-insert-header-atx-2
;;        :desc "Heading 3"         "3" #'markdown-insert-header-atx-3
;;        :desc "Heading 4"         "4" #'markdown-insert-header-atx-4
;;        :desc "Heading 5"         "5" #'markdown-insert-header-atx-5
;;        :desc "Heading 6"         "6" #'markdown-insert-header-atx-6
;;        :desc "Code block"        "C" #'markdown-insert-gfm-code-block
;;        :desc "Pre region"        "P" #'markdown-pre-region
;;        :desc "Blockquote region" "Q" #'markdown-blockquote-region
;;        :desc "Checkbox"          "[" #'markdown-insert-gfm-checkbox
;;        :desc "Bold"              "b" #'markdown-insert-bold
;;        :desc "Inline code"       "c" #'markdown-insert-code
;;        :desc "Italic"            "e" #'markdown-insert-italic
;;        :desc "Footnote"          "f" #'markdown-insert-footnote
;;        :desc "Header dwim"       "h" #'markdown-insert-header-dwim
;;        :desc "Italic"            "i" #'markdown-insert-italic
;;        :desc "Kbd"               "k" #'markdown-insert-kbd
;;        :desc "Pre"               "p" #'markdown-insert-pre
;;        :desc "New blockquote"    "q" #'markdown-insert-blockquote
;;        :desc "Strike through"    "s" #'markdown-insert-strike-through
;;        :desc "Table"             "t" #'markdown-insert-table
;;        :desc "Wiki link"         "w" #'markdown-insert-wiki-link)
;;       (:prefix ("t" . "toggle")
;;        :desc "Inline LaTeX"      "e" #'markdown-toggle-math
;;        :desc "Code highlights"   "f" #'markdown-toggle-fontify-code-blocks-natively
;;        :desc "Inline images"     "i" #'markdown-toggle-inline-images
;;        :desc "URL hiding"        "l" #'markdown-toggle-url-hiding
;;        :desc "Markup hiding"     "m" #'markdown-toggle-markup-hiding
;;        :desc "Wiki links"        "w" #'markdown-toggle-wiki-links
;;        :desc "GFM checkbox"      "x" #'markdown-toggle-gfm-checkbox)))



(use-package evil-markdown
  :vc (:url "https://github.com/Somelauw/evil-markdown" :rev :newest)
  :hook (markdown-mode . evil-markdown-mode)
  :config
  (add-hook 'evil-markdown-mode-hook #'evil-normalize-keymaps))
;; (map! :map evil-markdown-mode-map
;;       :n "TAB" #'markdown-cycle
;;       :n [backtab] #'markdown-shifttab
;;       (:unless evil-disable-insert-state-bindings
;;         :i "M-*" #'markdown-insert-list-item
;;         :i "M-b" #'markdown-insert-bold
;;         :i "M-i" #'markdown-insert-italic
;;         :i "M-`" #'+markdown/insert-del
;;         :i "M--" #'markdown-insert-hr)
;;       :n "M-r" #'browse-url-of-file
;;       :m "]h"  #'markdown-next-visible-heading
;;       :m "[h"  #'markdown-previous-visible-heading
;;       :m "[p"  #'markdown-promote
;;       :m "]p"  #'markdown-demote
;;       :m "[l"  #'markdown-previous-link
;;       :m "]l"  #'markdown-next-link))


(use-package markdown-indent-mode
  :hook (markdown-mode . markdown-indent-mode))

(with-eval-after-load 'general
  (general-define-key
   :states '(normal visual)
   :keymaps 'override
   "}" 'next-buffer
   "{" 'previous-buffer
   "M-;" 'evil-commentary
   "C-=" 'er/expand-region)

  ;; s sneak

  (general-create-definer leader-keys
    :prefix "SPC"
    :global-prefix "C-S-SPC")

  (general-create-definer local-leader-keys
    :prefix "SPC m"
    :global-prefix "C-S-SPC m")

  (leader-keys
    :states '(normal visual insert emacs)
    :keymaps 'override

    ;; " list registers

    ;; / swiper

    ;; tab visit last file

    ;; a align
    ;; a e easyalign

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
    "g s" '(magit-status :wk identity)
    "g l" '(magit-log :wk identity) ;; show branch commits by selecting "other (o)"
    "g f" '(magit-log-buffer-file :wk identity)
    "g b" '(magit-show-refs :wk "show branches")
    ;; gB blame?
    ;; gBl blame line?

    "h" '(:ignore t :wk "help")
    "h f" '(describe-function :wk identity)
    "h F" '(describe-face :wk identity)
    "h v" '(describe-variable :wk identity)
    "h k" '(describe-key :wk identity)
    "h K" '(describe-key :wk identity)

    ;; m marks

    "n" '(:ignore t :wk "treemacs/nerdtree TODO")
    ;; N treemacs/nerdtree current file

    "o" '(:ignore t :wk "org TODO")

    "p" '(:ignore t :wk "harpoon TODO")

    ;; s easymotion
    ;; S easymotion overwin

    "t" '(:ignore t :wk "terminal TODO")

    ;; u undo tree

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
    "; RET" '(visual-line-mode :wk "toggle word wrap"))
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


  (local-leader-keys
    :states '(normal visual insert emacs)
    :keymaps 'org-mode-map
    "#" '(org-insert-structure-template :wk "insert template")
    "y" '(org-store-link :wk identity)
    "p" '(org-insert-link :wk identity))

  ;; (local-leader-keys
  ;;   :states '(normal visual insert emacs)
  ;;   :keymaps 'markdown-mode-map
  ;;   "P" '(grip-mode :wk identity)))
  )

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (message "Emacs ready in %s with %d garbage collectios."
		     (format "%.2f seconds"
			     (float-time
			      (time-subtract after-init-time before-init-time)))
		     gcs-done)))

(add-hook 'org-mode-hook
        (lambda ()
          (add-hook 'before-save-hook
                    #'wr/org-add-trailing-space-to-headings
                    nil t)))
