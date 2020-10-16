(defun make-conf-path (path)
  "Shortcut to create the path of the configuration"
  (expand-file-name (concat base path)))

(add-to-list 'load-path (make-conf-path "modules"))

(require 'cl)

;; custom file loaded at the very beginning
;; what if this is set differently?
(setq custom-file (make-conf-path "custom.el"))

(when (file-exists-p custom-file)
  (message "loading custom file")
  (load-file custom-file))

(setq package-archives
      '(("melpa-stable" . "http://stable.melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("melpa" . "http://melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")))

(defun online? ()
  "Detect if it's online or not,
  ;TODO:find a better way to filter out interfaces"
  (if (and (functionp 'network-interface-list)
           (network-interface-list))
      (some (lambda (iface) (unless (or (equal "lo" (car iface)) (equal "docker0" (car iface)))
                         (member 'up (first (last (network-interface-info
                                                   (car iface)))))))
            (network-interface-list))
    t))

(defun install-if-needed (package)
  (unless (package-installed-p package)
    (print package)
    (package-install package)))


;; MAKE MORE packages available with the package installer
(setq
 ca-to-install '(4clojure
                 ack
                 adoc-mode
                 ag
                 alchemist
                 android-mode
                 ansible
                 ansible-doc
                 ansible-vault
                 apache-mode
                 arduino-mode
                 auctex
                 autopair
                 auto-highlight-symbol
                 beacon
                 bitlbee
                 browse-kill-ring
                 c-eldoc
                 cider
                 cider-decompile
                 cider-eval-sexp-fu
                 cljr-helm
                 clj-refactor
                 cljsbuild-mode
                 clojure-mode
                 clojure-mode-extra-font-locking
                 cmake-mode
                 color-moccur
                 color-theme
                 company
                 company-ansible
                 company-cabal
                 company-dict
                 company-erlang
                 company-ghc
                 company-ghci
                 company-go
                 company-inf-ruby
                 company-jedi
                 company-lua
                 company-restclient
                 company-shell
                 company-web
                 csharp-mode
                 csv-mode
                 cython-mode
                 d-mode
                 diff-hl
                 docker
                 dockerfile-mode
                 dracula-theme
                 dpaste
                 ebib
                 edit-server
                 ejc-sql
                 ein
                 elein
                 elixir-mode
                 elixir-yasnippets
                 elm-mode
                 elm-yasnippets
                 emamux
                 emmet-mode
                 emms
                 ;; ensime
                 erlang
                 ess
                 eval-in-repl
                 evil
                 expand-region
                 exec-path-from-shell
                 fancy-narrow
                 feature-mode
                 find-file-in-repository
                 flycheck
                 flycheck-cask
                 flycheck-clojure
                 flycheck-clj-kondo
                 flycheck-cython
                 flycheck-elixir
                 flycheck-elm
                 flycheck-ghcmod
                 flycheck-haskell
                 flycheck-ocaml
                 flycheck-pony
                 flycheck-pos-tip
                 flycheck-perl6
                 flycheck-rust
                 flycheck-mypy
                 flycheck-swift
                 gist
                 gitconfig
                 git-annex
                 git-commit
                 gitlab
                 go-mode
                 golint
                 google-contacts
                 google-translate
                 graphviz-dot-mode
                 groovy-mode
                 hackernews
                 haskell-mode
                 helm
                 helm-ag
                 helm-aws
                 helm-cider
                 helm-chrome
                 helm-clojuredocs
                 helm-company
                 helm-dired-history
                 helm-dired-recent-dirs
                 helm-flycheck
                 helm-flyspell
                 helm-ghc
                 helm-git
                 helm-git-files
                 helm-gitlab
                 helm-google
                 helm-hoogle
                 helm-make
                 helm-spotify
                 helm-projectile
                 helm-swoop
                 hindent
                 hi2
                 highlight-blocks
                 highlight-indent-guides
                 htmlize
                 impatient-mode
                 indent-guide
                 inf-clojure
                 intero
                 jedi
                 jinja2-mode
                 js-comint
                 json-mode
                 js2-mode
                 kubernetes
                 know-your-http-well
                 kanban
                 kibit-helper
                 ledger-mode
                 less-css-mode
                 log4j-mode
                 lua-mode
                 magit
                 magit-annex
                 magit-gitflow
                 markdown-mode
                 memory-usage
                 minimap
                 multiple-cursors
                 nginx-mode
                 nix-mode
                 noctilux-theme
                 notmuch
                 ob-elixir
                 ob-diagrams
                 ob-go
                 ob-http
                 ob-ipython
                 ob-lfe
                 ob-prolog
                 ob-rust
                 ob-sql-mode
                 ob-typescript
                 olivetti
                 offlineimap
                 org-bullets
                 org-gcal
                 outline-magic
                 ox-reveal
                 p4
                 paradox
                 persistent-scratch
                 php-mode
                 poet-theme
                 pomodoro
                 pony-mode
                 powerline
                 prolog
                 protobuf-mode
                 puppet-mode
                 purescript-mode
                 pytest
                 psc-ide
                 racket-mode
                 rainbow-delimiters
                 rainbow-mode
                 rebox2
                 restclient
                 rinari
                 ruby-compilation
                 ruby-electric
                 ruby-mode
                 rbenv
                 sly
                 skewer-mode
                 smartparens
                 smart-mode-line
                 smart-mode-line-powerline-theme
                 sos
                 slime
                 solarized-theme
                 sx
                 terraform-mode
                 textile-mode
                 tern
                 tern-auto-complete
                 tuareg
                 typo
                 undo-tree
                 use-package
                 virtualenv
                 virtualenvwrapper
                 web-mode
                 yaml-mode
                 yasnippet
                 yasnippet-snippets
                 zenburn-theme
                 yafolding
                 which-key

                 ;; ruby packages
                 helm-robe
                 robe
                 rubocop
                 ;; rubocop-fmt
                 yari
                 rust-mode
                 racer
                 company-racer
                 flycheck-rust
                 toml-mode
                 cargo
                 lsp-ui
                 wakatime-mode
                 wordnut
                 define-word
                 synosaurus))

(defun reload ()
  (interactive)
  (when (online?)
    (require 'package)
    (package-initialize)
    (package-refresh-contents)
    (mapc 'install-if-needed ca-to-install)))

<<<<<<< HEAD
(require 'flycheck)
=======
(reload)
>>>>>>> cf75fbf... sadly need to reload or the auto package load does not work for some reason
(global-flycheck-mode t)
(column-number-mode t)
(display-time-mode t)
(global-company-mode t)
(global-linum-mode t)
(global-prettify-symbols-mode t)
(indent-guide-global-mode t)
(show-paren-mode t)
(transient-mark-mode t)
(which-function-mode t)
(which-key-mode t)

; second argument as 0 to compile if they don't exist
(require 'ca-customs)
(require 'ca-utils)

;; ;; all the subdirectories are added to the path, including modules
(ca-gen-path-dirs base)

(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist '(("." . "~/.saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t
 vc-make-backup-files t)       ; use versioned backups

(setq
 initial-major-mode 'emacs-lisp-mode
 inhibit-startup-message t
 initial-scratch-message nil)

;; Setting indent-tabs-mode for only spaces
(setq-default indent-tabs-mode nil)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-mode)

(add-hook 'text-mode-hook #'variable-pitch-mode)

;; make it possible to disable it
(windmove-default-keybindings 'shift)

(setq calendar-date-style 'european)

(require 'ca-fonts)

;; (require 'ca-python)
(require 'ca-org)
;; ;; these things change the global state
(require 'ca-keys)
(require 'ca-aliases)

;; ;; some other things which might be optional
;; ;; create a dictionary structure where
(require 'ca-dired)
(require 'ca-misc)
(require 'ca-other-modes)
(require 'ca-prog-mode)
(require 'ca-vc)
(require 'ca-buffers)
(require 'ca-desktop)
(require 'ca-faces)
;; (require 'ca-haskell)
;; (require 'ca-ruby)
;; (require 'ca-latex)
;; (require 'ca-ocaml)
;; (require 'ca-c)
(require 'ca-clojure)
;; (require 'ca-web)
;; (require 'ca-server)
(require 'ca-javascript)
(require 'ca-helm)
(require 'ca-smartparens-lisp)
;; (require 'ca-devops)
;; (require 'ca-purescript)
;; (require 'ca-elm)
(require 'ca-restclient)
;; (require 'ca-elixir)
;; (require 'ca-go)
(require 'ca-helm-swoop)

(require 'helm-projectile)
(require 'ca-highlight)
;; (require 'ca-rust)

(beacon-mode t)
;; (yas-global-mode t)

(projectile-global-mode t)
(define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; (global-wakatime-mode nil)

;; ;; (desktop-save-mode t)

;; (global-undo-tree-mode t)
;; ;; (load-theme 'solarized-dark)
;; ;; (load-theme 'solarized-zenburn)
;; (load-theme 'dracula)

(provide 'ca-init)
