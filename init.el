;; [[file:config.org::*File variables][File variables:2]]
;;; ~/.config/doom/init.el -*- lexical-binding: t; -*-
;; File variables:2 ends here

;; [[file:config.org::*Enable modules (init.el)][Enable modules (init.el):1]]
(doom!
       :completion
       (company
        +childframe)
       (ivy
        +icons)

       :ui
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

       :tools
       ansible
       docker
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
       (cc +lsp)
       (clojure
        +cider
        +lsp)
       common-lisp
       data
       emacs-lisp
       (go +lsp)
       (java +lsp)
       (javascript +lsp)
       latex
       markdown
       (nim +lsp)
       nix
       (org
        +dragndrop
        +journal
        +roam2
        +pretty)
       (python
        +lsp)
       sh
       scheme
       (yaml)

       :email
       mu4e

       :config
       literate
       (default +bindings +smartparens))
;; Enable modules (init.el):1 ends here
