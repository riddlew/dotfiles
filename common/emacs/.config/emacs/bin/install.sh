#!/usr/bin/env bash

# This file is used to tangle the config.org file on a fresh install.
# This can be skipped entirely by going to the config.org and running
# org-babel-tangle. But this is also easier (if it works).

emacs --batch \
      -l org \
      --eval "(setq org-src-preserve-indentation t)" \
      "~/.config/emacs/config.org" \
      -f org-babel-tangle
