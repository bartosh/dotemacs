
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
(require 'midnight)
(setq clean-buffer-list-delay-general)
(require 'ido)
(setq ido-save-directory-list-file "~/.emacs.d/ido.last")
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

  ;; rope
  (require 'pymacs)
  (pymacs-load "ropemacs" "rope-")
  (setq ropemacs-enable-autoimport t)

;;   (require 'auto-complete-config)
;;   (ac-ropemacs-initialize)
;;   (ac-yasnippet-initialize)
;;   (auto-complete-mode t)
;;   (setq ac-auto-start nil)
;;   (setq ac-dwim t)
;;   (set-default 'ac-sources 
;; 	       '(ac-source-abbrev 
;; 		 ac-source-words-in-buffer 
;; 		 ac-source-yasnippet
;; 		 ac-source-ropemacs)) 

;;   (defun my-complete ()
;;     (interactive)
;;     (if (eql (ac-start) 0)
;; 	(indent-for-tab-command)))

;;   (defadvice ac-start (before advice-turn-on-auto-start activate)
;;     (set (make-local-variable 'ac-auto-start) t))
;;   (defadvice ac-cleanup (after advice-turn-off-auto-start activate)
;;     (set (make-local-variable 'ac-auto-start) nil))

;;   (define-key py-mode-map "\t" 'my-complete)
  
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

