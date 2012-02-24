;; Editted by Huazhi (Hank) GONG
;; Please install Emacs Lucid version at ubuntu
;; Copy the following contents to ~/.Xdefaults or ~/.Xresources
;;Emacs.pane.menubar.font:        -*-arial-medium-r-normal--*-96-*-*-*-*-iso10646-1
;;Emacs.menu*.font:       -*-arial-medium-r-normal--*-96-*-*-*-*-iso10646-1
;;Emacs.dialog*.font:     -*-arial-medium-r-normal--*-96-*-*-*-*-iso10646-1

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(display-time-mode t)
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#0C1021" :foreground "#F8F8F8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(completions-common-part ((t (:inherit default :foreground "red"))))
 '(diredp-ignored-file-name ((t (:foreground "#bebebe"))))
 '(isearch ((((class color) (min-colors 88) (background light)) (:background "black" :foreground "white"))))
 '(show-paren-match ((((class color) (background light)) (:background "azure2")))))


(setq frame-title-format "emacs@%b %f")
;;Hide toolbar and scrollbar
(tool-bar-mode nil)
(scroll-bar-mode nil)
;;Very general settings
(fset 'yes-or-no-p 'y-or-n-p)
(setq visible-bell nil)
(set-cursor-color "white")
(setq-default indent-tabs-mode nil)

;;(set-message-beep 'silent)
;;set mousewheel scroll speed
;;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-scroll-amount '(2))
(setq mouse-wheel-progressive-speed nil)
(setq scroll-step 1)		;;keyboard scroll one line at a time

;;emacs backup setting
(setq backup-inhibited t)

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
      (progn
        ;; use 120 char wide window for largeish displays
        ;; and smaller 80 column windows for smaller displays
        ;; pick whatever numbers make sense for you
        (if (> (x-display-pixel-width) 1280)
            (add-to-list 'default-frame-alist (cons 'width 133))
          (add-to-list 'default-frame-alist (cons 'width 80)))
        ;; for the height, subtract a couple hundred pixels
        ;; from the screen height (for panels, menubars and
        ;; whatnot), then divide by the height of a char to
        ;; get the height we want
        (add-to-list 'default-frame-alist 
                     (cons 'height (/ (- (x-display-pixel-height) 50) (frame-char-height)))))))

(set-frame-size-according-to-resolution)

;;enable line number mode
(global-linum-mode t)

;;tab size is set as 4
(setq default-tab-width 4)

;;IDO setting
(require 'ido)
(ido-mode t)

;;enable which-func
(require 'which-func)
(which-func-mode t)

;;engoemacs setting load
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "us") ; US
(load-file "~/.emacs.d/ergoemacs_1.9.3.1/site-lisp/site-start.el")

;;Global defined shortcut, it should not be defined before this
(setq kill-whole-line t)
(global-set-key (kbd "C-d") 'kill-whole-line)
(global-set-key (kbd "M-1") 'ido-switch-buffer)
(global-set-key (kbd "C-<tab>") 'next-multiframe-window)
(global-set-key (kbd "<f4>") 'anything-imenu)
(require 'ibuffer)
(global-set-key (kbd "M-\.") 'hippie-expand)
(global-set-key (kbd "M-\"") 'uncomment-region)
(global-set-key (kbd "C-\;") 'end-of-line)
(global-set-key (kbd "M-<down>") 'next-error)
(global-set-key (kbd "M-<up>") 'previous-error)

(setq hippie-expand-try-functions-list
 	  '(
		try-expand-dabbrev
		try-expand-dabbrev-visible
		try-expand-dabbrev-all-buffers
		try-expand-dabbrev-from-kill
		try-expand-list
		try-expand-list-all-buffers
		try-expand-line
        try-expand-line-all-buffers
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-whole-kill
        )
      )

;;show line-number and column-number in the mode line
(line-number-mode 1)
(column-number-mode 1)

;;autoload recent edited files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "M-2") 'recentf-open-files)

;;jump to last edit place
(setq load-path (cons (expand-file-name ".emacs.d") load-path))  
;;(load-file "~/.emacs.d/goto-last-change.el")
(require 'goto-last-change)
(global-set-key (kbd "M-m") 'goto-last-change)

;;load anything
(require 'anything-config)

                                        ;Hooks for different file extensions
;;C or C++ mode
(require 'cc-mode)                      
(require 'xcscope)

;;auto-complete and company mode
;;(add-to-list 'load-path "~/.emacs.d/company")
;;(autoload 'company-mode "company" nil t)
;;(require 'auto-complete)

;;git support
(add-to-list 'load-path "~/.emacs.d/git-emacs")
(require 'git-emacs)

;;(require 'cedet)
;; (global-ede-mode t)
;;(semantic-mode 1)
;;(global-semantic
;;(semantic-load-enable-code-helpers)
;; (require 'semantic-ia)
;; (require 'semantic-gcc)

;;(require 'auto-complete-semantic)
;; (load-file "~/.emacs.d/cedet-1.0.1/common/cedet.el")
;; (semantic-load-enable-code-helpers)
;; (global-set-key (kbd "C-/") 'semantic-complete-analyze-inline) 
;; (global-set-key "." 'semantic-complete-self-insert) 
;; (global-set-key ">" 'semantic-complete-self-insert) 


(defun my-c-mode-common-hook()
  (c-set-style "linux")  
  (setq tab-width 4 indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (show-paren-mode t)
;;  (setq show-paren-style 'parenthesis)
  (c-toggle-hungry-state 1)
  (imenu-add-menubar-index)
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook)

(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(define-key c-mode-base-map (kbd "<f3>") 'cscope-find-this-symbol)

(defun my-save-and-compile ()
  (interactive "")
  (save-buffer 0)
  (compile "cd ../build;make -k"))
(define-key c-mode-base-map (kbd "<f5>") 'my-save-and-compile) 

(setq load-path (cons (expand-file-name ".emacs.d/langmodes") load-path))  
(require 'cmake-mode)  
(setq auto-mode-alist  
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)  
                ("\\.cmake\\'" . cmake-mode))  
              auto-mode-alist))  
