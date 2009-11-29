
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))


(add-to-list 'load-path "~/.emacs.d/")
;; switch buffers by shift + arrow
(load "switch-buffer")
;; load local options
(load "general-options")

;; ansi-color to enable color output in shell
(load-library "ansi-color")
(ansi-color-for-comint-mode-on)

;; useful modes
(require 'ido)
(ido-mode t)
(require 'ffap)
(require 'uniquify)
(require 'recentf)
(recentf-mode t)

;; save sessions
(setq desktop-path '("~/.emacs.d/"))
(setq desktop-dirname "~/.emacs.d/")
(setq desktop-base-file-name "desktop")
(desktop-save-mode t)

;; remember last position in the file
;;(require 'saveplace)
;;(setq-default save-place t)
;;(setq save-place-file "~/.emacs.d/save-place")
;;(setq save-place-limit 500)

;; YASnippets
(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas/initialize)
(setq yas/root-directory '("~/.emacs.d/yasnippet/snippets" 
			   "~/.emacs.d/yasnippet/mysnippets"))
(mapc 'yas/load-directory yas/root-directory)

;; git
(require 'git)
(require 'gitsum)

;; python settings
(require 'python-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Auto-completion
;;; Integrates:
;;; 1) Rope
;;; 2) Yasnippet
;;; all with AutoComplete.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun prefix-list-elements (list prefix)
  (let (value)
    (nreverse
     (dolist (element list value)
       (setq value (cons (format "%s%s" prefix element) value))))))
(defvar ac-source-rope
  '((candidates
     . (lambda ()
         (prefix-list-elements (rope-completions) ac-target))))
  "Source for Rope")
(defun ac-python-find ()
  "Python `ac-find-function'."
  (require 'thingatpt)
  (let ((symbol (car-safe (bounds-of-thing-at-point 'symbol))))
    (if (null symbol)
        (if (string= "." (buffer-substring (- (point) 1) (point)))
            (point)
          nil)
      symbol)))
(defun ac-python-candidate ()
  "Python `ac-candidates-function'"
  (let (candidates)
    (dolist (source ac-sources)
      (if (symbolp source)
          (setq source (symbol-value source)))
      (let* ((ac-limit (or (cdr-safe (assq 'limit source)) ac-limit))
             (requires (cdr-safe (assq 'requires source)))
             cand)
        (if (or (null requires)
                (>= (length ac-target) requires))
            (setq cand
                  (delq nil
                        (mapcar (lambda (candidate)
                                  (propertize candidate 'source source))
                                (funcall (cdr (assq 'candidates source)))))))
        (if (and (> ac-limit 1)
                 (> (length cand) ac-limit))
            (setcdr (nthcdr (1- ac-limit) cand) nil))
        (setq candidates (append candidates cand))))
    (delete-dups candidates)))
(add-hook 'python-mode-hook
          (lambda ()
            (auto-complete-mode 1)
            (set (make-local-variable 'ac-sources)
                 (append ac-sources '(ac-source-rope))) ;;(append ac-sources '(ac-source-rope) '(ac-source-yasnippet)))
            (set (make-local-variable 'ac-find-function) 'ac-python-find)
            (set (make-local-variable 'ac-candidate-function) 'ac-python-candidate)
            (set (make-local-variable 'ac-auto-start) nil)))
;;Ryan's python specific tab completion
(defun ryan-python-tab ()
                                        ; Try the following:
                                        ; 1) Do a yasnippet expansion
                                        ; 2) Do a Rope code completion
                                        ; 3) Do an indent
  (interactive)
  (if (eql (ac-start) 0)
      (indent-for-tab-command)))
(defadvice ac-start (before advice-turn-on-auto-start activate)
  (set (make-local-variable 'ac-auto-start) t))
(defadvice ac-cleanup (after advice-turn-off-auto-start activate)
  (set (make-local-variable 'ac-auto-start) nil))
;;(define-key py-mode-map "\t" 'ryan-python-tab)
(define-key py-mode-map [C-tab]  'ryan-python-tab)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; End Auto Completion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun my-python-hook ()
  (require 'whitespace)
  (whitespace-mode t)
  (setq tab-width 4
        py-indent-offset 4
        indent-tabs-mode nil
        py-smart-indentation t
        whitespace-style '(tabs spaces trailing lines-tail newline 
            space-after-tab space-before-tab)
        whitespace-line-column 80)
  (require 'imenu)
  (require 'linum)
  ;;(linum-mode t)
  (transient-mark-mode t)
  (require 'pycomplete)
  (autoload 'pymacs-load "pymacs" nil t)
  (autoload 'pymacs-eval "pymacs" nil t)
  (autoload 'pymacs-apply "pymacs")
  (autoload 'pymacs-call "pymacs")
  (require 'auto-complete-config)
  (auto-complete-mode t)
  (require 'pymacs)
  (pymacs-load "ropemacs" "rope-")
  (setq ropemacs-enable-autoimport t)

  ;;ipython
  ;;(require 'ipython)
  ;;(setq py-python-command-args '("-colors" "LightBG"))
  ;;pdb
  ;;(setq pdb-path '/usr/lib/python2.5/pdb.py
  ;;	gud-pdb-command-name (symbol-name pdb-path))
  ;;(defadvice pdb (before gud-query-cmdline activate)
  ;;  "Provide a better default command line when called interactively."
  ;;  (interactive
  ;;   (list (gud-query-cmdline pdb-path
  ;;			      (file-name-nondirectory buffer-file-name)))))
)

(add-hook 'python-mode-hook 'my-python-hook)

;; set color theme
(require 'color-theme)
;;(setq color-theme-is-global t)
(require 'color-theme-tango)
(color-theme-tango)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((py-indent-offset . 4)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
