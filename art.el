;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))
;; Profile emacs startup
  (add-hook 'emacs-startup-hook
    (lambda ()
      (message "*** Emacs loaded in %s with %d garbage collections."
        (format "%.2f seconds"
          (float-time
            (time-subtract after-init-time before-init-time)))
               gcs-done)))

(set-default-coding-systems 'utf-8)
(setq
  split-width-threshold nil
  inhibit-startup-screen t
  create-lockfiles nil
  make-backup-files nil
  auto-save-default nil
  line-number-mode t
  column-number-mode t
  scroll-error-top-bottom t
  show-paren-delay 0.1
  tabs-width 2
  sentence-end-double-space nil
  split-width-threshold nil
  split-height-threshold nil
  ring-bell-function 'ignore
  inhibit-startup-echo-area-message t
  enable-local-variables :all
  mouse-1-click-follows-link t
  mouse-1-click-in-non-selected-windows t
  select-enable-clipboard t
  mouse-wheel-scroll-amount '(0.01)
  confirm-kill-emacs (quote y-or-n-p)
  ns-use-native-fullscreen nil
  ns-pop-up-frames nil
  line-move-visual t)
(setq-default
  fill-column 70
  indent-tabs-mode nil
  truncate-lines t
  require-final-newline t
  eldoc-documentation-function #'ignore
  global-eldoc-mode nil
  fringe-mode '(4 . 2))

(defalias 'yes-or-no-p 'y-or-n-p)
(blink-cursor-mode 0)
(global-hl-line-mode 0)
(show-paren-mode t)
(delete-selection-mode t)
(cua-mode t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq tab-always-indent 'complete)

(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config
    (setq exec-path-from-shell-variables '("PATH" "NVM_DIR"))
    (exec-path-from-shell-initialize))

(use-package auto-package-update
  :ensure t
  :custom
    (auto-package-update-interval 7)
    (auto-package-update-prompt-before-update t)
    (auto-package-update-hide-results t)
  :config
    (auto-package-update-maybe)
    (auto-package-update-at-time "09:00"))

(use-package no-littering
  :ensure t)
(setq auto-save-file-name-transforms
  `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(set-face-attribute 'default nil
  :family "PragmataPro Mono Liga"
  :weight 'light'
  :height 230)

(eval-when-compile (defconst pragmatapro-lig-alist
  '(("[ERROR]" #Xe2c0)
    ("[DEBUG]" #Xe2c1)
    ("[INFO]" #Xe2c2)
    ("[WARN]" #Xe2c3)
    ("[WARNING]" #Xe2c4)
    ("[ERR]" #Xe2c5)
    ("[FATAL]" #Xe2c6)
    ("[TRACE]" #Xe2c7)
    ("[FIXME]" #Xe2c8)
    ("[TODO]" #Xe2c9)
    ("[BUG]" #Xe2ca)
    ("[NOTE]" #Xe2cb)
    ("[HACK]" #Xe2cc)
    ("[MARK]" #Xe2cd)
    ("[FAIL]" #Xe2ce)
    ("// ERROR" #Xe2e0)
    ("// DEBUG" #Xe2e1)
    ("// INFO" #Xe2e2)
    ("// WARN" #Xe2e3)
    ("// WARNING" #Xe2e4)
    ("// ERR" #Xe2e5)
    ("// FATAL" #Xe2e6)
    ("// TRACE" #Xe2e7)
    ("// FIXME" #Xe2e8)
    ("// TODO" #Xe2e9)
    ("// BUG" #Xe2ea)
    ("// NOTE" #Xe2eb)
    ("// HACK" #Xe2ec)
    ("// MARK" #Xe2ed)
    ("// FAIL" #Xe2ee)
    ("# ERROR" #Xe2f0)
    ("# DEBUG" #Xe2f1)
    ("# INFO" #Xe2f2)
    ("# WARN" #Xe2f3)
    ("# WARNING" #Xe2f4)
    ("# ERR" #Xe2f5)
    ("# FATAL" #Xe2f6)
    ("# TRACE" #Xe2f7)
    ("# FIXME" #Xe2f8)
    ("# TODO" #Xe2f9)
    ("# BUG" #Xe2fa)
    ("# NOTE" #Xe2fb)
    ("# HACK" #Xe2fc)
    ("# MARK" #Xe2fd)
    ("# FAIL" #Xe2fe)
    ("!!" #Xe900)
    ("!=" #Xe901)
    ("!==" #Xe902)
    ("!!!" #Xe903)
    ;; ("!≡" #Xe904)
    ;; ("!≡≡" #Xe905)
    ("!>" #Xe906)
    ("!=<" #Xe907)
    ("#(" #Xe920)
    ("#_" #Xe921)
    ("#{" #Xe922)
    ("#?" #Xe923)
    ("#>" #Xe924)
    ("##" #Xe925)
    ("#_(" #Xe926)
    ("%=" #Xe930)
    ("%>" #Xe931)
    ("%>%" #Xe932)
    ("%<%" #Xe933)
    ;; ("<~" #Xe93f)
    ("&%" #Xe940)
    ("&&" #Xe941)
    ("&*" #Xe942)
    ("&+" #Xe943)
    ("&-" #Xe944)
    ("&/" #Xe945)
    ("&=" #Xe946)
    ("&&&" #Xe947)
    ("&>" #Xe948)
    ("$>" #Xe955)
    ;; ("~>" #Xe95f)
    ("***" #Xe960)
    ("*=" #Xe961)
    ("*/" #Xe962)
    ("*>" #Xe963)
    ("++" #Xe970)
    ("+++" #Xe971)
    ("+=" #Xe972)
    ("+>" #Xe973)
    ("++=" #Xe974)
    ("--" #Xe980)
    ("-<" #Xe981)
    ("-<<" #Xe982)
    ("-=" #Xe983)
    ("->" #Xe984)
    ("->>" #Xe985)
    ("---" #Xe986)
    ("-->" #Xe987)
    ("-+-" #Xe988)
    ("-\\/" #Xe989)
    ("-|>" #Xe98a)
    ("-<|" #Xe98b)
    ("->-" #Xe98c)
    ("-<-" #Xe98d)
    (".." #Xe990)
    ("..." #Xe991)
    ("..<" #Xe992)
    (".>" #Xe993)
    (".~" #Xe994)
    (".=" #Xe995)
    ("/*" #Xe9a0)
    ("//" #Xe9a1)
    ("/>" #Xe9a2)
    ("/=" #Xe9a3)
    ("/==" #Xe9a4)
    ("///" #Xe9a5)
    ("/**" #Xe9a6)
    (":::" #Xe9af)
    ("::" #Xe9b0)
    (":=" #Xe9b1)
    (":>" #Xe9b3)
    (":=>" #Xe9b4)
    (":(" #Xe9b5)
    (":-(" #Xe9b6)
    (":)" #Xe9b7)
    (":-)" #Xe9b8)
    (":/" #Xe9b9)
    (":\\" #Xe9ba)
    (":3" #Xe9bb)
    (":D" #Xe9bc)
    (":P" #Xe9bd)
    (":>:" #Xe9be)
    (":<:" #Xe9bf)
    ("<$>" #Xe9c0)
    ("<*" #Xe9c1)
    ("<*>" #Xe9c2)
    ("<+>" #Xe9c3)
    ("<-" #Xe9c4)
    ("<<" #Xe9c5)
    ("<<<" #Xe9c6)
    ("<<=" #Xe9c7)
    ("<=" #Xe9c8)
    ("<=>" #Xe9c9)
    ("<>" #Xe9ca)
    ("<|>" #Xe9cb)
    ("<<-" #Xe9cc)
    ("<|" #Xe9cd)
    ("<=<" #Xe9ce)
    ("<~" #Xe9cf)
    ("<~~" #Xe9d0)
    ("<<~" #Xe9d1)
    ("<$" #Xe9d2)
    ("<+" #Xe9d3)
    ("<!>" #Xe9d4)
    ("<@>" #Xe9d5)
    ("<#>" #Xe9d6)
    ("<%>" #Xe9d7)
    ("<^>" #Xe9d8)
    ("<&>" #Xe9d9)
    ("<?>" #Xe9da)
    ("<.>" #Xe9db)
    ("</>" #Xe9dc)
    ("<\\>" #Xe9dd)
    ("<\">" #Xe9de)
    ("<:>" #Xe9df)
    ("<~>" #Xe9e0)
    ("<**>" #Xe9e1)
    ("<<^" #Xe9e2)
    ("<!" #Xe9e3)
    ("<@" #Xe9e4)
    ("<#" #Xe9e5)
    ("<%" #Xe9e6)
    ("<^" #Xe9e7)
    ("<&" #Xe9e8)
    ("<?" #Xe9e9)
    ("<." #Xe9ea)
    ("</" #Xe9eb)
    ("<\\" #Xe9ec)
    ("<\"" #Xe9ed)
    ("<:" #Xe9ee)
    ("<->" #Xe9ef)
    ("<!--" #Xe9f0)
    ("<--" #Xe9f1)
    ("<~<" #Xe9f2)
    ("<==>" #Xe9f3)
    ("<|-" #Xe9f4)
    ("<||" #Xe9f5)
    ("<<|" #Xe9f6)
    ("<-<" #Xe9f7)
    ("<-->" #Xe9f8)
    ("<<==" #Xe9f9)
    ("<==" #Xe9fa)
    ("=<<" #Xea00)
    ("==" #Xea01)
    ("===" #Xea02)
    ("==>" #Xea03)
    ("=>" #Xea04)
    ("=~" #Xea05)
    ("=>>" #Xea06)
    ("=/=" #Xea07)
    ("=~=" #Xea08)
    ("==>>" #Xea09)
    ("=>=" #Xea0a)
    ("=<=" #Xea0b)
    ("=<" #Xea0c)
    ;;("≡≡" #Xea10)
    ;;("≡≡≡" #Xea11)
    ;;("≡:≡" #Xea12)
    (">-" #Xea20)
    (">=" #Xea21)
    (">>" #Xea22)
    (">>-" #Xea23)
    (">>=" #Xea24)
    (">>>" #Xea25)
    (">=>" #Xea26)
    (">>^" #Xea27)
    (">>|" #Xea28)
    (">!=" #Xea29)
    (">->" #Xea2a)
    ("??" #Xea40)
    ("?~" #Xea41)
    ("?=" #Xea42)
    ("?>" #Xea43)
    ("???" #Xea44)
    ("?." #Xea45)
    ("^=" #Xea48)
    ("^." #Xea49)
    ("^?" #Xea4a)
    ("^.." #Xea4b)
    ("^<<" #Xea4c)
    ("^>>" #Xea4d)
    ("^>" #Xea4e)
    ("\\\\" #Xea50)
    ("\\>" #Xea51)
    ("\\/-" #Xea52)
    ("@>" #Xea57)
    ("|=" #Xea60)
    ("||" #Xea61)
    ("|>" #Xea62)
    ("|||" #Xea63)
    ("|+|" #Xea64)
    ("|->" #Xea65)
    ("|-->" #Xea66)
    ("|=>" #Xea67)
    ("|==>" #Xea68)
    ("|>-" #Xea69)
    ("|<<" #Xea6a)
    ("||>" #Xea6b)
    ("|>>" #Xea6c)
    ("|-" #Xea6d)
    ("||-" #Xea6e)
    ("~=" #Xea70)
    ("~>" #Xea71)
    ("~~>" #Xea72)
    ("~>>" #Xea73)
    ("[[" #Xea80)
    ("]]" #Xea81)
    ("\">" #Xea90)
    ("_|_" #Xea97)
    )))

(defconst pragmatapro-lig-table
  (eval-when-compile
    (let ((v (make-vector 128 nil)))
      (dolist (i pragmatapro-lig-alist)
        (let ((s (car i))
              (f (min 127 (aref (car i) 0)))
              (c (cadr i)))
          (let ((a (aref v f))
                (r (substring s 1))
                (lr (1- (length s))))
            (aset
             v f
             (cons
              (max (if a (car a) 0) lr)
              (cons (list r lr
                          (vconcat (mapcar
                                    'string
                                    (concat (make-string lr ?\s)
                                            (string c)))))
                    (and a (cdr a))))))))
      (vconcat (mapcar (lambda (l)
                         (if l
                             (cons (car l)
                                   (sort (cdr l) (lambda (x y)
                                                   (> (cadr x) (cadr y)))))
                           nil))
                       v)))))

(defconst pragmatapro-lig-use-table
  (eval-when-compile
    (let ((v (make-vector 128 nil)))
      (dolist (i pragmatapro-lig-alist)
        (let ((s (car i)))
          (dotimes (j (length s))
            (aset v (aref s j) t))))
      v)))

(defun pragmatapro-guess-range (start end)
  (save-excursion
    (let ((s start) (e end)
          (ss (progn (goto-char start) (line-beginning-position)))
          (ee (progn (goto-char end) (line-end-position))))
      (while (and (> s ss)
                  (aref pragmatapro-lig-use-table
                        (min 127 (or (char-before s) 127))))
        (setq s (1- s)))
      (while (and (< e ee)
                  (aref pragmatapro-lig-use-table
                        (min 127 (or (char-after e) 127))))
        (setq e (1+ e)))
      (cons s e))))

(defun pragmatapro-remove-ligatures (start end)
  "Remove ligatures in start-end in the current buffer"
  (let ((p (text-property-any start end 'ligature t))
        (e nil))
    (while p
      (setq e (or (next-single-property-change p 'ligature) end))
      (remove-list-of-text-properties p e '(ligature display))
      (setq p (text-property-any e end 'ligature t)))))

(defun pragmatapro-update-ligatures (start end &optional l)
  "Update ligatures in start-end in the current buffer"
  (let ((modified (buffer-modified-p))
        (inhibit-read-only t)
        (case-fold-search nil))
    (save-excursion
      (let ((z (pragmatapro-guess-range (or start (point))
                                        (or end (point)))))
        (goto-char (car z))
        (setq end (cdr z)))
      (when (<= (point) end)
        (pragmatapro-remove-ligatures (point) end))
      (while (< (point) end)
        (let* ((c (char-after))
               (l (and c (aref pragmatapro-lig-table (min 127 c)))))
          (forward-char 1)
          (when l
            (catch 'break
              (let ((pt (point)))
                (dolist (p (cdr l))
                  (when (string-prefix-p
                         (car p)
                         (buffer-substring-no-properties
                          pt (min (+ pt (car l)) (1+ (buffer-size)))))
                    (forward-char (cadr p))
                    (let ((s (1- pt)) (th (caddr p)))
                      (put-text-property s (point) 'ligature t)
                      (dotimes (i (1+ (cadr p)))
                        (put-text-property (+ s i) (+ s i 1) 'display
                                           (aref th i)))
                      (throw 'break nil))))))))))
    (set-buffer-modified-p modified)))

(define-minor-mode pragmatapro-lig-mode
  "Compose pragmatapro's ligatures."
  :lighter " PragLig"
  (let ((inhibit-modification-hooks t)
        (inhibit-read-only t))
    (if pragmatapro-lig-mode
        (progn ; Turn on
          (add-hook 'after-change-functions 'pragmatapro-update-ligatures t t)
          (when (> (buffer-size) 0)
            (pragmatapro-update-ligatures 1 (buffer-size))))
      ;; Turn off
      (remove-hook 'after-change-functions 'pragmatapro-update-ligatures t)
      (when (> (buffer-size) 0)
        (pragmatapro-remove-ligatures 1 (buffer-size)))))
  pragmatapro-lig-mode)

(defun pragmatapro-lig-mode-on ()
  (pragmatapro-lig-mode 1))

(define-globalized-minor-mode pragmatapro-lig-global-mode
  pragmatapro-lig-mode
  pragmatapro-lig-mode-on)

;; ---

(defvar pragmatapro-icons
  (eval-when-compile
    (let ((tt (make-hash-table :size 127 :test 'equal)))
      (puthash "lisp" "()" tt)
      (puthash "lisp interaction" "()\xf41f" tt)
      (puthash "scheme" "(λ)" tt)
      (puthash "inferior scheme" "(λ)\xf41f" tt)
      (puthash "dired" "\xe5fe" tt)
      (puthash "html" "\xe736" tt)
      (puthash "web" "\xe796" tt)
      (puthash "scala" "\xe737" tt)
      (puthash "c" "\xe61e" tt)
      (puthash "c/*l" "\xe61e" tt)
      (puthash "c++" "\xe61d" tt)
      (puthash "c++//l" "\xe61d" tt)
      (puthash "java//l" "\xe738" tt)
      (puthash "java" "\xe738" tt)
      (puthash "ruby" "\xe791" tt)
      (puthash "inf-ruby" "\xe791\xf41f" tt)
      (puthash "rails" "\xe73b" tt)
      (puthash "python" "\xe606" tt)
      (puthash "inferior python" "\xe606\xf41f" tt)
      (puthash "php" "\xe73d" tt)
      (puthash "markdown" "\xe73e" tt)
      (puthash "css" "\xe749" tt)
      (puthash "sass" "\xe74b" tt)
      (puthash "javascript" "\xe60c" tt)
      (puthash "js" "\xe74e" tt)
      (puthash "typescript" "\xe628" tt)
      (puthash "jquery" "\xe750" tt)
      (puthash "coffee" "\xe751" tt)
      (puthash "angularjs" "\xe753" tt)
      (puthash "swift" "\xe755" tt)
      (puthash "less" "\xe758" tt)
      (puthash "clojure" "\xe76a" tt)
      (puthash "cidar" "\xe76a" tt)
      (puthash "haskell" "\xe777" tt)
      (puthash "haskell-cabal" "\xe777 Cabal" tt)
      (puthash "interactive-haskell" "\xe777\xf41f" tt)
      (puthash "hscompilation" "\xe777\x2611" tt)
      (puthash "emacs-lisp" "(\xe779)" tt)
      (puthash "prolog" "\xe7a1" tt)
      (puthash "fsharp" "\xe7a7" tt)
      (puthash "rust" "\xe7a8" tt)
      (puthash "d" "\xe7af" tt)
      (puthash "erlang" "\xe7b1" tt)
      (puthash "lua" "\xe620" tt)
      (puthash "dart" "\xe798" tt)
      (puthash "dart//l" "\xe798" tt)
      (puthash "go" "\xe627" tt)
      (puthash "git" "\xe630" tt)
      (puthash "comint" "\xf41f" tt)
      (puthash "fundamental" "\xf4a5" tt)
      (puthash "shell" "\xe7a2" tt)
      (puthash "elixir" "\xf499" tt)
      (puthash "debugger" "\xf4a0" tt)
      tt)))

(defun pragmatapro-get-mode-icon ()
  (let ((z (gethash (downcase mode-name) pragmatapro-icons)))
    (if z z mode-name)))
(pragmatapro-lig-global-mode)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :config
    (global-git-gutter-mode))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :bind-keymap (("C-c p" . projectile-command-map))
  :init
    (progn
      (projectile-mode)
      (setq projectile-completion-system 'ivy)
      (setq projectile-enable-caching nil)
      (setq projectile-verbose nil)
      (setq projectile-do-log nil)))

(use-package counsel
  :ensure t
  :diminish counsel-mode)

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :bind (("C-x b" . ivy-switch-buffer))
  :config
    (setq ivy-use-virtual-buffers t)
    (setq ivy-count-format "%d/%d ")
    (setq ivy-display-style 'fancy))

(use-package swiper
  :ensure t
  :diminish ivy-mode
  :bind (("\C-s" . swiper)
         ("C-c C-r" . ivy-resume)
         ("M-x" . counsel-M-x)
         ("C-c C-f" . counsel-find-file))
  :config
    (progn
      (ivy-mode 1)
      (setq ivy-use-virtual-buffers t)
      (setq ivy-display-style 'fancy)))

(use-package avy
  :ensure t
  :diminish avy-mode
  :bind (("C-;" . avy-goto-char)))

(use-package ace-window
  :ensure t
  :diminish ace-window-mode
  :bind (("M-o" . ace-window)
         ("M-p" . ace-delete-window))
  :init (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package expand-region
  :ensure t
  :diminish
  :commands er/expand-region
  :bind ("C-c i" . er/expand-region))

(use-package lsp-mode
  :ensure t
  :init
    (setq lsp-eldoc-render-all nil))

(use-package company
  :ensure t
  :custom
    (company-require-match nil)
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.2)
    (company-tooltip-align-annotation t)
    (company-frontends '(company-pseudo-tooltip-frontend
                               company-echo-metadata-frontend))
  :commands (company-mode global-company-mode company-complete
                          company-complete-common company-manual-begin
                          company-grab-line)
  :bind (
         :map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :hook ((prog-mode . company-mode)
         (comint-mode . company-mode))
  :config (setq lsp-completion-provider :capf))

(use-package yasnippet
  :ensure t
  :init
    (yas-global-mode 1))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init
  (setq flycheck-disabled-checkers '(ruby-reek)))

(use-package ruby-mode
  :ensure t
  :interpreter "ruby"
  :mode "\\.rb$"
  :mode "\\.rake$"
  :mode "\\.gemspec$"
  :mode "\\.\\(pry\\|irb\\)rc$"
  :mode "/\\(Gem\\|Cap\\|Vagrant\\|Rake\\|Pod\\|Puppet\\|Berks\\)file$"
  :config
    (setq ruby-insert-encoding-magic-comment nil)
    (setq ruby-deep-indent-paren t)
  :init
    (add-hook 'ruby-mode-hook #'flycheck-mode)
    (add-hook 'ruby-mode-hook 'lsp))

(use-package rbenv
  :ensure t
  :diminish
  :init
    (progn
      (setq rbenv-show-active-ruby-in-modeline nil)
      (setq rbenv-modeline-function 'rbenv--modeline-plain))
      (global-rbenv-mode))

(use-package ruby-end
  :ensure t
  :diminish
  :init
    (add-hook 'ruby-mode-hook 'ruby-end-mode t))

(use-package projectile-rails
  :ensure t
  :diminish
  :config
    (projectile-rails-global-mode t))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package ag
  :ensure t)

(use-package anzu
  :ensure t
  :diminish global-anzu-mode
  :config
    (global-anzu-mode)
  :bind (
    ("M-%" . anzu-query-replace)
    ("C-M-%" . anzu-query-replace-regexp)))

(use-package tree-sitter
  :ensure t
  :config
    (add-hook 'ruby-mode-hook #'tree-sitter-mode))
(use-package tree-sitter-langs
  :ensure t
  :config
    (add-hook 'ruby-mode-hook #'tree-sitter-hl-mode))

(use-package whitespace
  :ensure t
  :diminish global-whitespace-mode
  :config
  (progn
    (setq whitespace-style '(trailing face))
    (global-whitespace-mode)))

(use-package all-the-icons
  :ensure t)
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
    (setq doom-modeline-height 25)
    (setq doom-modeline-bar-width 2)
    (setq doom-modeline-persp-name t)
    (setq doom-modeline-buffer-file-name-style 'file-name)
    (setq doom-modeline-icon nil)
    (setq doom-modeline-major-mode-icon nil)
    (setq doom-modeline-minor-modes nil)
    (setq doom-modeline-github nil))

(use-package doom-themes
  :ensure t
  :init
    (load-theme 'doom-one-light t)
    (set-background-color "white"))
