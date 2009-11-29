;; keys
(defun Kill-Line ()
    (interactive)
    (beginning-of-line)
    (kill-line))
(global-set-key "\C-y" 'Kill-Line)

(global-set-key [(alt z)] 'undo)
(global-set-key "\M-g" 'goto-line)

;; examples
;;(global-set-key [(ctrl f2)] 'save-buffer)
;;(global-set-key [(s f2)] 'dired) ;; windows key + F2
;;(global-set-key [(shift f2)] 'ibuffer)

;; Unassigned simple key combinations
;; [(ctrl f1)] - [(ctrl f12)]
;; [(shift f1)] - [(shift f12)]
;; [(s f1)] - [(s f12)] - windows key + F1-F12

