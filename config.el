;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; THATS A ME
(setq user-full-name "Juuso Perälä"
      user-mail-address "juuso.perala@boogiesoftware.com")
;; FORK OF MATERIAL
(setq doom-theme 'juusop)

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
;;(setq display-line-numbers-type 'relative)
;; DISABLE LINENUMBERS
(setq display-line-numbers-type nil)

;; ORG-MODE
;; CORRECTS (AND IMPROVES) ORG-MODE'S NATIVE FONTIFICATION.
(doom-themes-org-config)

;; HOOKS
;; ENABLE FLYCHECK GLOBALLY
(add-hook 'after-init-hook #'global-flycheck-mode)

;; CUSTOM KEYBINDINGS NOTE: ONLY THING WORTH KEEPING
(define-key  evil-normal-state-map (kbd "ä") 'evil-backward-paragraph)
(define-key  evil-visual-state-map (kbd "ä") 'evil-backward-paragraph)
(define-key  evil-normal-state-map (kbd "ö") 'evil-forward-paragraph)
(define-key  evil-visual-state-map (kbd "ö") 'evil-forward-paragraph)
(define-key  evil-normal-state-map (kbd "å") 'evil-first-non-blank)
(define-key  evil-visual-state-map (kbd "å") 'evil-first-non-blank)
(define-key  evil-normal-state-map (kbd "¨") 'evil-last-non-blank)
(define-key  evil-visual-state-map (kbd "¨") 'evil-last-non-blank)

;; typescript angular hook
(with-eval-after-load 'tide
  (flycheck-add-mode 'typescript-tslint 'ng2-ts-mode)
  (flycheck-add-mode 'typescript-tide 'ng2-ts-mode)
  )

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
                    ;; "--trailing-comma" "none"
                    ;; "--bracket-spacing" "true"
                    ;; "--tab-width" "4"
                    ;; "--use-tabs" "true"
                    ;; "--print-width" "120"
                    "--single-quote" "true"
                    "--jsx-single-quote" "true"
                    ;; "--arrow-parens" "always"
                    )

 projectile-project-search-path '("~/code/" "~/gitlab/")


 org-ellipsis " ▾ "
 org-bullets-bullet-list '("·")
 org-tags-column -80
 org-agenda-files (ignore-errors (directory-files +org-dir t "\\.org$" t))
 org-log-done 'time
 org-refile-targets (quote ((nil :maxlevel . 1)))
 org-capture-templates '(("x" "Note" entry
                          (file+olp+datetree "journal.org")
                          "**** [ ] %U %?" :prepend t :kill-buffer t)
                         ("t" "Task" entry
                          (file+headline "tasks.org" "Inbox")
                          "* [ ] %?\n%i" :prepend t :kill-buffer t))

 +doom-dashboard-banner-file (expand-file-name "logo.png" doom-private-dir)
 +org-capture-todo-file "tasks.org"
 org-super-agenda-groups '((:name "Today"
                            :time-grid t
                            :scheduled today)
                           (:name "Due today"
                            :deadline today)
                           (:name "Important"
                            :priority "A")
                           (:name "Overdue"
                            :deadline past)
                           (:name "Due soon"
                            :deadline future)
                           (:name "Big Outcomes"
                            :tag "bo"))
 )


(after! org
  (set-face-attribute 'org-link nil
                      :weight 'normal
                      :background nil)
  (set-face-attribute 'org-code nil
                      :foreground "#a9a1e1"
                      :background nil)
  (set-face-attribute 'org-date nil
                      :foreground "#5B6268"
                      :background nil)
  (set-face-attribute 'org-level-1 nil
                      :foreground "steelblue2"
                      :background nil
                      :height 1.2
                      :weight 'normal)
  (set-face-attribute 'org-level-2 nil
                      :foreground "slategray2"
                      :background nil
                      :height 1.0
                      :weight 'normal)
  (set-face-attribute 'org-level-3 nil
                      :foreground "SkyBlue2"
                      :background nil
                      :height 1.0
                      :weight 'normal)
  (set-face-attribute 'org-level-4 nil
                      :foreground "DodgerBlue2"
                      :background nil
                      :height 1.0
                      :weight 'normal)
  (set-face-attribute 'org-level-5 nil
                      :weight 'normal)
  (set-face-attribute 'org-level-6 nil
                      :weight 'normal)
  (set-face-attribute 'org-document-title nil
                      :foreground "SlateGray1"
                      :background nil
                      :height 1.75
                      :weight 'bold)
  (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))

;; (set-popup-rule! "^\\*Org Agenda" :side 'bottom :size 0.90 :select t :ttl nil)
;; (set-popup-rule! "^CAPTURE.*\\.org$" :side 'bottom :size 0.90 :select t :ttl nil)
;; (set-popup-rule! "^\\*org-brain" :side 'right :size 1.00 :select t :ttl nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#252526" "#D16969" "#579C4C" "#D7BA7D" "#339CDB" "#C586C0" "#85DDFF" "#d4d4d4"])
 '(custom-safe-themes
   (quote
    ("26cd48d67378d35b2aae86cea8ab7492f5201b47bac1e7695f0d8c5fa394a386" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" default)))
 '(fci-rule-color "#37474F")
 '(hl-sexp-background-color "#263238")
 '(jdee-db-active-breakpoint-face-colors (cons "#171F24" "#237AD3"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#171F24" "#579C4C"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#171F24" "#777778"))
 '(objed-cursor-color "#D16969")
 '(pdf-view-midnight-colors (cons "#d4d4d4" "#1e1e1e"))
 '(rustic-ansi-faces
   ["#1e1e1e" "#D16969" "#579C4C" "#D7BA7D" "#339CDB" "#C586C0" "#85DDFF" "#d4d4d4"])
 '(vc-annotate-background "#1e1e1e")
 '(vc-annotate-color-map
   (list
    (cons 20 "#579C4C")
    (cons 40 "#81a65c")
    (cons 60 "#acb06c")
    (cons 80 "#D7BA7D")
    (cons 100 "#d8ab79")
    (cons 120 "#d99c76")
    (cons 140 "#DB8E73")
    (cons 160 "#d38b8c")
    (cons 180 "#cc88a6")
    (cons 200 "#C586C0")
    (cons 220 "#c97ca3")
    (cons 240 "#cd7286")
    (cons 260 "#D16969")
    (cons 280 "#ba6c6c")
    (cons 300 "#a37070")
    (cons 320 "#8d7374")
    (cons 340 "#37474F")
    (cons 360 "#37474F")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
