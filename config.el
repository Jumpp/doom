;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; THATS A ME
(setq user-full-name "Juuso Perälä"
      user-mail-address "juuso.perala@viidakko.fi")
;; FORK OF MATERIAL
(setq doom-theme 'juusop )
;; (setq doom-theme 'arc-dark )

;; FONTS
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

(doom-themes-org-config)
(setq
 doom-font (font-spec :family "Source Code Pro" :size 13)
 doom-big-font (font-spec :family "Source Code Pro" :size 18)
 )

;; TRANSPARENCY
(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))
(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist
             '(ns-appearance . dark))

;; CONFIRM KILL MESSAGE REMOVAL
(setq confirm-kill-emacs nil)

;; SPACEMACS CURSOR
(setq evil-insert-state-cursor '((bar . 2) "green")
evil-visual-state-cursor '((box . 2) "white")
      evil-normal-state-cursor '(box "orange"))

;; RELATIVE LINENUMBERS
;; (setq display-line-numbers-type 'relative)
;; DISABLE LINENUMBERS
(setq display-line-numbers-type nil)

;; ORG-MODE
;; CORRECTS (AND IMPROVES) ORG-MODE'S NATIVE FONTIFICATION.
(doom-themes-org-config)

;; HOOKS
;; ENABLE FLYCHECK GLOBALLY
(add-hook 'after-init-hook #'global-flycheck-mode)

;; PRETTIER HOOK
(add-hook 'js-mode-hook 'prettier-js-mode)

;; EMMET HOOK
(add-hook 'js-mode-hook  'emmet-mode)

;; ESLINT
(defun eslint-fix-file ()
  (interactive)
  (message "eslint --fixing the file" (buffer-file-name))
  (shell-command (concat "eslint --fix " (buffer-file-name))))

(defun eslint-fix-file-and-revert ()
  (interactive)
  (eslint-fix-file)
  (revert-buffer t t))

;; COMPANY
(add-hook 'after-init-hook 'global-company-mode)

;; (add-hook 'js-mode-hook 'eslint-fix )
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook #'eslint-fix-file-and-revert)))

(setq
 prettier-js-args '(
                    "--trailing-comma" "none"
                    "--bracket-spacing" "true"
                    "--tab-width" "4"
                    "--use-tabs" "true"
                    "--print-width" "120"
                    "--single-quote" "true"
                    "--jsx-single-quote" "true"
                    "--arrow-parens" "always"
                    )

 projectile-project-search-path '("~/code/" "~/gitlab/" "~/kurssit")
)

 ;; org-ellipsis " ▾ "
 ;; org-bullets-bullet-list '("·")
 ;; org-tags-column -80
 ;; org-agenda-files (ignore-errors (directory-files +org-dir t "\\.org$" t))
 ;; org-log-done 'time
 ;; org-refile-targets (quote ((nil :maxlevel . 1)))
 ;; org-capture-templates '(("x" "Note" entry
 ;;                         (file+olp+datetree "journal.org")
 ;;                        "**** [ ] %U %?" :prepend t :kill-buffer t)
 ;;                      ("t" "Task" entry
 ;;                      (file+headline "tasks.org" "Inbox")
 ;;                     "* [ ] %?\n%i" :prepend t :kill-buffer t))
 ;;+doom-dashboard-banner-file (expand-file-name "logo.png" doom-private-dir)
 ;; +org-capture-todo-file "tasks.org"
 ;; org-super-agenda-groups '((:name "Today"
 ;;                                  :time-grid t
 ;;                                  :scheduled today)
 ;;                           (:name "Due today"
 ;;                                  :deadline today)
 ;;                           (:name "Important"
 ;;                                  :priority "A")
 ;;                           (:name "Overdue"
 ;;                                  :deadline past)
 ;;                           (:name "Due soon"
 ;;                                  :deadline future)
 ;;                           (:name "Big Outcomes"
 ;;                                  :tag "bo")))

;; (add-hook! reason-mode
;;   (add-hook 'before-save-hook #'refmt-before-save nil t))

;; (add-hook!
;;   js2-mode 'prettier-js-mode
;;   (add-hook 'before-save-hook #'refmt-before-save nil t))

;; (map! :ne "M-/" #'comment-or-uncomment-region)
;; (map! :ne "SPC / r" #'deadgrep)
;; (map! :ne "SPC n b" #'org-brain-visualize)

;; (def-package! parinfer ; to configure it
;;   :bind (("C-," . parinfer-toggle-mode)
;;          ("<tab>" . parinfer-smart-tab:dwim-right)
;;          ("S-<tab>" . parinfer-smart-tab:dwim-left))
;;   :hook ((clojure-mode emacs-lisp-mode common-lisp-mode lisp-mode) . parinfer-mode)
;;   :config (setq parinfer-extensions '(defaults pretty-parens evil paredit)))

;; (after! org
;;   (set-face-attribute 'org-link nil
;;                       :weight 'normal
;;                       :background nil)
;;   (set-face-attribute 'org-code nil
;;                       :foreground "#a9a1e1"
;;                       :background nil)
;;   (set-face-attribute 'org-date nil
;;                       :foreground "#5B6268"
;;                       :background nil)
;;   (set-face-attribute 'org-level-1 nil
;;                       :foreground "steelblue2"
;;                       :background nil
;;                       :height 1.2
;;                       :weight 'normal)
;;   (set-face-attribute 'org-level-2 nil
;;                       :foreground "slategray2"
;;                       :background nil
;;                       :height 1.0
;;                       :weight 'normal)
;;   (set-face-attribute 'org-level-3 nil
;;                       :foreground "SkyBlue2"
;;                       :background nil
;;                       :height 1.0
;;                       :weight 'normal)
;;   (set-face-attribute 'org-level-4 nil
;;                       :foreground "DodgerBlue2"
;;                       :background nil
;;                       :height 1.0
;;                       :weight 'normal)
;;   (set-face-attribute 'org-level-5 nil
;;                       :weight 'normal)
;;   (set-face-attribute 'org-level-6 nil
;;                       :weight 'normal)
;;   (set-face-attribute 'org-document-title nil
;;                       :foreground "SlateGray1"
;;                       :background nil
;;                       :height 1.75
;;                       :weight 'bold)
;;   (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))

;; (after! ruby
;;   (add-to-list 'hs-special-modes-alist
;;                `(ruby-mode
;;                  ,(rx (or "def" "class" "module" "do" "{" "[")) ; Block start
;;                  ,(rx (or "}" "]" "end"))                       ; Block end
;;                  ,(rx (or "#" "=begin"))                        ; Comment start
;;                  ruby-forward-sexp nil)))

;; (after! web-mode
;;   (add-to-list 'auto-mode-alist '("\\.njk\\'" . web-mode)))

;; (defun +data-hideshow-forward-sexp (arg)
;;   (let ((start (current-indentation)))
;;     (forward-line)
;;     (unless (= start (current-indentation))
;;       (require 'evil-indent-plus)
;;       (let ((range (evil-indent-plus--same-indent-range)))
;;         (goto-char (cadr range))
;;         (end-of-line)))))

;; (add-to-list 'hs-special-modes-alist '(yaml-mode "\\s-*\\_<\\(?:[^:]+\\)\\_>" "" "#" +data-hideshow-forward-sexp nil))

;; (remove-hook 'enh-ruby-mode-hook #'+ruby|init-robe)

;; (setq +magit-hub-features t)

;; (set-popup-rule! "^\\*Org Agenda" :side 'bottom :size 0.90 :select t :ttl nil)
;; (set-popup-rule! "^CAPTURE.*\\.org$" :side 'bottom :size 0.90 :select t :ttl nil)
;; (set-popup-rule! "^\\*org-brain" :side 'right :size 1.00 :select t :ttl nil)
