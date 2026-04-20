;; Install LSPs
;; M-x all-the-icons-install-fonts

;; TODO:
;; install packages:
;;    - chronos
;;    - visual-fill-column
;;    - vline
;;    - company-quickhelp
;;    - seeing-is-believing
;;    - org-modern
;;    - evil-escape
;;    - flycheck-popup-tip
;;    - yasnippet
;;    - auto-yasnippet
;;    - doom-snippets
;;
;; doom modules:
;;    competion:
;;      company
;;      vertico
;;
;;    ui:
;;      doom
;;      hl-todo
;;      hydra
;;      indent-guides
;;      modeline
;;      ophints
;;      popup +defaults
;;      treemacs
;;      vc-gutter
;;      window-select
;;      workspaces
;;
;;    editor:
;;      evil +everywhere
;;      fold
;;      format
;;      multiple-cursors
;;
;;    emacs
;;      dired
;;      electric
;;      undo +tree
;;
;;    term
;;      eshell
;;      shell
;;      term
;;      vterm
;;
;;    checkers
;;      syntax
;;
;;    tools
;;      debugger +lsp
;;      eval +overlay
;;      lookup
;;      lsp
;;      magit
;;      make
;;      taskrunner
;;      tree-sitter
;;
;;    lang
;;      cc +lsp
;;      common-lisp
;;      csharp +lsp +unity
;;      data
;;      emacs-lisp
;;      gdscript +lsp
;;      go +lsp
;;      json +lsp
;;      java +lsp
;;      javascript +lsp
;;      latex +lsp
;;      ledger
;;      lua +lsp
;;      markdown
;;      org +pandoc +roam2
;;      python +lsp +pyright
;;      rest
;;      ruby +lsp +rails
;;      rust +lsp
;;      sh +lsp
;;      web
;;      yaml
;;
;;    app
;;      irc
;;
;;    config
;;      default +bindings +smartparens
;;
;; add settings:
;;    (setq org-pretty-entities t)

;; (global-eldoc-mode -1)
;; (add-hook! lsp-ui-mode
;;            (lsp-ui-sideline-mode -1))
;; (add-hook! lsp-mode
;;   ;; (lsp-ui-sideline-mode -1)
;;   (eldoc-mode -1)
;;   (setq lsp-eldoc-enable-hover nil)
;;   (setq lsp-signature-render-documentation nil))
;; (after! lsp-mode
;;   (setq lsp-eldoc-enable-hover nil))

;; (use-package! company
;;   :config
;;   (setq company-minimum-prefix-length 1
;;         company-selection-wrap-around t
;;         company-idle-delay 0)
;;   ;; (define-key company-active-map 'company-complete-common nil)
;;   (define-key company-active-map [tab] 'company-complete-selection)
;;   (define-key company-active-map [return] 'newline-and-indent)
;;   (company-tng-mode -1)
;;   (company-quickhelp-mode 1))

;; (setq-default ediff-highlight-all-diffs nil)
;; (setq-default ediff-split-window-function 'split-window-horizontally)
;; (add-hook  'ediff-prepare-buffer-hook 'f-ediff-prepare-buffer-hook-setup)
;; (defun f-ediff-prepare-buffer-hook-setup ()
;;   ;; specific modes
;;   (cond ((eq major-mode 'org-mode)
;;          (f-org-vis-mod-maximum)))
;;   ;; all modes
;;   (setq truncate-lines nil))


;; (defun f-org-vis-mod-maximum ()
;;   "Visibility: Show the most possible."
;;   (cond
;;    ((eq major-mode 'org-mode)
;;     (visible-mode 1)
;;     (setq truncate-lines nil)
;;     (setq org-hide-leading-stars t))
;;    (t
;;     (message "ERR: not in Org mode")
;;     (ding))))

;; ;; Disable company mode in terminals (slow file/path lookup on windows).
;; (add-hook! '(shell-mode-hook eshell-mode-hook term-mode-hook vterm-mode-hook)
;;            (company-mode -1))

;; ;; Eshell settings
;; (setq eshell-prompt-regexp "^[^>\n]*[>] "
;;       eshell-prompt-function
;;       (lambda nil
;;         (concat
;;          (if (= (user-uid) 0)
;;              (propertize "root " 'face `(:foreground "#de5577"))
;;            "")
;;          (propertize (user-login-name) 'face `(:foreground "orange1"))
;;          (propertize " @ " 'face `(:foreground "grey50"))
;;          (propertize (system-name) 'face `(:foreground "khaki1"))
;;          (propertize "\n[" 'face `(:foreground "grey50"))
;;          (if (string= (eshell/pwd) (getenv "HOME"))
;;              "~" (eshell/pwd))
;;          (propertize "]\n" 'face `(:foreground "grey50"))
;;          (propertize "> " 'face `(:inherit 'default)))))

;; (use-package! org-modern
;;   :config
;;   (setq org-modern-star '("●")
;;         org-modern-table-vertical 1
;;         org-modern-list '((?+ . "•")
;;                           (?- . "–")
;;                           (?* . "◦"))
;;         org-modern-checkbox nil ;; Does not look good in current font
;;         org-modern-keyword " "
;;         org-modern-internal-target '("  " t " ")
;;         org-modern-radio-target '("  " t " ")
;;         org-modern-progress nil
;;         org-modern-variable-pitch nil
;;         org-modern-todo nil
;;         org-modern-priority nil
;;         org-modern-table nil
;;         )
;;   (custom-set-faces!
;;     '(org-modern-block-keyword :weight semibold)
;;     '(org-modern-label :width condensed :weight regular :underline nil)
;;     '(org-modern-tag :background "dim gray" :foreground "white")
;;     '(org-modern-done :background "dim gray" :foreground "white")
;;     '(org-modern-internal-target :inherit org-modern-done)
;;     '(org-modern-radio-target :inherit org-modern-done)
;;     '(org-modern-priority :inherit org-modern-done :weight semibold :foreground "black")
;;     '(org-modern-statistics :inherit org-modern-done)
;;     '(org-modern-date-active :inherit org-modern-done)
;;     '(org-modern-time-active :inherit org-modern-done :weight semibold :background "gray75" :foreground "black")
;;     '(org-modern-date-inactive :inherit org-modern-done :background "gray20" :foreground "gray70")
;;     '(org-modern-time-inactive :inherit org-modern-done :foreground "gray5")
;;     )
;;   (global-org-modern-mode))


  ;; ;; Hide the modeline bar in inactive windows
  ;; (set-face-background 'doom-modeline-bar (face-background 'mode-line))
  ;; (set-face-background 'doom-modeline-bar-inactive (face-background 'mode-line-inactive)))

;; ;;* Col Highlight (manual package) *********************************************
;; (require 'col-highlight)


;; ;;* Dired **********************************************************************
;; (add-hook 'dired-mode-hook
;;            (lambda ()
;;              (dired-hide-details-mode 1)))

;; ;;* Seeing Is Believing ********************************************************
;; (use-package seeing-is-believing
;;   :hook (ruby-mode . seeing-is-believing))


;; ;;* DAP ************************************************************************
;; (after! dap-mode
;;   (setq dap-python-debugger 'debugpy))

;; (add-hook 'dap-stopped-hook
;;           (lambda (arg) (call-interactively #'dap-hydra)))

;; ;;* DAP (ruby) *****************************************************************
;; (require 'dap-ruby)

;; ;; Note for the future:
;; ;; DAP does not correctly install the vscode extension needed for dap when
;; ;; dap-ruby-install is ran. Instead, you have to download the extension
;; ;; manually from
;; ;; https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby
;; ;; and extract the plugin to the correct path in
;; ;; .emacs.d/.local/etc/dap-extension/vscode/rebornix.Ruby
;; ;; Then install `rdebug-ide' (install ruby-debug-ide and debase gems).







;; ****************************************************************************
;; * Setup use-package / package archives                                     *
;; ****************************************************************************
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))


(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; Disabled - quelpa-use-package will handle it.
;; (setq use-package-always-ensure t)


;; ****************************************************************************
;; * Quelpa                                                                   *
;; ****************************************************************************
;;
;; Needed to use quelpa-use-package, which will let me use use-package with git repos.
;;
(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))


;; ****************************************************************************
;; * quelpa-use-package                                                       *
;; ****************************************************************************
(use-package quelpa-use-package
  :init
  (setq quelpa-update-melpa-p nil)
  (setq use-package-always-ensure t)
  :config (quelpa-use-package-activate-advice))
;;(unless (package-installed-p 'quelpa-use-package)
;;  (quelpa
;;   '(quelpa-use-package
;;     :fetcher git
;;     :url "https://github.com/quelpa/quelpa-use-package.git")))

;;(setq use-package-always-ensure t)
;;(setq quelpa-use-package-inhibit-loading-quelpa t)
;;(require 'quelpa-use-package)

;; ****************************************************************************
;; * Main Settings                                                            *
;; ****************************************************************************
;; Turn off startup message
(setq inhibit-startup-message t)
;; Add some padding
(set-fringe-mode 10)
;; Flash taskbar (disabled)
(setq visible-bell nil)
;; Tab width = 2 except for python
(setq-default tab-width 2)

;; (setq tab-width 2
;;       ;; evil-shift-width 2
;;       tab-stop-list (number-sequence 2 120 2))
;; (add-hook!
;;  (prog-mode emacs-lisp-mode)
;;  (setq tab-width 2
;;        ;; evil-shift-width 2
;;        tab-stop-list (number-sequence 2 120 2)))
;; (add-hook! python-mode
;;   (setq tab-width 4
;;         ;; evil-shift-width 4
;;         tab-stop-list (number-sequence 4 120 4)))

;; Insert spaces not tabs
(setq-default indent-tabs-mode nil)
;; Show y/n instead of yes/no
;; (defalias 'yes-or-no-p 'y-or-n-p)
;; Show y/n instead of yes/no
(advice-add #'yes-or-no-p :override #'y-or-n-p)
(setq y-or-n-p-use-read-key t)
;; Disable UI dialog prompts
(setq use-dialog-box nil)
;; Wraps whole words instead of breaking them apart
(global-visual-line-mode 1)
;; 80 width column
(setq-default fill-column 80)
(setq-default kill-do-not-save-duplicates t)
;; Make shebang file executable after saved.
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
;; Selected text is replaced when typing text.
(delete-selection-mode 1)
;; Revert buffers when the file has changed outside of emacs.
(global-auto-revert-mode 1)
;; Revert dired and other buffers
(setq global-auto-revert-non-file-buffers t)
;; Disable blinking cursor
(blink-cursor-mode 0)
;; Show column numbers
(column-number-mode 1)

;; Enable line numbers for specific modes
(dolist (mode '(prog-mode-hook))
  (add-hook mode (lambda ()
                   (display-line-numbers-mode t)          ;; Line numbers
                   (display-fill-column-indicator-mode t) ;; Display indicator at fill-column
                   (display-fill-column-indicator-column 80) ;; Col 80
                   )))

;; ****************************************************************************
;; * Gui Only Settings                                                        *
;; ****************************************************************************
(defun wr/load-gui-only-settings ()
  (interactive)
  (scroll-bar-mode -1)                ;; Turn off scroll bar
  (tool-bar-mode -1)                  ;; Turn off tool bar
  (menu-bar-mode -1)                  ;; Turn off menu bar
  )

;; ****************************************************************************
;; * UTF-8 Settings                                                           *
;; ****************************************************************************
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; ****************************************************************************
;; * Backup Settings                                                          *
;; ****************************************************************************
;;
;; Save backups in emacs directory backups folder
(setq backup-by-copying t
      backup-directory-alist
      `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; ****************************************************************************
;; * Perf Tweaks                                                              *
;; ****************************************************************************
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(setq lsp-log-io nil)

;; ****************************************************************************
;; * Eshell Settings                                                          *
;; ****************************************************************************
(setq eshell-prompt-regexp "^[^>\n]*[>] "
      eshell-prompt-function
      (lambda nil
        (concat
         (if (= (user-uid) 0)
             (propertize "root " 'face `(:foreground "#de5577"))
           "")
         (propertize (user-login-name) 'face `(:foreground "orange1"))
         (propertize " @ " 'face `(:foreground "grey50"))
         (propertize (system-name) 'face `(:foreground "khaki1"))
         (propertize "\n[" 'face `(:foreground "grey50"))
         (if (string= (eshell/pwd) (getenv "HOME"))
             "~" (eshell/pwd))
         (propertize "]\n" 'face `(:foreground "grey50"))
         (propertize "> " 'face `(:inherit 'default)))))

;; ****************************************************************************
;; * Org Mode Prettify Symbols                                                *
;; ****************************************************************************
;; (add-hook 'org-mode-hook (lambda ()
;;                            (push '("[ ]" . "") prettify-symbols-alist)
;;                            (push '("[X]" . "✔") prettify-symbols-alist)
;;                            (push '("[-]" . "") prettify-symbols-alist)
;;                            (setq prettify-symbols-unprettify-at-point t)
;;                            (prettify-symbols-mode)))

;; ****************************************************************************
;; * Ediff Settings                                                           *
;; ****************************************************************************
(setq-default ediff-highlight-all-diffs nil)
(setq-default ediff-split-window-function 'split-window-horizontally)

;; Functions to fix org files collapsed when trying to ediff
(add-hook  'ediff-prepare-buffer-hook 'f-ediff-prepare-buffer-hook-setup)
(defun f-ediff-prepare-buffer-hook-setup ()
  ;; specific modes
  (cond ((eq major-mode 'org-mode)
         (f-org-vis-mod-maximum))
        )
  ;; all modes
  (setq truncate-lines nil))
(defun f-org-vis-mod-maximum ()
  "Visibility: Show the most possible."
  (cond
   ((eq major-mode 'org-mode)
    (visible-mode 1)
    (setq truncate-lines nil)
    (setq org-hide-leading-stars t))
   (t
    (message "ERR: not in Org mode")
    (ding))))

;; ****************************************************************************
;; * Company Box Icons                                                        *
;; ****************************************************************************
(with-eval-after-load 'company-box
  ;; Fix icon alignment and colors
  (setq company-box-icons-alist 'company-box-icons-all-the-icons
        company-box-icons-all-the-icons
        (let ((all-the-icons-scale-factor 1)
              (all-the-icons-default-adjust 0))
          `((Unknown       . ,(all-the-icons-faicon "code" :background "#cccccc" :foreground "#cccccc"))
            (Text          . ,(all-the-icons-material "text_format" :background "#cccccc" :foreground "#cccccc"))
            (Method        . ,(all-the-icons-faicon "cube" :face 'all-the-icons-lblue))
            (Function      . ,(all-the-icons-faicon "cube" :face 'all-the-icons-lblue))
            (Constructor   . ,(all-the-icons-faicon "cube" :face 'all-the-icons-lblue))
            (Field         . ,(all-the-icons-faicon "tag" :face 'all-the-icons-lgreen))
            (Variable      . ,(all-the-icons-faicon "tag" :face 'all-the-icons-lgreen))
            (Class         . ,(all-the-icons-faicon "cog" :face 'all-the-icons-lyellow))
            (Interface     . ,(all-the-icons-faicon "cogs" :face 'all-the-icons-lyellow))
            (Module        . ,(all-the-icons-faicon "code" :face 'all-the-icons-lpurple))
            (Property      . ,(all-the-icons-faicon "wrench" :face 'all-the-icons-lgreen))
            (Unit          . ,(all-the-icons-material "streetview" :face 'all-the-icons-lgreen))
            (Value         . ,(all-the-icons-faicon "tag" :face 'all-the-icons-lgreen))
            (Enum          . ,(all-the-icons-faicon "file-text-o" :face 'all-the-icons-lyellow))
            (Keyword       . ,(all-the-icons-material "vpn_key" :face 'all-the-icons-lyellow))
            (Snippet       . ,(all-the-icons-material "content_paste" :face 'all-the-icons-lsilver))
            (Color         . ,(all-the-icons-material "palette" :face 'all-the-icons-lred))
            (File          . ,(all-the-icons-faicon "file" :face 'all-the-icons-lyellow))
            (Reference     . ,(all-the-icons-faicon "tag" :face 'all-the-icons-lgreen))
            (Folder        . ,(all-the-icons-faicon "folder" :face 'all-the-icons-lgreen))
            (EnumMember    . ,(all-the-icons-faicon "tag" :face 'all-the-icons-lgreen))
            (Constant      . ,(all-the-icons-faicon "tag" :face 'all-the-icons-lgreen))
            (Struct        . ,(all-the-icons-faicon "cog" :face 'all-the-icons-lyellow))
            (Event         . ,(all-the-icons-faicon "bolt" :face 'all-the-icons-lyellow))
            (Operator      . ,(all-the-icons-faicon "tag" :face 'all-the-icons-lyellow))
            (TypeParameter . ,(all-the-icons-faicon "cog" :face 'all-the-icons-lyellow))
            (Template      . ,(all-the-icons-faicon "bookmark" :face 'all-the-icons-lyellow)))))
  )

;; ****************************************************************************
;; * Load Theme                                                               *
;; ****************************************************************************
;; Load themes folder
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; Use custom theme "tedious"
(load-theme 'tedious t)

(set-face-attribute 'col-highlight nil :background "#0b4662" :foreground "#ffffff")

;; ****************************************************************************
;; * Functions                                                                *
;; ****************************************************************************

;; Load fonts
(defun wr/load-faces ()
  (interactive)
  ;; Other good fonts:
  ;;   Input
  ;;   DejaVu Sans Mono / DejaVuSansMono NF
  ;;   JetBrains Mono
  ;; (set-face-attribute 'default nil :font "IosevkaMine NF:antialias=subpixel" :height 100)
  ;; (set-face-attribute 'fixed-pitch nil :font "IosevkaMine NF" :height 100)
  ;; (set-face-attribute 'variable-pitch nil :font "IosevkaMine NF" :height 100)
  ;;
  (set-face-attribute 'default nil :font "InputMono NF" :height 105)
  (set-face-attribute 'fixed-pitch nil :font "InputSans" :height 105)
  (setq-default line-spacing 0))

;; Load settings if client is not a daemon
(defun wr/load-all ()
  (wr/load-gui-only-settings)
  (wr/load-faces)
  )
;; (add-hook 'after-make-frame-functions #'wr/load-all)
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (wr/load-all))))
  (wr/load-all))

;; Keep selection after shifting left / right in visual mode.
(defun wr/evil-shift-right ()
  (interactive)
  (evil-shift-right evil-visual-beginning evil-visual-end)
  (evil-normal-state)
  (evil-visual-restore))

(defun wr/evil-shift-left ()
  (interactive)
  (evil-shift-left evil-visual-beginning evil-visual-end)
  (evil-normal-state)
  (evil-visual-restore))

(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))


(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -2))

;; Setup Org Mode
(defun wr/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 0)
  (visual-line-mode 1))
  ;;(setq evil-auto-indent nil))

;; Setup visual fill column settings
(defun wr/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

;; Setup LSP Mode
(defun wr/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

;; ******************************************************************* hydra **
(use-package hydra
  :defer 1)

;; ********************************************************************* ivy **
(use-package ivy
  :diminish
  :bind (("C-/" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1)
  ;; Add recentf-mode and bookmarks to ivy-switch-buffer
  (setq ivy-use-virtual-buffers nil)
  ;; C-n / C-p wrap around at end of list
  (setq ivy-wrap t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)

  ;; Use different regex strategies per completion command
  (push '(completion-at-point . ivy--regex-fuzzy) ivy-re-builders-alist) ;; This doesn't seem to work...
  (push '(swiper . ivy--regex-ignore-order) ivy-re-builders-alist)
  (push '(counsel-M-x . ivy--regex-ignore-order) ivy-re-builders-alist)

  ;; Set minibuffer height for different commands
  (setf (alist-get 'counsel-projectile-ag ivy-height-alist) 15)
  (setf (alist-get 'counsel-projectile-rg ivy-height-alist) 15)
  (setf (alist-get 'swiper ivy-height-alist) 15)
  (setf (alist-get 'counsel-switch-buffer ivy-height-alist) 15))

;; *************************************************************** ivy-hydra **
(use-package ivy-hydra
  :defer t
  :after hydra)

;; **************************************************************** ivy-rich **
(use-package ivy-rich
  :init
  (ivy-rich-mode 1)
  :config
  (setq ivy-format-function #'ivy-format-function-line)
  (setq ivy-rich-display-transformers-list
        (plist-put ivy-rich-display-transformers-list
                   'ivy-switch-buffer
                   '(:columns
                     ((ivy-rich-candidate (:width 30))
                      (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right)); return the buffer indicators
                      (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))          ; return the major mode info
                      (ivy-rich-switch-buffer-project (:width 15 :face success))             ; return project name using `projectile'
                      (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))  ; return file path relative to project root or `default-directory' if project is nil
                     :predicate
                     (lambda (cand)
                       (if-let ((buffer (get-buffer cand)))
                           ;; Don't mess with EXWM buffers
                           (with-current-buffer buffer
                             (not (derived-mode-p 'exwm-mode)))))))))

;; ************************************************************ ivy-posframe **
;; (use-package ivy-posframe
;;   :after ivy
;;   :demand t
;;   :custom
;;   (ivy-posframe-width      115)
;;   (ivy-posframe-min-width  70)
;;   (ivy-posframe-height     10)
;;   (ivy-posframe-min-height 10)
;;   :config
;;   (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-bottom-center)))
;;   (setq ivy-posframe-parameters '((parent-frame . nil)
;;                                   (left-fringe . 8)
;;                                   (right-fringe . 8)))
;;   (ivy-posframe-mode 1))

;; ***************************************************************** counsel **
(use-package counsel
  :bind (("M-x" . counsel-M-x)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^

;; ********************************************************************* avy **
;; Search / jump by char
(use-package avy
  :commands (avy-goto-char avy-goto-word-1 avy-goto-line)
  :config
  (setq avy-all-windows t))

;; ********************************************************************* flx **
;; Improves sorting for fuzzy-matched results.
(use-package flx
  :defer t
  :init
  (setq ivy-flx-limit 10000))

;; ******************************************************************** smex **
;; Adds M-x recent command sorting for counsel-M-x.
(use-package smex
  :defer 1
  :after counsel)

;; ******************************************************************* wgrep **
(use-package wgrep)

;; *********************************************************** all-the-icons **
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

;; *********************************************************** doom-modeline **
(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  (setq doom-modeline-indent-info t)
  (setq doom-modeline-icon nil)
  (setq doom-modeline-bar-width 1)
  (setq doom-modeline-unicode-fallback t))

;; ****************************************************** rainbow-delimiters **
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; ************************************************************ rainbow-mode **
;; Shows colors within emacs, such as hexadecimal colors.
(use-package rainbow-mode
  :hook (prog-mode text-mode)
  :config (rainbow-mode 1))

;; *************************************************************** which-key **
(use-package which-key
  :init
  (setq which-key-idle-delay 1.0)
  (which-key-mode)
  :config
  ;; Fixes which-key getting cut off on bottom when using daemon / emacsclient.
  (setq which-key-allow-imprecise-window-fit nil)
  :diminish which-key-mode)

;; *************************************************************** undo-tree **
(use-package undo-tree
  :init
  (setq undo-tree-auto-save-history nil)
  :config
  (undo-tree-mode 1))

;; ******************************************************************** evil **
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-respect-visual-line-mode nil)
  (setq evil-split-window-below t)
  (setq evil-vsplit-window-right t)
  (setq evil-shift-width 2)
  (setq evil-undo-system 'undo-tree)
  (setq evil-kill-on-visual-paste nil)
  (setq evil-select-search-module 'evil-search)
  (setq evil-move-beyond-eol t)
  (setq evil-move-cursor-back nil)
  (setq evil-normal-state-cursor '("#e8e8d3" box))
  (setq evil-insert-state-cursor '("#ffcc5c" box))
  (setq evil-visual-state-cursor '("#4585be" box))
  (setq evil-replace-state-cursor '("#ff8484" box))
  (setq evil-emacs-state-cursor '("#c5f467" box))
  :config
  ;; (add-hook 'evil-mode-hook 'dw/evil-hook)
  (add-hook 'evil-local-mode-hook 'turn-on-undo-tree-mode)
  (evil-mode 1)

  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

;;   (dolist (mode '(custom-mode
;;                   eshell-mode
;;                   git-rebase-mode
;;                   erc-mode
;;                   circe-server-mode
;;                   circe-chat-mode
;;                   circe-query-mode
;;                   sauron-mode
;;                   term-mode))
;;     (add-to-list 'evil-emacs-state-modes mode)))

;; ********************************************************* evil-collection **
(use-package evil-collection
  :after evil
  :custom
  (evil-collection-outline-bind-tab-p nil)
  :config
  (evil-collection-init))

;; ************************************************************ evil-goggles **
(use-package evil-goggles
  :ensure t
  :init
  (setq evil-goggles-pulse nil)
  (setq evil-goggles-duration 0.1)
  (setq evil-goggles-enable-indent nil)
  (setq evil-goggles-enable-fill-and-move nil)
  (setq evil-goggles-enable-shift nil)
  (setq evil-goggles-enable-commentary nil)
  (setq evil-goggles-enable-nerd-commenter nil)
  (setq evil-goggles-enable-enable-record-macro nil)
  (setq evil-goggles-enable-set-marker nil)
  :config
  (evil-goggles-mode))

;; *********************************************************** evil-surround **
(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

;; ********************************************************* evil-commentary **
(use-package evil-commentary
  :config
  (evil-commentary-mode))

;; ************************************************************** projectile **
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/code")
    (setq projectile-project-search-path '("~/code")))
  (setq projetile-switch-project-action #'projectile-dired))

;; ****************************************************** counsel-projectile **
(use-package counsel-projectile
  :config (counsel-projectile-mode))

;; ******************************************************************* magit **
(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
  (magit-diff-refine-hunk 'all))

;; ************************************************************** git-gutter **
(use-package git-gutter
  :hook
  (prog-mode . git-gutter-mode)
  (org-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

;; ******************************************************* git-gutter-fringe **
(use-package git-gutter-fringe
  :config
;; (define-fringe-bitmap 'flycheck-fringe-bitmap-ball
;;   (vector #b00000000
;;           #b00000000
;;           #b00000000
;;           #b00000000
;;           #b00000000
;;           #b00111100
;;           #b00111100
;;           #b00111100
;;           #b00111100
;;           #b00111100
;;           #b00111100
;;           #b00111100
;;           #b00000000
;;           #b00000000
;;           #b00000000
;;           #b00000000
;;           #b00000000
;;           #b00000000))
  ;; (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  ;; (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  ;; (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))
  (define-fringe-bitmap 'git-gutter-fr:added
    (vector #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            )
    nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified
    (vector #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            #b00111000
            )
    nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted
    (vector #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b00000000
            #b11111111
            #b11111111
            )
    nil nil 'bottom))

;; ******************************************************************* forge **
(use-package forge
  :after magit)

;; Not sure how to do it yet.
;; I think you just put the gitlab api key in information in ~/.authinfo?
;; For gitlab, use command
;; (ghub-request "GET" "/user" nil
;; 	      :forge 'gitlab
;; 	      :host "api.github.com" ;; Replace with repo if private
;; 	      :username "USERNAME"
;; 	      :auth 'forge)

;; or set variables:
;; gitlab.user ;; The https://gitlab.com user.
;; gitlab.HOST.user ;; The user for the HOST gitlab instance.
;; gitlab.host ;; The gitlab host.

;; ********************************************************************* org **
(use-package org
  :defer t
  :hook (org-mode . wr/org-mode-setup)
  :config
  (setq org-ellipsis " ..."
        ;; ⤵ ▼ ↴ ⬎ ⤷ …
	org-hide-emphasis-markers t
	org-src-fontify-natively t
	org-src-tab-acts-natively t
	org-edit-src-content-indentation 0
	org-hide-block-startup nil
	org-src-preserve-indentation nil
	org-cycle-separator-lines 2
  org-startup-folded 'content
  org-goto-interface 'outline-path-completionp
  org-outline-path-complete-in-steps nil
  org-fontify-done-headline t
  org-fontify-todo-headline t
  org-directory "~/org/>"
  org-agenda-files "~/org/agenda.org"
  org-agenda-start-on-weekday 0
  org-agenda-start-day nil
  org-agenda-span 14
  org-agenda-start-with-follow-mode t
  org-babel-python-command "python3")

  ;; Org modern
  (setq org-auto-align-tags nil
        org-catch-invisible-edits 'show-and-error
        org-agenda-tags-column 0
        org-agenda-block-separator ?-)

  ;; Load these languages to be used in src blocks
  (org-babel-do-load-languages
  'org-babel-load-languages
  '((python . t)
    (emacs-lisp . t)))

  ;; Add support for conf files.
  (push '("conf-unix" . conf-unix) org-src-lang-modes)

  ;; Turn off annoying y/n prompt for running src blocks
  (setq org-confirm-babel-evaluate nil))

;; *************************************************************** org-tempo **
;; Shortcuts to create src blocks using <LANG + tab, such as <sh, <el, <py.
(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
(add-to-list 'org-structure-template-alist '("python" . "src python"))
(add-to-list 'org-structure-template-alist '("rb" . "src ruby"))
(add-to-list 'org-structure-template-alist '("ruby" . "src ruby"))

;; *********************************************************** org-superstar **
(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
  ;; (org-superstar-remove-leading-stars t)
  (org-hide-leading-stars nil)
  (org-superstar-leading-bullet ?\s)
  (org-indent-mode-turns-on-hiding-stars nil)
  (org-superstar-headline-bullets-list'("●")))
  ;; (org-superstar-headline-bullets-list'(" ")))

;; ****************************************************** visual-fill-column **
;; Centers content, simliar to vim zen mode.
;; Disabled because it limits width of src blocks, which I want to take up the
;; entire width of the window on some occasions.
;; (use-package visual-fill-column
;;   :defer t
;;   :hook (org-mode . wr/org-mode-visual-fill))

;; ***************************************************************** helpful **
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap display-local-help] . helpful-at-point))

;; **************************************************************** flycheck **
(define-fringe-bitmap 'flycheck-fringe-bitmap-ball
  (vector #b00000000
          #b00000000
          #b00000000
          #b00000000
          #b00000000
          #b00111100
          #b00111100
          #b00111100
          #b00111100
          #b00111100
          #b00111100
          #b00111100
          #b00000000
          #b00000000
          #b00000000
          #b00000000
          #b00000000
          #b00000000))

(use-package flycheck
  :config
  (flycheck-define-error-level 'error
    :severity 100
    :compilation-level 2
    :overlay-category 'flycheck-error-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-ball
    :fringe-face 'flycheck-fringe-error
    :error-list-face 'flycheck-error-list-error)
  (flycheck-define-error-level 'warning
    :severity 100
    :compilation-level 2
    :overlay-category 'flycheck-warning-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-ball
    :fringe-face 'flycheck-fringe-warning
    :error-list-face 'flycheck-error-list-warning)
  (flycheck-define-error-level 'info
    :severity 100
    :compilation-level 2
    :overlay-category 'flycheck-info-overlay
    :fringe-bitmap 'flycheck-fringe-bitmap-ball
    :fringe-face 'flycheck-fringe-info
    :error-list-face 'flycheck-error-list-info)
  ;; (setq flycheck-display-errors-function nil))
)

;; ************************************************************** quick-peek **
;; (use-package quick-peek
;;   :config
;;   (setq-default quick-peek-add-spacer nil))

;; ********************************************************* flycheck-inline **
;; (use-package flycheck-inline
;;   :after flycheck
;;   :config
;;   (global-flycheck-inline-mode 1))
;;   (setq flycheck-inline-display-function
;;         (lambda (msg pos err)
;;           (let* ((ov (quick-peek-overlay-ensure-at pos))
;;                  (contents (quick-peek-overlay-contents ov)))
;;             (setf (quick-peek-overlay-contents ov)
;;                   (concat contents (when contents "\n") msg))
;;             (quick-peek-update ov)))
;;         flycheck-inline-clear-function #'quick-peek-hide))

;; **************************************************************** lsp-mode **
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook
  (lsp-mode . wr/lsp-mode-setup)
  (go-mode . lsp)
  (rust-mode . lsp)
  (ruby-mode . lsp)
  ;; eldoc-print-current-symbol-info
  ;; eldoc-mode 0
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-eldoc-enable-hover nil)
  (setq lsp-signature-render-documentation nil)
  (setq lsp-signature-auto-activate nil)
  :config
  (lsp-enable-which-key-integration t))

;; ***************************************************************** company **
(use-package company
  :after lsp-mode
  :hook
  (lsp-mode . company-mode)
  :bind
  (:map company-active-map
        ("<tab>" . company-complete-selection))
  :custom
  (company-minimum-prefix-length 1)
  (company-selection-wrap-around t)
  (company-insertion-on-trigger nil)
  (company-idle-delay 0.0))

;; ************************************************************* company-box **
;; Improves company popup UI.
;; Need to use forked repo until they merge changes that fix popup window
;; going off of the screen.
(use-package company-box
  :demand t
  :hook (company-mode . company-box-mode)
  :quelpa (company-box
           :fetcher github
           :repo "HawkinsT/company-box"
           :branch "keep-doc-in-frame")
  :config
  (setq company-box-doc-enable t))

;; ****************************************************************** lsp-ui **
(use-package lsp-ui
  :hook
  (lsp-mode . lsp-ui-mode)
  :custom
  ;; (lsp-ui-doc-show-with-cursor t)
  ;; (lsp-ui-doc-delay 3.0)
  (lsp-ui-doc-position 'at-point))

;; ************************************************************** typescript **
(use-package typescript-mode
:mode "\\.ts\\'"
:hook (typescript-mode . lsp-deferred)
:config
(setq typescript-indent-level 2))

;; ***************************************************************** pyright **
(use-package lsp-pyright
  :custom
  (lsp-pyright-multi-root nil)
  :hook
  (python-mode . (lambda ()
                   (require 'lsp-pyright)
                   (lsp-deferred))))

;; ******************************************************************** ccls **
(use-package ccls
  :config
  (setq ccls-executable "ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))
;; (use-package eglot
;;   :hook ((c-mode c++-mode) . 'eglot-ensure))

;; ********************************************************************** go **
(use-package go-mode)

;; ******************************************************************** rust **
(use-package rustic)

;; ************************************************************* python-venv **
(use-package pyvenv
  :config
  (pyvenv-mode t))
  ;; ;; Set to venv on activate
  ;; (setq pyvenv-post-activate-hooks
  ;;       (list (lambda ()
  ;;               (setq python-shell-interpreter (concat pyvenv-virtual-env <<settings/python_executable>>)))))

  ;; ;; Set to python 3 on deactivate.
  ;; (setq pyvenv-post-deactivate-hooks
  ;;       (list (lambda ()
  ;;               (setq python-shell-interpreter "python3")))))

;; This works, have to (setq venv-location "Path/To/Folder/Containing/venv")
;; Not the venv folder it self, but the folder containing the venv. For example:
;; (setq venv-location "D:/repos/job_bot")
;; Then, venv-workon.
;; Finally, open python file AFTER loading venv and it should show correctly.
;; (use-package virtualenvwrapper)

;; ****************************************************************** bufler **
(use-package bufler
  :config (bufler-mode 1))

;; ******************************************************** multiple-cursors **
(use-package multiple-cursors)

;; ***************************************************************** unbinds **
(define-key undo-tree-map (kbd "C-/") nil)
(global-set-key (kbd "C-<mouse-4>") nil)
(global-set-key (kbd "C-<mouse-5>") nil)

;; ***************************************************************** general **
(use-package general
  :config
  (general-evil-setup t)

  ;; Define leader key actions
  (general-create-definer wr/leader-key-actions
		:keymaps '(normal visual)
		:prefix "SPC")

  (general-create-definer wr/my-custom-key-actions
    :keymaps '(normal visual)
    :prefix "SPC SPC")

  (general-create-definer wr/mode-key-actions
    :keymaps '(normal visual)
    :prefix "SPC m")

  (general-create-definer wr/my-lsp-key-actions
    :keymaps '(normal visual)
    :prefix "\\"))

;; ****************************************************************** global **
;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "M-\\") 'evil-execute-in-emacs-state)

;; (evil-define-key 'visual global-map
(general-vmap global-map
  ;; "gp" '+default/yank-pop

  ;; Keep visual selection after evil indents
  ">" 'wr/evil-shift-right
  "<" 'wr/evil-shift-left)

;; THIS WORKS
(general-define-key
 :states 'normal
 :keymaps '(override global-map)
 ;; "C-/" 'consult-line
 ;; "[s" #'embark-previous-symbol
 ;; "]s" #'embark-next-symbol

 ;; Next-error / prev-error have issues with jumping to previous buffer instead
 ;; of errors in the current buffer. Flycheck-next/previous-error do not do this.
 "[e"  'flycheck-previous-error
 "]e"  'flycheck-next-error

 "gp"  'counsel-yank-pop
 "C-h" 'evil-window-left
 "C-l" 'evil-window-right
 "C-j" 'evil-window-down
 "C-k" 'evil-window-up
 "M-h" 'evil-scroll-left
 "M-j" 'evil-scroll-left
 "M-k" 'evil-scroll-right
 "M-l" 'evil-scroll-right
 "C-p" 'lsp-ui-doc-glance
 "M-p" 'lsp-describe-thing-at-point)
;; TODO:
;; bind m-d/m-u to scroll glance documentation?

(general-define-key
 "C-/" 'swiper
 "C-c b" 'counsel-switch-buffer)

(general-define-key
 :states 'insert
 :keymaps '(override global-map)
 "M-p" 'lsp-signature-activate)

;; ***************************************************** which-key-overrides **
(which-key-add-key-based-replacements
  "SPC SPC" "custom actions"
  "SPC m" "mode"
  "\\" "lsp")

;; **************************************************************** org-mode **
(general-nmap org-mode-map
  "M-j" 'outline-next-visible-heading
  "M-k" 'outline-previous-visible-heading
  "M-J" 'org-forward-heading-same-level
  "M-K" 'org-backward-heading-same-level
  "C-M-j" 'outline-move-subtree-down
  "C-M-k" 'outline-move-subtree-up
  "C-M-h" 'org-do-promote
  "C-M-l" 'org-do-demote)

(general-vmap org-mode-map
  "C-M-j" 'outline-move-subtree-down
  "C-M-k" 'outline-move-subtree-up
  "C-M-h" 'org-do-promote
  "C-M-l" 'org-do-demote)

;; ****************************************************************** bufler **
(evil-define-key 'normal bufler-list-mode-map
  "r" #'bufler
  "q" #'quit-window
  (kbd "SPC") #'bufler-list-buffer-peek
  (kbd "RET") #'bufler-list-buffer-switch
  "d" #'bufler-list-buffer-kill
  "s" #'bufler-list-buffer-save
  "n" #'bufler-list-buffer-name-workspace
  "f" #'bufler-list-group-frame
  "F" #'bufler-list-group-make-frame)

;; ******************************************************************* dired **
(evil-define-key 'normal dired-mode-map
  "N" #'dired-create-empty-file)

;; ****************************************************************** leader **
(wr/leader-key-actions
  "TAB" '(evil-jump-item)
  "s" '(avy-goto-char)
  "W" '(:ignore t :which-key "workspace")
  "=" '(hydra-font-size/body)
  "-" '(hydra-window-size/body)
  ;; "n" '(+treemacs/toggle)

  ";" '(:ignore t :which-key "special")
  ";RET" '(global-visual-line-mode :which-key "word wrap")
  ";h" '(column-highlight-mode :which-key "col highlight")
  ";H" '(hl-line-mode :which-key "line highlight")

      ;; ;; SPC o
      ;; (:prefix-map ("o" . "open")
      ;;  "r" nil ;; Clear the keybind for "r" before rebinding it.
      ;;   (:prefix ("r" . "roam")
      ;;    :desc "Switch to buffer"              "b" #'org-roam-switch-to-buffer
      ;;    :desc "Org Roam Capture"              "c" #'org-roam-capture
      ;;    :desc "Find file"                     "f" #'org-roam-find-file
      ;;    :desc "Show graph"                    "g" #'org-roam-graph
      ;;    :desc "Insert"                        "i" #'org-roam-insert
      ;;    :desc "Insert (skipping org-capture)" "I" #'org-roam-insert-immediate
      ;;    :desc "Org Roam"                      "r" #'org-roam
      ;;    (:prefix ("d" . "by date")
      ;;     :desc "Arbitrary date" "d" #'org-roam-dailies-find-date
      ;;     :desc "Today"          "t" #'org-roam-dailies-find-today
      ;;     :desc "Tomorrow"       "m" #'org-roam-dailies-find-tomorrow
      ;;     :desc "Yesterday"      "y" #'org-roam-dailies-find-yesterday))
      ;;  :desc "REPL"               "R"  #'+eval/open-repl-other-window)
      ;; )


  "[" '(previous-buffer :which-key "previous buffer")
  "]" '(next-buffer :which-key "next buffer")
  "b" '(:ignore t :which-key "buffer")
  ;; "b[tab]" '(evil-switch-to-windows-last-buffer)
  "bd" '(kill-current-buffer :which-key "delete")
  "bn" '(evil-buffer-new :which-key "new")
  "f" '(:ignore t :which-key "find")
  "ff" '(counsel-find-file :which-key "file")
  ;; "fb" '(consult-buffer)
  "fb" '(bufler-switch-buffer :which-key "bufler")
  "fB" '(bufler-list :which-key "bufler list")
  ;; "fb" '(counsel-switch-buffer :which-key "buffer")
  ;; "fB" '(counsel-ibuffer :which-key "ibuffer")
  "fr" '(counsel-recentf :which-key "recent")
  "s" '(avy-goto-word-1 :which-key "goto line")
  "S" '(avy-goto-char :which-key "goto char")
  "w" '(:ignore t :which-key "window")
  "wc" '(evil-window-delete :which-key "close")
  "ws" '(evil-window-split :which-key "split")
  "wS" '(hydra-window-swap/body :which-key "swap windows")
  "wv" '(evil-window-vsplit :which-key "vsplit")
      ;; "s" #'+evil/window-split-and-follow
      ;; "v" #'+evil/window-vsplit-and-follow
  "t" '(:ignore t :which-key "toggles")
  "tt" '(counsel-load-theme :which-key "choose theme"))

;; ************************************************************** lsp-leader **
(wr/my-lsp-key-actions
  :states 'normal
  :keymaps 'prog-mode-map
  "\\" '(flycheck-list-errors :which-key "flycheck-list-errors")
  "[" '(flycheck-previous-error :which-key "flycheck-previous-error")
  "]" '(flycheck-next-error :which-key "flycheck-next-error")
  "=" '(:ignore t :which-key "format")
  "a" '(:ignore t :which-key "action")
  "aa" '(:ignore t :which-key "code action")
  ;; "al" '(:ignore t :which-key "lens") ;; unknown what this does
  "f" '(:ignore t :which-key "workspace folders")
  "a" '(:ignore t :which-key "add")
  "b" '(:ignore t :which-key "blacklist remove")
  "r" '(:ignore t :which-key "remove")
  "h" '(:ignore t :which-key "help")
  "j" '(:ignore t :which-key "jump to")
  ;; "ja" '(:ignore t :which-key "symbols")
  "jd" '(:ignore t :which-key "definition")
  "jD" '(:ignore t :which-key "declaration")
  ;; "je" '(:ignore t :which-key "errors")
  ;; "jh" '(:ignore t :which-key "call heirarchy")
  "ji" '(:ignore t :which-key "implementation")
  "jr" '(:ignore t :which-key "references")
  "jt" '(:ignore t :which-key "type definition")
  "l" '(:ignore t :which-key "lsp")
  "ld" '(:ignore t :which-key "describe session")
  "lq" '(:ignore t :which-key "shutdown")
  "lr" '(:ignore t :which-key "restart")
  "ls" '(:ignore t :which-key "start")
  "p" '(:ignore t :which-key "peek")
  "pd" '(:ignore t :which-key "definition")
  "pi" '(:ignore t :which-key "implementation")
  "pr" '(:ignore t :which-key "references")
  "ps" '(:ignore t :which-key "workplace symbol")
  "r" '(lsp-rename :which-key "rename")
  "t" '(:ignore t :which-key "toggle")
  "tD" '(:ignore t :which-key "modeline diag")
  "tS" '(:ignore t :which-key "sideline")
  "tb" '(:ignore t :which-key "breadcrumb")
  "td" '(:ignore t :which-key "documentation popup")
  "tf" '(:ignore t :which-key "on type formatting")
  "th" '(:ignore t :which-key "highlighting")
  "tl" '(:ignore t :which-key "lenses")
  "ts" '(:ignore t :which-key "signature"))

;; ********************************************************** custom-actions **
(wr/my-custom-key-actions
  "r" '(:ignore t :which-key "roam")
  "rn" '(:ignore t :which-key "new node")
  "rf" '(:ignore t :which-key "find node"))

;; ****************************************************** mode-key--org-mode **
(wr/mode-key-actions
  :states 'normal
  :keymaps 'org-mode-map
  "g" '(org-goto :which-key "goto")
  ;; "h" '(consult-outline)
  ;; "H" '(consult-org-heading)
  )

;; *************************************************************** font-size **
;; Font size
(defhydra hydra-font-size ()
  "
^Buffer^           ^Global^
-------------------------------
_-_: - font size   ___: - font size
_=_: + font size   _+_: + font size

"
  ("-" (text-scale-decrease 1) nil)
  ("=" (text-scale-increase 1) nil)
  ("_" (doom/decrease-font-size 1) nil)
  ("+" (doom/increase-font-size 1) nil)
  ("0" doom/reset-font-size "reset")
  ("q" nil "quit"))

;; ************************************************************ split-resize **
;; Window size
(defhydra hydra-window-size ()
  "
^Window Size^
^^^^^^^^---------------------------------
_j_: - height(10)   _h_: - width(10)
_k_: + height(10)   _l_: + width(10)

_J_: - height(1)    _H_: - width(1)
_K_: + height(1)    _L_: + width(1)

"
  ("j" (evil-window-decrease-height 10) nil)
  ("k" (evil-window-increase-height 10) nil)
  ("h" (evil-window-decrease-width 10) nil)
  ("l" (evil-window-increase-width 10) nil)

  ("J" (evil-window-decrease-height 1) nil)
  ("K" (evil-window-increase-height 1) nil)
  ("H" (evil-window-decrease-width 1) nil)
  ("L" (evil-window-increase-width 1) nil)
  ("q" nil "quit"))

;; ****************************************************************** bufler **
(defhydra hydra-bufler (:foreign-keys run)
  "
^Bufler^     ^Buffer^       ^Workspace
^^^^---------------------------------
_r_: Refresh _SPC_: Peek    _f_: Focus
_q_: Quit    _RET_: Open    _F_: Make frame
             _d_: Kill
             _s_: Save
             _n_: Move to named workspace
"
  ("r" #'bufler)
  ("q" nil "quit" :exit t)
  ("SPC" #'bufler-list-buffer-peek)
  ("RET" #'bufler-list-buffer-switch :color blue)
  ("d" #'bufler-list-buffer-kill)
  ("s" #'bufler-list-buffer-save)
  ("n" #'bufler-list-buffer-name-workspace)
  ("f" #'bufler-list-group-frame)
  ("F" #'bufler-list-group-make-frame :color blue))

;; Window swap
(defhydra hydra-window-swap ()
  "
^Window Swap^
^^^^^^^^---------------------------------
_h_: left       _s_: swap
_j_: down       _S_: swap & exit
_k_: up
_l_: right

"
  ("h" +evil/window-move-left nil)
  ("j" +evil/window-move-down nil)
  ("k" +evil/window-move-up nil)
  ("l" +evil/window-move-right nil)
  ("s" ace-swap-window nil)
  ("S" ace-swap-window nil :color blue)
  ("q" nil "quit"))
