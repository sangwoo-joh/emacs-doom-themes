;;; doom-tomorrow-day-theme.el -- port of tomorrow theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;; Commentary:
;; This file is part of emacs-doom-themes, which provides license
;; information.
;;; Code:

(require 'doom-themes)

(defgroup doom-tomorrow-day-theme nil
  "Options for the `doom-tomorrow-day' theme."
  :group 'doom-themes)

(defcustom doom-tomorrow-day-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-tomorrow-day-theme
  :type '(choice integer boolean))

(def-doom-theme doom-tomorrow-day
  "A light theme based off of Chris Kempson's Tomorrow Dark."

  ;; name        gui       256       16
  ((bg         '("#ffffff" "white"   "white" ))
   (bg-alt     '("#f2f2f2" nil       nil     ))
   (base0      '("#f2f2f2" "white"   "white" ))
   (base1      '("#e4e4e4" "#e4e4e4"         ))
   (base2      '("#dedede" "#cccccc"         ))
   (base3      '("#d6d4d4" "#cccccc" "silver"))
   (base4      '("#C0bfbf" "#c0c0c0" "silver"))
   (base5      '("#a3a1a1" "#adadad" "silver"))
   (base6      '("#8a8787" "#949494" "silver"))
   (base7      '("#696769" "#6b6b6b" "silver"))
   (base8      '("#000000" "#000000" "black" ))
   (fg         '("#4d4d4c" "#3a3a3a" "black"))
   (fg-alt     (doom-darken fg 0.6))

   (grey       '("#8e908c" "#999999" "silver"))
   (red        '("#c82829" "#cc3333" "red"))
   (orange     '("#f5871f" "#ff9933" "brightred"))
   (yellow     '("#eab700" "#ffcc00" "yellow"))
   (green      '("#718c00" "#669900" "green"))
   (blue       '("#4271ae" "#339999" "brightblue"))
   (dark-blue  (doom-darken blue 0.25))
   (teal       '("#3e999f" "#339999" "brightblue"))
   (magenta    '("#c678dd" "#c9b4cf" "magenta"))
   (violet     '("#8959a8" "#996699" "brightmagenta"))
   (cyan       '("#8abeb7" "#8abeb7" "cyan"))
   (dark-cyan  (doom-lighten cyan 0.4))

   ;; face categories
   (highlight      blue)
   (vertical-bar   base3)
   (selection      base1)
   (builtin        blue)
   (comments       grey)
   (doc-comments   grey)
   (constants      orange)
   (functions      blue)
   (keywords       violet)
   (methods        blue)
   (operators      fg)
   (type           (doom-darken yellow 0.2))
   (strings        green)
   (variables      red)
   (numbers        orange)
   (region         selection)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    (doom-lighten yellow 0.4))
   (vc-added       (doom-lighten green 0.4))
   (vc-deleted     red)

   ;; custom categories
   (org-block-bg             (doom-lighten bg-alt 0.3))
   (modeline-bg              `(,(doom-lighten (car bg-alt) 0.4) ,@(cdr base3)))
   (modeline-bg-alt          bg)
   (modeline-bg-inactive     `(,(doom-darken (car bg) 0.04) ,@(cdr base1)))
   (modeline-bg-alt-inactive bg)
   (modeline-fg              fg)
   (modeline-fg-inactive     comments)
   (modeline-fg-alt-inactive comments)

   (-modeline-pad
    (when doom-tomorrow-day-padded-modeline
      (if (integerp doom-tomorrow-day-padded-modeline)
          doom-tomorrow-day-padded-modeline
        4))))

  ;;;; Base theme face overrides
  (((font-lock-doc-face &override) :slant 'italic)
   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground base8)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-inactive
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-highlight :inherit 'bold :background highlight :foreground base0)

   ;;;; syntax
   (font-lock-comment-face :foreground comments)
   (font-lock-builtin-face :foreground builtin)
   (font-lock-constant-face :foreground constants)
   (font-lock-doc-face :foreground doc-comments)
   (font-lock-function-name-face :foreground functions :bold t)
   (font-lock-keyword-face :foreground keywords :bold t)
   (font-lock-negation-char-face :foreground constants)
   (font-lock-reference-face :foreground constants)
   (font-lock-string-face :foreground strings)
   (font-lock-type-face :foreground type)
   (font-lock-variable-name-face :foreground variables)
   (font-lock-warning-face :foreground warning :background bg-alt)
   (font-lock-error-face :foreground strings :background red :bolt t)
   ;;;; doom-modeline
   (doom-modeline-bar :background highlight)
   (doom-modeline-buffer-path       :foreground violet :weight 'bold)
   (doom-modeline-buffer-major-mode :inherit 'doom-modeline-buffer-path)
   ;;;; ivy
   (ivy-current-match :background region :distant-foreground grey :weight 'ultra-bold)
   (ivy-minibuffer-match-face-1 :foreground base5 :weight 'light)
   (ivy-minibuffer-match-face-2 :inherit 'ivy-minibuffer-match-face-1 :foreground violet :weight 'ultra-bold)
   (ivy-minibuffer-match-face-3 :inherit 'ivy-minibuffer-match-face-2 :foreground blue)
   (ivy-minibuffer-match-face-4 :inherit 'ivy-minibuffer-match-face-2 :foreground red)
   ;;;; magit
   (magit-branch :foreground constants :bold t)
   (magit-diff-context-highlight :background base2)
   (magit-diff-file-header :foreground fg-alt :background base2)
   (magit-diffstat-added :foreground type)
   (magit-diffstat-removed :foreground variables)
   (magit-hash :foreground fg-alt)
   (magit-hunk-heading :background base2)
   (magit-hunk-heading-highlight :background base2)
   (magit-item-highlight :background base2)
   (magit-log-author :foreground fg-alt)
   (magit-process-ng :foreground warning :bold t)
   (magit-process-ok :foreground functions :bold t)
   (magit-section-heading :foreground keywords :bold t)
   (magit-section-highlight :background base2)
   ;;;; org <built-in>
   ((org-block &override)            :background org-block-bg)
   ((org-block-background &override) :background org-block-bg)
   ((org-block-begin-line &override) :background org-block-bg)
   ((org-quote &override)            :background org-block-bg)
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground teal)
   ((outline-2 &override) :foreground blue)
   ((outline-3 &override) :foreground violet)
   ((outline-4 &override) :foreground blue)
   ((outline-5 &override) :foreground violet)
   ((outline-6 &override) :foreground blue)
   ((outline-7 &override) :foreground violet)
   ((outline-8 &override) :foreground blue)
   ;;;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground violet)
   (rainbow-delimiters-depth-2-face :foreground blue)
   (rainbow-delimiters-depth-3-face :foreground green)
   (rainbow-delimiters-depth-4-face :foreground magenta)
   (rainbow-delimiters-depth-5-face :foreground orange)
   (rainbow-delimiters-depth-6-face :foreground yellow)
   (rainbow-delimiters-depth-7-face :foreground teal)
   ;;;; solaire-mode
   (solaire-mode-line-face :inherit 'mode-line :background modeline-bg-alt)
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-alt-inactive
    :foreground modeline-fg-alt-inactive)
   ;;;; treemacs
   (treemacs-git-untracked-face :foreground yellow)
   ;;;; tuareg-mode
   (tuareg-font-lock-governing-face :foreground strings :bold t)
   (tuareg-font-lock-multistage-face :foreground comments :background base3 :bold t)
   (tuareg-font-lock-line-number-face :foreground base3)
   (tuareg-font-lock-operator-face :foreground strings)
   (tuareg-font-lock-module-face :inherit font-lock-type-face :bold t)
   (tuareg-font-lock-constructor-face :foreground constants :bold t)
   (tuareg-font-lock-error-face :foreground strings :background red :bold t)
   (tuareg-font-lock-interactive-output-face :foreground base3)
   (tuareg-font-lock-interactive-error-face :inherit font-lock-warning-face)
   ;;;; web-mode
   (web-mode-builtin-face :inherit font-lock-builtin-face)
   (web-mode-comment-face :inherit font-lock-comment-face)
   (web-mode-constant-face :inherit font-lock-constant-face)
   (web-mode-doctype-face :inherit font-lock-comment-face)
   (web-mode-function-name-face :inherit font-lock-function-name-face)
   (web-mode-css-selector-face :foreground type)
   (web-mode-html-attr-name-face :foreground type)
   (web-mode-html-attr-value-face :foreground functions)
   (web-mode-html-tag-bracket-face :inherit 'default)
   (web-mode-html-tag-face :foreground keywords :weight 'bold)
   (web-mode-keyword-face :foreground keywords)
   (web-mode-preprocessor-face :foreground orange)
   (web-mode-string-face :foreground strings)
   (web-mode-type-face :inherit font-lock-type-face)
   (web-mode-warning-face :inherit font-lock-warning-face)

   ;;;; which-func
   (which-func :inherit font-lock-function-name-face)
   ;;;; whitespace <built-in>
   (whitespace-tab :background (doom-lighten base0 0.6)
                   :foreground comments))

  ;; --- variables --------------------------
  ;; ()
  )

;;; doom-tomorrow-day-theme.el ends here
