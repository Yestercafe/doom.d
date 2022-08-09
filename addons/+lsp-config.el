;;; +lsp.el -*- lexical-binding: t; -*-

;; cc-lsp + eglot
(setq-default lsp-clangd-binary-path "/usr/local/opt/llvm/bin/clangd")
(setq-default lsp-clangd-version "14.0.6")

(setq lsp-clients-clangd-args '("-j=3"
				"--background-index"
				"--clang-tidy"
				"--completion-style=detailed"
				"--header-insertion=never"
				"--header-insertion-decorators=0"))

(after! lsp-clangd (set-lsp-priority! 'clangd 2))

(set-eglot-client! 'cc-mode '("clangd" "-j=3" "--clang-tidy"))
