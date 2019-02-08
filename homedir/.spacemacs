;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil lv0.200.10ayers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     vimscript
     ansible

     (auto-completion :variables auto-completion-enable-help-tooltips t
                                          auto-completion-enable-sort-by-usage t)

     ;; better-defaults

     (c-c++ :variables c-c++-enable-clang-support t)

    ;; cscope

     (dash :variables helm-dash-docset-newpath
                      "/home/jbenden/.local/share/Zeal/Zeal/docsets")

     (elfeed :variables rmh-elfeed-org-files (list "~/.emacs.d/private/elfeeds.org"))

     emacs-lisp

     git

     gtags

     helm

     html

     javascript

     latex

     markdown

     ocaml

     ;; org

     python

     ;; (rust :variables
     ;;       rust-format-on-save t)

     semantic

     search-engine

     (shell :variables
             shell-default-height 30
             shell-default-position 'bottom)

     shell-scripts

     ;; (spell-checking :variables enable-flyspell-auto-completion nil)

     syntax-checking

     ;; version-control

     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(auto-indent-mode eterm-256color origami)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-escape)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."

  ;; FreeBSD Bash shell is evil
  (when (equal system-type 'berkeley-unix)
    (setq exec-path-from-shell-arguments '("-c")))

  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repositt mouse 1 shows 12 point DejaVu Sans Mono as being the same size as the big one. This may be a Windows thing, though.ory.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 40)
                                (projects . 40))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         tsdh-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   ;; DejaVu Sans Mono
   dotspacemacs-default-font '("Source Code Pro"
                               :size 20
                               :weight light
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

    (setq-default git-magit-status-fullscreen t)

    (setq-default company-clang-executable "/usr/bin/clang-5.0")
    (setq-default flycheck-c/c++-clang-executable "/usr/bin/clang-5.0")
    (setq-default clang-format-executable "/usr/bin/clang-format-4.0")
  )

;;
;; Automatically close compilation buffer windows, when the
;; compilation results in a clean build (exit status 0)
;;
;;(defun bury-compile-buffer-if-successful (buffer string)
;;  "Bury a compilation buffer if succeeded without warnings"
;;  (if (and
;;       (string-match "compilation" (buffer-name buffer))
;;       (string-match "finished" string)
;;       (not
;;        (with-current-buffer buffer
;;          (goto-char 1)
;;          (or
;;           (re-search-forward "\\(warning\\|Warning\\|WARNING\\)" nil t)))))
;;      (run-with-timer 1 nil
;;                      (lambda (buf)
;;						(bury-buffer buf)
;;						(switch-to-prev-buffer (get-buffer-window buf) 'kill))
;;                      buffer)))

;; (defun bury-compile-buffer-if-successful (buffer string)
;;   "Bury a compilation buffer if succeeded without warnings"
;;   (if (and
;;        (string-match "compilation" (buffer-name buffer))
;;        (string-match "finished" string)
;;        (not
;; (with-current-buffer buffer
;; (seq-some #'(lambda (line)
;;               (if (and (string-match "\\(warning\|Warning\|WARNING\\)" line)
;;                        (not (string-match "Makefile" line)))
;;                   t))
;;           (split-string (buffer-string) "\n" t))))
;; )
;;       (run-with-timer 1 nil
;;                       (lambda (buf)
;; 						(bury-buffer buf)
;; 						(switch-to-prev-buffer (get-buffer-window buf) 'kill))
;;                       buffer)))
;; 
(defun bury-compile-buffer-if-successful (buffer string)
  "Bury a compilation buffer if succeeded without warnings"
  (if (and
       (string-match "compilation" (buffer-name buffer))
       (string-match "finished" string))
      (run-with-timer 1 nil
                      (lambda (buf)
					   (save-selected-window
						(bury-buffer buf)
                        (quit-window 'kill (get-buffer-window buf))))
                      buffer)))

;;
;; Automatically reformat copy and pasted code
;;
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (derived-mode-p 'prog-mode)
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

(defun reformat-region (&optional b e)
  (interactive "r")
  (when (not (buffer-file-name))
    (error "A buffer must be associated with a file in order to use REFORMAT-REGION."))
  (when (not (executable-find "clang-format-4.0"))
    (error "clang-format not found."))
  (shell-command-on-region b e
     "clang-format-4.0 -style=file"
     (current-buffer) t)
  (indent-region b e)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

    (let ((node-modules-bin (expand-file-name (concat user-emacs-directory "node_modules/.bin"))))
      (when (file-exists-p node-modules-bin)
        (add-to-list 'exec-path node-modules-bin t)))

    (add-to-list 'load-path
                 (expand-file-name (concat user-emacs-directory "private")))

    ; Stop Emacs from losing undo information by
    ; setting very high limits for undo buffers
    (setq undo-limit 20000000)
    (setq undo-strong-limit 40000000)

    ;
    ; http://www.mostlymaths.net/2016/09/more-emacs-configuration-tweaks.html
    ;
    (global-set-key (kbd "C-S-<mouse-2>") 'helm-dash-at-point)

    ; (global-unset-key (kbd "M-<down-mouse-1>"))
    (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

    ;; (require 'origami)
    ;; (define-key evil-normal-state-map "Z" 'origami-toggle-node)
    ;; (define-key evil-visual-state-map "Z" 'origami-toggle-node)

    ;; (defun rb-toggle-rec (buffer point)
    ;;   (interactive (list (current-buffer) (point)))
    ;;   (progn (origami-recursively-toggle-node buffer point)
    ;;          ; (minimap-new-minimap)
    ;;   ))

    ;; (define-key evil-normal-state-map "z" 'rb-toggle-rec)
    ;; (define-key evil-visual-state-map "z" 'rb-toggle-rec)
    ;; (define-key evil-insert-state-map "C-z" 'rb-toggle-rec)

    ;;(require 'fic-ext-mode)
    ;;(add-hook 'c++-mode-hook 'turn-on-fic-ext-mode)
    ;;(add-hook 'c-mode-hook 'turn-on-fic-ext-mode)

    ;; (require 'auto-indent-mode)

    ;; (setq auto-indent-on-visit-file t
    ;;       auto-indent-indent-style 'conservative
    ;;       auto-indent-current-pairs t
    ;;       auto-indent-next-pairs t)

    ;; (add-hook 'c++-mode-hook 'auto-indent-mode)
    ;; (add-hook 'c-mode-hook 'auto-indent-mode)

    ;;(auto-indent-global-mode)

    ;; (add-to-list 'auto-indent-known-indent-levels 'c-basic-offset)

    (setq flyspell-popup-correct-delay 1.5)

    (setq browse-url-browser-function 'browse-url-generic
          engine/browser-function 'browse-url-generic
          browse-url-generic-program "elinks")

    (defun misra-set-c-style ()
      "Recommended BSD-Allman style, by MISRA, and Mozilla; with slight personal modifications."
      (setq c-basic-offset 2
            c-file-style "bsd")
      (c-set-offset 'statement-cont 0)
      (c-set-offset 'substatement 0)
      (c-set-offset 'substatement-open 0)
      (c-set-offset 'innamespace 0)
      (c-set-offset 'inclass 2)
      (c-set-offset 'case-label 2)
      (c-set-offset 'defun-block-intro 2)
      (c-set-offset 'statement-block-intro 2)
      (c-set-offset 'inextern-lang 0))
    (add-hook 'c-mode-common-hook 'misra-set-c-style)

    ;; automatically close a successful compilation buffer
    ;; (add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)
    ;; (push 'bury-compile-buffer-if-successful 'compilation-finish-functions)
    ;; (fmakunbound 'compilation-finish-function)

    (add-hook 'term-mode-hook #'eterm-256color-mode)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (parent-mode request pkg-info epl flx highlight iedit anzu goto-chg diminish bind-map packed popup vimrc-mode dactyl-mode origami eterm-256color bind-key auto-indent-mode powerline smartparens evil projectile helm helm-core avy org-plus-contrib ghub let-alist async hydra f dash s engine-mode elfeed-web elfeed-org elfeed-goodies ace-jump-mode noflet elfeed markdown-mode skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors js2-mode haml-mode flyspell-correct web-completion-data tern auctex xcscope toml-mode racer flycheck-rust seq pos-tip flycheck company cargo rust-mode yasnippet auto-complete caml dash-functional anaconda-mode pythonic gitignore-mode magit magit-popup git-commit with-editor evil-escape zeal-at-point yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen utop use-package tuareg toc-org tagedit stickyfunc-enhance srefactor spaceline smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el paradox orgit org-bullets open-junk-file ocp-indent neotree multi-term move-text mmm-mode merlin markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc jinja2-mode insert-shebang info+ indent-guide hy-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-cscope helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md ggtags fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fish-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump disaster define-word cython-mode company-web company-tern company-statistics company-shell company-c-headers company-auctex company-ansible company-anaconda column-enforce-mode coffee-mode cmake-mode clean-aindent-mode clang-format auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile ansible-doc ansible aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(safe-local-variable-values
   (quote
    ((eval
      (lambda nil
        (when
            (string=
             (file-name-extension buffer-file-name)
             "h")
          (c++-mode))
        (when
            (string=
             (file-name-extension buffer-file-name)
             "tcc")
          (c++-mode))))
     (c-c++-default-mode-for-headers . c++-mode)
     (c-c++-default-mode-for-headers quote c++-mode)
     (c-c++-default-mode-for-headers
      (quote c++-mode))
     (eval
      (lambda nil
        (when
            (string=
             (file-name-extension buffer-file-name)
             "tcc")
          (c++-mode))))
     (eval progn
           (c-set-offset
            (quote statement-cont)
            2)
           (c-set-offset
            (quote substatement)
            0)
           (c-set-offset
            (quote substatement-open)
            0)
           (c-set-offset
            (quote innamespace)
            0)
           (c-set-offset
            (quote case-label)
            2)
           (c-set-offset
            (quote inextern-lang)
            0))
     (whitespace-action warn-read-only auto-cleanup)
     (whitespace-newline . t)
     (whitespace-style face trailing lines-tail space-before-tab indentation empty)
     (eval progn
           (c-set-offset
            (quote statement-cont)
            0)
           (c-set-offset
            (quote substatement)
            0)
           (c-set-offset
            (quote substatement-open)
            0)
           (c-set-offset
            (quote innamespace)
            0)
           (c-set-offset
            (quote case-label)
            2)
           (c-set-offset
            (quote inextern-lang)
            0))
     (eval progn
           (c-set-offset
            (quote statement-cont)
            0)
           (c-set-offset
            (quote substatement)
            0)
           (c-set-offset
            (quote substatement-open)
            0)
           (c-set-offset
            (quote innamespace)
            0)
           (c-set-offset
            (quote case-label)
            0)
           (c-set-offset
            (quote inextern-lang)
            0))
     (eval code-style "Project Code Style"
           (c-set-offset
            (quote statement-cont)
            0)
           (c-set-offset
            (quote substatement)
            0)
           (c-set-offset
            (quote substatement-open)
            0)
           (c-set-offset
            (quote innamespace)
            0)
           (c-set-offset
            (quote case-label)
            0)
           (c-set-offset
            (quote inextern-lang)
            0))
     (eval
      (c-set-offset
       (quote statement-cont)
       0)
      (c-set-offset
       (quote substatement)
       0)
      (c-set-offset
       (quote substatement-open)
       0)
      (c-set-offset
       (quote innamespace)
       0)
      (c-set-offset
       (quote case-label)
       0)
      (c-set-offset
       (quote inextern-lang)
       0))
     (eval
      (c-set-offset
       (quote statement-cont)
       0)
      (c-set-offset
       (quote substatement)
       0)
      (c-set-offset
       (quote substatement-open)
       0)
      (c-set-offset
       (quote innamespace)
       0)
      (c-set-offset
       (quote inclass)
       2)
      (c-set-offset
       (quote case-label)
       0)
      (c-set-offset
       (quote defun-block-intro)
       2)
      (c-set-offset
       (quote inextern-lang)
       0))
     (c-set-offset
      (quote inextern-lang)
      0)
     (setq c-file-style "bsd")
     (flyspell-mode . -1)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
