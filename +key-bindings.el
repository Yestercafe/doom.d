;;; +key-bindings.el -*- lexical-binding: t; -*-

;; evil escape mapping
(setq-default evil-escape-key-sequence "kj")

(map! :leader
      (:when (featurep! :ui tabs)
       (:prefix-map ("j" . "tabs")
        (:prefix ("g" : "... group")
         :desc "Switch groups"                "g"      #'centaur-tabs-switch-group
         :desc "Backward group"               "h"      #'centaur-tabs-backward-group
         :desc "Forward group"                "l"      #'centaur-tabs-forward-group)
        :desc "Backward tab"                  "h"      #'centaur-tabs-backward-tab
        :desc "Forward tab"                   "l"      #'centaur-tabs-forward-tab
        :desc "Select beginning tab"          "H"      #'centaur-tabs-select-beg-tab
        :desc "Select end tab"                "L"      #'centaur-tabs-select-end-tab
        :desc "Kill this tab"                 "x"      #'centaur-tabs--kill-this-buffer-dont-ask
        (:prefix ("X" . "Kill ...")
         :desc "Kill all tabs"                "x"      #'centaur-tabs-kill-all-buffers-in-current-group
         :desc "Kill all other tabs"          "o"      #'centaur-tabs-kill-other-buffers-in-current-group)
        (:prefix ("m" . "Move ...")
         :desc "Move this tab to left"        "h"      #'centaur-tabs-move-current-tab-to-left
         :desc "Move this tab to right"       "l"      #'centaur-tabs-move-current-tab-to-right))))

(map! :leader
      (:prefix-map ("?" . "docs")
       (:desc "Dash at point"                "d"       #'dash-at-point
        :desc "Dash at point with docset"    "D"       #'dash-at-point-with-docset)))

(map! :leader
      :desc "Disable highlight"              "0"       #'evil-ex-nohighlight)

(add-hook 'with-editor-mode-hook
          (lambda ()
            (map! :leader
                  (:prefix-map ("e" . "with-editor-mode")
                   (:desc "Finish"   "c" #'with-editor-finish
                    :desc "Cancel"   "k" #'with-editor-cancel)))))
