;;; skinny-samurai-theme.el --- A port of Chuby Ninja Sublime Text 2 theme to Emacs
;; Author: deftpunk
;; URL: https://github.com/deftpunk/skinnySamurai
;; Version: 0.2
;; Package-Requires: ((emacs "24"))
;; Keywords: color theme

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:

;; This started out as a port of the Chuby Ninja ST2 theme for Emacs 24 but has
;; moved on a little bit from that.

;;; Credits:

;; Chuby Ninja ST2 theme as a starting point
;; bbatsov: framework for setting up a deftheme

;;; Code:

(deftheme skinny-samurai "The skinnySamurai color theme")

;; A crude face for numbers
(defface skinny-samurai-numbers-face
  '((((class color) (background dark))
     (:bold t :foreground "#ff0087"))
    (((class color) (background light))
     (:bold t :foreground "#ff0087")))
  "Face used to color numbers."
  :group 'my-faces)

;; TODO: For some reason my numbers face is NOT working!?!
;; Neither the mapcar construct or the bare font-lock-add-keywords is working.
(mapcar
    (lambda (mode)
      (font-lock-add-keywords mode '(("\\_<[0-9]+\\_>" . 'skinny-samurai-numbers-face))))
  '(python-mode emacs-lisp-mode lisp-mode perl-mode shell-mode))
;; (font-lock-add-keywords nil '(("\\_<[0-9]+\\_>" . 'skinny-samurai-numbers-face)))

;;; Color Palette
(defvar skinny-samurai-colors-alist
  '(("skinny-fg"      . "#eeeeee")
    ("skinny-bg+2"    . "#303030")
    ("skinny-bg+1"    . "#262626")
    ("skinny-bg"      . "#121212")
    ("skinny-bg-1"    . "#080808")
    ("skinny-bg-2"    . "#000000")

    ("skinny-cyan"    . "#afffff")
    ("skinny-cyan-2"  . "#00dfff")

    ("skinny-blue"    . "#00afff")
    ("skinny-blue-1"  . "#0087ff")
    ("skinny-blue")

    ("skinny-green+6" . "#00af00")
    ("skinny-green+5" . "#00ff5f")
    ("skinny-green+4" . "#00df5f")
    ("skinny-green+3" . "#87df87")
    ("skinny-green"   . "#00af00")
    ("skinny-green-5" . "#005f00")

    ("skinny-grey"    . "#585858")
    ("skinny-grey+2"  . "#9e9e9e")

    ("skinny-magenta" . "#af005f")

    ("skinny-orange+3". "#ffaf87")
    ("skinny-orange"  . "#ff8700")
    ("skinny-orange+2". "#ff5f00")

    ("skinny-purple"  . "#af87af")
    ("skinny-purple-2". "#5f0087")

    ("skinny-red"     . "#800000")
    ("skinny-red+1"   . "#ff0000")

    ("skinny-yellow-1". "#ffdf00")
    ("skinny-yellow"  . "#ffff5f")
    ("skinny-yellow+2". "#ffffaf")

    )
  "List of skinny-samurai colors.

  `+N' suffixes indicate a color is lighter.
  `-N' suffixes indicate a color is darker.")

(defmacro skinny-samurai-with-color-variables (&rest body)
  "`let' bind all colors defined in `skinny-samurai-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   skinny-samurai-colors-alist))
     ,@body))

(skinny-samurai-with-color-variables
 (custom-theme-set-faces
  'skinny-samurai

;;;; Basic coloring
  '(button ((t (:underline t))))
  `(default ((t (:foreground ,skinny-fg :background ,skinny-bg-1))))
  `(link ((t (:foreground ,skinny-yellow :underline t :weight bold))))
  `(link-visited ((t (:foreground ,skinny-yellow :underline t :weight normal))))
  `(cursor ((t (:foreground ,skinny-fg :background ,skinny-magenta))))
  `(escape-glyph ((t (:foreground ,skinny-yellow :bold t))))
  `(fringe ((t (:foreground ,skinny-fg :background ,skinny-bg-1))))
  `(header-line ((t (:foreground ,skinny-yellow
				 :background ,skinny-bg-1
				 :box (:line-width -1 :style released-button)))))
  `(highlight ((t (:background ,skinny-bg+2))))
  `(region ((t (:foreground ,skinny-green+5 :background ,skinny-green+3))))
  `(success ((t (:foreground ,skinny-green :weight bold))))
  `(warning ((t (:foreground ,skinny-red+1 :weight bold))))

;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,skinny-green+3 :weight bold))))
   `(font-lock-comment-face ((t (:foreground ,skinny-grey :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,skinny-grey :slant italic))))
   `(font-lock-constant-face ((t (:foreground ,skinny-green+4))))
   `(font-lock-doc-face ((t (:foreground ,skinny-grey+2))))
   `(font-lock-doc-string-face ((t (:foreground ,skinny-grey+2))))
   `(font-lock-function-name-face ((t (:foreground ,skinny-cyan-2))))
   `(font-lock-keyword-face ((t (:foreground ,skinny-blue-1 :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,skinny-yellow :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,skinny-blue))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,skinny-yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,skinny-green :weight bold))))
   `(font-lock-string-face ((t (:foreground ,skinny-yellow+2 :slant italic))))
   `(font-lock-type-face ((t (:foreground ,skinny-blue-1))))
   `(font-lock-variable-name-face ((t (:foreground ,skinny-orange))))
   `(font-lock-warning-face ((t (:foreground ,skinny-yellow :weight bold))))

   ;; Rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:bold t :foreground ,skinny-green+5))))
   `(rainbow-delimiters-depth-2-face ((t (:bold t :foreground ,skinny-blue-1))))
   `(rainbow-delimiters-depth-3-face ((t (:bold t :foreground ,skinny-red+1))))
   `(rainbow-delimiters-depth-4-face ((t (:bold t :foreground ,skinny-magenta))))
   `(rainbow-delimiters-depth-5-face ((t (:bold t :foreground ,skinny-cyan-2))))
   `(rainbow-delimiters-depth-6-face ((t (:bold t :foreground ,skinny-orange))))
   `(rainbow-delimiters-depth-7-face ((t (:bold t :foreground ,skinny-purple-2))))
   `(rainbow-delimiters-depth-8-face ((t (:bold t :foreground ,skinny-fg))))
   `(rainbow-delimiters-depth-9-face ((t (:bold t :foreground ,skinny-yellow+2))))
   `(rainbow-delimiters-unmatched-face ((t (:foreground ,skinny-fg :background ,skinny-red+1 :weight bold))))

))


;; (let ((class '((class color) (min-colors 89)))
;;       ;; Palette colors.
;;       (yellow-1 "#fce94f") (yellow-2 "#ffd700") (yellow-3 "#c4a000") (yellow-4 "#875f00")
;;       (orange-1 "#ffaf5f") (orange-2 "#ff8700") (orange-3 "#ff5d17") (orange-4 "#d75f00")
;;       (string-orange-1 "#ff9580") (orange-01 "#ffad59")
;;       (magenta-01 "#ffc0c0")
;;       (magenta-1 "#ff7bbb") (magenta-2 "#ff4ea3") (magenta-3 "#ff1f8b") (magenta-4 "#5f005f")
;;       (green-1 "#afff00") (green-2 "#a1db00") (green-3 "#00af00") (green-4 "#008700") (green-5 "#005f00")
;;       (blue-1 "#729fcf") (blue-2 "#1f5bff") (blue-3 "#005f87") (blue-4 "#005faf") (blue-5 "#0000af")
;;       (blue-01 "#99feff")
;;       (cyan-1 "#87ffff") (cyan-2 "#00ffff") (cyan-3 "#00d7af") (cyan-4 "#5f87af")
;;       (purple-1 "#d18aff") (purple-2 "#9a08ff") (purple-3 "#6c0099")
;;       (red-1 "#ef2929")  (red-2 "#cc0000")  (red-3 "#a40000")
;;       (white-1 "#ffffff") (white-2 "#eeeeee") (white-3 "#c6c6c6") (white-4 "#b2b2b2") (LIGHT_BG "#ffffd7")
;;       (black-1 "#000000") (black-2 "#080808") (black-3 "#1c1c1c") (DARK_BG "#121212")
;;       ;; (grey-1 "#585858")
;;       (grey-1 "#585858") (grey-2 "#808080") (grey-3 "#999999")

;;       (green-01 "#d7ff00") (green-02 "#2e4d0f") (green-02 "#7acc7c")
;;       (green-0 "#d7ff5f") (blue-0 "#afd7ff") (purple-0 "#e6a8df") (yellow-0 "#ffff87") (white-0 "#ffffff") (white-01 "#cbcbcb")
;;       (red-0 "#ff4b4b")  (black-4 "#626262") (black-5 "#5f5f5f") (black-6 "#3a3a3a") (orange-0 "#ffaf87") (magenta-0 "#ffafd7")
;;       (green-00 "#d7ff87") (yellow-00 "#ffffaf") (blue-00 "#d7d7ff"))

;;   (custom-theme-set-faces
;;    'skinny-samurai
;;    ;; Ensure sufficient contrast on low-color terminals.
;;    `(default ((((class color) (min-colors 4096))
;; 	       (:foreground ,white-2 :background ,DARK_BG))
;; 	      (((class color) (min-colors 256))
;; 	       (:foreground ,white-2 :background ,DARK_BG))
;; 	      (,class
;; 	       (:foreground ,white-2 :background ,DARK_BG))))
;;    `(cursor ((,class (:background ,black-5))))

;;    ;; TODO: For some reason my numbers face is NOT working!?!
;;    `(skinny-samurai-numbers-face ((,class (:foreground ,magenta-1 :weight bold))))

;;    ;; hilight current line number - hlinum.el
;;    `(linum-highlight-face ((,class (:foreground ,yellow-1 :background "#151515"))))


;;    ;; Highlighting faces
;;    `(fringe ((,class (:foreground ,black-1 :background "#151515"))))
;;    `(linum ((,class (:foreground "#a8a8a8" :background "#151515"))))
;;    `(highlight ((,class (:background ,green-0))))
;;    `(hl-line ((,class (:background ,magenta-4 :weight bold)))) ; Embedded strings of IM (e.g. fcitx) would be very unreadable... orz
;;    `(region ((,class (:background ,green-02))))
;;    `(secondary-selection ((,class (:background ,blue-3 :foreground ,white-0))))
;;    `(isearch ((,class (:foreground ,white-0 :background ,orange-3))))
;;    `(lazy-highlight ((,class (:background ,magenta-3 :foreground ,white-0))))
;;    `(trailing-whitespace ((,class (:background ,red-3))))
;;    `(show-paren-match ((,class (:background ,blue-00))))
;;    ;; Mode line & frames' faces
;;     `(mode-line ((,class
;; 		  (:box (:line-width -1 :style nil)
;; 		   :background ,grey-1 :foreground ,white-0))))
;;     `(mode-line-inactive ((,class
;; 			   (:box (:line-width -1 :style nil)
;; 			    :background ,white-2 :foreground ,black-1))))
;;    `(mode-line-buffer-id ((,class (:foreground ,white-0 :background ,grey-1 :bold t))))
;;    `(vertical-border ((,class (:foreground "#d7d7af" :background "#d7d7af"))))

;;    ;; Escape and prompt faces
;;    `(minibuffer-prompt ((,class (:foreground ,black-6 :background ,green-2))))
;;    `(escape-glyph ((,class (:foreground ,yellow-3))))
;;    `(error ((,class (:foreground ,red-0))))
;;    `(warning ((,class (:foreground ,orange-1))))
;;    `(success ((,class (:foreground ,green-2))))

;;    ;; Font lock faces
;;    `(font-lock-builtin-face ((,class (:foreground ,magenta-01))))
;;    `(font-lock-comment-delimiter-face ((,class (:foreground ,grey-1 :slant italic)))) ;done
;;    `(font-lock-comment-face ((,class (:foreground ,grey-1 :slant italic :slant italic)))) ;done
;;    `(font-lock-constant-face ((,class (:foreground ,blue-2))))
;;    `(font-lock-doc-face ((,class (:foreground ,grey-3))))
;;    `(font-lock-doc-string-face ((,class (:foreground ,grey-3))))
;;    `(font-lock-function-name-face ((,class (:foreground ,blue-01))))
;;    `(font-lock-keyword-face ((,class (:foreground ,green-02))))
;;    `(font-lock-negation-char-face ((,class (:foreground ,green-3))))
;;    `(font-lock-preprocessor-face ((,class (:foreground ,purple-2))))
;;    `(font-lock-regexp-grouping-backslash ((,class (:foreground ,orange-2))))
;;    `(font-lock-regexp-grouping-construct ((,class (:foreground ,purple-2))))
;;    `(font-lock-string-face ((,class (:foreground ,string-orange-1)))) ;done
;;    `(font-lock-type-face ((,class (:foreground ,blue-2))))
;;    `(font-lock-variable-name-face ((,class (:foreground ,orange-2))))
;;    `(font-lock-warning-face ((,class (:weight bold :foreground ,red-2))))

;;    ;; org-mode
;;    `(org-document-title ((,class (:foreground ,blue-1 :background ,LIGHT_BG :weight bold :height 1.5))))
;;    `(org-document-info ((,class (:foreground ,blue-3 :background ,LIGHT_BG :weight bold))))
;;    `(org-document-info-keyword ((,class (:foreground ,black-5 :background ,LIGHT_BG))))
;;    `(org-agenda-date-today
;;      ((,class (:foreground ,orange-2 :slant italic :weight bold))) t)
;;    `(org-agenda-structure
;;      ((,class (:inherit font-lock-comment-face))))
;;    `(org-archived ((,class (:slant italic))))
;;    `(org-checkbox ((,class (:background ,white-2 :foreground ,black-3
;;                                    :box (:line-width 1 :style released-button)))))
;;    `(org-date ((,class (:foreground ,blue-2 :underline t))))
;;    `(org-done ((,class (:bold t :weight bold :foreground ,green-4 :background ,green-1
;;                               :box (:line-width 1 :style none)))))
;;    `(org-todo ((,class (:bold t :weight bold :foreground ,red-3 :background ,orange-0
;;                               :box (:line-width 1 :style none)))))
;;    `(org-level-1 ((,class (:bold t :foreground ,blue-1 :height 1.3))))
;;    `(org-level-2 ((,class (:bold t :foreground ,green-2 :height 1.2))))
;;    `(org-level-3 ((,class (:bold t :foreground ,orange-2 :height 1.1))))
;;    `(org-level-4 ((,class (:bold t :foreground ,cyan-3))))
;;    `(org-level-5 ((,class (:bold t :foreground ,red-2))))
;;    `(org-level-6 ((,class (:bold t :foreground ,magenta-2))))
;;    `(org-level-7 ((,class (:bold t :foreground ,purple-2))))
;;    `(org-level-8 ((,class (:bold t :foreground ,yellow-2))))
;;    `(org-tag ((,class (:background ,black-1 :foreground ,white-0 :bold t :weight bold))))
;;    `(org-column ((,class (:background ,white-4 :foreground ,black-5))))
;;    `(org-column-title ((,class (:background ,green-2 :foreground ,black-5 :underline t :weight bold))))
;;    `(org-deadline-announce ((,class (:foreground ,red-3))))
;;    `(org-scheduled ((,class (:foreground ,green-3))))
;;    `(org-scheduled-previously ((,class (:foreground ,red-1))))
;;    `(org-scheduled-today ((,class (:foreground ,blue-2))))
;;    `(org-special-keyword ((,class (:background ,yellow-2 :foreground ,yellow-4))))
;;    `(org-table ((,class (:background ,yellow-0 :foreground ,black-3))))
;;    `(org-time-grid ((,class (:foreground ,orange-2))))
;;    `(org-upcoming-deadline ((,class (:inherit font-lock-keyword-face))))
;;    `(org-warning ((,class (:bold t :foreground ,red-3 :weight bold))))
;;    `(org-formula ((,class (:foreground ,purple-2))))
;;    `(org-headline-done ((,class (:foreground ,green-2))))
;;    `(org-hide ((,class (:foreground ,black-2))))
;;    `(org-code ((,class (:foreground ,blue-2))))
;;    `(org-link ((,class (:foreground ,blue-2 :underline ,blue-2))))
;;    `(org-footnote ((,class (:foreground ,magenta-3))))
;;    `(org-ellipsis ((,class (:foreground ,red-2))))
;;    `(org-agenda-clocking ((,class (:foreground ,blue-3 :background ,blue-0 :bold t))))
;;    `(org-agenda-date ((,class (:foreground ,blue-2 :underline nil))))
;;    `(org-agenda-todo ((,class (:foreground ,white-0 :background ,red-2))))
;;    `(org-agenda-done ((,class (:foreground ,black-3 :background ,green-2))))
;;    `(org-agenda-dimmed-todo-face ((,class (:foreground ,white-0 :background ,red-2))))
;;    `(org-block ((,class (:foreground ,orange-1))))
;;    `(org-quote ((,class (:foreground ,orange-1))))
;;    `(org-block-begin-line ((,class (:foreground ,orange-2))))
;;    `(org-block-end-line ((,class (:foreground ,orange-2))))
;;    `(org-mode-line-clock ((,class (:foreground ,blue-3 :background ,blue-0 :bold t))))
;;    `(org-mode-line-clock-overrun ((,class (:foreground ,white-0 :background ,red-1 :bold t))))


;;    ;; undo-tree
;;    `(undo-tree-visualizer-default-face ((,class (:foreground ,black-5))))
;;    `(undo-tree-visualizer-current-face ((,class (:foreground ,green-2 :weight bold))))
;;    `(undo-tree-visualizer-active-branch-face ((,class (:foreground ,red-2))))
;;    `(undo-tree-visualizer-register-face ((,class (:foreground ,yellow-2))))

;;    ;; Markdown-mode
;;    `(markdown-blockquote-face ((,class (:foreground ,green-3 :background ,green-00 :italic t))))
;;    `(markdown-bold-face ((,class (:foreground ,black-5 :bold t))))
;;    `(markdown-comment-face ((,class (:foreground ,white-4 :italic t))))
;;    `(markdown-header-delimiter-face ((,class (:foreground ,orange-3 :bold t))))
;;    `(markdown-header-face ((,class (:foreground ,orange-2 :bold t))))
;;    `(markdown-header-rule-face ((,class (:foreground ,orange-2 :bold t))))
;;    `(markdown-header-face-1 ((,class (:foreground ,orange-2 :bold t :height 2.0))))
;;    `(markdown-header-face-2 ((,class (:foreground ,orange-2 :bold t :height 1.5))))
;;    `(markdown-header-face-3 ((,class (:foreground ,orange-2 :bold t :height 1.2))))
;;    `(markdown-header-face-4 ((,class (:foreground ,orange-2 :bold t))))
;;    `(markdown-header-face-5 ((,class (:foreground ,orange-2 :bold t))))
;;    `(markdown-header-face-6 ((,class (:foreground ,orange-2 :bold t))))
;;    `(markdown-link-face ((,class (:foreground ,magenta-1 :bold t :underline ,magenta-1))))
;;    `(markdown-inline-code-face ((,class (:foreground ,blue-3 :background ,blue-00))))
;;    `(markdown-italic-face ((,class (:foreground ,black-5 :italic t :underline ,black-5))))
;;    `(markdown-list-face ((,class (:foreground ,orange-2 :background ,LIGHT_BG :bold t))))
;;    `(markdown-math-face ((,class (:foreground ,purple-2))))
;;    `(markdown-missing-link-face ((,class (:foreground ,red-1 :bold t))))
;;    `(markdown-pre-face ((,class (:foreground ,blue-2))))
;;    `(markdown-reference-face ((,class (:foreground ,orange-2 :italic t))))
;;    `(markdown-url-face ((,class (:foreground ,magenta-3 :underline ,magenta-3))))

;;    ;; Twittering-mode
;;    `(twittering-username-face ((,class (:foreground ,blue-3 :background ,blue-00))))
;;    `(twittering-uri-face ((,class (:foreground ,blue-2 :underline ,blue-2))))
;;    `(twittering-timeline-footer-face ((,class (:foreground ,black-1 :bold t))))
;;    `(twittering-timeline-header-face ((,class (:foreground ,black-1 :bold t))))

;;    ;; popup
;;    `(popup-face ((,class (:background ,blue-00 :foreground ,blue-3))))
;;    `(popup-isearch-match ((,class (:background ,cyan-1 :foreground ,black-3))))
;;    `(popup-menu-face ((,class (:background ,blue-00 :foreground ,blue-3))))
;;    `(popup-menu-selection-face ((,class (:background ,blue-1 :foreground ,white-0))))
;;    `(popup-menu-summary-face ((,class (:background ,blue-00 :foreground ,blue-3))))
;;    `(popup-scroll-bar-background-face ((,class (:background ,blue-0 :foreground ,blue-0))))
;;    `(popup-scroll-bar-foreground-face ((,class (:background ,blue-3 :foreground ,blue-3))))
;;    `(popup-summary-face ((,class (:background ,blue-00 :foreground ,blue-3))))
;;    `(popup-tip-face ((,class (:background ,yellow-00 :foreground ,black-3))))

;;    ;; Button and link faces
;;    `(link ((,class (:underline t :foreground ,blue-1))))
;;    `(link-visited ((,class (:underline t :foreground ,blue-2))))

;;    ;; Gnus faces
;;    `(gnus-group-news-1 ((,class (:foreground ,purple-2))))
;;    `(gnus-group-news-1-low ((,class (:foreground ,purple-1))))
;;    `(gnus-group-news-2 ((,class (:foreground ,blue-2))))
;;    `(gnus-group-news-2-low ((,class (:foreground ,blue-1))))
;;    `(gnus-group-news-3 ((,class (:foreground ,green-3))))
;;    `(gnus-group-news-3-low ((,class (:foreground ,green-2))))
;;    `(gnus-group-news-4 ((,class (:foreground ,magenta-3))))
;;    `(gnus-group-news-4-low ((,class (:foreground ,magenta-2))))
;;    `(gnus-group-news-5 ((,class (:foreground ,orange-3))))
;;    `(gnus-group-news-5-low ((,class (:foreground ,orange-2))))
;;    `(gnus-group-news-low ((,class (:foreground ,yellow-3))))
;;    `(gnus-group-mail-1 ((,class (:foreground ,purple-2))))
;;    `(gnus-group-mail-1-low ((,class (:foreground ,purple-1))))
;;    `(gnus-group-mail-2 ((,class (:foreground ,blue-2))))
;;    `(gnus-group-mail-2-low ((,class (:foreground ,blue-1))))
;;    `(gnus-group-mail-3 ((,class (:foreground ,green-3))))
;;    `(gnus-group-mail-3-low ((,class (:foreground ,green-2))))
;;    `(gnus-group-mail-low ((,class (:foreground ,yellow-3))))
;;    `(gnus-header-content ((,class (:weight normal :foreground ,yellow-3))))
;;    `(gnus-header-from ((,class (:foreground ,yellow-2))))
;;    `(gnus-header-subject ((,class (:foreground ,green-2))))
;;    `(gnus-header-name ((,class (:foreground ,blue-1))))
;;    `(gnus-header-newsgroups ((,class (:foreground ,magenta-2))))
;;    `(gnus-signature ((,class (:italic t :foreground ,black-1))))
;;    `(gnus-summary-cancelled ((,class (:foreground ,black-3)))) ;
;;    `(gnus-summary-high-ancient ((,class (:bold t :foreground ,yellow-3))))
;;    `(gnus-summary-high-read ((,class (:bold t :foreground ,green-3))))
;;    `(gnus-summary-high-ticked ((,class (:bold t :foreground ,red-2))))
;;    `(gnus-summary-high-unread ((,class (:bold t :foreground ,black-5))))
;;    `(gnus-summary-normal-ancient ((,class (:foreground ,yellow-3))))
;;    `(gnus-summary-normal-read ((,class (:foreground ,green-2))))
;;    `(gnus-summary-normal-ticked ((,class (:foreground ,red-2))))
;;    `(gnus-summary-normal-unread ((,class (:foreground ,white-0))))
;;    `(gnus-summary-low-ancient ((,class (:italic t :foreground ,green-3))))
;;    `(gnus-summary-low-read ((,class (:italic t :foreground ,yellow-3))))
;;    `(gnus-summary-low-ticked ((,class (:italic t :foreground ,red-3))))
;;    `(gnus-summary-low-unread ((,class (:italic t :foreground ,black-1))))
;;    `(gnus-summary-selected  ((,class (:background ,magenta-3 :foreground ,white-0))))

;;    ;; Helm
;;    `(helm-selection ((,class (:foreground ,black-3 :background ,green-01))))
;;    `(helm-bookmark-directory ((,class (:foreground ,blue-1 :background ,black-5 :bold t))))
;;    `(helm-bookmark-file ((,class (:foreground ,yellow-4 :background ,yellow-0))))
;;    `(helm-bookmark-info ((,class (:foreground ,green-4 :background ,green-0))))
;;    `(helm-ff-directory ((,class (:foreground ,blue-1 :background ,LIGHT_BG :bold t))))
;;    `(helm-ff-file ((,class (:foreground ,black-5 :background ,LIGHT_BG))))
;;    `(helm-ff-excutable ((,class (:foreground ,green-2 :background ,LIGHT_BG :bold t))))
;;    `(helm-source-header ((,class (:foreground ,black-4 :background ,blue-1 :bold t))))
;;    `(helm-header ((,class (:foreground ,blue-3 :background ,white-0))))
;;    `(helm-candidate-number ((,class (:foreground ,blue-3 :background ,white-0))))
;;    `(helm-match ((,class (:foreground ,green-2 :background ,LIGHT_BG :bold t))))
;;    `(helm-buffer-saved-out ((,class (:foreground ,red-2 :background ,LIGHT_BG))))
;;    `(helm-ff-invalid-symlink ((,class (:foreground ,white-0 :background ,red-2))))
;;    `(helm-ff-prefix ((,class (:foreground ,white-0 :background ,orange-2))))
;;    `(helm-buffer-size ((,class (:foreground ,orange-2))))

;;    ;; Dired+
;;    `(dired-directory ((,class (:foreground ,blue-1 :bold t))))
;;    `(dired-flagged ((,class (:foreground ,red-1))))
;;    `(dired-header ((,class (:foreground ,blue-1))))
;;    `(dired-ignored ((,class (:foreground ,white-4))))
;;    `(dired-mark ((,class (:foreground ,green-1))))
;;    `(dired-marked ((,class (:foreground ,green-2))))
;;    `(dired-perm-write ((,class (:foreground ,red-2))))
;;    `(dired-symlink ((,class (:foreground ,magenta-2))))
;;    `(dired-warning ((,class (:foreground ,white-0 :background ,red-1 :bold t))))
;;    `(diredp-compressed-file-suffix ((,class (:foreground ,purple-2))))
;;    `(diredp-date-time ((,class (:foreground ,blue-3 :background ,blue-00))))
;;    `(diredp-deletion ((,class (:foreground ,white-0, :background ,red-3))))
;;    `(diredp-deletion-file-name ((,class (:foreground ,red-2))))
;;    `(diredp-dir-heading ((,class (:foreground ,black-5 :background ,green-01 :bold t))))
;;    `(diredp-dir-priv ((,class (:foreground ,blue-1 :background ,LIGHT_BG :bold t))))
;;    `(diredp-display-msg ((,class (:foreground ,orange-2))))
;;    `(diredp-executable-tag ((,class (:foreground ,green-2))))
;;    `(diredp-file-name ((,class (:foreground ,black-5))))
;;    `(diredp-file-suffix ((,class (:foreground ,orange-3))))
;;    `(diredp-flag-mark ((,class (:foreground ,white-0 :background ,magenta-3 :bold t))))
;;    `(diredp-flag-mark-line ((,class (:foreground ,black-5 :background ,magenta-1))))
;;    `(diredp-ignored-file-name ((,class (:foreground ,white-4))))
;;    `(diredp-link-priv ((,class (:foreground ,magenta-3))))
;;    `(diredp-mode-line-flagged ((,class (:foreground ,black-5 :background ,green-2))))
;;    `(diredp-mode-line-marked ((,class (:foreground ,white-0 :background ,magenta-3 bold t))))
;;    `(diredp-no-priv ((,class (:foreground ,yellow-3 :background ,yellow-00))))
;;    `(diredp-number ((,class (:foreground ,green-3))))
;;    `(diredp-other-priv ((,class (:foreground ,white-0 :background ,blue-3))))
;;    `(diredp-rare-priv ((,class (:foreground ,white-0 :background ,purple-2))))
;;    `(diredp-symlink ((,class (:foreground ,magenta-3))))
;;    `(diredp-read-priv ((,class (:foreground ,green-4 :background ,green-0))))
;;    `(diredp-write-priv ((,class (:foreground ,blue-5 :background ,blue-0))))
;;    `(diredp-exec-priv ((,class (:foreground ,red-3 :background ,orange-0))))

;;    ;; Magit
;;    `(magit-branch ((,class (:foreground ,blue-2 :background ,blue-0 :bold t))))
;;    `(magit-diff-add ((,class (:foreground ,green-3 :background ,LIGHT_BG :bold t))))
;;    `(magit-diff-del ((,class (:foreground ,red-2 :background ,LIGHT_BG :bold t))))
;;    `(magit-diff-file-header ((,class (:foreground ,black-4 :background ,white-3 :bold t))))
;;    `(magit-diff-hunk-header ((,class (:foreground ,black-2 :background ,white-1 :bold t))))
;;    `(magit-diff-merge-current ((,class (:foreground ,purple-1))))
;;    `(magit-diff-merge-diff3-separator ((,class (:foreground ,purple-1))))
;;    `(magit-diff-merge-proposed ((,class (:foreground ,purple-1))))
;;    `(magit-diff-merge-separator ((,class (:foreground ,purple-1))))
;;    `(magit-diff-none ((,class (:foreground ,white-4))))
;;    `(magit-header ((,class (:foreground ,blue-2 :background ,white-0 :underline ,blue-2))))
;;    `(magit-item-highlight ((,class (:background ,yellow-00))))
;;    `(magit-item-mark ((,class (:foreground ,white-0 :background ,magenta-2))))
;;    `(magit-log-author ((,class (:foreground ,green-3 :background ,LIGHT_BG))))
;;    `(magit-log-author-date-cutoff ((,class (:foreground ,red-1 :bold t))))
;;    `(magit-log-date ((,class (:foreground ,black-5 :background ,green-0))))
;;    `(magit-log-graph ((,class (:foreground ,black-2 :background ,LIGHT_BG))))
;;    `(magit-log-head-label-bisect-bad ((,class (:foreground ,white-1 :background ,red-0))))
;;    `(magit-log-head-label-bisect-good ((,class (:foreground ,black-3 :background ,green-0))))
;;    `(magit-log-head-label-default ((,class (:foreground ,white-0 :background ,black-3 :bold t))))
;;    `(magit-log-head-label-local ((,class (:foreground ,white-0 :background ,black-3 :bold t))))
;;    `(magit-log-head-label-patches ((,class (:foreground ,red-3 :background ,orange-0 :bold t))))
;;    `(magit-log-head-label-remote ((,class (:foreground ,green-3 :background ,green-0 :bold t))))
;;    `(magit-log-head-label-tags ((,class (:foreground ,yellow-4 :background ,yellow-0 :bold t))))
;;    `(magit-log-message ((,class (:foreground ,black-5 :background ,LIGHT_BG))))
;;    `(magit-log-sha1 ((,class (:foreground ,orange-2 :background ,LIGHT_BG))))
;;    `(magit-section-title ((,class (:foreground ,orange-3 :background ,LIGHT_BG :underline ,orange-3 :bold ,t))))
;;    `(magit-valid-signature ((,class (:foreground ,cyan-3 :background ,LIGHT_BG :bold t))))
;;    `(magit-whitespace-warning-face ((,class (:foreground ,white-0 :background ,red-2 :bold t))))

;;    ;; Message faces
;;    `(message-header-name ((,class (:foreground ,blue-3))))
;;    `(message-header-cc ((,class (:foreground ,yellow-3))))
;;    `(message-header-other ((,class (:foreground ,magenta-2))))
;;    `(message-header-subject ((,class (:foreground ,green-2))))
;;    `(message-header-to ((,class (:foreground ,yellow-2))))
;;    `(message-cited-text ((,class (:foreground ,green-2))))
;;    `(message-separator ((,class (:foreground ,purple-2))))

;;    ;; SMerge faces
;;    `(smerge-refined-change ((,class (:background ,blue-3))))

;;    ;; Grep
;;    `(grep-context-face ((,class (:foreground ,red-2))))
;;    `(grep-error-face ((,class (:foreground ,red-1 :weight bold :underline t))))
;;    `(grep-hit-face ((,class (:foreground ,green-2))))
;;    `(grep-match-face ((,class (:foreground nil :background nil :inherit match))))

;;    ;; Ediff faces
;;    `(ediff-current-diff-A ((,class (:background ,magenta-1))))
;;    `(ediff-fine-diff-A ((,class (:background ,green-1))))
;;    `(ediff-even-diff-A ((,class (:background ,yellow-0))))
;;    `(ediff-odd-diff-A ((,class (:background ,orange-0))))
;;    `(ediff-current-diff-B ((,class (:background ,magenta-1))))
;;    `(ediff-fine-diff-B ((,class (:background ,green-1))))
;;    `(ediff-even-diff-B ((,class (:background ,yellow-0))))
;;    `(ediff-odd-diff-B ((,class (:background ,orange-0))))

;;    ;; smerge
;;    `(smerge-refined-change ((,class (:background ,blue-3 :foreground ,white-0))))

;;    ;; Flyspell faces
;;    `(flyspell-duplicate ((,class (:underline t foreground-color,orange-1))))
;;    `(flyspell-incorrect ((,class (:background ,red-1 :foreground ,white-0 :bold t))))

;;    ;; Semantic faces
;;    `(semantic-decoration-on-includes ((,class (:underline ,black-1))))
;;    `(semantic-decoration-on-private-members-face
;;      ((,class (:background ,purple-0))))
;;    `(semantic-decoration-on-protected-members-face
;;      ((,class (:background ,magenta-1))))
;;    `(semantic-decoration-on-unknown-includes
;;      ((,class (:background ,red-0))))
;;    `(semantic-decoration-on-unparsed-includes
;;      ((,class (:background ,yellow-1))))
;;    `(semantic-tag-boundary-face ((,class (:overline ,blue-1))))
;;    `(semantic-unmatched-syntax-face ((,class (:underline ,red-1))))

;;    ;; CUA
;;    `(cua-rectangle ((,class (:background ,magenta-3 :foreground ,white-0))))

;;    ;; Ace-jump
;;    `(ace-jump-face-background ((,class (:foreground ,white-4))))
;;    `(ace-jump-face-foreground ((,class (:foreground ,red-2 :bold t))))

;;    ;; Rainbow-delimiters
;;    `(rainbow-delimiters-depth-1-face ((,class (:bold t :foreground ,red-2))))
;;    `(rainbow-delimiters-depth-2-face ((,class (:bold t :foreground ,blue-2))))
;;    `(rainbow-delimiters-depth-3-face ((,class (:bold t :foreground ,green-3))))
;;    `(rainbow-delimiters-depth-4-face ((,class (:bold t :foreground ,magenta-2))))
;;    `(rainbow-delimiters-depth-5-face ((,class (:bold t :foreground ,cyan-3))))
;;    `(rainbow-delimiters-depth-6-face ((,class (:bold t :foreground ,orange-2))))
;;    `(rainbow-delimiters-depth-7-face ((,class (:bold t :foreground ,purple-2))))
;;    `(rainbow-delimiters-depth-8-face ((,class (:bold t :foreground ,yellow-2))))
;;    `(rainbow-delimiters-depth-9-face ((,class (:bold t :foreground ,black-5))))
;;    `(rainbow-delimiters-unmatched-face ((,class (:foreground ,white-0 :background ,red-3 :bold t))))

;;    ;; EShell
;;    `(eshell-ls-archive ((,class (:foreground ,purple-2))))
;;    `(eshell-ls-backup ((,class (:foreground ,white-3))))
;;    `(eshell-ls-clutter ((,class (:foreground ,black-1))))
;;    `(eshell-ls-directory ((,class (:foreground ,blue-1 :bold t))))
;;    `(eshell-ls-executable ((,class (:foreground ,green-3))))
;;    `(eshell-ls-missing ((,class (:foreground ,white-0 :background ,red-3))))
;;    `(eshell-ls-product ((,class (:foreground ,white-0 :background ,green-2))))
;;    `(eshell-ls-readonly ((,class (:foreground ,orange-3))))
;;    `(eshell-ls-special ((,class (:foreground ,yellow-3))))
;;    `(eshell-ls-symlink  ((,class (:foreground ,magenta-2))))
;;    `(eshell-ls-unreadable ((,class (:foreground ,black-2))))
;;    `(eshell-prompt ((,class (:foreground ,black-3 :background ,yellow-0 :bold t))))

;;    ;; which-function-mode
;;    `(which-func ((,class (:foreground ,white-0 :background ,orange-2))))

;;    ;; Flymake
;;    `(flymake-warnline ((,class (:underline ,orange-2))))
;;    `(flymake-errline ((,class (:underline ,red-2))))

;;    ;; MMM-Mode
;;    `(mmm-default-submode-face ((,class (:background ,yellow-00))))

;;    ;; Clojure
;;    `(clojure-test-failure-face ((,class (:underline ,orange-2))))
;;    `(clojure-test-error-face ((,class (:underline ,red-2))))
;;    `(clojure-test-success-face ((,class (:underline ,green-3))))

;;    ;; rcirc
;;    `(rcirc-bright-nick ((,class (:foreground ,blue-1 :bold t))))
;;    `(rcirc-dim-nick ((,class (:foreground ,black-2 :bold t))))
;;    `(rcirc-keyword ((,class (:foreground ,magenta-2 :bold t))))
;;    `(rcirc-my-nick ((,class (:foreground ,green-2 :bold t))))
;;    `(rcirc-nick-in-message ((,class (:foreground ,green-3))))
;;    `(rcirc-nick-in-message-full-line ((,class (:foreground ,blue-3))))
;;    `(rcirc-other-nick ((,class (:foreground ,blue-4 :bold t))))
;;    `(rcirc-prompt ((,class (:foreground ,black-3 :background ,green-01 :bold t))))
;;    `(rcirc-server ((,class (:foreground ,black-1))))
;;    `(rcirc-server-prefix ((,class (:foreground ,black-1))))
;;    `(rcirc-timestamp ((,class (:foreground ,orange-2))))
;;    `(rcirc-track-keyword ((,class (:foreground ,magenta-2))))
;;    `(rcirc-track-nick ((,class (:foreground ,blue-1))))
;;    `(rcirc-url ((,class (:foreground ,blue-2 :bold nil :underline ,blue-2))))

;;    ;; ERC
;;    `(erc-button ((,class (:foreground ,blue-2 :underline ,blue-2 :bold nil))))
;;    `(erc-current-nick-face ((,class (:foreground ,green-3))))
;;    `(erc-dangerous-hosts ((,class (:foreground ,red-3 :bold t))))
;;    `(erc-direct-msg-face ((,class (:foreground ,orange-2))))
;;    `(erc-error-face ((,class (:foreground ,red-2))))
;;    `(erc-header-face ((,class (:background ,blue-1))))
;;    `(erc-input-face ((,class (:foreground ,black-3))))
;;    `(erc-keyword-face ((,class (:foreground ,magenta-2 :bold t))))
;;    `(erc-my-nick-face ((,class (:foreground ,green-2 :bold t))))
;;    `(erc-nick-default-face ((,class (:bold t :foreground ,blue-4))))
;;    `(erc-nick-msg-face ((,class (:weight normal :foreground ,orange-2))))
;;    `(erc-notice-face ((,class (:foreground ,black-1))))
;;    `(erc-pal-face ((,class (:foreground ,purple-1))))
;;    `(erc-prompt-face ((,class (:bold t :foreground ,black-3 :background ,green-01))))
;;    `(erc-timestamp-face ((,class (:foreground ,orange-2))))

;;    ;; ReStructuredText
;;    `(rst-level-1-face ((,class (:foreground ,green-3 :background ,green-00 :bold t))))
;;    `(rst-level-2-face ((,class (:foreground ,green-3 :background ,green-00 :bold t))))
;;    `(rst-level-3-face ((,class (:foreground ,green-3 :background ,green-00 :bold t))))
;;    `(rst-level-4-face ((,class (:foreground ,green-3 :background ,green-00 :bold t))))
;;    `(rst-level-5-face ((,class (:foreground ,green-3 :background ,green-00 :bold t))))
;;    `(rst-level-6-face ((,class (:foreground ,green-3 :background ,green-00 :bold t))))
;;    `(rst-block ((,class (:foreground ,orange-2 :background ,LIGHT_BG :bold t))))
;;    `(rst-reference ((,class (:foreground ,magenta-3 :background ,LIGHT_BG))))
;;    `(rst-definition ((,class (:foreground ,yellow-3 :background ,LIGHT_BG))))
;;    `(rst-external ((,class (:foreground ,blue-2 :background ,LIGHT_BG))))

;; )

(skinny-samurai-with-color-variables
   (custom-theme-set-variables
    'skinny-samurai
    `(fci-rule-color ,skinny-grey)))
    ;; `(ansi-color-names-vector [,black-5 ,red-0 ,green-0 ,yellow-1
    ;; 			      ,blue-1 ,purple-1 ,blue-0 ,white-0])))
;; fix wrong default face
(if window-system
    (progn
      (set-background-color "#ffffd7")
      (set-foreground-color "#5f5f5f")))

(declare-function rainbow-mode 'rainbow-mode)
(declare-function rainbow-colorize-by-assoc 'rainbow-mode)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'skinny-samurai)

;;;###autoload
(add-to-list 'safe-local-eval-forms
             '(when (require 'rainbow-mode nil t) (rainbow-mode 1)))

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; skinny-samurai-theme.el ends here
