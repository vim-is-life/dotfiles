;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;; (package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;; (package! another-package
;;   :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;; (package! this-package
;;   :recipe (:host github :repo "username/repo"
;;            :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;; (package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;; (package! builtin-package :recipe (:nonrecursive t))
;; (package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;; (package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;; (package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;; (unpin! pinned-package)
;; ...or multiple packages
;; (unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;; (unpin! t)

;;; citations
;; 2023-??-??  will maybe try to use native org cites.... we'll see
(package! org-ref)      ; citations, cross-references, and more
(package! ivy-bibtex)   ; insert citations with org mode/org-ref

;;; other
;; 2023-??-?? arduino for microcontrollers class
(package! arduino-mode
  :recipe (:host github :repo "bookest/arduino-mode"))

;; 2024-08-19 for note taking
(package! howm)

;; 2024-08-20 for ulisp work
(package! ulisp-repl)

;; 2024-09-09 for auto managing buffer size
(package! golden-ratio)

;; 2025-01-26 for added rref functionality to calc-mode
;; taken from https://github.com/doomemacs/doomemacs/blob/master/docs/getting_started.org#usingloading-local-packages
(package! calc-rref
  :recipe (:local-repo "~/.config/doom/packages/calc-rref/"))

;; 2025-03-04: adding mpvi package to be able to control mpv from emacs
(package! mpvi
  :recipe (:local-repo "~/.config/doom/packages/mpvi/"))

;; 2025-12-02: adding this to help with studying
(package! org-drill)
