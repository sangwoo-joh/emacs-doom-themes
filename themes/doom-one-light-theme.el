;;; doom-one-light-theme.el --- inspired by Atom One Light -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Copyright (C) 2016-2021 Henrik Lissner
;;
;; Author: Henrik Lissner <https://github.com/hlissner>
;; Created: December 6, 2020
;; Version: 2.0.0
;; Keywords: custom themes, faces
;; Homepage: https://github.com/hlissner/emacs-doom-themes
;; Package-Requires: ((emacs "25.1") (cl-lib "0.5") (doom-themes "2.2.1"))
;;
;;; Commentary:
;;
;; Inspired by Atom's One Light color scheme.
;;
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-one-light-theme nil
  "Options for the `doom-one-light' theme."
  :group 'doom-themes)

(defcustom doom-one-light-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-one-light-theme
  :type 'boolean)

(defcustom doom-one-light-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-one-light-theme
  :type 'boolean)

(defcustom doom-one-light-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-one-light-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-one-light
  "A light theme inspired by Atom One Light."

  ;; name        default   256       16
  ((bg         '("#fafafa" "white"   "white"        ))
   (fg         '("#383a42" "#424242" "black"        ))

   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#f0f0f0" "white"   "white"        ))
   (fg-alt     '("#c6c7c7" "#c7c7c7" "brightblack"  ))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#f0f0f0" "#f0f0f0" "white"        ))
   (base1      '("#e7e7e7" "#e7e7e7" "brightblack"  ))
   (base2      '("#dfdfdf" "#dfdfdf" "brightblack"  ))
   (base3      '("#c6c7c7" "#c6c7c7" "brightblack"  ))
   (base4      '("#9ca0a4" "#9ca0a4" "brightblack"  ))
   (base5      '("#383a42" "#424242" "brightblack"  ))
   (base6      '("#202328" "#2e2e2e" "brightblack"  ))
   (base7      '("#1c1f24" "#1e1e1e" "brightblack"  ))
   (base8      '("#1b2229" "black"   "black"        ))

   (grey       base4)
   (red        '("#e45649" "#e45649" "red"          ))
   (orange     '("#da8548" "#dd8844" "brightred"    ))
   (green      '("#50a14f" "#50a14f" "green"        ))
   (teal       '("#4db5bd" "#44b9b1" "brightgreen"  ))
   (yellow     '("#986801" "#986801" "yellow"       ))
   (blue       '("#4078f2" "#4078f2" "brightblue"   ))
   (dark-blue  '("#a0bcf8" "#a0bcf8" "blue"         ))
   (magenta    '("#a626a4" "#a626a4" "magenta"      ))
   (violet     '("#b751b6" "#b751b6" "brightmagenta"))
   (cyan       '("#0184bc" "#0184bc" "brightcyan"   ))
   (dark-cyan  '("#005478" "#005478" "cyan"         ))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      blue)
   (vertical-bar   (doom-darken base2 0.1))
   (selection      dark-blue)
   (builtin        magenta)
   (comments       (if doom-one-light-brighter-comments cyan base4))
   (doc-comments   (doom-darken comments 0.15))
   (constants      violet)
   (functions      magenta)
   (keywords       red)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        green)
   (variables      (doom-darken magenta 0.36))
   (numbers        orange)
   (region         `(,(doom-darken (car bg-alt) 0.1) ,@(doom-darken (cdr base0) 0.3)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg              fg)
   (modeline-fg-alt          (doom-blend
                              violet base4
                              (if doom-one-light-brighter-modeline 0.5 0.2)))
   (modeline-bg              (if doom-one-light-brighter-modeline
                                 (doom-darken base2 0.05)
                               base1))
   (modeline-bg-alt          (if doom-one-light-brighter-modeline
                                 (doom-darken base2 0.1)
                               base2))
   (modeline-bg-inactive     (doom-darken bg 0.1))
   (modeline-bg-alt-inactive `(,(doom-darken (car bg-alt) 0.05) ,@(cdr base1)))

   (-modeline-pad
    (when doom-one-light-padded-modeline
      (if (integerp doom-one-light-padded-modeline) doom-one-light-padded-modeline 4))))

  ;;;; Base theme face overrides
  (((font-lock-comment-face &override)
    :background (if doom-one-light-brighter-comments base0)
    :foreground comments)
   ((font-lock-doc-face &override) :slant 'italic)
   ((line-number &override) :foreground (doom-lighten base4 0.15))
   ((line-number-current-line &override) :foreground base8)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if doom-one-light-brighter-modeline base8 highlight))
   (shadow :foreground base4)
   (tooltip :background base1 :foreground fg)

   ;;; syntax
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
   ;;;; centaur-tabs
   (centaur-tabs-unselected :background bg-alt :foreground base4)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if doom-one-light-brighter-modeline modeline-bg highlight))
   ;;;; ediff <built-in>
   (ediff-current-diff-A        :foreground red   :background (doom-lighten red 0.8))
   (ediff-current-diff-B        :foreground green :background (doom-lighten green 0.8))
   (ediff-current-diff-C        :foreground blue  :background (doom-lighten blue 0.8))
   (ediff-current-diff-Ancestor :foreground teal  :background (doom-lighten teal 0.8))
   ;;;; helm
   (helm-candidate-number :background blue :foreground bg)
   ;;;; lsp-mode
   (lsp-ui-doc-background      :background base0)
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
   ;;;; markdown-mode
   (markdown-markup-face     :foreground base5)
   (markdown-header-face     :inherit 'bold :foreground red)
   ((markdown-code-face &override)       :background base1)
   (mmm-default-submode-face :background base1)
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground red)
   ((outline-2 &override) :foreground orange)
   ;;;; org <built-in>
   ((org-block &override) :background base1)
   ((org-block-begin-line &override) :foreground fg :slant 'italic)
   (org-ellipsis :underline nil :background bg     :foreground red)
   ((org-quote &override) :background base1)
   ;;;; posframe
   (ivy-posframe               :background base0)
   ;;;; selectrum
   (selectrum-current-candidate :background base1)
   ;;;; vertico
   (vertico-current :background base1)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-alt-inactive
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt-inactive)))
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
   ;;;; wgrep <built-in>
   (wgrep-face :background base1)
   ;;;; whitespace
   ((whitespace-tab &override)         :background (unless (default-value 'indent-tabs-mode) base0))
   ((whitespace-indentation &override) :background (if (default-value 'indent-tabs-mode) base0)))

  ;;;; Base theme variable overrides-
  ()
  )

;;; doom-one-light-theme.el ends here
