;;
;; Switch between buffers
;;
(defun kampi-previous-buffer ()
  "Hmm, to be frank, this is just the same as bury-buffer.
Used to wander through the buffer stack with the keyboard."
  (interactive)
  (bury-buffer))

(defun kampi-next-buffer ()
  "Cycle to the next buffer with keyboard."
  (interactive)
  (let* ((bufs (buffer-list))
           (entry (1- (length bufs)))
           val)
    (while (not (setq val (nth entry bufs)
                      val (and (/= (aref (buffer-name val) 0)
                                   ? )
                               val)))
      (setq entry (1- entry)))
      (switch-to-buffer val)))


;; With keybindings:
;; Buffer cycling like on modeline
;;(global-set-key "[c" (quote kampi-next-buffer))
(global-set-key [(shift right)] 'kampi-next-buffer)
;;(global-set-key "[d" (quote kampi-previous-buffer))
(global-set-key [(shift left)] 'kampi-previous-buffer)

;;(add-menu-item nil "<<<" 'kampi-next-buffer t)
;;(add-menu-item nil ">>>" 'kampi-previous-buffer t)

;; make scroll to shitf up/down
(global-set-key [(shift up)] '(lambda() (interactive) (scroll-down 1)))
(global-set-key [(shift down)] '(lambda() (interactive) (scroll-up 1)))

(message "switch-buffer utility initialised")
