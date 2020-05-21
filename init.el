;; [[file:~/.config/doom/config.org::*File variables][File variables:2]]
;;; ~/.config/doom/init.el -*- lexical-binding: t; -*-
;; File variables:2 ends here

;; [[file:~/.config/doom/config.org::*Enable modules (init.el)][Enable modules (init.el):1]]
(doom!
       :completion
       (company
        +childframe)
       (ivy
        +fuzzy
        +icons)

       :ui
       deft
       doom
       doom-dashboard
       hl-todo
       indent-guides
       (modeline)
       nav-flash
       ophints
       (popup
        +all
        +defaults)
       (pretty-code
        +pragmata-pro)
       treemacs
       vc-gutter
       vi-tilde-fringe
       window-select
       workspaces
       zen

       :editor
       (evil +everywhere)
       fold
       format
       multiple-cursors
       rotate-text
       snippets
       word-wrap

       :emacs
       dired
       electric
       vc

       :term
       vterm

       :checkers
       syntax
       spell

       :tools
       ansible
       docker
       (debugger +lsp)
       direnv
       editorconfig
       (eval
        +overlay)
       (lookup
        +docsets
        +dictionary)
       (lsp +peek)
       (magit +forge)
       make
       terraform

       :lang
       (clojure
        +cider
        +lsp)
       common-lisp
       data
       emacs-lisp
       (go +lsp)
       (java +lsp)
       javascript
       markdown
       nix
       (org
        +dragndrop
        +journal
        +roam)
       (python
        +lsp +pyenv)
       (scala +lsp)
       sh
       scheme
       (yaml +lsp)

       :email
       mu4e

       :config
       literate
       (default +bindings +smartparens))
;; Enable modules (init.el):1 ends here
