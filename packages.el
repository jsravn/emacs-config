;; [[file:../../../../tmp/config.org.F26TNI::*Custom Packages][Custom Packages:1]]
;; -*- no-byte-compile: t; -*-
;; Custom Packages:1 ends here

;; [[file:../../../../tmp/config.org.F26TNI::*Package loading][Package loading:1]]
;; custom packages
(package! atomic-chrome)    ;; integration with the atomic chrome extension
(package! org-alert)
(package! caddyfile-mode)
(package! protobuf-mode)

;; unpin these packages to use the latest always
(unpin! org-roam)
(unpin! lsp-mode)
;; Package loading:1 ends here
