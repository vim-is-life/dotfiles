;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Daunovan McCullough"
      user-mail-address "dmccu2@uic.edu")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
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

;; 2024-12-10: setting default font to sexy berkeley mono
(setq doom-font (font-spec :family "Berkeley Mono" :size 15.0 :weight 'semi-bold))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-spectrum)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; 2024-09-18: changing to regular line numbers because can use gsj and gsk and family to get an indicator and then jump to line
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


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



;; function for making sure the line endings are always compatible
(defun no-junk-please-were-unixish ()
  (let ((coding-str (symbol-name buffer-file-coding-system)))
    (when (string-match "-\\(?:dos\\|mac\\)$" coding-str)
      (set-buffer-file-coding-system 'unix))))
(add-hook 'find-file-hook 'no-junk-please-were-unixish) ;; call the function defined earlier i believe this is doing

;;; Miscellaneous config
(setq ispell-program-name "aspell")

(setq lsp-tex-server 'texlab)   ; latex lsp

;; elfeed
(add-hook! 'elfeed-search-mode-hook 'elfeed-update)

;; vterm
(setq! vterm-shell "/usr/bin/zsh")

;; docview settings
(setq! doc-view-continuous t)

;; 2024-12-04: display time and doom modeline settings
(display-time-mode 1)                                     ; set display-time mode to be on for time in modeline
(setq! display-time-24hr-format t
       display-time-mail-string "")
(setq! doom-modeline-buffer-file-name-style 'buffer-name  ; only show unique buffer names
       doom-modeline-major-mode-icon t                    ; show an icon for filetype
       doom-modeline-enable-word-count t                  ; enable word count on selections
       doom-modeline-continuous-word-count-modes          ; show word count all the time for these modes
       '(markdown-mode gfm-mode org-mode))

;; emms
(emms-all)
(emms-default-players)
;; (emms-mode-line 1)
;; (emms-playing-time 1)
(setq! emms-source-file-default-directory (concat "/media/" user-login-name "/escudo/Music/")
       emms-playlist-buffer-name "*Music*"
       emms-info-asynchronously t
       emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)

;; stuff for c
(after! ccls
  (setq! ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t)))
  (set-lsp-priority! 'ccls 2)
  (set-formatter! 'my-clang-fmt
    '("clang-format --style=\"{BasedOnStyle: llvm, IndentWidth: 4}\"")))
                                        ; optional as ccls is the default in Doom

;; 2024-09-09 golden ratio
(use-package golden-ratio
  :hook (after-init . golden-ratio-mode)
  ;; :custom (golden-ratio-exclude-buffer-names '("doom:scratch"))
  :custom (golden-ratio-exclude-modes '(occur-mode calendar-mode))
  :custom (golden-ratio-exclude-buffer-regexp '(".*repl.*"
                                                "*doom:.*"))
  :config (setq! golden-ratio-auto-scale t))

;; 2024-09-15: configuring dirvish quick access entries
(after! dirvish
  (setq! dirvish-quick-access-entries
         `(("h" "~/"                                "Home")
           ("e" ,user-emacs-directory               "Emacs user directory")
           ("e" "~/.dotfiles/.config/doom/"         "Doom user directory")
           ("c" "~/code/"                           "Code")
           ("d" "~/Downloads/"                      "Downloads")
           ("m" ,(concat "/media/" user-login-name) "Mounted drives")
           ("t" "~/.local/share/Trash/files/"       "Trash"))))

;;; org settings
(after! org
  (setq! org-ellipsis " ▼ "
         org-image-actual-width 500
         org-log-done 'time
         org-hide-emphasis-markers t))

;; ox-reveal settings
(setq! org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")

;; org-pomodoro settings
(setq! org-pomodoro-length 25)

;; calc settings
(setq! calc-prefer-frac t
       calc-symbolic-mode t
       calc-internal-prec 50)

;;; 2024-08-19 howm notetaking system config
(use-package! howm
  ;; :mode ("_howm\\.org\\'" . howm-mode)
  :config (progn
            (setq!
             howm-file-ext "_howm.org"
             howm-directory "~/howm/"
             howm-keyword-file (expand-file-name ".howm-keys" howm-directory)
             howm-history-file (expand-file-name ".howm-history" howm-directory)
             howm-file-name-format (concat "%Y/%m/%Y-%m-%d-%H%M%S"
                                           howm-file-ext))
            ;; look at enabling these if howm gets slow.
            ;; see page 70 on tutorial
            ;; howm-view-use-grep t                         ; use external grep
            ;; howm-menu-refresh-after-save nil
            ;; howm-menu-expiry-hours 1                     ; cache menu for n hours
            ;; howm-menu-file "000-00-00-000000.txt"        ; don't *search*
            (add-hook 'org-mode-hook 'howm-mode)))

;;; org ref stuff
(after! org-ref-ivy
  (setq org-ref-insert-link-function 'org-ref-insert-link-hydra/body
        org-ref-insert-cite-function 'org-ref-cite-insert-ivy
        org-ref-insert-label-function 'org-ref-insert-label-link
        org-ref-insert-ref-function 'org-ref-insert-ref-link
        org-ref-cite-onclick-function (lambda (_)
                                        (org-ref-citation-hydra/body))))
(after! org-ref-refproc
  (setq bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"
        bibtex-completion-additional-search-fields '(keywords)
        bibtex-completion-display-formats
        '((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
          (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
          (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
          (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
          (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
        bibtex-completion-pdf-open-function (lambda (fpath) (call-process "open" nil 0 nil fpath)))
  (setq bibtex-dialect 'biblatex))
;; (setq org-latex-pdf-process
;;       '("latexmk -f -pdf -%latex -shell-escape -interaction=nonstopmode -output-directory=%o %f"))


;;; Keybinds
;; winner mode
(map! :leader
      (:prefix ("w" . "window")
       :desc "Winner redo" "<right>" #'winner-redo
       :desc "Winner undo" "<left>" #'winner-undo))

;; emms
(map! :leader
      (:prefix ("e" . "EMMS audio player")
       :desc "Go to emms playlist" "a" #'emms-playlist-mode-go
       :desc "Emms pause track" "x" #'emms-pause
       :desc "Emms stop track" "s" #'emms-stop
       :desc "Emms play previous track" "p" #'emms-previous
       :desc "Emms play next track" "n" #'emms-next
       :desc "Emms play file" "o" #'emms-play-file))

;; ledger-mode: Make C-p go to previous uncleared and C-n go to next uncleared.
(map! :mode 'ledger-mode
      (:desc "Previous uncleared trans" :n "C-p" #'ledger-navigate-previous-uncleared
       :desc "Next uncleared trans" :n "C-n" #'ledger-navigate-next-uncleared))

;; 2024-09-10: golden-ratio: hook into window move commands to do auto resizing
;; TODO: do this in a better way where it just hooks in after an evil window jump command
(map! :mode 'golden-ratio-mode
      :leader
      (:prefix ("w" . "Golden ratio window functions")
       :desc "Move to right window" "l" (cmd! (evil-window-right 1) (golden-ratio))
       :desc "Move to left window"  "h" (cmd! (evil-window-left 1) (golden-ratio))
       :desc "Move to upper window" "k" (cmd! (evil-window-up 1) (golden-ratio))
       :desc "Move to lower window" "j" (cmd! (evil-window-down 1) (golden-ratio))
       :desc "Toggle golden ratio"  "t" #'golden-ratio-mode))

;; 2024-09-11: adding keymap for inserting date regardless of mode
(map! :i "C-i" (cmd! (insert (string-trim (shell-command-to-string "date '+%Y-%m-%d'")))))
