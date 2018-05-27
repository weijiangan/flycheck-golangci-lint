# flycheck-golangci-lint
Flycheck checker for golangci-lint

# Install
## MELPA (coming soon)
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
(setq flycheck-golangci-lint-config "path/to/config"
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

# Contribute
Pull requests are welcomed :)
