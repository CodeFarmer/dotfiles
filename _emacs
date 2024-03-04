
(require 'package)

;; https has problems as of march 2020
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))
(package-initialize)

;; other bits and pieces
(setq inhibit-startup-message t) ;; No splash screen
(setq initial-scratch-message nil) ;; No scratch message
(tool-bar-mode nil) ;; No toolbars

(setq lispy-hook
      (lambda ()
	(highlight-parentheses-mode t)
	(paredit-mode t)))

(require 'clojure-mode)

(add-hook 'clojure-mode-hook lispy-hook)

(add-hook 'cider-repl-mode-hook lispy-hook)

(add-hook 'emacs-lisp-mode-hook lispy-hook)

(setq cider-cljs-lein-repl
      "(do (user/run)
           (user/browser-repl))")

(add-hook 'slime-mode-hook lispy-hook)
(add-hook 'slime-repl-mode-hook lispy-hook)

(global-set-key (kbd "C-x C-S-f") (quote find-file-other-frame))

(add-to-list 'auto-mode-alist '("\\.hla\\'" . asm-mode))

(setq org-startup-folded nil)


;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph    
(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        ;; This would override `fill-column' if it's an integer.
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))

(define-key global-map "\M-Q" 'unfill-paragraph)

(define-key global-map "\M-/" 'comment-dwim)

(setq byte-compile-warnings '(not docstrings))
