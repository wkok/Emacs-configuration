1;; Set font size
(set-face-attribute 'default nil :height 200)

;; (add-hook 'clojure-mode-hook
;;   (lambda ()
;;     (local-set-key (kbd "M-(") 'paredit-wrap-round)))

;; (add-hook 'clojure-mode-hook
;;   (lambda ()
;;     (local-set-key (kbd "M-[") 'paredit-wrap-square)))

;; (add-hook 'clojure-mode-hook
;;   (lambda ()
;;     (local-set-key (kbd "M-{") 'paredit-wrap-curly)))

;; (add-hook 'clojure-mode-hook
;;   (lambda ()
;;     (local-set-key (kbd "C-w") 'sp-kill-sexp)))

;; (add-hook 'clojure-mode-hook
;;   (lambda ()
;;     (local-set-key (kbd "M-w") 'sp-copy-sexp)))

;; (define-key smartparens-mode-map (kbd "M-(") 'sp-wrap-round)
;; (define-key smartparens-mode-map (kbd "M-[") 'sp-wrap-square)
;; (define-key smartparens-mode-map (kbd "M-{") 'sp-wrap-curly)
;; (define-key smartparens-mode-map (kbd "C-<right>") 'sp-forward-slurp-sexp)
;; (define-key smartparens-mode-map (kbd "C-<left>") 'sp-forward-barf-sexp)
;; (define-key smartparens-mode-map (kbd "C-w") 'sp-kill-sexp)
;; (define-key smartparens-mode-map (kbd "M-w") 'sp-copy-sexp)

;; Indentation of function forms
;; https://github.com/clojure-emacs/clojure-mode#indentation-of-function-forms
;; (setq clojure-indent-style 'align-arguments)

;; Vertically align s-expressions
;; https://github.com/clojure-emacs/clojure-mode#vertical-alignment
;; (setq clojure-align-forms-automatically t)

;; Auto-indent code automatically
;; https://emacsredux.com/blog/2016/02/07/auto-indent-your-code-with-aggressive-indent-mode/
;; (add-hook 'clojure-mode-hook #'aggressive-indent-mode)

;; (setq ns-pop-up-frames nil) ;opens files in same frame
;; (desktop-save-mode)
;; (auto-save-visited-mode)
;; (golden-ratio-mode)
;; (desktop-read)
