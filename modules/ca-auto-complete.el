
;;; Require
(require 'auto-complete)
;; Various configurations
(require 'auto-complete-config)
(ac-config-default)

(setq ac-auto-start 2)                  ;automatically start
(setq ac-override-local-map nil)        ;don't override local map
(setq ac-use-menu-map t)
(setq ac-candidate-limit 20)
;; Default settings
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;; making it a bit faster
(setq ac-delay 5)
(setq ac-auto-show-menu 0.4)
(setq ac-quick-help-delay 0.5)
;; using a dictionary (emtpy now)
(add-to-list 'ac-dictionary-directories (make-conf-path "auto-complete/dict"))

(setq-default ac-sources
              (append ac-sources '(ac-source-yasnippet)))

;TODO: check the issue with auto completion/yasnippet and org-mode

(dolist
    (ca-ac-mode '(nesc-mode cmake-mode org-mode html-mode xml-mode haskell-mode ned-mode cpp-omnet-mode))
  (add-to-list 'ac-modes ca-ac-mode))

; this is used for trigger ac actions from org-mode also
(add-to-list 'ac-trigger-commands 'org-self-insert-command)

;; using a nice function is ac-config
(dolist (hook (list
               'lisp-interaction-mode-hook
               'ielm-mode-hook
               ))
  (add-hook hook 'ac-emacs-lisp-mode-setup))

(add-hook 'java-mode-hook
          '(lambda ()
             (add-to-list 'ac-sources 'eclim-complete)))
