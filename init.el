
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))


(add-to-list 'load-path "~/.emacs.d/")
;; switch buffers by shift + arrow
(load "switch-buffer")
;; shift region by Meta + Shift + arrow
(load "shift-region")
;; swap 2 windows by C-s
(load "swap-windows")
;; load local options
(load "general-options")
;; load keys definitions
(load "keys")


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
;;(require 'recentf)
;;(recentf-mode t)

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
(require 'magit)

;; TAGS
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "ctags-exuberant -f %s/TAGS -e -R %s" dir-name dir-name))
  )

;; My Python settings
(load "python-settings")

;; My Erlang settings
;;(load "erlang-settings")

;; My C settings
(load "c-settings")

;; google maps
(require 'google-maps)

;; set color theme
(require 'color-theme)
;;(setq color-theme-is-global t)
;; Set different themes for X and nox modes
(if window-system
    (progn
      (require 'color-theme-tango)
      (color-theme-tango))
  (eval-after-load "color-theme"
    '(progn
       (color-theme-initialize)
       (color-theme-billw))))
