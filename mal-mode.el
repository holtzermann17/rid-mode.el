;;; mal-mode.el

;; Copyright (C) 2011 Joseph Corneli <holtzermann17@gmail.com>

;; Maintainer: Joseph Corneli
;; Keywords: fontlock

;; This NOT file is part of GNU Emacs, but is distributed
;; under the same terms as GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Fontify words from the Young Schema Questionnaire.

;; According to its inventor, "the 18 Early Maladaptive
;; Schemas are self-defeating, core themes or patterns
;; that we keep repeating throughout our lives."

;; This version extracts some of the keywords from the
;; Questionnaire and can show how frequently these
;; "maladaptive" words appear in a given text.

;; Version one: This works for fontification purposes.

;; TODO: 

;; * Keeping a running tally of the number of words used
;; in each category.

;; * Add more words and continue to improve the accuracy
;; of the words that are present.
;;  - draw from http://www.schematherapy.com/id205.htm
;;  - and http://www.schematherapy.com/id71.htm

(setq abandonment (concat "\\<" (regexp-opt '("instab" "unreliab" "support" "connection" "significant" "strength" "unstable" "outbursts" "imminent" "abandon" "favor" "feel" "leave" "upset" "losing" "they'll" "they're" "addicted" "afraid" "available" "clinging" "coming" "committed" "defenseless" "desperate" "die" "expect" "fighting" "last" "leaves" "leaving"  "nice" "partners" "period" "prefer" "pulling" "regular" "self-absorbed" "short" "soon" "stable" "unpredictable" "worried")  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '("count" "drive")  t) "\\>")

      emotional-deprivation  (concat "\\<" (regexp-opt '("support" "adequate" "attention" "companion" "understanding" "listening" "disclosure" "sharing" "mutual" "direction" "guidance" "empathy" "nurturance" "haven't" "advice" "warmth" "wanted" "tuned" "true" "spend" "special" "sound" "share" "nurture" "holding" "himself" "herself" "gotten" "felt" "deeply")  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '()  t) "\\>")

      emotional-inhibition  (concat "\\<" (regexp-opt '("disapproval" "communic" "emotion" "emotionally" "anger" "warm" "uptight" "unemotional" "spontaneous" "show" "seriously" "positive" "likely" "inside" "gets" "emotions" "embarrassing" "affection" "actions") t) "[A-Za-z]*\\>"  "\\|" "\\<" (regexp-opt '()  t) "\\>")

      enmeshment  (concat "\\<" (regexp-opt '("parent" "involve" "closeness" "survive" "support" "smother" "fuse" "emptiness" "empty" "flounder" "exist" "parents" "partner" "separate" "living" "intimate" "speak" "separating" "privacy" "overinvolved" "other's" "lives" "keeping" "identity" "distance" "disappointed" "details" "day" "betrayed" )  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '()  t) "\\>")

      entitlement  (concat "\\<" (regexp-opt '("superior" "privilege" "bound" "reciproc" "famous" "wealthy" "power" "control" "shouldn't" "tolerate" "tell" "rules" "restrictions" "priorities" "placed" "offer" "normal" "kept" "irritated" "irritable" "hate" "friends" "follow" "conventions" "controlling" "contributions" "constrained" "answer" "ahead")  t) "[A-Za-z]*\\>")

      insufficient-self-control  (concat "\\<" (regexp-opt '("goal" "restrain" "impuls" "avoid" "conflict" "responsibility" "easily" "complete" "temper" "stick" "start" "smoking" "slightest" "routine" "resolutions" "regret" "reach" "problem" "persevere" "overeating" "once" "offense" "long-range" "later" "impulsively" "hold" "frustrated" "force" "enjoy" "drinking" "discipline" "cost" "concentrate" "bored" "behaviors" "anything" "allow" "self-control" "self-discipline")  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '()  t) "\\>")

      mistrust-abuse  (concat "\\<" (regexp-opt '("hurt" "humiliate" "cheat" "lie" "harm" "unjustified" "negligence" "motives" "before" "advantage" "throughout" "well-intentioned" "used" "truth" "trusting" "trust" "towards" "suspicious" "purposes" "prove" "protect" "presence" "mistreated" "lookout" "intentionally" "honest" "guard" "controlled" "betrays" "belief" "appear" "after" "mistrust" "abuse" "tests")  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '()  t))

      subjugation  (concat "\\<" (regexp-opt '("surrender" "coerce" "retaliation" "suppress" "valid" "important" "compliance" "comply" "trapped" "passive" "reject" "wishes" "upper" "rights" "retaliate" "respected" "pleasing" "lengths" "instead" "fear" "demanding" "decisions" "consequences" "confrontations" "choices" "choice" "asking" "account")  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '("iron")  t) "\\>")

      self-sacrifice  (concat "\\<" (regexp-opt '("voluntar" "cause" "causing" "guilt" "maintain" "pain" "others" "resentment" "codepend" "happy" "guilty" "busy" "volunteer" "uncomfortable" "taking" "return" "receiving" "minimal" "loved" "giving" "everyone" "ends" "else's" "disappoint" "couldn't" "comfortable" "self")  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '()  t) "\\>")

      social-undesirability  (concat "\\<" (regexp-opt '("wouldn't" "ugly" "status" "socially" "sexually" "self-conscious" "longer" "level" "fat" "education" "dull"  "career" "boring" "attractive" "undesirab")  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '("decent")  t) "\\>")

      unrelenting-standards  (concat "\\<" (regexp-opt '("slow" "satisfying" "attention" "should" "moral" "ethical" "precept" "efficien" "best" "pressure" "suffering" "suffer" "strive" "standards" "settle" "second" "relax" "push" "pleasure" "performance" "perfect" "off" "mistakes" "mistake" "look" "hook" "health" "happiness" "excuses" "done" "deserve" "criticism" "constant" "competitive" "achieve" "accomplish" "accept" "unrelenting")  t) "[A-Za-z]*\\>"  "\\|" "\\<" (regexp-opt '("under" "all" "order")  t) "\\>")

      vulnerability  (concat "\\<" (regexp-opt '("might" "serious" "attack" "vagrant" "strike" "street" "sick" "precautions" "physician" "heart" "happening" "financial" "escape" "disaster" "diagnosed" "developing" "destitute" "dangerous" "criminal" "crazy" "concerned" "careful" "being" "becoming" "attacked" "anxiety" "anxious" "vulnerability" "natural" "medical" "AIDS" "catastrophe" "collaps" "crash" "victim")  t) "[A-Za-z]*\\>")

      social-isolation  (concat "\\<" (regexp-opt '("tomorrow" "outside" "notice" "loner" "isolated" "different" "group" "community" "fit" "families" "disappeared" "belong" "alienated" "alien")  t) "[A-Za-z]*\\>")

      defectiveness-shame  (concat "\\<" (regexp-opt '("bad" "unwanted" "inferior" "invalid" "unlovable" "blame" "comparison" "compare" "shame" "flaw" "awkward" "defects" "respect" "real" "desire" "basic" "worthwhile" "unworthy" "unacceptable" "stay" "secrets" "saw" "reveal" "lovable" "knew" "inner" "inherent" "greatest" "fooling" "flawed" "fears" "fault" "face" "exposed" "drawn" "defective" "critical" "anyone")  t) "[A-Za-z]*\\>"  "\\|" "\\<" (regexp-opt '("man" "woman" "she" "he")  t) "\\>")

      failure  (concat "\\<" (regexp-opt '("fail" "inadequate" "stupid" "untalented" "ignorant" "lower" "less" "failure" "school" "capable" "compare" "embarrassed" "failures" "humiliated" "inadequacies" "incompetent" "intelligent" "sphere" "successful" "talented")  t) "[A-Za-z]*\\>"  "\\|" "\\<" (regexp-opt '()  t) "\\>")

      dependence-incompetence  (concat "\\<" (regexp-opt '("unable" "exercise" "tackle" "everyday" "responsibilities" "need" "wrong" "unless" "tackling" "solve" "screw" "rely" "relied" "practical" "overwhelming" "issues" "inept" "help" "handling" "guide" "functioning" "dependent" "cope" "confident" "child" "believe" "adult" "ability" "dependence" "incompetence") t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '()  t) "\\>")

      )

;;;;;;;;;;;;;;;;;; Begin preliminary mode to provide faces
(defvar mal-mode-hook nil)

(defmacro mal-new-face (name color doc)
  (let ((prop (intern (concat "mal-" (symbol-name name) "-face"))))
    `(progn
       (defvar  ,prop ',prop)
       (defface ,prop '((t (:foreground ,(symbol-name color)))) ,doc))))

(defmacro mal-ul-face (name color doc)
  (let ((prop (intern (concat "mal-" (symbol-name name) "-face"))))
    `(progn
       (defvar  ,prop ',prop)
       (defface ,prop '((t (:foreground ,(symbol-name color) :underline t))) ,doc))))

(defmacro mal-it-face (name color doc)
  (let ((prop (intern (concat "mal-" (symbol-name name) "-face"))))
    `(progn
       (defvar  ,prop ',prop)
       (defface ,prop '((t (:foreground ,(symbol-name color) :slant italic) )) ,doc))))


(defmacro mal-box-face (name color doc)
  (let ((prop (intern (concat "mal-" (symbol-name name) "-face"))))
    `(progn
       (defvar  ,prop ',prop)
       (defface ,prop '((t (:foreground ,(symbol-name color) :box (:line-width 2 :color "grey75" :style none)) )) ,doc))))

(defmacro mal-bold-face (name color doc)
  (let ((prop (intern (concat "mal-" (symbol-name name) "-face"))))
    `(progn
       (defvar  ,prop ',prop)
       (defface ,prop '((t (:foreground ,(symbol-name color) :weight bold) )) ,doc))))

(mal-new-face orality            red              "Abandonment") 
(mal-new-face anality            OrangeRed        "Social undesirability") 
(mal-new-face sex                DarkOrange2      "Unrelenting standards") 
(mal-new-face touch              goldenrod1       "Emotional Deprivation") 
(mal-new-face taste              yellow           "Emotional inhibition") 
(mal-new-face odor               LawnGreen        "Enmeshment") 
(mal-new-face general-sensation  green4           "Entitlement") 
(mal-new-face sound              LightSeaGreen    "Vulnerability") 
(mal-new-face vision             DodgerBlue2      "Insufficient self-control") 
(mal-new-face cold               purple1          "Mistrust/Abuse")  
(mal-new-face hard               magenta4         "Subjugation") 
(mal-new-face soft               MediumVioletRed  "Self-sacrifice") 

(mal-bold-face passivity  red                     "Social isolation") 
(mal-bold-face voyage  OrangeRed                  "Defectiveness/shame") 
(mal-bold-face random-movement  DarkOrange2       "Failure") 
(mal-bold-face diffusion  goldenrod1              "Dependence/Incompetence") 
;; (mal-bold-face chaos  yellow                      "Defensive Symbolization: chaos") 
;; (mal-bold-face unknown  LawnGreen                 "Regressive Cognition: unknown") 
;; (mal-bold-face timelessness green4                "Regressive Cognition: timelessness") 
;; (mal-bold-face consciousness  LightSeaGreen       "Regressive Cognition: consciousness alteration") 
;; (mal-bold-face brink-passage  DodgerBlue2         "Regressive Cognition: brink-passage") 
;; (mal-bold-face narcissism  purple1                "Regressive Cognition: narcissism")  
;; (mal-bold-face concreteness magenta4              "Regressive Cognition: concreteness") 

;; (mal-box-face ascend  MediumVioletRed             "Icarian imagery: ascend") 
;; (mal-box-face height  yellow                      "Icarian imagery: height") 
;; (mal-box-face descent goldenrod1                  "Icarian imagery: descent") 
;; (mal-box-face depth   purple1                     "Icarian imagery: depth") 
;; (mal-box-face fire    red                         "Icarian imagery: fire") 
;; (mal-box-face water   DodgerBlue2                 "Icarian imagery: water") 

;; (mal-ul-face abstract-thought  LawnGreen          "Secondary process: abstract thought") 
;; (mal-ul-face social-behavior  green4              "Secondary process: social behavior") 
;; (mal-ul-face instrumental-behavior  LightSeaGreen "Secondary process: instrumental behavior") 
;; (mal-ul-face restraint  DodgerBlue2               "Secondary process: restraint") 
;; (mal-ul-face order  purple1                       "Secondary process: order")  
;; (mal-ul-face temporal-representation magenta4     "Secondary process: temporal representation") 
;; (mal-ul-face moral-imperative MediumVioletRed     "Secondary process: moral imperative") 

;; (mal-it-face anxiety              LawnGreen       "Emotion: anxiety") 
;; (mal-it-face sadness              DodgerBlue2     "Emotion: sadness") 
;; (mal-it-face affection            goldenrod1      "Emotion: affection") 
;; (mal-it-face positive-affect      yellow          "Emotion: positive-affect") 
;; (mal-it-face aggression           red             "Emotion: aggression") 
;; (mal-it-face expressive-behavior  OrangeRed       "Emotion: expressive behavior") 
;; (mal-it-face glory                green4          "Emotion: glory") 

(setq mal-font-lock-keywords
      (list `(,abandonment
              . mal-orality-face)
            `(,social-undesirability
              . mal-anality-face)
            `(,unrelenting-standards
              . mal-sex-face)
            `(,emotional-deprivation
              . mal-touch-face)
            `(,emotional-inhibition
              . mal-taste-face)
            `(,enmeshment
              . mal-odor-face)
            `(,entitlement
              . mal-general-sensation-face)
            `(,vulnerability
              . mal-sound-face)
            `(,insufficient-self-control
              . mal-vision-face)
            `(,mistrust-abuse
              . mal-cold-face)
            `(,subjugation
              . mal-hard-face)
            `(,self-sacrifice
              . mal-soft-face)
            `(,social-isolation
              . mal-passivity-face)
            `(,defectiveness-shame
               . mal-voyage-face)
            `(,failure
              . mal-random-movement-face)
            `(,dependence-incompetence
              . mal-diffusion-face)
            ;; `(,chaos
            ;;   . mal-chaos-face)
            ;; `(,unknown
            ;;   . mal-unknown-face)
            ;; `(,timelessness
            ;;   . mal-timelessness-face)
            ;; `(,consciousness
            ;;   . mal-consciousness-face)
            ;; `(,brink-passage
            ;;   . mal-brink-passage-face)
            ;; `(,narcissism
            ;;   . mal-narcissism-face)
            ;; `(,concreteness
            ;;   . mal-concreteness-face)
            ;; `(,icarian-ascend
            ;;   . mal-ascend-face)
            ;; `(,icarian-height
            ;;   . mal-height-face)
            ;; `(,icarian-descent
            ;;   . mal-descent-face)
            ;; `(,icarian-depth
            ;;   . mal-depth-face)
            ;; `(,icarian-fire
            ;;   . mal-fire-face)
            ;; `(,icarian-water
            ;;   . mal-water-face)
            ;; `(,abstract-thought
            ;;   . mal-abstract-thought-face)
            ;; `(,social-behavior
            ;;   . mal-social-behavior-face)
            ;; `(,instrumental-behavior
            ;;   . mal-instrumental-behavior-face)
            ;; `(,restraint
            ;;   . mal-restraint-face)
            ;; `(,order
            ;;   . mal-order-face)
            ;; `(,temporal-representation
            ;;   . mal-temporal-representation-face)
            ;; `(,moral-imperative
            ;;   . mal-moral-imperative-face)
            ;; `(,positive-affect
            ;;   . mal-positive-affect-face)
            ;; `(,anxiety
            ;;   . mal-anxiety-face)
            ;; `(,sadness
            ;;   . mal-sadness-face)
            ;; `(,affection
            ;;   . mal-affection-face)
            ;; `(,aggression
            ;;   . mal-aggression-face)
            ;; `(,expressive-behavior
            ;;   . mal-expressive-behavior-face)
            ;; `(,glory
            ;;  . mal-glory-face)
            ))

(defun mal-document-face ()
  (interactive)
  (message (face-documentation (get-text-property (point) 'face))))

(defvar mal-mode-map (make-sparse-keymap "mal-map"))

(if mal-mode-map
    (let ((km mal-mode-map))
      (define-key km "\C-c\C-c" 'mal-document-face)
      ))

(define-derived-mode mal-mode text-mode
  "MAL"
  "Mode for color-coding words from maladaptive schemas.
\\{mal-mode-map}"
  (set (make-local-variable 'font-lock-defaults)
       '((mal-font-lock-keywords) nil t))
  (font-lock-mode))

;;; mal-mode.el ends here
