;;; custom --- Custom configuration

;;; Commentary:

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Look & Feel
;;;
;;; (set-face-attribute 'default nil :height 100)
(load-theme 'dracula t)
(global-prettify-symbols-mode -1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Clojure
;;;
;;; (smartparens-global-strict-mode t)
;;;
;;; on windows clojure-lsp is on path so this can be nil
(setq lsp-clojure-server-command nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Plant UML
;;;
(setq plantuml-jar-path "~/bin/plantuml/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)
;;; Enable plantuml-mode for PlantUML files
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Files
;;;
(auto-save-visited-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Git
;;;
(add-hook 'git-commit-setup-hook 'clj-dev-git-commit-setup)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Extra Custom
(add-to-list 'load-path "./custom/")
(load-library "navigate")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Formatting
;;;
;;; See: https://docs.cider.mx/cider/usage/code_completion.html
(setq tab-always-indent 'complete)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(provide 'custom)
;;; custom.el ends here
