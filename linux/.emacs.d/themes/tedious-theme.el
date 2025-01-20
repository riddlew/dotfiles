(deftheme tedious)

;; (class color) (min-color #xFFFFFF)
(let ((class '((class color) (min-colors 89)))
      ;; (t-bg-1        "#1d1d1d")
      ;; (t-bg-2        "#151515")
      (t-bg-0        "#0d0e11")
      (t-bg-1        "#18191f")
      (t-bg-2        "#1f2024")
      (t-bg-3        "#282b33")
      (t-bg-4        "#34373e")
      (t-bg-5        "#41454b")
      (t-bg-6        "#515462")


      (t-grey-1      "#999999")
      (t-grey-2      "#6e7899")
      (t-grey-3      "#b2c1da")

      (t-white-1     "#e8e8d3")
      (t-white-2     "#d3d7cf")

      (t-red-1       "#ff8484")
      (t-red-2       "#d97474")
      (t-red-3       "#ff3e3e")
      (t-red-4       "#de5577")
      ;; (t-red-5       "#701919")
      (t-red-5       "#461212")

      (t-yellow-1    "#ffcc5c")
      (t-yellow-2    "#e1af6a")

      (t-blue-1      "#5cb2ff")
      (t-blue-2      "#4b93d1")
      (t-blue-3      "#4585be")
      (t-blue-4      "#4568b3")

      (t-cyan-1      "#5cecc6")
      (t-cyan-2      "#63ceb0")

      (t-green-1     "#c5f467")
      (t-green-2     "#a7cb6d")
      (t-green-3     "#3eff3e")
      (t-green-4     "#67b842")
      ;; (t-green-5     "#197019")
      (t-green-5     "#124612")

      (t-purple-1    "#dfafff")
      (t-purple-2    "#bb93d6")

      (t-pink-1 "#FF00FF")
      )

  (custom-theme-set-faces
   'tedious

   ;; *************
   ;; * Font Lock *
   ;; *************
   `(font-lock-builtin-face              ((,class (:foreground ,t-blue-1))))
   `(font-lock-comment-face              ((,class (:foreground ,t-grey-1))))
   `(font-lock-constant-face             ((,class (:foreground ,t-blue-1))))
   `(font-lock-doc-face                  ((,class (:foreground ,t-green-1))))
   `(font-lock-function-name-face        ((,class (:foreground ,t-yellow-1))))
   `(font-lock-keyword-face              ((,class (:foreground ,t-blue-1))))
   `(font-lock-preprocessor-face         ((,class (:foreground ,t-cyan-1))))
   `(font-lock-string-face               ((,class (:foreground ,t-green-1))))
   `(font-lock-type-face                 ((,class (:foreground ,t-yellow-1))))
   `(font-lock-variable-name-face        ((,class (:foreground ,t-purple-1))))
   `(font-lock-warning-face              ((,class (:foreground ,t-red-1))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,t-red-1))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,t-pink-1))))
   `(font-lock-negation-char-face        ((,class (:foreground ,t-pink-1))))

   ;; ***********
   ;; * Default *
   ;; ***********
   `(default                             ((,class (:background ,t-bg-2 :foreground ,t-white-1))))
   `(region                              ((,class (:background ,t-blue-1 :foreground ,t-bg-2 :extend nil))))
   `(italic                              ((,class (:underline nil :slant italic))))
   `(highlight                           ((,class (:background ,t-bg-5))))
   `(hl-line                             ((,class ())))
   `(fringe                              ((,class (:background nil :foreground ,t-grey-1))))
   `(cursor                              ((,class (:background ,t-white-1 :foreground "black"))))
   `(show-paren-match                    ((,class (:background ,t-yellow-1 :foreground "black"))))
   `(show-paren-mismatch                 ((,class (:background ,t-red-1 :foreground "black"))))
   `(isearch                             ((,class (:background ,t-yellow-1 :foreground "black"))))
   `(isearch-fail                        ((,class (:background ,t-red-1 :foreground "black"))))
   `(isearch-group-1                     ((,class (:background ,t-blue-2 :foreground "black"))))
   `(isearch-group-2                     ((,class (:background ,t-purple-2 :foreground "black"))))
   `(vertical-border                     ((,class (:foreground ,t-grey-1))))
   `(minibuffer-prompt                   ((,class (:foreground ,t-blue-1))))
   `(link                                ((,class (:foreground ,t-cyan-1 :underline t))))
   `(warning                             ((,class (:foreground ,t-yellow-1))))
   `(error                               ((,class (:foreground ,t-red-1))))
   `(line-number                         ((,class (:foreground ,t-grey-1))))
   `(line-number-current-line            ((,class (:foreground ,t-yellow-1))))

   ;; ***********
   ;; * Company *
   ;; ***********
   ;; `(company-preview-common              ((,class (:foreground "#ff0000"))))
   ;; `(company-scrollbar-fg                ((,class (:foreground "#ff00ff"))))
   ;; `(company-scrollbar-bg                ((,class (:foreground "#ffff00"))))
   ;; `(company-tooltip                     ((,class (:foreground "#00ffff"))))
   ;; `(company-tooltip-common              ((,class (:foreground "#0000ff"))))
   ;; `(company-tooltip-selection           ((,class (:foreground "#00ff00"))))

   ;; ***************
   ;; * Company Box *
   ;; ***************
   ;; Background
   `(company-tooltip                     ((,class (:background ,t-bg-3))))
   ;; Method, Variable, etc
   `(company-box-annotation              ((,class (:foreground ,t-blue-1))))
   ;; Name color
   `(company-box-candidate               ((,class (:foreground ,t-white-1))))
   ;; Highlighted part of match
   `(company-tooltip-common              ((,class (:foreground ,t-white-1))))
   ;; Highlighted part of match in selection
   `(company-tooltip-common-selection    ((,class (:foreground "black"))))
   ;; Selection and scrollbar background
   `(company-tooltip-selection           ((,class (:background ,t-blue-1 :foreground "black"))))

   ;; ************
   ;; * Modeline *
   ;; ************
   `(mode-line                           ((,class (:bold nil :foreground ,t-white-1 :background ,t-bg-4))))
   `(mode-line-inactive                  ((,class (:background ,t-bg-4 :foreground ,t-grey-2))))
   `(mode-line-buffer-id                 ((,class (:foreground ,t-white-1))))
   `(mode-line-highlight                 ((,class (:background ,t-purple-1))))
   `(mode-line-emphasis                  ((,class (:foreground ,t-white-1))))

   ;; *****************
   ;; * Doom Modeline *
   ;; *****************
   `(doom-modeline-bar                   ((,class (:inherit 'mode-line))))
   `(doom-modeline-bar-inactive          ((,class (:inherit 'mode-line-inactive))))
   `(doom-modeline-panel                 ((,class (:background ,t-blue-1 :foreground "black"))))
   `(doom-modeline-evil-emacs-state      ((,class (:background ,t-white-1 :foreground "black"))))
   `(doom-modeline-evil-normal-state     ((,class (:background ,t-green-1 :foreground "black"))))
   `(doom-modeline-evil-motion-state     ((,class (:background ,t-green-2 :foreground "black"))))
   `(doom-modeline-evil-operator-state   ((,class (:background ,t-bg-6 :foreground "black"))))
   `(doom-modeline-evil-insert-state     ((,class (:background ,t-yellow-1 :foreground "black"))))
   `(doom-modeline-evil-replace-state    ((,class (:background ,t-red-1 :foreground "black"))))
   `(doom-modeline-evil-visual-state     ((,class (:background ,t-blue-1 :foreground "black"))))

   ;; ************
   ;; * Org Mode *
   ;; ************
   `(org-code                            ((,class (:foreground ,t-green-1 :inherit 'fixed-pitch))))
   ;; `(org-hide                            ((,class (:background ,t-blue-1 :foreground "black"))))
   `(outline-1                           ((,class (:foreground ,t-yellow-1))))
   `(outline-2                           ((,class (:foreground ,t-blue-1))))
   `(outline-3                           ((,class (:foreground ,t-purple-1))))
   `(outline-4                           ((,class (:foreground ,t-cyan-1))))
   `(outline-5                           ((,class (:foreground ,t-yellow-1))))
   `(outline-6                           ((,class (:foreground ,t-blue-1))))
   `(outline-7                           ((,class (:foreground ,t-purple-1))))
   `(outline-8                           ((,class (:foreground ,t-cyan-1))))
   `(org-headline-done                   ((,class (:foreground ,t-white-1))))
   `(org-headline-todo                   ((,class (:foreground ,t-white-1))))
   `(org-date                            ((,class (:foreground ,t-cyan-1 :bold t :inherit 'fixed-pitch))))
   `(org-sexp-date                       ((,class (:inherit 'org-date))))
   `(org-footnote                        ((,class (:foreground ,t-cyan-1))))
   ;; `(org-link                            ((,class (:foreground ,t-cyan-1 :underline "black"))))
   ;; `(org-special-keyword                 ((,class (:background ,t-blue-1 :foreground "black"))))
   `(org-block-begin-line                ((,class (:background ,t-bg-4 :foreground ,t-grey-1 :inherit 'fixed-pitch))))
   `(org-block-end-line                  ((,class (:inherit 'org-block-begin-line))))
   `(org-block                           ((,class (:background ,t-bg-4 :inherit 'fixed-pitch))))
   ;; `(org-quote                           ((,class (:background ,t-blue-1 :foreground "black"))))
   ;; `(org-verse                           ((,class (:background ,t-blue-1 :foreground "black"))))
   `(org-todo                            ((,class (:foreground ,t-yellow-1 :bold t))))
   `(org-done                            ((,class (:foreground ,t-green-1 :bold t))))
   `(org-warning                         ((,class (:foreground ,t-red-1 :bold t))))
   `(org-agenda-structure                ((,class (:foreground ,t-blue-1))))
   `(org-agenda-date                     ((,class (:foreground ,t-white-1))))
   ;; `(org-agenda-date-weekend             ((,class (:background ,t-blue-1 :foreground "black"))))
   `(org-agenda-date-today               ((,class (:foreground ,t-blue-1))))
   `(org-agenda-done                     ((,class (:foreground ,t-green-1))))
   `(org-scheduled                       ((,class (:foreground ,t-purple-1))))
   `(org-scheduled-today                 ((,class (:foreground ,t-yellow-1))))
   `(org-ellipsis                        ((,class (:underline nil))))
   `(org-verbatim                        ((,class (:foreground ,t-purple-1))))
   `(org-document-title                  ((,class (:foreground ,t-cyan-1))))
   `(org-document-info                   ((,class (:inherit 'org-document-title))))
   `(org-document-info-keyword           ((,class (:foreground ,t-red-1))))
   `(org-table                           ((,class (:foreground ,t-grey-3))))
   ;; `(org-meta-line                       ((,class (:inherit 'org-block))))
   `(org-checkbox                        ((,class (:foreground ,t-yellow-1))))

   ;; *******
   ;; * Ivy *
   ;; *******
   `(ivy-minibuffer-match-face-1         ((,class (:background unspecified))))
   `(ivy-minibuffer-match-face-2         ((,class (:foreground ,t-yellow-1))))
   `(ivy-minibuffer-match-face-3         ((,class (:foreground ,t-green-1))))
   `(ivy-minibuffer-match-face-4         ((,class (:foreground ,t-purple-1))))
   `(ivy-minibuffer-match-highlight      ((,class (:inherit 'ivy-current-match))))

   ;; ****************
   ;; * Ivy Posframe *
   ;; ****************
   `(ivy-posframe                        ((,class (:background ,t-bg-1))))
   `(ivy-posframe-border                 ((,class (:background unspecified))))

   ;; *********
   ;; * Dired *
   ;; *********
   `(dired-directory                     ((,class (:foreground ,t-blue-1))))
   `(dired-broken-symlink                ((,class (:background ,t-red-3 :foreground ,t-white-1))))
   `(dired-symlink                       ((,class (:foreground ,t-cyan-1))))
   ;; `(dired-flagged                       ((,class (:foreground ,t-blue-1))))
   ;; `(dired-header                        ((,class (:foreground ,t-blue-1))))
   ;; `(dired-ignored                       ((,class (:foreground ,t-blue-1))))
   ;; `(dired-mark                          ((,class (:foreground ,t-blue-1))))
   ;; `(dired-marked                        ((,class (:foreground ,t-blue-1))))
   ;; `(dired-perm-write                    ((,class (:foreground ,t-blue-1))))
   ;; `(dired-set-id                        ((,class (:foreground ,t-blue-1))))
   ;; `(dired-special                       ((,class (:foreground ,t-blue-1))))
   ;; `(dired-warning                       ((,class (:foreground ,t-blue-1))))

   ;; **********
   ;; * Eshell *
   ;; **********
   `(eshell-ls-executable                ((,class (:foreground ,t-red-1))))
   `(eshell-prompt                       ((,class (:foreground ,t-blue-1))))

   ;; ********************************
   ;; * Rainbow Delimiters           *
   ;; ********************************
   `(rainbow-delimiters-unmatched-face   ((,class (:foreground ,t-red-3))))
   `(rainbow-delimiters-depth-1-face     ((,class (:foreground "dark orange"))))
   `(rainbow-delimiters-depth-2-face     ((,class (:foreground "deep pink"))))
   `(rainbow-delimiters-depth-3-face     ((,class (:foreground "chartreuse"))))
   `(rainbow-delimiters-depth-4-face     ((,class (:foreground "deep sky blue"))))
   `(rainbow-delimiters-depth-5-face     ((,class (:foreground "yellow"))))
   `(rainbow-delimiters-depth-6-face     ((,class (:foreground "sienna1"))))
   `(rainbow-delimiters-depth-7-face     ((,class (:foreground "spring green"))))
   `(rainbow-delimiters-depth-8-face     ((,class (:foreground "orchid"))))

   ;; ********************************
   ;; * Evil                         *
   ;; ********************************
   `(evil-ex-lazy-highlight              ((,class (:background ,t-white-1 :foreground "black"))))
   ;; `(evil-ex-search                      ((,class (:background "#dd0093"))))
   `(evil-ex-substitute-matches          ((,class (:foreground ,t-red-1))))
   `(evil-ex-substitute-replacement      ((,class (:foreground ,t-green-1))))

   ;; ********************************
   ;; * Evil Goggles                 *
   ;; ********************************
   `(evil-goggles-delete-face            ((,class (:background ,t-red-1 :foreground "black"))))
   `(evil-goggles-change-face            ((,class (:background ,t-blue-1 :foreground "black"))))
   `(evil-goggles-yank-face              ((,class (:background ,t-yellow-1 :foreground "black"))))
   `(evil-goggles-join-face              ((,class (:background ,t-green-1 :foreground "black"))))
   `(evil-goggles-paste-face             ((,class (:background ,t-green-1 :foreground "black"))))
   `(evil-goggles-replace-with-registe-face ((,class (:background ,t-blue-1 :foreground "black"))))
   `(evil-goggles-surround-face          ((,class (:background ,t-blue-1 :foreground "black"))))

   ;; ********************************
   ;; * Magit                        *
   ;; ********************************
   `(magit-diff-removed                  ((,class (:background ,t-red-5 :foreground ,t-white-2))))
   `(magit-diff-removed-highlight        ((,class (:background ,t-red-5 :foreground ,t-white-2))))
   `(diff-refine-removed                 ((,class (:background ,t-red-5 :foreground ,t-red-2))))
   `(magit-diff-added                    ((,class (:background ,t-green-5 :foreground ,t-white-2))))
   `(magit-diff-added-highlight          ((,class (:background ,t-green-5 :foreground ,t-white-2))))
   `(diff-refine-added                   ((,class (:background ,t-green-5 :foreground ,t-green-2))))

   ;; ********************************
   ;; * Git Gutter                   *
   ;; ********************************
   `(git-gutter:added                    ((,class (:foreground ,t-green-1))))
   `(git-gutter:deleted                  ((,class (:foreground ,t-red-1))))
   `(git-gutter:modified                 ((,class (:foreground ,t-blue-1))))

   ;; ********************************
   ;; * Flycheck                     *
   ;; ********************************
   `(flycheck-error                      ((,class (:foreground ,t-red-1 :underline (:style line :color ,t-red-1)))))
   `(flycheck-warning                    ((,class (:foreground ,t-yellow-1 :underline (:style line :color ,t-yellow-1)))))
   `(flycheck-info                      ((,class (:foreground ,t-cyan-1 :underline (:style line :color ,t-cyan-1)))))
   `(flycheck-fringe-error               ((,class (:foreground ,t-red-1))))
   `(flycheck-fringe-warning             ((,class (:foreground ,t-yellow-1))))
   `(flycheck-fringe-info                ((,class (:foreground ,t-cyan-1))))
   `(quick-peek-background-face          ((,class (:foreground ,t-cyan-1))))


   ;; ********************************
   ;; * LSP Headerline             *
   ;; ********************************
   `(lsp-headerline-breadcrumb-path-error-face ((,class (:foreground ,t-red-1 :underline (:style line :color ,t-red-1)))))
   `(lsp-headerline-breadcrumb-path-warning-face((,class (:foreground ,t-yellow-1 :underline (:style line :color ,t-yellow-1)))))
   `(lsp-headerline-breadcrumb-path-info-face((,class (:foreground ,t-cyan-1 :underline (:style line :color ,t-cyan-1)))))
   ;; `(lsp-headerline-breadcrumb-path-hint-face((,class (:foreground ,t-cyan-1 :underline (:style line :color ,t-cyan-1)))))
   `(lsp-headerline-breadcrumb-symbols-error-face ((,class (:foreground ,t-red-1 :underline (:style line :color ,t-red-1)))))
   `(lsp-headerline-breadcrumb-symbols-warning-face((,class (:foreground ,t-yellow-1 :underline (:style line :color ,t-yellow-1)))))
   `(lsp-headerline-breadcrumb-symbols-info-face((,class (:foreground ,t-cyan-1 :underline (:style line :color ,t-cyan-1)))))
   ;; `(lsp-headerline-breadcrumb-symbols-hint-face((,class (:foreground ,t-cyan-1 :underline (:style line :color ,t-cyan-1)))))











   )
  )

;; Autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'tedious)
