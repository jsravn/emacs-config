;; [[file:~/.config/doom/config.org::*File variables][File variables:1]]
;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-
;; File variables:1 ends here

;; [[file:~/.config/doom/config.org::*Personal information][Personal information:1]]
(setq user-full-name "James Ravn"
      user-mail-address "james@r-vn.org"
      calendar-latitude 51.508166
      calendar-longitude -0.075971
      calendar-location-name "London, UK")
;; Personal information:1 ends here

;; [[file:~/.config/doom/config.org::*Theme][Theme:1]]
(setq doom-theme 'doom-one
      doom-font (font-spec :family "PragmataPro Liga" :size 16)
      doom-variable-pitch-font (font-spec :family "sans" :size 14)
      doom-big-font (font-spec :family "PragmataPro Liga" :size 20)
      doom-unicode-font (font-spec :family "Noto Color Emoji" :size 16)
      +pretty-code-pragmata-pro-font-name "PragmataPro Liga")
;; Theme:1 ends here

;; [[file:~/.config/doom/config.org::*Mixed pitch mode][Mixed pitch mode:1]]
(add-hook! (org-mode gfm-mode markdown-mode) #'mixed-pitch-mode)
(setq mixed-pitch-set-height t)
;; Mixed pitch mode:1 ends here

;; [[file:~/.config/doom/config.org::*Maximize][Maximize:1]]
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; Maximize:1 ends here

;; [[file:~/.config/doom/config.org::*Deletion][Deletion:1]]
(setq delete-by-moving-to-trash t)
;; Deletion:1 ends here

;; [[file:~/.config/doom/config.org::*Deletion][Deletion:2]]
(setq evil-want-fine-undo t)
;; Deletion:2 ends here

;; [[file:~/.config/doom/config.org::*Auto-save][Auto-save:1]]
(auto-save-visited-mode t)
;; Auto-save:1 ends here

;; [[file:~/.config/doom/config.org::*Auto-save][Auto-save:2]]
(add-hook! '(doom-switch-buffer-hook
             doom-switch-window-hook)
  (if (buffer-file-name) (save-some-buffers t))) ; avoid saving when switching to a non-file buffer
(add-function :after after-focus-change-function
              (lambda () (save-some-buffers t)))
;; Auto-save:2 ends here

;; [[file:~/.config/doom/config.org::*Line wrapping][Line wrapping:1]]
(setq-default fill-column 120)
(add-hook! '(text-mode-hook prog-mode-hook conf-mode-hook)
           #'display-fill-column-indicator-mode)
;; Line wrapping:1 ends here

;; [[file:~/.config/doom/config.org::*Line wrapping][Line wrapping:2]]
;; (remove-hook 'text-mode-hook #'auto-fill-mode)
;; (add-hook 'text-mode-hook #'+word-wrap-mode)
;; Line wrapping:2 ends here

;; [[file:~/.config/doom/config.org::*Window splitting][Window splitting:1]]
(setq evil-vsplit-window-right t
      evil-split-window-below t)
;; Window splitting:1 ends here

;; [[file:~/.config/doom/config.org::*Window splitting][Window splitting:2]]
(setq split-width-threshold 240)
;; Window splitting:2 ends here

;; [[file:~/.config/doom/config.org::*Clipboard and Copy/Paste][Clipboard and Copy/Paste:1]]
(setq select-enable-clipboard t)
;; Clipboard and Copy/Paste:1 ends here

;; [[file:~/.config/doom/config.org::*Clipboard and Copy/Paste][Clipboard and Copy/Paste:2]]
(map!
 :i "C-S-v" #'yank)
;; Clipboard and Copy/Paste:2 ends here

;; [[file:~/.config/doom/config.org::*Which-key][Which-key:1]]
(setq which-key-idle-delay 0.5)
;; Which-key:1 ends here

;; [[file:~/.config/doom/config.org::*Authinfo][Authinfo:1]]
(setq auth-sources '("~/.authinfo.gpg"))
;; Authinfo:1 ends here

;; [[file:~/.config/doom/config.org::*atomic-chrome configuration][atomic-chrome configuration:1]]
(use-package! atomic-chrome
  :after-call focus-out-hook
  :config
  (setq atomic-chrome-default-major-mode 'markdown-mode
        atomic-chrome-buffer-open-style 'frame)
  (atomic-chrome-start-server))
;; atomic-chrome configuration:1 ends here

;; [[file:~/.config/doom/config.org::*caddyfile-mode][caddyfile-mode:1]]
(use-package caddyfile-mode
  :mode (("Caddyfile\\'" . caddyfile-mode)
         ("Corefile\\'" . caddyfile-mode)
         ("caddy\\.conf\\'" . caddyfile-mode)))
;; caddyfile-mode:1 ends here

;; [[file:~/.config/doom/config.org::*Projects][Projects:1]]
(setq projectile-project-search-path '("~/devel/" "~/sky" "~/gatech"))
;; Projects:1 ends here

;; [[file:~/.config/doom/config.org::*Projects][Projects:2]]
(defun +private/projectile-invalidate-cache (&rest _args)
  (projectile-invalidate-cache nil))
(advice-add 'magit-checkout
            :after #'+private/projectile-invalidate-cache)
(advice-add 'magit-branch-and-checkout
            :after #'+private/projectile-invalidate-cache)
;; Projects:2 ends here

;; [[file:~/.config/doom/config.org::*Smart parentheses][Smart parentheses:1]]
(map!
 :ni "M-u"   #'sp-up-sexp)
;; Smart parentheses:1 ends here

;; [[file:~/.config/doom/config.org::*Workspaces][Workspaces:1]]
(setq +workspaces-on-switch-project-behavior t)
;; Workspaces:1 ends here

;; [[file:~/.config/doom/config.org::*Workspaces][Workspaces:2]]
(map! :leader
      (:prefix-map ("TAB" . "workspace")
        :desc "Switch to last workspace"  ","   #'+workspace/other
       ))
;; Workspaces:2 ends here

;; [[file:~/.config/doom/config.org::*Zen][Zen:1]]
(after! writeroom-mode
  (setq +zen-text-scale 0
        +zen-mixed-pitch-modes nil
        writeroom-mode-line t
        writeroom-width 160))
;; Zen:1 ends here

;; [[file:~/.config/doom/config.org::*Treemacs][Treemacs:1]]
(after! treemacs
  (treemacs-follow-mode 1)
  (setq treemacs-width 40))
;; Treemacs:1 ends here

;; [[file:~/.config/doom/config.org::*Completion][Completion:1]]
(after! company
  (remove-hook 'evil-normal-state-entry-hook #'company-abort))
;; Completion:1 ends here

;; [[file:~/.config/doom/config.org::*Flyspell][Flyspell:1]]
(after! flyspell (flyspell-lazy-mode 1))
;; Flyspell:1 ends here

;; [[file:~/.config/doom/config.org::*Configuration][Configuration:1]]
(set-email-account!
 "r-vn.org"
 '((mu4e-sent-folder       . "/r-vn.org/Sent")
   (mu4e-drafts-folder     . "/r-vn.org/Drafts")
   (mu4e-trash-folder      . "/r-vn.org/Trash")
   (mu4e-refile-folder     . "/r-vn.org/Archive")
   (smtpmail-smtp-user     . "james@r-vn.org")
   (mu4e-maildir-shortcuts .
                           ((:maildir "/r-vn.org/INBOX"   :key ?i)
                            (:maildir "/r-vn.org/Archive" :key ?a)
                            (:maildir "/r-vn.org/Trash"   :key ?t)
                            (:maildir "/r-vn.org/Sent"    :key ?s)))
   (smtpmail-smtp-server . "smtp.fastmail.com")
   (smtpmail-stream-type . ssl)
   (smtpmail-smtp-service . 465)
   (smtpmail-default-smtp-server . "smtp.fastmail.com"))
 t)
;; Configuration:1 ends here

;; [[file:~/.config/doom/config.org::*Configuration][Configuration:2]]
(after! mu4e
  (setq mu4e-attachment-dir "~/Downloads"   ; Attachments in standard place.
        mu4e-headers-include-related nil    ; Only show messages which match the current filter.
        mu4e-headers-fields                 ; Header columns.
        '((:human-date . 12)
          (:flags . 6)
          (:from . 25)
          (:subject))
        mu4e-update-interval 300))          ; Check for mail every 5 minutes.
;; Configuration:2 ends here

;; [[file:~/.config/doom/config.org::*Configuration][Configuration:3]]
(remove-hook 'mu4e-compose-mode-hook #'org-mu4e-compose-org-mode) ; Don't use org-mu4e.

(use-package org-msg
  :after (org mu4e)
  :hook (mu4e-main-mode . org-msg-mode)
  :config
  (setq org-msg-options "html-postamble:nil H:5 num:nil ^:{} toc:nil author:nil email:nil \\n:t"
	      org-msg-startup "hidestars indent inlineimages"
	      org-msg-greeting-fmt "\nHi %s,\n\n"
	      org-msg-greeting-name-limit 3
	      org-msg-text-plain-alternative t
        org-msg-signature "

Regards,

#+begin_signature
-- James
#+end_signature"))
;; Configuration:3 ends here

;; [[file:~/.config/doom/config.org::*Configuration][Configuration:4]]
(map!
 :leader
 :prefix "o"
 :desc "Mail" "m" #'=mu4e)
;; Configuration:4 ends here

;; [[file:~/.config/doom/config.org::*Configuration][Configuration:5]]
(setq shr-color-visible-luminance-min 80)
;; Configuration:5 ends here

;; [[file:~/.config/doom/config.org::*Configuration][Configuration:6]]
(setq doom-modeline-mu4e t)
(use-package! mu4e-alert
  :after mu4e
  :config
  (mu4e-alert-enable-mode-line-display))
;; Configuration:6 ends here

;; [[file:~/.config/doom/config.org::*Language Server Protocol (LSP)][Language Server Protocol (LSP):1]]
(map! :leader
      (:prefix "c"
       :desc "LSP Parameters" "p" #'lsp-signature-activate))
;; Language Server Protocol (LSP):1 ends here

;; [[file:~/.config/doom/config.org::*Language Server Protocol (LSP)][Language Server Protocol (LSP):2]]
(setq lsp-auto-guess-root nil)
;; Language Server Protocol (LSP):2 ends here

;; [[file:~/.config/doom/config.org::*Language Server Protocol (LSP)][Language Server Protocol (LSP):3]]
(setq lsp-enable-symbol-highlighting nil)
;; Language Server Protocol (LSP):3 ends here

;; [[file:~/.config/doom/config.org::*Language Server Protocol (LSP)][Language Server Protocol (LSP):4]]
(setq lsp-enable-links nil)
;; Language Server Protocol (LSP):4 ends here

;; [[file:~/.config/doom/config.org::*Language Server Protocol (LSP)][Language Server Protocol (LSP):5]]
(setq lsp-signature-auto-activate t
      lsp-signature-render-documentation nil)
;; Language Server Protocol (LSP):5 ends here

;; [[file:~/.config/doom/config.org::*Language Server Protocol (LSP)][Language Server Protocol (LSP):6]]
(setq lsp-enable-snippet nil)
;; Language Server Protocol (LSP):6 ends here

;; [[file:~/.config/doom/config.org::*Language Server Protocol (LSP)][Language Server Protocol (LSP):7]]
;(setq lsp-log-io t)
;; Language Server Protocol (LSP):7 ends here

;; [[file:~/.config/doom/config.org::*Magit][Magit:1]]
(setq magit-prefer-remote-upstream t)
;; Magit:1 ends here

;; [[file:~/.config/doom/config.org::*Magit][Magit:2]]
(setq forge-topic-list-limit '(30 . 5))
;; Magit:2 ends here

;; [[file:~/.config/doom/config.org::*Golang][Golang:1]]
(setq lsp-gopls-hover-kind "FullDocumentation")
;; Golang:1 ends here

;; [[file:~/.config/doom/config.org::*Org Mode][Org Mode:1]]
(setq org-directory "~/Dropbox/Notes/")
;; Org Mode:1 ends here

;; [[file:~/.config/doom/config.org::*Editor][Editor:1]]
(setq org-imenu-depth 6)
;; Editor:1 ends here

;; [[file:~/.config/doom/config.org::*Visuals][Visuals:1]]
(custom-set-faces!
  '(outline-1 :weight extra-bold :height 1.12)
  '(outline-2 :weight bold :height 1.10)
  '(outline-3 :weight bold :height 1.08)
  '(outline-4 :weight semi-bold :height 1.06)
  '(outline-5 :weight semi-bold :height 1.04)
  '(outline-6 :weight semi-bold :height 1.02)
  '(outline-8 :weight semi-bold)
  '(outline-9 :weight semi-bold))
;; Visuals:1 ends here

;; [[file:~/.config/doom/config.org::*Visuals][Visuals:2]]
(setq
 org-ellipsis " ▼ "
 org-superstar-headline-bullets-list '("☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷" "☷" "☷" "☷"))
;; Visuals:2 ends here

;; [[file:~/.config/doom/config.org::*Archiving][Archiving:1]]
(setq org-archive-location (concat org-directory ".archive/%s::"))
(after! org (setq org-archive-subtree-add-inherited-tags t))
;; Archiving:1 ends here

;; [[file:~/.config/doom/config.org::*Download][Download:1]]
(after! org-download
  (setq org-download-screenshot-method
        (cond (IS-MAC "screencapture -i %s")
              (IS-LINUX "~/.config/sway/capture.sh %s"))))
;; Download:1 ends here

;; [[file:~/.config/doom/config.org::*Exporting (General)][Exporting (General):1]]
(after! org (setq org-export-headline-levels 6))
;; Exporting (General):1 ends here

;; [[file:~/.config/doom/config.org::*Exporting to HTML][Exporting to HTML:1]]
(defun jsravn--org-inline-css-hook (exporter)
  "Insert custom inline css to automatically set the
   background of code to whatever theme I'm using's background"
  (when (eq exporter 'html)
    (setq
     org-html-head-extra
     (concat
      (if (s-contains-p "<!––tec/custom-head-start-->" org-html-head-extra)
          (s-replace-regexp "<!––tec/custom-head-start-->.*<!––tec/custom-head-end-->" "" org-html-head-extra)
        org-html-head-extra)
      (format "<!––tec/custom-head-start-->
<style type=\"text/css\">
   :root {
      --theme-bg: %s;
      --theme-bg-alt: %s;
      --theme-base0: %s;
      --theme-base1: %s;
      --theme-base2: %s;
      --theme-base3: %s;
      --theme-base4: %s;
      --theme-base5: %s;
      --theme-base6: %s;
      --theme-base7: %s;
      --theme-base8: %s;
      --theme-fg: %s;
      --theme-fg-alt: %s;
      --theme-grey: %s;
      --theme-red: %s;
      --theme-orange: %s;
      --theme-green: %s;
      --theme-teal: %s;
      --theme-yellow: %s;
      --theme-blue: %s;
      --theme-dark-blue: %s;
      --theme-magenta: %s;
      --theme-violet: %s;
      --theme-cyan: %s;
      --theme-dark-cyan: %s;
   }
</style>"
              (doom-color 'bg)
              (doom-color 'bg-alt)
              (doom-color 'base0)
              (doom-color 'base1)
              (doom-color 'base2)
              (doom-color 'base3)
              (doom-color 'base4)
              (doom-color 'base5)
              (doom-color 'base6)
              (doom-color 'base7)
              (doom-color 'base8)
              (doom-color 'fg)
              (doom-color 'fg-alt)
              (doom-color 'grey)
              (doom-color 'red)
              (doom-color 'orange)
              (doom-color 'green)
              (doom-color 'teal)
              (doom-color 'yellow)
              (doom-color 'blue)
              (doom-color 'dark-blue)
              (doom-color 'magenta)
              (doom-color 'violet)
              (doom-color 'cyan)
              (doom-color 'dark-cyan))
      "
<link rel='stylesheet' type='text/css' href='https://fniessen.github.io/org-html-themes/styles/readtheorg/css/htmlize.css'/>
<link rel='stylesheet' type='text/css' href='https://fniessen.github.io/org-html-themes/styles/readtheorg/css/readtheorg.css'/>

<script src='https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<script type='text/javascript' src='https://fniessen.github.io/org-html-themes/styles/lib/js/jquery.stickytableheaders.min.js'></script>
<script type='text/javascript' src='https://fniessen.github.io/org-html-themes/styles/readtheorg/js/readtheorg.js'></script>

<style>
   pre.src {
     background-color: var(--theme-bg);
     color: var(--theme-fg);
     scrollbar-color:#bbb6#9992;
     scrollbar-width: thin;
     margin: 0;
     border: none;
   }
   div.org-src-container {
     border-radius: 12px;
     overflow: hidden;
     margin-bottom: 24px;
     margin-top: 1px;
     border: 1px solid#e1e4e5;
   }
   pre.src::before {
     background-color:#6666;
     top: 8px;
     border: none;
     border-radius: 5px;
     line-height: 1;
     border: 2px solid var(--theme-bg);
     opacity: 0;
     transition: opacity 200ms;
   }
   pre.src:hover::before { opacity: 1; }
   pre.src:active::before { opacity: 0; }

   pre.example {
     border-radius: 12px;
     background: var(--theme-bg-alt);
     color: var(--theme-fg);
   }

   code {
     border-radius: 5px;
     background:#e8e8e8;
     font-size: 80%;
   }

   kbd {
     display: inline-block;
     padding: 3px 5px;
     font: 80% SFMono-Regular,Consolas,Liberation Mono,Menlo,monospace;
     line-height: normal;
     line-height: 10px;
     color:#444d56;
     vertical-align: middle;
     background-color:#fafbfc;
     border: 1px solid#d1d5da;
     border-radius: 3px;
     box-shadow: inset 0 -1px 0#d1d5da;
   }

   table {
     max-width: 100%;
     overflow-x: auto;
     display: block;
     border-top: none;
   }

   a {
       text-decoration: none;
       background-image: linear-gradient(#d8dce9, #d8dce9);
       background-position: 0% 100%;
       background-repeat: no-repeat;
       background-size: 0% 2px;
       transition: background-size .3s;
   }
   \#table-of-contents a {
       background-image: none;
   }
   a:hover, a:focus {
       background-size: 100% 2px;
   }
   a[href^='#'] { font-variant-numeric: oldstyle-nums; }
   a[href^='#']:visited { color:#3091d1; }

   li .checkbox {
       display: inline-block;
       width: 0.9em;
       height: 0.9em;
       border-radius: 3px;
       margin: 3px;
       top: 4px;
       position: relative;
   }
   li.on > .checkbox { background: var(--theme-green); box-shadow: 0 0 2px var(--theme-green); }
   li.trans > .checkbox { background: var(--theme-orange); box-shadow: 0 0 2px var(--theme-orange); }
   li.off > .checkbox { background: var(--theme-red); box-shadow: 0 0 2px var(--theme-red); }
   li.on > .checkbox::after {
     content: '';
     height: 0.45em;
     width: 0.225em;
     -webkit-transform-origin: left top;
     transform-origin: left top;
     transform: scaleX(-1) rotate(135deg);
     border-right: 2.8px solid#fff;
     border-top: 2.8px solid#fff;
     opacity: 0.9;
     left: 0.10em;
     top: 0.45em;
     position: absolute;
   }
   li.trans > .checkbox::after {
       content: '';
       font-weight: bold;
       font-size: 1.6em;
       position: absolute;
       top: 0.23em;
       left: 0.09em;
       width: 0.35em;
       height: 0.12em;
       background:#fff;
       opacity: 0.9;
       border-radius: 0.1em;
   }
   li.off > .checkbox::after {
    content: '✖';
    color:#fff;
    opacity: 0.9;
    position: relative;
    top: -0.40rem;
    left: 0.17em;
    font-size: 0.75em;
  }

   span.timestamp {
       color: #003280;
       background: #647CFF44;
       border-radius: 3px;
       line-height: 1.25;
   }

   \#table-of-contents { overflow-y: auto; }
   blockquote p { margin: 8px 0px 16px 0px; }
   \#postamble .date { color: var(--theme-green); }

   ::-webkit-scrollbar { width: 10px; height: 8px; }
   ::-webkit-scrollbar-track { background:#9992; }
   ::-webkit-scrollbar-thumb { background:#ccc; border-radius: 10px; }
   ::-webkit-scrollbar-thumb:hover { background:#888; }
</style>
<!––tec/custom-head-end-->
"
      ))))

(add-hook 'org-export-before-processing-hook 'jsravn--org-inline-css-hook)
;; Exporting to HTML:1 ends here

;; [[file:~/.config/doom/config.org::*Exporting to HTML][Exporting to HTML:2]]
(setq org-html-text-markup-alist
      '((bold . "<b>%s</b>")
        (code . "<code>%s</code>")
        (italic . "<i>%s</i>")
        (strike-through . "<del>%s</del>")
        (underline . "<span class=\"underline\">%s</span>")
        (verbatim . "<kbd>%s</kbd>")))
;; Exporting to HTML:2 ends here

;; [[file:~/.config/doom/config.org::*Exporting to HTML][Exporting to HTML:3]]
;; (after! org
;;   (appendq! org-html-checkbox-types
;;             '((html-span .
;;                          ((on . "<span class='checkbox'></span>")
;;                           (off . "<span class='checkbox'></span>")
;;                           (trans . "<span class='checkbox'></span>")))))
;;   (setq org-html-checkbox-type 'html-span))
;; Exporting to HTML:3 ends here

;; [[file:~/.config/doom/config.org::*Exporting to Beamer][Exporting to Beamer:1]]
(setq org-beamer-theme "[progressbar=foot]metropolis")
;; Exporting to Beamer:1 ends here

;; [[file:~/.config/doom/config.org::*Exporting to Beamer][Exporting to Beamer:2]]
(setq org-beamer-frame-level 2)
;; Exporting to Beamer:2 ends here

;; [[file:~/.config/doom/config.org::*Exporting to GFM][Exporting to GFM:1]]
(eval-after-load "org"
  '(require 'ox-gfm nil t))
;; Exporting to GFM:1 ends here

;; [[file:~/.config/doom/config.org::*Capture templates][Capture templates:1]]
(after! org
  (setq org-capture-templates
        `(("t" "Todo [inbox]" entry
           (file ,(concat org-directory "inbox.org"))
           "* TODO %i%?")
          ("e" "Event [inbox]" entry
           (file ,(concat org-directory "inbox.org"))
           "* %i%? \n %U")
          ("n" "Note [inbox]" entry
           (file ,(concat org-directory "inbox.org"))
           "* %?")
          ("s" "Shopping [todo]" checkitem
           (file+olp ,(concat org-directory "someday.org") "Home" "Shopping")
           "- [ ] %?"))))
;; Capture templates:1 ends here

;; [[file:~/.config/doom/config.org::*Task settings][Task settings:1]]
(after! org
  (setq
   org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)"))
   org-log-done 'time))
;; Task settings:1 ends here

;; [[file:~/.config/doom/config.org::*Contexts][Contexts:1]]
(after! org
  (setq
   org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("@omscs" . ?o))
   org-fast-tag-selection-single-key t))
;; Contexts:1 ends here

;; [[file:~/.config/doom/config.org::*Refile targets][Refile targets:1]]
(after! org
  (setq
   org-refile-targets '(("~/Dropbox/Notes/todo.org" :maxlevel . 2)
                        ("~/Dropbox/Notes/someday.org" :maxlevel . 1)
                        ("~/Dropbox/Notes/tickler.org" :maxlevel . 2)
                        ("~/Dropbox/Notes/notes.org" :maxlevel . 2))))
;; Refile targets:1 ends here

;; [[file:~/.config/doom/config.org::*Habits][Habits:1]]
(after! org
  (add-to-list 'org-modules 'org-habit t))
;; Habits:1 ends here

;; [[file:~/.config/doom/config.org::*Custom Agendas][Custom Agendas:1]]
(after! org
  (setq org-agenda-custom-commands
        (list (jsravn--all-agenda)
              (jsravn--agenda "home")
              (jsravn--agenda "work")
              (jsravn--agenda "omscs"))))
;; Custom Agendas:1 ends here

;; [[file:~/.config/doom/config.org::*Custom Agendas][Custom Agendas:2]]
(after! org (setq org-deadline-warning-days 14))
;; Custom Agendas:2 ends here

;; [[file:~/.config/doom/config.org::*All Agenda Function][All Agenda Function:1]]
(defun jsravn--all-agenda ()
  "Custom all agenda."
  `("A" "All agenda"
    ((todo "" ((org-agenda-files '("~/Dropbox/Notes/inbox.org"))
               (org-agenda-overriding-header "Inbox")))
     (tags "-{.*}" ((org-agenda-files '("~/Dropbox/Notes/todo.org"
                                        "~/Dropbox/Notes/tickler.org"
                                        "~/Dropbox/Notes/someday.org"))
                    (org-agenda-overriding-header "Untagged")))
     (agenda "" ((org-agenda-span 7)
                 (org-agenda-start-day "-1d")
                 (org-agenda-files '("~/Dropbox/Notes/tickler.org"
                                     "~/Dropbox/Notes/todo.org"))
                 (org-agenda-skip-function #'jsravn--skip-scheduled-if-in-todo)))
     ,(jsravn--tags-todo "@home" "Home")
     ,(jsravn--tags-todo "@work" "Work")
     ,(jsravn--tags-todo "@omscs" "OMSCS"))))
;; All Agenda Function:1 ends here

;; [[file:~/.config/doom/config.org::*Context Agenda Function][Context Agenda Function:1]]
(defun jsravn--agenda (scope)
  "Custom scoped agenda."
  (let ((key (substring scope 0 1))
        (title (concat (upcase-initials scope) "agenda"))
        (tag (concat "@" scope)))
    `(,key ,title
           ((agenda "" ((org-agenda-span 7)
                        (org-agenda-start-day "-1d")
                        (org-agenda-files '("~/Dropbox/Notes/tickler.org"
                                            "~/Dropbox/Notes/todo.org"))
                        (org-agenda-skip-function #'jsravn--skip-scheduled-if-in-todo)))
            ,(jsravn--tags-todo (concat tag "/!TODO") "Todo")
            ,(jsravn--tags-todo (concat tag "/!WAITING") "Waiting"))
           ((org-agenda-tag-filter-preset '(,(concat "+" tag)))))))
;; Context Agenda Function:1 ends here

;; [[file:~/.config/doom/config.org::*Agenda Support Functions][Agenda Support Functions:1]]
(defun jsravn--tags-todo (tags header)
  "Customized tags-todo view which only shows the first TODO in a subheading."
  `(tags-todo ,tags ((org-agenda-files '("~/Dropbox/Notes/todo.org"))
                     (org-agenda-overriding-header ,header)
                     (org-agenda-skip-function #'jsravn--skip-all-siblings-but-first))))

(defun jsravn--skip-all-siblings-but-first ()
  "Skip all but the first non-done entry that is inside a subheading."
  (when (> (car (org-heading-components)) 2)
    (let (should-skip-entry)
      (save-excursion
        (while (and (not should-skip-entry) (org-goto-sibling t))
          (when (string= "TODO" (org-get-todo-state))
            (setq should-skip-entry t))))
      (when should-skip-entry
        (or (outline-next-heading) (goto-char (point-max)))))))
;; Agenda Support Functions:1 ends here

;; [[file:~/.config/doom/config.org::*Agenda Support Functions][Agenda Support Functions:2]]
(defun jsravn--skip-scheduled-if-in-todo ()
  "Skip scheduled items that have been moved to todo.org."
  (when (and (string= "todo.org" (file-name-nondirectory (buffer-file-name)))
             (org-entry-get nil "SCHEDULED"))
    (or (outline-next-heading) (goto-char (point-max)))))
;; Agenda Support Functions:2 ends here

;; [[file:~/.config/doom/config.org::*Agenda Searches][Agenda Searches:1]]
(after! org (setq org-agenda-text-search-extra-files '(agenda-archives)))
;; Agenda Searches:1 ends here

;; [[file:~/.config/doom/config.org::*Agenda Searches][Agenda Searches:2]]
(after! org (setq org-agenda-search-view-always-boolean t))
;; Agenda Searches:2 ends here

;; [[file:~/.config/doom/config.org::*org-roam][org-roam:1]]
(setq org-roam-directory (concat org-directory "roam/"))
;; org-roam:1 ends here

;; [[file:~/.config/doom/config.org::*org-roam][org-roam:2]]
(setq org-roam-capture-templates
      '(("d" "default" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "${slug}-%<%Y%m%d%H%M%S>"
         :head "#+TITLE: ${title}\n"
         :unnarrowed t)))
;; org-roam:2 ends here

;; [[file:~/.config/doom/config.org::*org-roam][org-roam:3]]
(setq deft-directory org-roam-directory)
;; org-roam:3 ends here

;; [[file:~/.config/doom/config.org::*org-roam][org-roam:4]]
(setq org-roam-buffer-no-delete-other-windows t)
;; org-roam:4 ends here

;; [[file:~/.config/doom/config.org::*org-roam][org-roam:5]]
(defun jsravn--open-org-roam ()
  "Called by `org-mode-hook' to call `org-roam' if the current buffer is a roam file."
  (remove-hook 'window-configuration-change-hook #'jsravn--open-org-roam)
  (when (org-roam--org-roam-file-p)
    (unless (eq 'visible (org-roam--current-visibility)) (org-roam))))

(after! org-roam
  (add-hook 'org-mode-hook
            (lambda ()
              (add-hook 'window-configuration-change-hook #'jsravn--open-org-roam))))
;; org-roam:5 ends here

;; [[file:~/.config/doom/config.org::*org-journal][org-journal:1]]
(setq org-journal-date-prefix "#+TITLE: "
      org-journal-date-format "%A, %d %B %Y"
      org-journal-file-format "%Y-%m-%d.org"
      org-journal-dir org-roam-directory)
;; org-journal:1 ends here

;; [[file:~/.config/doom/config.org::*Calendar][Calendar:1]]
;; (use-package! org-caldav
;;   :after org
;;   :init
;;   ;; Configure my calendars.
;;   (setq org-caldav-url "https://caldav.fastmail.com/dav/calendars/user/james@r-vn.org"
;;         org-caldav-calendars
;;         `((:calendar-id "0a220cb3-0ee8-49a9-af76-15c60bde70da"
;;            :files ,(list (concat org-directory "cal-personal.org"))
;;            :inbox ,(concat org-directory "cal-personal.org"))
;;           (:calendar-id "071a3712-0213-4dac-a421-a79dc1760517"
;;            :files ,(list (concat org-directory "cal-family.org"))
;;            :inbox ,(concat org-directory "cal-family.org"))
;;           (:calendar-id "4a92bcb6-a731-418c-89a3-97b86c0c51e5"
;;            :files ,(list (concat org-directory "cal-holidayuk.org"))
;;            :inbox ,(concat org-directory "cal-holidayuk.org"))))

;;   ;; Configure caldav.
;;   (let ((caldav-dir (concat org-directory ".org-caldav/")))
;;     (setq org-caldav-backup-file (concat caldav-dir "org-caldav-backup.org")
;;           org-caldav-save-directory caldav-dir
;;           org-caldav-show-sync-results nil))

;;   :config
;;   ;; Configure icalendar.
;;   (setq org-icalendar-alarm-time 1
;;         org-icalendar-include-todo t
;;         org-icalendar-timezone "Europe/London"
;;         org-icalendar-use-deadline '(event-if-todo event-if-not-todo todo-due)
;;         org-icalendar-use-scheduled '(todo-start event-if-todo event-if-not-todo))

;;   (map! :map org-mode-map
;;         :localleader
;;         :desc "Sync calendars" "C" #'org-caldav-sync))
;; Calendar:1 ends here

;; [[file:~/.config/doom/config.org::*Alerts][Alerts:1]]
;; (use-package! org-alert
;;   :after org
;;   :init
;;   (setq alert-default-style 'libnotify                  ; Use system notifications.
;;         org-alert-headline-regexp "\\(Deadline:.+\\)"   ; Only notify for deadlines.
;;         org-alert-interval 7200)                        ; Check/alert bihourly.
;;   :config
;;   (add-hook 'emacs-startup-hook #'org-alert-enable))
;; Alerts:1 ends here

;; [[file:~/.config/doom/config.org::*YAML][YAML:1]]
(setq lsp-yaml-schemas (make-hash-table))
(puthash "kubernetes" ["resources.yaml"
                       "resources/*"
                       "pod.yaml"
                       "deployment.yaml"
                       "serviceaccount.yaml"
                       "clusterrole.yaml"
                       "role.yaml"
                       "clusterrolebinding.yaml"
                       "rolebinding.yaml"
                       "configmap.yaml"
                       "service.yaml"]
         lsp-yaml-schemas)
(puthash "http://json.schemastore.org/kustomization" ["kustomization.yaml"] lsp-yaml-schemas)
;; YAML:1 ends here
