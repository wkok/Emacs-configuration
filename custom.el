;;; custom --- Custom configuration

;;; Commentary:

;;; Code:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Macro to run elisp based on OS
;;;
(defmacro with-system (type &rest body)
  "Evaluate BODY if `system-type' equals TYPE."
  (declare (indent defun))
  `(when (eq system-type ',type)
     ,@body))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Look & Feel
;;;
;;; (set-face-attribute 'default nil :height 100)
;; (load-theme 'dracula t)
(use-package modus-themes
  :ensure                         ; omit this to use the built-in themes
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t
        modus-themes-region '(bg-only no-extend))

  ;; Load the theme files before enabling a theme (else you get an error).
  (modus-themes-load-themes)
  :config
  ;; Load the theme of your choice:
  (modus-themes-load-operandi) ;; OR (modus-themes-load-vivendi)
  :bind ("<f5>" . modus-themes-toggle))

(global-prettify-symbols-mode -1)

(use-package default-text-scale)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Clojure
;;;
;;; (smartparens-global-strict-mode t)
;;;
(with-system windows-nt
  (setq lsp-clojure-server-command nil)
  (setq cider-clojure-cli-command "powershell"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Plant UML
;;;
(setq plantuml-jar-path "~/bin/plantuml/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)
(setq plantuml-output-type "png")
;;; Enable plantuml-mode for PlantUML files
(add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Files
;;;
;;; (auto-save-visited-mode) ; this causes the cursor to jump to the begin/end of line after typing a space and it saves
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Extra Custom
;; (add-to-list 'load-path "./custom/")
;; (load-library "navigate")
(load-file (make-relative-path "navigate.el"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Formatting
;;;
;;; See: https://docs.cider.mx/cider/usage/code_completion.html
;; (setq tab-always-indent 'complete)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Swiper
;;;
(use-package swiper)
(global-set-key (kbd "C-s") 'swiper)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Resolves issue where cider-jack-in-cljs did not work
;;; See: https://issueexplorer.com/issue/clojure-emacs/cider/3001
;;;
(use-package exec-path-from-shell)
(exec-path-from-shell-copy-env "PATH")
(exec-path-from-shell-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;j


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Make completion popups lazier
;;;
;; (use-package company
  ;; :init (global-company-mode)
  ;; :custom
  ;; (company-tooltip-align-annotations t)
  ;; (company-minimum-prefix-length 3)
  ;; (company-idle-delay 2)
  ;; (company-show-numbers t))

(provide 'custom)
;;; custom.el ends here
