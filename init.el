;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
(defconst MRLASERS-HOME_DIR
  (if (eq system-type 'windows-nt)
      (concat "C:/users/" (getenv "USER"))
    "~/"))

;; fennel-mode
;; (autoload 'fennel-mode "~/spacemacs-modes/fennel-mode/fennel-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.fnl\\'" . fennel-mode))

;; (eval-after-load 'html
;;   `(evil-define-key 'normal ))

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     (lua :variables
          lua-backend 'lua-mode)
     ;; (lua :variables
     ;;      lua-backend 'lsp
     ;;      lua-lsp-server 'lua-language-server
     ;;      lsp-clients-lua-language-server-bin
     ;;      "~/bin/lua-language-server/bin/lua-language-server"
     ;;      lsp-clients-lua-language-server-main-location
     ;;      "~/bin/lua-language-server/bin/main.lua")
     yaml
     (html :variables
           css-enable-lsp t
           less-enable-lsp t
           scss-enable-lsp t
           html-enable-lsp nil
           web-fmt-tool 'prettier)
     prettier
     ;; web-beautify
     (sql :variables
          sql-backend 'lsp
          sql-lsp-sqls-workspace-config-path 'workspace
          sql-capitalize-keywords t)
     csv
     (clojure :variables
              clojure-enable-clj-refactor t
              clojure-toplevel-inside-comment-form t
              clojure-backend 'cider ;; can also set this to 'lsp to work without repl
              )
     typescript
     elm
     ;; my stuff
     themes-megapack
     (org :variables
          org-enable-epub-support t
          org-enable-valign t
          ;; this does that automatic indenting under headings
          org-adapt-indentation nil ;; t
          )

     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t)
     ;; better-defaults
     emacs-lisp
     git
     ;; helm
     ivy
     ;lsp ;; enabled this because clojure layer quick start suggest it?
     (lsp :variables
          ; trying to fix that duplicate character thing
          lsp-completion-enable nil

          ; not sure where these came from???
          lsp-ui-doc-enable nil
          lsp-ui-sideline-enable nil
          treemacs-space-between-root-nodes nil)
     markdown
     multiple-cursors
     ;; or
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     (syntax-checking :variables
                      syntax-checking-enable-by-default t
                      syntax-checking-enable-tooltips t
                      )
     ;; version-control
     ;; neotree
     treemacs
     ;; (treemacs :variables
     ;;           treemacs-use-follow-mode 'tag
     ;;           ;; treemacs-git-mode 'deferred
     ;;           )
     themes-megapack
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '()

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

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
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         space-cobolt
                         modus-vivendi
                         spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Fira Code"
                               :size 11.0 ;; default was 11
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

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

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 't ; nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
)

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq-default spell-checking-enable-by-default nil)
  ;; (add-to-list 'custom-theme-load-path "~/.spacemacs.d/themes/")
)


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
)


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; set my custom Cobolt theme
  ;; somehow this doesn't work...
  ;;(setq-default dotspacemacs-themes '(space-cobolt))
  ;(setq clojure-enable-fancify-symbols t)
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook 'prettier-js-mode)
  ;; (setq prettier-js-command 'prettier)
  ;; (setq javascript-fmt-tool 'prettier)
  ;; (setq javascript-fmt-on-save t)
  (spacemacs/set-leader-keys "op" 'projectile-add-known-project)
  ;; tabs/indents
  (setq-default tab-width 2)
  (setq web-mode-code-indent-offset 1)
  ;; clojurescript
  (setq cider-check-cljs-repl-requirements nil)
  ;;(cider-library-present-p "cljs.core")
  ;; (setq cidekkshadow-default-options "app")
  (setq org-agenda-files '("~/notes"))

  ;; disable line highlighting while we make theme adjustments
  ;; (global-hl-line-mode -1)
  ;; '(custom-enabled-themes '(space-cobolt))

)

;; custom indents
;; found this config on github issue; it seems to work
;; https://github.com/syl20bnr/spacemacs/issues/10433#issuecomment-370263111
(defun my-setup-indent (n)
  (setq javascript-indent-level n)
  (setq js-indent-level n)
  (setq js2-basic-offset n)
  (setq web-mode-markup-indent-offset n)
  (setq web-mode-css-indent-offset n)
  (setq web-mode-code-indent-offset n)
  (setq css-indent-offest n))

(my-setup-indent 2)

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
 '(custom-enabled-themes '(space-cobolt))
 '(custom-safe-themes
   '("55e0ea3599d4d667337afd025834113c576b6e18c00eeaa8b754f8b8e17556fe" "fd0760d607aa45a047e5592719947894475d7ceb8f78503fa942138dfe9c12f8" "3475cd5a203c64eb07fd341b9fde96ad40017b9a2786a7956d3ae4a6dc7e6612" "33edaffe6456f511b6e0dd67e8f862bc3452ab037cff37c840e7cd4de6c30f3e" "a415d65e2a46a18641da4686ba56ff1280c4adc4ab22cad4908eab6769920d18" "3b586eecdec4b5b2ff54aa400ebff7b8c6e3345e314ecab81cecb58d4a7a01b7" "cd68a4b82c76ffa1dd24ccb6e42b9c8748a5fc89d56b3baf805271cef2ce1583" "c068ce3ebedafee29d84f362afacb0b82bd929ae49d39d6f824bc979fbc64694" "3d9c0cf19cfd991a4a463d2e428c317ed7a36b874276882a7d06088ad74f1923" "49019bd01f48efb94f5674cd4bc4c5a35429b688dbfd7b825e3b0b8b785304ef" "b1594bb119459891d717b80a6dcba39bb2822772a3f8d121f498361d90fe1631" "25c12ce6c386312c8be8b12a907e08335e1869506ef24d9cd4402e30156ebe3b" "7788342be9dc633db4f97a4406e90f74627471c453c768ef5cfbad694d9c1cbb" "085161aed224b4fb545d36abac27e27d33af393032626b8e1bd2b17a63080ddb" "e230adb62aa98c86509cd4a38b9f28bbc498939e1099a6cdaff058af9b6794da" "75e09a4636302cd51b99f167c8fcc78f76d8cdeffaeafde5f113bd2f8505ac45" "7cb684b78510cce8ef3cb44659e0b17ac983f31652b0e9095e45f9ac3a8e6c12" "17b4e47e87f16c80c20c5e6d8696c327d7491f11ce2370a69f6c3a809454a1cf" "03e613916101882ec47640ae150e856d2aba26de4c8fea9f88d8d03fa9f6f580" "f725bf157164e67acc2887848cbe05e2a516abf022b7c2d8f60a299edbaced55" "6a3859115f571299cde06cca6a5f32ea036c3b87a56f16fedf3e76a11e1b1e0f" "fce1deb104b6bdf6b7eccc938d5c01b01abb274ac5a80334caaa33e9774dfa75" "49f74b880c604655044e9c7c24072ecb77a48d53e6572134ba3e180ccd5139d7" "42ea9e6097764a8d8b3c2f67007fd27c08e016a641631bd54c6f8bcc32e6e6fa" "07b1dbbccf515b246eb961d82f4235c28aca2e64b61d35ac0550815d60e0fa9a" "0a9f0718190831703b40c8795c848a399a158615b59800c65fd844dc0be97f02" "7f8fb47b1292675ab9a48559e9c2322dc60fca9c032fe3bfd00cf54bb236df71" "6252af5fdc2446a489d69282fe77d9eeae2a7b4e60f76f5780eccdd08d9b1970" "77ecc8641229ae99db369d243e61a1f6a0193b782d2a03f80af5c0c4dfdf64b3" "090a329e53b2ddb34ae0ce7a151b103e5f13ff03368592493aed0c22c2b98d33" "90e483990e1d9b660e778adc85f8dc20a979b85de5b5665a0b18305cc285e32a" "5fe0b1b1d7f24522ca601a947c2b5bebdfb6a6160b64fe40b65fbb1fb46bc729" "ff700478a8fb9e7f7d678877b4b43a6d6c353200f4e5302378826cd60b66a328" "43e498162e9e4c05a4d0031c31d2994dba7e7c8c80e7d345d07574ede4c6f714" "9eeedefcb51eab95db6c5bc95ee4415fde0a7815bd2e5e62232a70987bddf6b4" "4ba5440d96d494d35e0a4643ebad079b656bc2bb7958b03e8b3aef19478d43f7" "df6aa53cbac8d4b88f4767d48f95adfb9acd1fc6ba99b6c0aa4ad9d38bad2116" "660df5ed90f0450b76153ff8bf468e24e4a297f00f6261859119770a2b732519" "6807b909a34e5ba0e1b7e94cc9a79a537c751908a96c44fa8e20e5adcdd408e0" "967a3bcee5405d1eb68a793ccd38ca1ac335d4fedad0fde30b6f614a4c9225af" "9214d8e9dc1334f022bdbdadb3326319657b0cd231b927716095c6e89d687947" "cdf41f34ed46647fc81a2de6f162d4c93ac9500d466c49c09d2fa91f80425cfa" "ebfbb471ca2a5aca820ad013054bef51c58c8b776c2239856dccf5270cee6f3f" "ee561b6741eddd7ad93ad1b9758ec294d6183b02bb369adcea5f6cac100e4b12" "b3667430cdea131adf461d09fe2ebd99f79d86322f6412e3e852be21342eddc8" "091c91916ce4efbfadfdfda638fe09c7bbdb742289a79bc38e92d57b7d38f5b1" "f3d8496da50a2a1ab69ca71d5f1957fa5968f335a7ca79fdb8eed1a9f14e622d" "e6c0612e21c46a013d07da71767429750062775a559d1426a381d1c582b923fe" "edef8d4dab91e7fd7de3ebb04cf5c8938be46a8969b76bac8c8a0e8e1016b789" "5164d7555f864c5f1d831d3ce28ebfaf2fadad8ee45fb103c453860bee919208" "86842912cc8cc23981234fd701975e1e012df9c731e7b33428ff55723bee38a8" "66dc1383af9d89242f465649fbf902de2a248f3a707870596dc03128e70728b1" "cdfee1b89b656dc0515b1f8addda1798d649a7baae7ecffe4e5ae2b8754069ba" "c6073c616c3257e44fefd353f7f8d3b23e5619f09ace505c2e96d9e7057f5950" "4956291a85d54e0ed605bbdaf60cbef44901256852f8d10410552b4d5d2385fd" "d69f27c9a22c362d19466bdbbfbfee8edfaf2c86de8c98f70d849b8cc18ff97f" "c7e3e56b96c43c7866068cd4f4458eac32161b5a8d0c766675ba030256d3a732" "35f71e8b9523cbe4350e28c833094e8db5a9ebbfb147f99fdd0db26e0fcddb4f" "6f008950078fed4190c03c7bceb85845032fc91c775db7d3bd91c67a09042b64" "76ffb9b3137f2a43af7761f471478680e9ec2342cda25412dd89ffba2f5fa5a9" "911d9219adb275bd40e9d77b5c1809158d1c14961d0db9a20508faa49a3073cb" "7667b43b93a47f47949fce443b6387b3d281ba7239eaa723cbb9d239c67c579a" "6362b4146876094985eb6f5b620698424944f60f8f6ef3e8a078a9227f1ba7d7" "e970247b7df4421816042f4635bfea1d5bc68e48da01bffe6a0e706e21c3b70b" "2471f6570b02f3b48d52a1f1b18e38d46e1f3b869ca5e93047d666ccefc44df6" "47e899ff5a151e38d1dfe04d9c8729bbad96e0e62ab3c294a4e9836b7f543696" "a4a0c901592e2335bda03e6473a324529aa960b45ea731ffe575e8ca4fff0c1e" "68f8328fb27ebaf6eb2de67759f14faa7c58613ed0707aa1de52912710e3e7aa" "b694335f0e4c81b4a874fae491ea0a4a3bcaf05f58f2a5678e7e851fa4b43165" "997855e6f993982c5b57ff52484b9649e96b1534bda0a21ac5a12fae8f2d05da" "cef2d2c5779bfb84b8ad825e44c77fd43f309e9174b2459a0927339294680385" "7889bae261f9bd86de3461191eeb6fb2b83c0cb67c112d74f6ab6202cca646d2" "fdf5f00dc8a8cbcda037b52124097af30265f22447dc9b95ea66c49c8125930f" "a776a24a7b551096129576639aeae11fa763de6da6fc15f3766ee11fede2789d" "1affbbfdae785b300a0a9763fdbc57e6446ccb4cc8ff93063f51761554171316" "785f1ac7f9d73597ccd3a6b85607f4e5c0500e2e3446c8462dbe9635e9db1b95" "fab6be10d3d131f12b2befe301e2892ec3fdf767889c5d245126ebfdab001f70" "7d6b9199d93495836ff249c3f7d7763bda5c3644724df770c5a8ca0d1bbf4cef" "136d5e9b5b3315929b9b5cc35bdf2876e99f63ae1dcb2a154349c1ccaf669511" "6d55cee67ae1ea0f184d0948df3f19a2276192d1260e1013e81e95487d09dc10" "eac687778e16801d11b078be483eace719d3480539c00f6e35412f9a298181f8" "4b5cad275c86f8f1728fcfc97db3193c11701bc327493e632449996753b02b92" "3e32ffbdf098cf1fa7e9f117150900db9b5e2a0d083c44b7bee02646a0dac1aa" "9a8e0ab88f8d40fc816540a9ac93889a8f757ede6e01a269ff3c9cb3527c939b" "ad35ad5e20a628a7c699cdd0ebe22340a5fe5f8ca272688bde945441aadefd5f" "68d54956593c945c3ebfa3f510430a30af54ca4b9c31d02e204898078beeecc8" "3807b618aa7932e4b3f34e53fbc43e1a7654ce8037102d3470a0794c411a6902" "f69fe07345f92c3723ea608650fad118c6db2a685170c5dc3a4c34d3ad95867a" "dbb5084b6c9aea6672c4f104991f97fdb4df03833e04cc22e5ddd0a6ab07eb21" "fc4d069ed7debf9bbb48c7b961b587be172dc77e3982629d93624c3b33d46160" "b6de13e065dfd1ef6272734fe7f02499cdd474f621b5ffd2b96f9bd44b06590b" "1f7b0acee86f93b90d63e840138f944986a43af6fc250f47ccbaa618289eb3f0" "3840e9eab988a70847a613cb19fc459980729f1644b02d241847d45a18cdd47b" "4da77eea6e8987a549aeee281ec88e351e5e8f8a1f471716cc1da4c54129e1fe" "c6248634f829f40913120d0196b2f6cb6b32716ba3ef14d90e8107f29d9cb86a" "b631756c98c0302579f422aa904e8b3d097866b3ee052a1c4a8c7aedaca9ed48" "c0077ef78ff8ad75a260100dfc9d00cf44d7dda882021bc4c8f644866cc39882" "19308bb36270ce557112bb2acef3bb42fee0d9407b07483cc57b3c8b03299ef3" "0d1107ba6ac6dca6b7d80f8f63bb38f13f579a934299d7ed2a2106f35787da4e" "ed3114ed8da8253879046ea77ac67075f59a63f6cfdb6f845921fc80f257db14" "ea447594cb6d5a00c927fab26aacb95a51576531b314005fb532e1be57023276" "31ab8e6ae4a4fa6cbf59c2a5296bfca8065653c545ccda94d7c98e5796d79a26" "02baaa5d16a63b591b2c73b2df7db94d7fe471342cb72a973438b90fa7c51bab" "e2b257e1ca8d092beb08c0b2504450eeab86f4972b829f5ca68a84ec8cf1999d" "6784a2e0478e292135634dc1ff5410bb922d0fb24bebf48ecba07bd17ec5d92f" "fed59d76b0df9007cc5927acd0917c20e5d8311cb7276312d8756b90f9dc6fc5" "b871070e62d41079bcceb63cde1d42027c852dcf28ffe093eacd78f6e8c7b8d1" "3220ac6c16bd4b0a0f6ec39b6b416bff7424e5113c6e34d385104e259b2e62b3" "f4078764100f0dfbc45f3e40ecf18d5be3b41aeb48e2c3128c976ceb251c0d27" "9f9329bb33819f9cb04fd9b81fd1c47ef340ec60763055e1d7c4488006a1cb40" "4df3c55225c0445db82fe4143eed256e8c83b6d36e44ebeff2a51d634c2cb330" "b117e2927c118ca8a3c7c731fbcf1406adda57c7b0768a7c4ec0eb5f7fb06929" "de856fe2580eae426373881320bde2023e61eb8b3060b8b0531bfe11fb366695" "4f6badef753da6cfe1a50fdfd7e10c9134eebca17f346625b6f0055eb9ee169f" "369a2692636082583502d03ae80a0f0432bea240f6ffdb6c60549a11a13a8f04" "e6f8abdea3a38305ff19b1583d154c65d91d2145a716b406403aae6db32bec62" "acf538a09167bd7b6aae7c0cc86b8e92b1fd301042799da8af92b4f7b583ba28" "4ef807a121eae5e5c47ce536c5fcd2226f4721d480dfcae756d27b478369eddf" "af96220f10b4628d1060086e1f16834fe83e07caadb68d041edbcaa8799e58f5" "df34fb6922183f3ff3df39dd3b6d361bfa9bea28365c993c1e757a243d923239" "d019fd7271bdf5cb818fb875183b956eaeb687a6686a40002d25846cd607ebd3" "7698b291da5c604ec634b1133d7121a995c6f5868757aae660e6ea100da32445" "cbc864c00a75707f78148c929755c74292c9643f280f2ea936bcb36f176aff91" "14e1bbc5302648b285ec801a562eb3557ef9358d5546b93abe874747b1dc1678" "d5ad1b9452958bd8effa951ba72af4f46820c229e474fcad3151adef3a420366" "b09703127ee075414ad39438578bf18765454dcb26807295e468ec366afd20cb" "ace07a03098d30cef6422d06a0c8f221144b7ff553a38bd01fd00b98c357a007" "572eda590f9631fad911f927a147d7270fa8a700c90a6bc455c1fb041ea6dccb" "5a77120b3b3eb9eed8f4760ece6fcc031b8f263cb36db5a2939f4917bbb7c287" "c1b5f8470fd90e3cb99564cf943297eda90e16efaee8f754876d20bc64c12320" "d885b671f05e80ac24b258ff3a2443920925dac4dd79a6a51fe332f48f5d5dee" "9b022e8fe1595627e4edd9f7e89611205250156ada3d99a55914e376c21c1c1a" "943a4958d4a9c56b842f6fdce81a329c5ca1433163abe8bba76e6be16b3db310" "d02dc0268fe069b2ec75bb8a93f3fee04833d49b33cd4ea6ef1eb544424691e5" "6c288aa2ccdc41bfc76b34567843c70219ba0a4d2890efa49ca739289ce25761" "4bca27d8c151f0529903f5a97c3ede16c39d1691a9a0835229bb509fca5c4cdd" "68dde197cac4dfea69be6c16163b410ebd45fc11af31a0254c77192a6b8898c7" "221f8c5aec0097da4a65a20a93c5387ff5e9e475c1715975c873c1fbaf4675ca" "c12a50b3d238038361ef9159ffe074f2ebd9bec72b9c86fcf0f646ee522b808d" "66be36320c6f6f87aeb04ae8a573930a8774143dcda6dc6067c255188117ec45" "e7c265b6bb9bdae7d21fa9c0ffea9e079f5e8051cdc6823aa994b406026d952e" "42bf80e4342f2772a13d0de1191519a9910262cfdd651d1d3ace05867c35a861" "961d8b778e47ab9b3724488b1e741f6baa9e64d69b013f396d0b3ea762b05f76" "23727a90f6a2a0fef3f588d71866a1fb3a479dffd318742c8061685e95344d4b" "0ecb2af7c42e47ac69d179963fb335b376b8fd0cd997569dbcaa369cc23b95d4" "9edf18bf33d7884222b268d3d3261143a0ac258b0e9efd6907ffa8dd160bf23e" "1a10896643cce14633f9e2b9f3727761cc528ee7bbbe7e8efeb442e067da1a96" "c453511537c5b58c16302068d6f05b419a6df2f98c0ddf29ff77cd33a2cf4add" "a2ec4be76897e6396c90f8109fb3c5239ee98e2a56a561006034bf94adc0fab2" "d8f96cbd85e63a35e57eaa484dad6f0553f5db179423d50de55e7f37b9ac1eda" "ea9ce17b3056afc7411aa173eced74e13392d0b3cb43d041371d1f857dc37b47" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(package-selected-packages
   '(fennel-mode company-lua counsel-gtags ggtags lua-mode sqlite3 wgrep smex lsp-ivy ivy-yasnippet ivy-xref ivy-purpose ivy-hydra ivy-avy flyspell-correct-ivy counsel-projectile ssass-mode eglot flymake-sass flycheck xah-fly-keys valign ox-epub dash treemacs cfrs pfuture posframe neotree company-quickhelp yaml-mode prettier tagedit slim-mode scss-mode sass-mode pug-mode impatient-mode helm-css-scss haml-mode counsel-css counsel swiper ivy company-web web-completion-data clj-refactor inflections lsp-ui lsp-treemacs lsp-origami origami helm-lsp lsp-mode sqlup-mode sql-indent csv-mode orgit-forge orgit compat org-rich-yank org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-contrib org-cliplink htmlize helm-org-rifle gnuplot evil-org zonokai-emacs zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme modus-themes minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme kaolin-themes jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme eziam-theme exotica-theme espresso-theme dracula-theme doom-themes django-theme darktooth-theme darkokai-theme darkmine-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme chocolate-theme autothemer cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme tern web-mode typescript-mode import-js grizzl emmet-mode add-node-modules-path flycheck-elm elm-test-runner elm-mode reformatter yasnippet-snippets treemacs-magit smeargle mmm-mode markdown-toc helm-ls-git helm-git-grep helm-company helm-c-yasnippet gitignore-templates git-timemachine git-modes git-messenger git-link gh-md fuzzy forge yaml markdown-mode magit ghub closql emacsql-sqlite emacsql treepy magit-section git-commit with-editor transient flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete ws-butler writeroom-mode winum which-key volatile-highlights vim-powerline vi-tilde-fringe uuidgen use-package undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil toc-org symon symbol-overlay string-inflection string-edit spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline-all-the-icons space-doc restart-emacs request rainbow-delimiters quickrun popwin pcre2el password-generator paradox overseer org-superstar open-junk-file nameless multi-line macrostep lorem-ipsum link-hint inspector info+ indent-guide hybrid-mode hungry-delete holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-org helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio font-lock+ flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-terminal-cursor-changer evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-ediff evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu emr elisp-slime-nav elisp-def editorconfig dumb-jump drag-stuff dotenv-mode dired-quick-sort diminish devdocs define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile aggressive-indent ace-link ace-jump-helm-line))
 '(safe-local-variable-values
   '((eval progn
           (make-variable-buffer-local 'cider-jack-in-nrepl-middlewares)
           (add-to-list 'cider-jack-in-nrepl-middlewares "shadow.cljs.devtools.server.nrepl/middleware"))
     (typescript-backend . tide)
     (typescript-backend . lsp)
     (javascript-backend . tide)
     (javascript-backend . tern)
     (javascript-backend . lsp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
)
