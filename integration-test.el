
(defun lsp-notify-wrapper (params)
  (let ((lsp--virtual-buffer-mappings (ht)))
    (pcase (plist-get params :method)
      (`"textDocument/didChange"
       (setq my/params params)
       (-let [(&plist :params
                      (&plist :textDocument (&plist :uri :version)
                              :contentChanges [(&plist :range (&plist :start :end )
                                                       :text)]))
              params]
         (with-current-buffer (get-buffer-create (format "*%s*" (f-filename (lsp--uri-to-path uri))))
           (let ((start-point (if start
                                  (lsp--position-to-point (ht ("line" (plist-get start :line))
                                                              ("character" (plist-get start :character))))
                                (point-min)))
                 (end-point (if end
                                (lsp--position-to-point (ht ("line" (plist-get end :line))
                                                            ("character" (plist-get end :character))))
                              (point-max))))
             (display-buffer-in-side-window (current-buffer) ())
             (delete-region start-point end-point)
             (goto-char start-point)
             (insert text)))))
      (`"textDocument/didOpen"
       (-let [(&plist :params (&plist :textDocument
                                      (&plist :uri
                                              :version
                                              :text)))
              params]
         (with-current-buffer (get-buffer-create (format "*%s*" (f-filename (lsp--uri-to-path uri))))
           (display-buffer-in-side-window (current-buffer) ())

           (delete-region (point-min) (point-max))
           (insert (or text ""))))))))
