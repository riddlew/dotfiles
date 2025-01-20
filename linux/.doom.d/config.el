;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "riddlew"
      user-mail-address "riddle.w@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-tomorrow-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "D:/org")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-font (font-spec :family "JetBrainsMono NF" :size 14 :weight 'regular))
(setq doom-themes-treemacs-enable-variable-pitch nil)
(setq-default line-spacing 1)

(setq-default display-fill-column-indicator 80)
(add-hook! prog-mode (display-fill-column-indicator-mode 1))

(setq avy-all-windows t)
(setq evil-move-cursor-back nil)
(setq org-hide-emphasis-markers t)
(setq org-pretty-entities t)
(setq confirm-kill-emacs nil)

(global-visual-line-mode 1)
(setq! +evil-want-o/O-to-continue-comments nil)

;;* Evil ***********************************************************************
(use-package! evil
  ;; :hook (evil-local-mode . turn-on-undo-tree-mode)
  :config
  ;; (global-undo-tree-mode 1)
  (setq evil-normal-state-cursor '("#e8e8d3" box)
        evil-insert-state-cursor '("#ffcc5c" box)
        evil-visual-state-cursor '("#4585be" box)
        evil-replace-state-cursor '("#ff8484" box)
        evil-emacs-state-cursor '("#c5f467" box)))

;;* Vertico ********************************************************************
;; Enable C-h in which-key buffer.
;; (after! vertico
;;       (setq which-key-use-C-h-commands t))

;;* Which-key ******************************************************************
(use-package! which-key
  :config
  ;; Fix which-key getting cut off on bottom when using daemon / emacsclient.
  (setq which-key-allow-imprecise-window-fit nil))

;;* LSP ************************************************************************
;; (global-eldoc-mode -1)
;;
;; (add-hook! lsp-ui-mode
;;            (lsp-ui-sideline-mode -1))
;;
;; (add-hook! lsp-mode
;;   ;; (lsp-ui-sideline-mode -1)
;;   (eldoc-mode -1)
;;   (yas-minor-mode-on)
;;   (setq lsp-eldoc-enable-hover nil)
;;   (setq lsp-signature-render-documentation nil))
;;
;; (after! lsp-mode
;;   (setq lsp-eldoc-enable-hover nil))

(after! lsp-mode
  ;; (setq lsp-signature-render-documentation nil))
  (setq lsp-signature-auto-activate nil)
  (setq lsp-ui-sideline-enable nil))

;;* Undo Tree ******************************************************************
;; (use-package! undo-tree
;;   :config
;;   (setq undo-tree-auto-save-history nil))

;;* Company ********************************************************************
;; Make company autocomplete more useable.
;; (use-package! company
;;   :config
;;   (setq company-minimum-prefix-length 1
;;         company-selection-wrap-around t
;;         company-tooltip-minimum-width 20
;;         company-tooltip-maximum-width 40
;;         company-idle-delay 0)
;;   ;; (define-key company-active-map 'company-complete-common nil)
;;   (define-key company-active-map [tab] 'company-complete-selection)
;;   (define-key company-active-map [return] 'newline-and-indent)
;;   (company-tng-mode -1)
;;   (company-quickhelp-mode 1))

;; (use-package! company-box
;;   :config
;;   (setq company-box-icons-all-the-icons
;;         `((Unknown       . ,(all-the-icons-material "find_in_page"         :face 'all-the-icons-purple))
;;           (Text          . ,(all-the-icons-material "text_fields"          :face 'all-the-icons-green))
;;           (Method        . ,(all-the-icons-material "functions"            :face 'all-the-icons-red))
;;           (Function      . ,(all-the-icons-material "functions"            :face 'all-the-icons-red))
;;           (Constructor   . ,(all-the-icons-material "functions"            :face 'all-the-icons-red))
;;           (Field         . ,(all-the-icons-faicon "tag"                    :face 'all-the-icons-red))
;;           (Variable      . ,(all-the-icons-material "adjust"               :face 'all-the-icons-blue))
;;           (Class         . ,(all-the-icons-faicon "cog"                    :face 'all-the-icons-red))
;;           (Interface     . ,(all-the-icons-faicon "cogs"                   :face 'all-the-icons-red))
;;           (Module        . ,(all-the-icons-material "view_module"          :face 'all-the-icons-red))
;;           (Property      . ,(all-the-icons-octicon "settings"              :face 'all-the-icons-red))
;;           (Unit          . ,(all-the-icons-material "straighten"           :face 'all-the-icons-red))
;;           (Value         . ,(all-the-icons-material "filter_center_focus"  :face 'all-the-icons-red))
;;           (Enum          . ,(all-the-icons-fileicon "textile"              :face 'all-the-icons-red))
;;           (Keyword       . ,(all-the-icons-octicon "key"                   :face 'all-the-icons-red))
;;           (Snippet       . ,(all-the-icons-material "short_text"           :face 'all-the-icons-red))
;;           (Color         . ,(all-the-icons-material "color_lens"           :face 'all-the-icons-red))
;;           (File          . ,(all-the-icons-material "insert_drive_file"    :face 'all-the-icons-red))
;;           (Reference     . ,(all-the-icons-material "collections_bookmark" :face 'all-the-icons-red))
;;           (Folder        . ,(all-the-icons-material "folder"               :face 'all-the-icons-red))
;;           (EnumMember    . ,(all-the-icons-material "people"               :face 'all-the-icons-red))
;;           (Constant      . ,(all-the-icons-faicon "lock"                   :face 'all-the-icons-red))
;;           (Struct        . ,(all-the-icons-faicon "gavel"                  :face 'all-the-icons-red))
;;           (Event         . ,(all-the-icons-material "event"                :face 'all-the-icons-red))
;;           (Operator      . ,(all-the-icons-material "control_point"        :face 'all-the-icons-red))
;;           (TypeParameter . ,(all-the-icons-material "class"                :face 'all-the-icons-red))
;;           (Template      . ,(all-the-icons-material "short_text"           :face 'all-the-icons-green))
;;           (ElispFunction . ,(all-the-icons-material "functions"            :face 'all-the-icons-red))
;;           (ElispVariable . ,(all-the-icons-material "check_circle"         :face 'all-the-icons-blue))
;;           (ElispFeature  . ,(all-the-icons-material "stars"                :face 'all-the-icons-orange))
;;           (ElispFace     . ,(all-the-icons-material "format_paint"         :face 'all-the-icons-pink))))
;;   )

;;* ISpell ********************************************************************
;; Disable ispell
;; (after! text-mode
;;   (set-company-backend! 'text-mode
;;     '(:separate company-yasnippet company-dabbrev)))
(after! text-mode
  (set-company-backend! 'text-mode nil))

;;* Ediff *********************************************************************
(setq-default ediff-highlight-all-diffs nil)
(setq-default ediff-split-window-function 'split-window-horizontally)

;; Functions to fix org files collapsed when trying to ediff
(add-hook  'ediff-prepare-buffer-hook 'f-ediff-prepare-buffer-hook-setup)
(defun f-ediff-prepare-buffer-hook-setup ()
  ;; specific modes
  (cond ((eq major-mode 'org-mode)
         (f-org-vis-mod-maximum)))

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

;;* Shells / Terminals *********************************************************
;; Disable company mode in terminals (slow file/path lookup on windows).
(add-hook! '(shell-mode-hook eshell-mode-hook term-mode-hook vterm-mode-hook)
           (company-mode -1))

;; Eshell settings
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

;;* Org ************************************************************************
(after! org
  ;; Start org agenda on Sunday
  (setq org-agenda-start-on-weekday 0)
  (setq org-agenda-start-day nil)
  ;; Show this week and next week
  (setq org-agenda-span 14)
  ;; Start agenda in follow mode
  (setq org-agenda-start-with-follow-mode t)
  ;; Remove "SCHEDULED:" from all scheduled dates
  (setq org-agenda-scheduled-leaders '("" "#%2d: "))

  ;; Added settings for org modern.
  (setq ;;org-auto-align-tags nil
        org-catch-invisible-edits 'show-and-error
        ;;org-agenda-tags-column 0
        org-agenda-block-separator ?─)

  (setq org-indent-indentation-per-level 2)
  )



(use-package! org-modern
  :config
  (setq ;;org-modern-star '("●")
        org-modern-star nil
        org-modern-table-vertical 1
        ;; org-modern-list '((?+ . "•")
        ;;                   (?- . "–")
        ;;                   (?* . "◦"))
        ;; org-modern-list '((?+ . "•")
        ;;                   (?- . "•")
        ;;                   (?* . "•"))
        org-modern-checkbox nil ;; Does not look good in current font
        ;; org-modern-keyword " "
        ;; org-modern-internal-target '("  " t " ")
        ;; org-modern-radio-target '("  " t " ")
        org-modern-progress nil
        org-modern-variable-pitch nil
        org-modern-todo nil
        org-modern-priority nil
        org-modern-table nil
        )
  (custom-set-faces!
    '(org-modern-block-keyword :weight semibold)
    '(org-modern-label :width condensed :weight regular :underline nil)
    '(org-modern-tag :background "dim gray" :foreground "white")
    '(org-modern-done :background "dim gray" :foreground "white")
    '(org-modern-internal-target :inherit org-modern-done)
    '(org-modern-radio-target :inherit org-modern-done)
    '(org-modern-priority :inherit org-modern-done :weight semibold :foreground "black")
    '(org-modern-statistics :inherit org-modern-done)
    '(org-modern-date-active :inherit org-modern-done)
    '(org-modern-time-active :inherit org-modern-done :weight semibold :background "gray75" :foreground "black")
    '(org-modern-date-inactive :inherit org-modern-done :background "gray20" :foreground "gray70")
    '(org-modern-time-inactive :inherit org-modern-done :foreground "gray5")
    )
  (global-org-modern-mode))


;;* Org-Tempo ******************************************************************
(use-package! org-tempo
  :config
  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist '("python" . "src python"))
  (add-to-list 'org-structure-template-alist '("rb" . "src ruby"))
  (add-to-list 'org-structure-template-alist '("ruby" . "src ruby"))
  (add-to-list 'org-structure-template-alist '("js" . "src js"))
  (add-to-list 'org-structure-template-alist '("java" . "src java"))
  (add-to-list 'org-structure-template-alist '("mermaid" . "src mermaid"))
  (org-babel-do-load-languages
   'org-babel-do-load-languages
   '((js . t)
     (java . t))))

;;* Org-Superstar **************************************************************
(use-package! org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
  (org-superstar-headline-bullets-list '("●")))

;;* Doom Modeline **************************************************************
(after! doom-modeline
  (setq doom-modeline-indent-info t
        doom-modeline-bar-width 1
        doom-modeline-unicode-fallback t)

  ;; Hide the modeline bar in inactive windows
  (set-face-background 'doom-modeline-bar (face-background 'mode-line))
  (set-face-background 'doom-modeline-bar-inactive (face-background 'mode-line-inactive)))

;;* Col Highlight (manual package) *********************************************
;; (require 'col-highlight)

;;* Dired **********************************************************************
(add-hook 'dired-mode-hook
           (lambda ()
             (dired-hide-details-mode 1)))

;;* Seeing Is Believing ********************************************************
(use-package seeing-is-believing
  :hook (ruby-mode . seeing-is-believing))

;;* DAP ************************************************************************
(after! dap-mode
  (setq dap-python-debugger 'debugpy))

(add-hook 'dap-stopped-hook
          (lambda (arg) (call-interactively #'dap-hydra)))

;;* DAP (ruby) *****************************************************************
(require 'dap-ruby)

;; Note for the future:
;; DAP does not correctly install the vscode extension needed for dap when
;; dap-ruby-install is ran. Instead, you have to download the extension
;; manually from
;; https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby
;; and extract the plugin to the correct path in
;; .emacs.d/.local/etc/dap-extension/vscode/rebornix.Ruby
;; Then install `rdebug-ide' (install ruby-debug-ide and debase gems).


(after! magit
  (setq magit-diff-refine-hunk nil))


(after! treemacs
  (treemacs-indent-guide-mode 1))


;; *****************************************************************************
;; * Custom Functions                                                          *
;; *****************************************************************************
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))


(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -2))

;; *****************************************************************************
;; * Hydras                                                                    *
;; *****************************************************************************

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


;; *****************************************************************************
;; * Non-Leader Bindings                                                       *
;; *****************************************************************************
(map! ;(:map override-global-map
 :m "C-/" #'consult-line
 :mi "C-h" #'evil-window-left
 :mi "C-j" #'evil-window-down
 :mi "C-k" #'evil-window-up
 :mi "C-l" #'evil-window-right

 :m "M-h" #'evil-scroll-left
 :m "M-j" #'evil-scroll-left
 :m "M-k" #'evil-scroll-right
 :m "M-l" #'evil-scroll-right

 :nv "gp" #'+default/yank-pop
 :m "[s" #'embark-previous-symbol
 :m "]s" #'embark-next-symbol
 ;; Next-error / prev-error have issues with jumping to previous buffer instead
 ;; of errors in the current buffer. Flycheck-next/previous-error do not do this.
 :m "[e" #'flycheck-previous-error
 :m "]e" #'flycheck-next-error)


;; *****************************************************************************
;; * Leader Bindings                                                           *
;; *****************************************************************************
;; SPC b
(map! :map doom-leader-buffer-map
      [tab] #'evil-switch-to-windows-last-buffer)

;; SPC c
(map! :map doom-leader-code-map
      ;; "R" #'+eval/send-region-to-repl
      "s" #'lsp-signature-activate
      "p" #'lsp-ui-doc-toggle
      "P" #'lsp-ui-doc-focus-frame
      )

;; SPC f
(map! :map doom-leader-file-map
      "b" #'consult-buffer)

;; SPC h
(map! :map help-map
      "O" #'+lookup/online-select)

;; SPC w
(map! :map evil-window-map
      "s" #'+evil/window-split-and-follow
      "v" #'+evil/window-vsplit-and-follow
      "S" #'hydra-window-swap/body)
      ;; (:prefix-map ("S" . "swap")
      ;;   "S" #'ace-swap-window
      ;;   "H" #'+evil/window-move-left
      ;;   "J" #'+evil/window-move-down
      ;;   "K" #'+evil/window-move-up
      ;;   "L" #'+evil/window-move-right)

;; Org-mode SPC m <localleader>
(map! :map org-mode-map
      :localleader
      "h" #'consult-outline
      "H" #'consult-org-heading)

;; SPC
(map! :leader
      "TAB" #'evil-jump-item
      ;; Replace SPC-s keymap with avy-goto-char
      "s" #'avy-goto-char-2
      "W" doom-leader-workspace-map
      "=" #'hydra-font-size/body
      "-" #'hydra-window-size/body
      "n" #'+treemacs/toggle

      ;; SPC \
      (:prefix-map("\\" . "other")
       :desc "Toggle word wrap" "RET" #'global-visual-line-mode
       :desc "Toggle col Highlight" "h" #'column-highlight-mode
       :desc "Toggle line Highlight" "H" #'hl-line-mode)

      ;; SPC o
      (:prefix-map ("o" . "open")
       "r" nil ;; Clear the keybind for "r" before rebinding it.
        (:prefix ("r" . "roam")
         :desc "Switch to buffer"              "b" #'org-roam-switch-to-buffer
         :desc "Org Roam Capture"              "c" #'org-roam-capture
         :desc "Find file"                     "f" #'org-roam-find-file
         :desc "Show graph"                    "g" #'org-roam-graph
         :desc "Insert"                        "i" #'org-roam-insert
         :desc "Insert (skipping org-capture)" "I" #'org-roam-insert-immediate
         :desc "Org Roam"                      "r" #'org-roam
         (:prefix ("d" . "by date")
          :desc "Arbitrary date" "d" #'org-roam-dailies-find-date
          :desc "Today"          "t" #'org-roam-dailies-find-today
          :desc "Tomorrow"       "m" #'org-roam-dailies-find-tomorrow
          :desc "Yesterday"      "y" #'org-roam-dailies-find-yesterday))
       :desc "REPL"               "R"  #'+eval/open-repl-other-window)
      )


;; *****************************************************************************
;; * Whichkey Description Overrides                                            *
;; *****************************************************************************
;;
;; Need to manually add the labels to replace "+prefix", since which-key does
;; not seem to catch the prefix labels added after initially loading.
;;
(after! which-key
  (which-key-add-key-based-replacements "SPC w S" "swap")
  (which-key-add-key-based-replacements "SPC W" "workspace"))


;; *****************************************************************************
;; * Theme                                                                     *
;; *****************************************************************************
;; Load themes folder
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (load-theme 'tedious t)
(setq doom-theme 'doom-gruvbox)

;; (set-face-attribute 'col-highlight nil :background "#0b4662" :foreground "#ffffff")

;; (after! magit
;;   (set-face-attribute 'magit-diff-added nil :foreground "#909753")
;;   (set-face-attribute 'magit-diff-added-highlight nil :foreground "#b5bd68")
;;   (set-face-attribute 'magit-diff-removed nil :foreground "#a35151")
;;   (set-face-attribute 'magit-diff-removed-highlight nil :foreground "#cc6666")
;; )

;; *****************************************************************************
;; * Spell checking                                                            *
;; *****************************************************************************
(setq ispell-local-dictionary "en_US")
(setq ispell-hunspell-dict-paths-alist '(("en_US" "C:/apps/hunspell/en_US.aff")))
;; (setq ispell-local-dictionary-alist
;; ;; Please note the list `("-d" "en_US")` contains ACTUAL parameters passed to hunspell
;; ;; You could use `("-d" "en_US,en_US-med")` to check with multiple dictionaries
;; '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
(after! ispell
  (setq ispell-program-name "C:/msys64/mingw64/bin/hunspell.exe")

  ;; ;; the following line won't make flyspell-mode enabled by default as you might think
  ;; (flyspell-mode 1)
  ;; ;; ispell-word for showing correcting options of the current misspelled word
  ;; (global-set-key (kbd "M-\\") 'ispell-word)
  )

;; *****************************************************************************
;; * Mermaid                                                                   *
;; *****************************************************************************
(use-package! ob-mermaid
  :config
  (setq ob-mermaid-cli-path "C:/Users/riddl/AppData/Roaming/npm/mmdc.cmd"))


(custom-theme-set-faces! '(doom-tomorrow-night)
  '(magit-diff-added :foreground "#909753" :background nil)
  '(magit-diff-added-highlight :foreground "#b5bd68" :background nil)
  '(magit-diff-removed :foreground "#a35151" :background nil)
  '(magit-diff-removed-highlight :foreground "#cc6666" :background nil)
  )
