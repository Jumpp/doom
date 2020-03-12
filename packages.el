;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

;; PACKAGES:
(package! arc-dark-theme
  :recipe (:host github :repo "cfraz89/arc-dark-theme")
  )

;; angular
(package! ng2-mode )

(package! typescript-mode )

(package! prettier-js)
(package! js-import)
(package! emmet-mode)
(package! move-text)
(package! eslint-fix)
;; (package! spaceline :recipe (:host github :repo "TheBB/spaceline"))
