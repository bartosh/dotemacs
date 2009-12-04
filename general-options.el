;; general options
(setq kill-whole-line t
      default-major-mode 'text-mode
      delete-key-deletes-forward t
      next-line-add-newlines nil
      passwd-invert-frame-when-keyboard-grabbed nil
      european-calendar-style t
      minibuffer-max-depth nil
      indent-tabs-mode nil
      max-lisp-eval-depth 6000
      max-specpdl-size 10000
      dired-recursive-deletes t
)

;; scrolling
(setq scroll-step 1
      scrool-margin 10
      scroll-conservatively 50
      scroll-preserve-screen-position 't)

(defun yes-or-no-p (prompt)
  (y-or-n-p prompt))

(defun user-mail-address ()
  "bartosh@gmail.com")

;; ==== appearance =======
(display-time)
(setq bar-cursor 1
      font-lock-mode t
      column-number-mode t
      line-number-mode t
      inhibit-startup-message t
      display-time-24hr-format t
      display-time-day-and-date t
      frame-title-format "%b: %f")

(mouse-wheel-mode 1)
;;(bar-cursor-mode nil)

;;(set-scroll-bar-mode 'right)
(scroll-bar-mode nil)
;;(menu-bar-mode 0)
(tool-bar-mode 0)

;; bell
(setq visible-bell 1
      ring-bell-function 'ignore)
;; bell-volume 0

;;frame-title-format "GNU Emacs %S: %f")

(setq-default font-lock-maximum-decoration t)
;;(set-face-font 'default "7x14")
