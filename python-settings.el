(require 'python-mode)

;; check python code with flymake+pylint
;;(when (load "flymake" t)
;;  (defun flymake-pylint-init ()
;;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                       'flymake-create-temp-inplace))
;;           (local-file (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;      (list "epylint" (list local-file))))
;;
;;  (add-to-list 'flymake-allowed-file-name-masks
;;               '("\\.py\\'" flymake-pylint-init)))

(defun my-python-hook ()
  (setq tab-width 4
        py-indent-offset 4
        indent-tabs-mode nil
        py-smart-indentation t
        whitespace-style '(trailing lines-tail space-after-tab space-before-tab)
        whitespace-line-column 80)
  (require 'whitespace)
  (whitespace-mode t)
  (require 'smart-operator)
  (smart-operator-mode-on)
  (require 'imenu)
  (require 'linum)
  ;;(linum-mode t)
  (transient-mark-mode t)
  (require 'pycomplete)
  (flymake-mode)

  ;; rope
;;  (require 'pymacs)
;;  (pymacs-load "ropemacs" "rope-")
;;  (setq ropemacs-enable-autoimport t)

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
  
  ;;pylint
  (load-library "pylint")
  ;;ipython
  (require 'ipython)
  (setq py-python-command-args '("-colors" "Linux"))
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
