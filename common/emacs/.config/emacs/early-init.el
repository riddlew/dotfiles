;; -*- lexical-binding: t; -*-

;; Increase GC threshold during startup
(setq gc-cons-threshold most-positive-fixnum)

;; Restore to a sane default after startup (will work if config errors out)
(add-hook 'emacs-startup-hook
  	  (lambda ()
  	    (setq gc-cons-threshold 1600000)))

;;(setq package-native-compile nil)
;;(setq native-comp-deferred-compilation nil)
;;(setq native-comp-jit-compilation nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-screen t)

(setq default-frame-alist
      (append default-frame-alist
	      '((left . 0)
		(top . 0)
		(width . 180)
		(height . 50))))
