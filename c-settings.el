(add-hook 'text-mode-hook 'turn-on-auto-fill)
(require 'cc-mode)

(define-abbrev-table 'c-mode-abbrev-table
  '(("#i" "#include" c-electric-continued-statement 0)
    ("#d" "#define" c-electric-continued-statement 0)
    ("#e" "#endif" c-electric-continued-statement 0)
    ("sw" "switch" c-electric-continued-statement 0)
    ("ca" "case" c-electric-continued-statement 0)
    ("br" "break" c-electric-continued-statement 0)
    ("ret" "return" c-electric-continued-statement 0)
    ("wh" "while" c-electric-continued-statement 0)))

(defun my-c-hook ()
  (c-set-style "gnu")
  ;; (c-toggle-auto-hungry-state 1)
  (line-number-mode t)
  (column-number-mode t)
  (abbrev-mode t)
  (auto-fill-mode t)
  (setq 
   tab-width 3
   indent-tabs-mode nil
   whitespace-style '(trailing lines-tail space-after-tab space-before-tab)
   whitespace-line-column 80)
  (require 'whitespace)
  (whitespace-mode t)
  ;;(setq c-tab-always-indent t)
  (local-set-key [return] 'reindent-then-newline-and-indent)
)

(add-hook 'c-mode-hook 'my-c-hook)

(message "cc-mode initialised")
