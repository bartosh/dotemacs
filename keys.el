;; keys
(defun Kill-Line ()
    (interactive)
    (beginning-of-line)
    (kill-line))
(global-set-key "\C-y" 'Kill-Line)
