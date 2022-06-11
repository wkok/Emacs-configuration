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
(setq lsp-lens-enable nil)
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
;; (load-file (make-relative-path "navigate.el"))
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
;; (use-package swiper)
;; (global-set-key (kbd "C-s") 'swiper)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Resolves issue where cider-jack-in-cljs did not work
;;; See: https://issueexplorer.com/issue/clojure-emacs/cider/3001
;;;
;; (use-package exec-path-from-shell)
;; (exec-path-from-shell-copy-env "PATH")
;; (exec-path-from-shell-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;j


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Undo company-mode default nav key binding change because otherwise
;;; we cannot ignore the company popup and still go to next line
;;; See: https://github.com/company-mode/company-mode/blob/master/NEWS.md
;;;
(with-eval-after-load 'company
  (dolist (map (list company-active-map company-search-map))
    (define-key map (kbd "C-n") nil)
    (define-key map (kbd "C-p") nil)
    (define-key map (kbd "M-n") #'company-select-next)
    (define-key map (kbd "M-p") #'company-select-previous)))


(provide 'custom)
;;; custom.el ends here
