;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   dotspacemacs-distribution 'spacemacs

   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()

   dotspacemacs-configuration-layers
   '(typescript
		 rust
     html
     sql
     nginx
     react
     osx
     auto-completion
     better-defaults
     emacs-lisp
     javascript
     typescript
     (typescript :variables
                 typescript-fmt-on-save t
                 typescript-fmt-tool 'tide
                 typescript-linter 'tslint
                 typescript-backend 'tide
                 ttide-tsserver-executable "/usr/local/bin/tsserver")
     json
     python
     git
     neotree
     asm
     java
     helm
     lsp
     markdown
     sql
     c-c++
     (c-c++ :variables c-c++-enable-clang-support t)
     multiple-cursors
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
		 prettier
		 (javascript :variables javascript-fmt-tool 'prettier)
     spell-checking
     syntax-checking
     version-control

     (osx :variables osx-command-as       'hyper
          osx-option-as        'meta
          osx-control-as       'control
          osx-function-as      nil
          osx-right-command-as 'left
          osx-right-option-as  'left
          osx-right-control-as 'left
          osx-swap-option-and-command nil)

     )

   dotspacemacs-additional-packages '(
     (web-mode flycheck prettier-js-mode add-node-modules-path)
   )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-enable-emacs-pdumper nil
   dotspacemacs-emacs-pdumper-executable-file "emacs"
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-gc-cons '(100000000 0.1)
   dotspacemacs-use-spacelpa nil
   dotspacemacs-verify-spacelpa-archives t
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory 'emacs-version
   dotspacemacs-editing-style 'vim
   dotspacemacs-startup-buffer-show-version t
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-new-empty-buffer-major-mode 'text-mode
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-initial-scratch-message nil
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14.0
                               :weight normal
                               :width normal)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-undecorated-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-enable-server nil
   dotspacemacs-server-socket-dir nil
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-icon-title-format nil
   dotspacemacs-whitespace-cleanup nil
   dotspacemacs-use-clean-aindent-mode t
   dotspacemacs-zone-out-when-idle nil
   dotspacemacs-pretty-docs nil
	 ;; JAVASCRIPT CONFIGURATION
	 js2-basic-offset 2
	 js-indent-level 2
	 ;; web-mode
	 css-indent-offset 2
	 web-mode-markup-indent-offset 2
	 web-mode-css-indent-offset 2
	 web-mode-code-indent-offset 2
	 web-mode-attr-indent-offset 2

	 ))

(defun dotspacemacs/user-env ()
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ())

(defun dotspacemacs/user-load ()
  (require 'lsp-mode)
  (require 'web-mode)
  (require 'flycheck)
	(require 'prettier-js)
	(require 'eaf)
)

(defun dotspacemacs/user-config ()
	(add-hook 'js2-mode-hook 'prettier-js-mode)
  	(evil-ex-define-cmd "q" 'kill-this-buffer)
  	(require 'asm-mode)
  	(add-hook 'asm-mode-hook (lambda ()
                             (setq indent-tabs-mode t) ; use spaces to indent
                             (electric-indent-mode -1)))

	(define-key asm-mode-map (kbd "<ret>") 'newline-and-indent)
 	(define-key asm-mode-map (kbd "M-.") 'helm-etags-select)
	;; auto-enable for .js/.jsx files
	;;  (add-to-list 'auto-mode-alist '("\\.js[x]?$" . web-mode))
  	(add-to-list 'auto-mode-alist '("\\.inc?$" . asm-mode))
	;;  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
 	(setq-default indent-tabs-mode 2)
	(setq c-basic-offset 2)
	(with-eval-after-load 'web-mode
		(add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
		(add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
		(add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))
	(add-hook 'web-mode-hook  'web-mode-init-hook)
	(add-hook 'web-mode-hook  'web-mode-init-prettier-hook)
	(with-eval-after-load 'flycheck
		(flycheck-add-mode 'html-tidy 'web-mode)
		(flycheck-add-mode 'css-csslint 'web-mode)
		(flycheck-add-mode 'javascript-eslint 'web-mode)
		(message "entering flycheck"))
  	;; Enable flycheck globally
  	(add-hook 'after-init-hook #'global-flycheck-mode)

  	(defun web-mode-init-prettier-hook ()
    		(add-node-modules-path)
    		(prettier-js-mode))
	(add-hook 'js2-mode-hook 'prettier-js-mode)
	(add-hook 'web-mode-hook 'prettier-js-mode)
	 (use-package rjsx-mode
		 :mode ("\\.jsx?$" . rjsx-mode)
		 :mode ("\\.js?$" . rjsx-mode)
		 :hook (rjsx-mode . tide-setup)
		 :config (setq js2-indent-level 2
		 js2-strict-missing-semi-warning nil))

	 (defun kill-minibuffer ()
    		(interactive)
    		(when (windowp (active-minibuffer-window))
      			(evil-ex-search-exit)))

  	(add-hook 'mouse-leave-buffer-hook #'kill-minibuffer)
	)
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (tide typescript-mode import-js grizzl toml-mode racer flycheck-rust dap-mode bui cargo rust-mode use-package-hydra tagedit slim-mode scss-mode sass-mode pug-mode impatient-mode helm-css-scss haml-mode emmet-mode counsel-css company-web web-completion-data add-node-modules-path rjsx-mode x86-lookup nasm-mode neotree sqlup-mode sql-indent mvn meghanada maven-test-mode lsp-java groovy-mode groovy-imports pcache gradle-mode nginx-mode helm-gtags ggtags d-mode counsel-gtags counsel swiper company-dcd ivy flycheck-dmd-dub yasnippet-classic-snippets web-mode yapfify web-beautify pytest pyenv-mode py-isort prettier-js pippel pipenv pyvenv pip-requirements nodejs-repl lsp-python-ms livid-mode skewer-mode simple-httpd live-py-mode json-navigator hierarchy json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc importmagic epc ctable concurrent deferred helm-pydoc cython-mode company-tern tern company-anaconda blacken anaconda-mode pythonic yasnippet-snippets xterm-color ws-butler writeroom-mode winum which-key vterm volatile-highlights vi-tilde-fringe uuidgen use-package unfill treemacs-projectile treemacs-persp treemacs-magit treemacs-evil toc-org terminal-here symon symbol-overlay string-inflection spaceline-all-the-icons smeargle shell-pop restart-emacs rainbow-delimiters popwin pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-bullets org-brain open-junk-file nameless mwim multi-term move-text mmm-mode markdown-toc magit-svn magit-section magit-gitflow macrostep lsp-ui lsp-treemacs lorem-ipsum link-hint indent-guide hybrid-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-lsp helm-ls-git helm-gitignore helm-git-grep helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ gh-md fuzzy font-lock+ flyspell-correct-helm flycheck-pos-tip flycheck-package flycheck-elsa flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav editorconfig dumb-jump dotenv-mode diminish devdocs define-word company-lsp column-enforce-mode clean-aindent-mode centered-cursor-mode browse-at-remote auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
