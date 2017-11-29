
(require 'package)

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; other bits and pieces
(setq inhibit-startup-message t) ;; No splash screen
(setq initial-scratch-message nil) ;; No scratch message
(tool-bar-mode nil) ;; No toolbars

(require 'clojure-mode)

(add-hook 'clojure-mode-hook
	  (lambda ()
	    (highlight-parentheses-mode t)
	    (paredit-mode t)))

(add-hook 'cider-repl-mode-hook
	  (lambda ()
	    (highlight-parentheses-mode t)
	    (paredit-mode t)))

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (highlight-parentheses-mode t)
	    (paredit-mode t)))

(setq cider-cljs-lein-repl
      "(do (user/run)
           (user/browser-repl))")

(global-set-key (kbd "C-x C-S-f") (quote find-file-other-frame))
