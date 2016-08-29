(defun force-yasnippet-off ()
  (yas-minor-mode -1)
  (setq yas-dont-activate t))

(defun launch-terminal ()
  (interactive)
  (shell-command "~/.local/bin/urxvt_launch.sh -name \"urxvt floating\""))

(defun setup-windows ()
  (interactive)
  (kill-matching-buffers-rudely "\*terminal<[0-9]+>\*")
  (delete-other-windows)
  (split-window-right-and-focus)
  (split-window-below-and-focus)
  (multi-term)
  (toggle-current-window-dedication)
  ;;(neotree-toggle)
  (select-window-1))

(defun setup-windows-bookmark ()
  (interactive)
  (helm-bookmarks)
  (setup-windows))

(defun make-80 ()
  (interactive)
  (evil-window-set-width 80))

(defun my-config ()
  (setq-default powerline-default-separator nil
                gofmt-command "goimports"
                flycheck-disabled-checkers '()
                case-fold-search nil
                git-gutter-fr:side (quote right-fringe)
                nxml-child-indent 4
                python-shell-virtualenv-path "/home/jchase/.local/waf_env"
                ;; debug-on-quit t
                )
  (evil-leader/set-key "at" 'launch-terminal)
  (evil-leader/set-key-for-mode 'term-mode "md" 'term-send-eof)
  (evil-leader/set-key "ghd" 'git-gutter:popup-hunk)
  (evil-leader/set-key-for-mode 'go-mode "mgt" 'godef-jump)
  (evil-leader/set-key-for-mode 'go-mode "mgg" 'godef-jump-other-window)
  (evil-leader/set-key-for-mode 'eshell-mode "mr" 'spacemacs/helm-eshell-history)
  (evil-leader/set-key "ep" 'spacemacs/previous-error)
  (evil-leader/set-key "wb" 'setup-windows-bookmark)
  (evil-leader/set-key "wv" 'split-window-below-and-focus)
  (evil-leader/set-key "wg" 'split-window-right-and-focus)
  (evil-leader/set-key "ws" 'setup-windows)
  (evil-leader/set-key "tn" 'linum-mode)
  (evil-leader/set-key "tc" 'goto-address-mode)
  (evil-leader/set-key "tG" 'git-gutter-mode)
  (evil-leader/set-key "z8" 'make-80)
  (evil-leader/set-key "qq" 'delete-frame)
  (set-face-background 'evil-search-highlight-persist-highlight-face "#dddd00")
  (set-face-foreground 'evil-search-highlight-persist-highlight-face "#333333")
  (add-hook 'term-mode-hook #'force-yasnippet-off)
  (add-hook 'shell-mode-hook #'force-yasnippet-off)
  (add-hook 'go-mode-hook #'yas-minor-mode)
  (spacemacs/toggle-transparent-frame)
  (add-hook 'yas-before-expand-snippet-hook (lambda () (smartparens-mode -1)))
  (add-hook 'yas-after-exit-snippet-hook (lambda () (smartparens-mode 1)))
  )

(defun ido-goto-symbol (&optional symbol-list)
  "refresh imenu and jump to a place in the buffer using ido."
  (interactive)
  (unless (featurep 'imenu)
    (require 'imenu nil t))
  (cond
    ((not symbol-list)
      (let ((ido-mode ido-mode)
             (ido-enable-flex-matching
               (if (boundp 'ido-enable-flex-matching)
                 ido-enable-flex-matching t))
             name-and-pos symbol-names position)
        (unless ido-mode
          (ido-mode 1)
          (setq ido-enable-flex-matching t))
        (while (progn
                 (imenu--cleanup)
                 (setq imenu--index-alist nil)
                 (ido-goto-symbol (imenu--make-index-alist))
                 (setq selected-symbol
                   (ido-completing-read "symbol? " symbol-names))
                 (string= (first imenu--rescan-item) selected-symbol)))
        (unless (and (boundp 'mark-active) mark-active)
          (push-mark nil t nil))
        (setq position (rest (assoc selected-symbol name-and-pos)))
        (cond
          ((overlayp position)
            (goto-char (overlay-start position)))
          (t
            (goto-char position)))))
    ((listp symbol-list)
      (dolist (symbol symbol-list)
        (let (name position)
          (cond
            ((and (listp symbol) (imenu--subalist-p symbol))
              (ido-goto-symbol symbol))
            ((listp symbol)
              (setq name (first symbol))
              (setq position (rest symbol)))
            ((stringp symbol)
              (setq name symbol)
              (setq position
                (get-text-property 1 'org-imenu-marker symbol))))
          (unless (or (null position) (null name)
                    (string= (first imenu--rescan-item) name))
            (add-to-list 'symbol-names name)
            (add-to-list 'name-and-pos (cons name position))))))))
