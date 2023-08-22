(setq modus-themes-bold-constructs t)
;; (setq modus-themes-italic-constructs t)


(defconst modus-vivendi-palette-overrides
  '(
    ;; Basic values
    (bg-main          "#193549")
    (bg-active        "#00ffff")
    (fg-main          "#fff")

    (bg-hl-line       "#1f4662")

    (bg-line-number-active "#12273866")
    (fg-line-number-active "#aaa")

    (bg-mode-line-active "#15232d")
    (fg-mode-line-active "#aaa")
    ;; (border-mode-line-active "#0d3a58")


    ;; (fg-line-number-active )
    ;; (bg-line-number-inactive )
    ;; (fg-line-number-inactive )

    ;; (bg-parent-match "#0d3a58")
    ;; (bg-parent-match "#0000ff")

    ;; (bg-mode-line-active "#ff00ff")
    ;; (cursor nil)
    ;; (built-in "#000000")
    (comment "#0088ff")
    ;; (constant blue)
    ;; (docstring green)
    ;; (fname "#ff0000")
    (keyword "#ffc600")

    (bg-region "#0050a4")



    ))

(load-theme 'modus-operandi t)
(load-theme 'modus-vivendi t)
