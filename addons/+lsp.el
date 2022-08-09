;;; +lsp.el -*- lexical-binding: t; -*-

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
