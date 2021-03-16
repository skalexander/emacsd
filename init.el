;; We don't want to type yes and no all the time so, do y and n
(defalias 'yes-or-no-p 'y-or-n-p)



(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)
;; list the packages you want
(defvar package-list '(magit org-plus-contrib counsel olivetti))


(unless package-archive-contents
  (package-refresh-contents))
;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))


;; Org-Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(require 'org-mode-default)
(setq org-log-done 'time
;      org-duration-format 'h:mm
      org-duration-format '(("h" . t) (special . 2))
      org-todo-keywords '((sequence "TODO" "INPROGRESS" "WAITING" "DONE"))
      org-todo-keyword-faces '(("INPROGRESS" . (:foreground "blue" :weight bold))))

;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (flyspell-mode)))
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (writegood-mode)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-item-indent 0)
 '(backup-directory-alist `((".*" . ,temporary-file-directory)))
 '(auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
 '(fill-column 120)
 '(inhibit-startup-screen t)
 '(ispell-dictionary "en_CA")
 '(ispell-program-name "hunspell")
 '(org-agenda-files '("~/OneDrive - libangsurgical.com/org"))
 '(org-capture-templates
   '(("t" "Todo" entry
      (file+headline "~/OneDrive - libangsurgical.com/org/captured.org" "Tasks")
      "* TODO %?
  %i
  %a")
     ("j" "Work Journal" entry
      (file+olp+datetree "~/OneDrive - libangsurgical.com/org/Journal.org")
      "* Journal %U
  %?")
     ("m" "Meeting" entry
      (file+olp+datetree "~/OneDrive - libangsurgical.com/org/Meetings.org")
      "* %? %U
  %i")
     ("i" "Idea" entry
      (file+olp+datetree "~/OneDrive - libangsurgical.com/org/captured.org" "Ideas")
      "* %? Entered on %u
  %i")))
 '(org-default-notes-file "~/OneDrive - libangsurgical.com/org/captured.org")
 '(org-file-apps
   '((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . default)
     ("\\.docx\\'" . default)))
 '(org-refile-targets '((org-agenda-files :maxlevel . 3)))
 '(org-startup-indented t)
 '(package-selected-packages '(org-plus-contrib magit async counsel))
 '(safe-local-variable-values
   '((auto-fill-mode . t)
     (org-attach-directory . "./data")
     (org-use-tag-inheritance)))
; '(server-mode t)
 '(tool-bar-mode nil))


(provide 'init)
;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 110 :width normal)))))

;;(load-theme 'material t)
;;(elpy-enable)
;;(global-company-mode)



;; Enable Ivy mode in general
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; Add Counsel and Swiper search functions
(global-set-key (kbd "C-c f r") #'counsel-recentf)
(global-set-key (kbd "C-c C-s") #'swiper)

;; Replace default "M-x" and "C-x C-f" with Counsel version
(global-set-key (kbd "M-x") #'counsel-M-x)
(global-set-key (kbd "C-x C-f") #'counsel-find-file)

;; Optionally, you can replace these default functions with Counsel version, too
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)


;; Olivetti
;; Look & Feel for long-form writing

;; Set the body text width
(setq olivetti-body-width 80)

;; Enable Olivetti for text-related mode such as Org Mode
;;(add-hook 'text-mode-hook 'olivetti-mode)

;;(setq ispell-program-name "hunspell")

(setq ispell-hunspell-dict-paths-alist
         '(("en_CA" "C:/Users/Simon/dic/en_CA.aff")
 	  ("en_US" "C:/Users/Simon/dic/en_US.aff")))

;; (setq ispell-local-dictionary "en_CA")
(setq ispell-hunspell-dictionary-alist
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil nil nil utf-8)
	("en_CA" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil nil nil utf-8)))
;; Please note the list `("-d" "en_US")` contains ACTUAL parameters passed to hunspell

;; You could use `("-d" "en_US,en_US-med")` to check with multiple dictionaries

;;      '(("en_CA" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-a -d" "en_CA") nil utf-8)
;;	("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-a -d" "en_US") nil utf-8)))

;; the following line won't make flyspell-mode enabled by default as you might think

;; (flyspell-mode 1)

;; ispell-word for showing correcting options of the current misspelled word

(global-set-key (kbd "M-\\") 'ispell-word)
