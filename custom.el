;;; custom --- Custom configuration

;;; Commentary:

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Look & Feel
;;;
;;; (set-face-attribute 'default nil :height 100)
(load-theme 'dracula t)
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


(auto-save-visited-mode)

(provide 'custom)
;;; custom.el ends here
