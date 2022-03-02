;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ivan Chien"
      user-mail-address "qyc027@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Sarasa Term SC" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-material)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'visual)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; evil escape mapping
(setq-default evil-escape-key-sequence "kj")


;; default fullscreen
(add-to-list 'initial-frame-alist '(fullscreen . maximized))


;; key bindings
(map! :leader
      (:when (featurep! :ui tabs)
       (:prefix-map ("j" . "tabs")
        (:prefix ("g" : "... group")
         :desc "Switch groups"                "g"      #'centaur-tabs-switch-group
         :desc "Backward group"               "h"      #'centaur-tabs-backward-group
         :desc "Forward group"                "l"      #'centaur-tabs-forward-group)
        :desc "Backward tab"                  "h"      #'centaur-tabs-backward-tab
        :desc "Forward tab"                   "l"      #'centaur-tabs-forward-tab
        :desc "Select beginning tab"          "H"      #'centaur-tabs-select-beg-tab
        :desc "Select end tab"                "L"      #'centaur-tabs-select-end-tab
        :desc "Kill this tab"                 "x"      #'centaur-tabs--kill-this-buffer-dont-ask
        (:prefix ("X" . "Kill ...")
         :desc "Kill all tabs"                "x"      #'centaur-tabs-kill-all-buffers-in-current-group
         :desc "Kill all other tabs"          "o"      #'centaur-tabs-kill-other-buffers-in-current-group)
        (:prefix ("m" . "Move ...")
         :desc "Move this tab to left"        "h"      #'centaur-tabs-move-current-tab-to-left
         :desc "Move this tab to right"       "l"      #'centaur-tabs-move-current-tab-to-right))))

(map! :leader
      (:prefix-map ("?" . "docs")
       (:desc "Dash at point"                "d"       #'dash-at-point
        :desc "Dash at point with docset"    "D"       #'dash-at-point-with-docset)))

(map! :leader
      :desc "Disable highlight"              "0"       #'evil-ex-nohighlight)

(add-hook 'with-editor-mode-hook
          (lambda ()
            (map! :leader
                  (:prefix-map ("e" . "with-editor-mode")
                   (:desc "Finish"   "c" #'with-editor-finish
                    :desc "Cancel"   "k" #'with-editor-cancel)))))


;; haskell-lsp
(setq lsp-haskell-server-path "/Users/ivan/.local/bin/haskell-language-server-macOS-8.10.7")


;; cc-lsp + eglot
(setq-default lsp-clangd-binary-path "/etc/local/opt/llvm/bin/clangd")
(setq-default lsp-clangd-version "13.0.1")

(setq lsp-clients-clangd-args '("-j=3"
				"--background-index"
				"--clang-tidy"
				"--completion-style=detailed"
				"--header-insertion=never"
				"--header-insertion-decorators=0"))

(after! lsp-clangd (set-lsp-priority! 'clangd 2))

(set-eglot-client! 'cc-mode '("clangd" "-j=3" "--clang-tidy"))


;; wakatime mode
(global-wakatime-mode)
