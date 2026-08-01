# flycheck-golangci-lint
Flycheck checker for golangci-lint

# Install
## MELPA
```
M-x package-install flycheck-golangci-lint
```

## Manual
```
M-x package-install-file
```

# Usage
Add the following lines to your config
```lisp
(eval-after-load 'flycheck                                       
  '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))
```

If you have `use-package` installed
```lisp
(use-package flycheck-golangci-lint
  :ensure t
  :hook (go-mode . flycheck-golangci-lint-setup))
```

# Available options
`flycheck-golangci-lint-executable` (default: `nil`, meaning `golangci-lint` found on `PATH`)

Path to the golangci-lint executable, if it's not on `PATH` or you want to use a specific binary. This is a flycheck option (not a CLI flag), and it is honored both when probing the version and when running the checker.

```lisp
(setq flycheck-golangci-lint-executable "/path/to/golangci-lint")
```

It can also be set buffer-locally for per-project overrides:

```lisp
;; e.g. in go-mode-hook or flycheck-mode-hook
(setq-local flycheck-golangci-lint-executable "~/bin/golangci-lint")
```

or per-directory via `.dir-locals.el`:

```elisp
((go-mode . ((flycheck-golangci-lint-executable . "/path/to/golangci-lint"))))
```

Note: the variable is marked `:risky`, so Emacs will ask for confirmation before applying file- or dir-local values.

`--config` (default: `nil`)
```lisp
(setq flycheck-golangci-lint-config "path/to/config")
```

`--deadline` (default: `1m`)
```lisp
(setq flycheck-golangci-lint-deadline "1m")
```

`--tests` (default: `nil`)
```lisp
(setq flycheck-golangci-lint-tests t)
```

`--fast` (default: `nil`)
```lisp
(setq flycheck-golangci-lint-fast t)
```

`--enable-all` (default: `nil`)
```lisp
(setq flycheck-golangci-lint-enable-all t)
```

`--disable-all` (default: `nil`)
```lisp
(setq flycheck-golangci-lint-disable-all t)
```

`--enable=` (default: `nil`)
```lisp
(setq flycheck-golangci-lint-enable-linters '("lll" "structcheck"))
```

`--disable=` (default: `nil`)
```lisp
(setq flycheck-golangci-lint-disable-linters '("unused" "staticcheck" "misspell"))
```

# GO Modules

Make sure you have set GO111MODULE, if it's not the default in your Go version.

```
(setenv "GO111MODULE" "on")
```

# Contribute
Pull requests are welcomed :)
