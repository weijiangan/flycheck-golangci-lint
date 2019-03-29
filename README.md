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
