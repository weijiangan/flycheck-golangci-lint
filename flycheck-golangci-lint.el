;;; flycheck-golangci-lint.el --- Flycheck checker for golangci-lint  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Wei Jian Gan

;; Author: Wei Jian Gan <weijiangan@Weis-MacBook-Pro.local>
;; Keywords: convenience, tools, go
;; Version: 0.1.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Flycheck checker for golangci-lint
;;
;; Usage:
;;
;;     (eval-after-load 'flycheck
;;       '(add-hook 'flycheck-mode-hook #'flycheck-golangci-lint-setup))

;;; Code:

(require 'flycheck)

(flycheck-def-option-var flycheck-golangci-lint-config nil golangci-lint
  "Path to golangci-lint configuration file if you don't like using default config path .golangci.(yml|toml|json)"
  :safe #'stringp)

(flycheck-def-option-var flycheck-golangci-lint-deadline "1m" golangci-lint
  "Timeout for running golangci-lint, 1m by default."
  :safe #'string)

(flycheck-def-option-var flycheck-golangci-lint-tests nil golangci-lint
  "Analyze *_test.go files. It's false by default."
  :safe #'booleanp
  :type 'boolean)

(flycheck-def-option-var flycheck-golangci-lint-fast nil golangci-lint
  "Run only fast linters from the enabled set of linters. To find out which linters are fast run golangci-lint linters."
  :safe #'booleanp
  :type 'boolean)

(flycheck-define-checker golangci-lint
  "A Go syntax checker using golangci-lint that's 5x faster than gometalinter

See URL `https://github.com/golangci/golangci-lint'."
  :command ("golangci-lint" "run" "--print-issued-lines=false"
	    (option "--config" flycheck-golangci-lint-config concat)
	    (option "--deadline=" flycheck-golangci-lint-deadline concat)
	    (option "--tests" flycheck-golangci-lint-tests)
	    (option "--fast" flycheck-golangci-lint-fast))
  :error-patterns
  ((error line-start (file-name) ":" line ":" column ": " (message) line-end))
  :modes go-mode)

;;;###autoload
(defun flycheck-golangci-lint-setup ()
  "Setup Flycheck Irony.
Add `irony' to `flycheck-checkers'."
  (interactive)
  (add-to-list 'flycheck-checkers 'irony))

(provide 'flycheck-golangci-lint)
;;; flycheck-golangci-lint.el ends here
