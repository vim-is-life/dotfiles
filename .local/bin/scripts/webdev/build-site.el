;;; -*- lexical-binding: t -*-
;; Taken from
;; <https://systemcrafters.net/publishing-websites-with-org-mode/building-the-site/>

(message "Starting build ...")

;; define base dirs
(defconst proj-dir "/home/shark/Documents/webdev")
(defconst org-dir (concat proj-dir "/org"))
(defconst html-dir (concat proj-dir "/html"))

;; Set the package install directory so that packages aren't stored in the
;; default path.
(require 'package)
(setq package-user-dir (concat org-dir "/.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

;; Load the publishing system
(require 'ox-publish)

(defconst site/org-html-head
  (concat
   ;; "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\">\n"
   "<link rel=\"stylesheet\" href=\"/static/style.css\">\n"))

;; Define some variables to clean up our HTML output
(setq org-html-doctype "html5"
      org-html-validation-link nil
      ;; org-html-head-include-scripts nil
      ;; org-html-head-include-default-style nil
      org-html-head site/org-html-head
      org-export-with-smart-quotes t)

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "www.mosleyd.xyz"
             :recursive t
             :base-directory (concat org-dir "/www.mosleyd.xyz")
             :publishing-directory (concat html-dir "/www.mosleyd.xyz")
             :publishing-function 'org-html-publish-to-html
             :with-author nil
             :with-creater nil
             :with-toc nil
             :section-numbers nil
             :time-stamp-file nil)
       (list "blog.mosleyd.xyz"
             :recursive t
             :base-directory (concat org-dir "/blog.mosleyd.xyz")
             :publishing-directory (concat html-dir "/blog.mosleyd.xyz")
             :publishing-function 'org-html-publish-to-html
             :author "Daunovan Mosley"
             :email "daunovan@mail.mosleyd.xyz"
             :with-author t
             :with-creater t
             :with-date t
             :with-toc t
             :section-numbers nil
             :time-stamp-file nil)
       (list "www.wikileaf.xyz"
             :recursive t
             :base-directory (concat org-dir "/www.wikileaf.xyz")
             :publishing-directory (concat html-dir "/www.wikileaf.xyz")
             :publishing-function 'org-html-publish-to-html
             :with-author nil
             :with-creater nil
             :with-toc nil
             :section-numbers nil
             :time-stamp-file nil)
       (list "blog.wikileaf.xyz"
             :recursive t
             :base-directory (concat org-dir "/blog.wikileaf.xyz")
             :publishing-directory (concat html-dir "/blog.wikileaf.xyz")
             :publishing-function 'org-html-publish-to-html
             :author "Just another human"
             :with-author t
             :email "downward AT spiral DOT com"
             :with-email t
             :with-creater nil
             :with-toc t
             :section-numbers nil
             :time-stamp-file nil)))

(org-publish-all t)

(message "Build complete!")
