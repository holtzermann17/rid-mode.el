;;; rid-mode.el Fontify words from the Regressive Imagery Dictionary

;; Version one: This works for fontification purposes.
;; Next step: Keeping a running tally of the number of
;; words used in each category would be good, but one can
;; also use rid.py to do an analysis at the end.

(setq  primary-need-orality  (concat "\\<" (regexp-opt '("absinth" "ale" "ales" "alimentary" "ambrosia" "ambrosial" "appetit" "apple" "artichok" "asparagu" "bacon" "banana" "bean" "beef" "beer" "belch" "bellies" "belly" "berri" "berry" "beverag" "biscuit" "bite" "bite" "bites" "biting" "bitten" "bonbon" "brandy" "bread" "breakfast" "breast" "brew" "broth" "burp" "butter" "buttermilk" "cafe" "cafes" "cake" "cakes" "cafetaria" "candy" "cannibal" "caviar" "champagn" "chees" "cherri" "cherry" "chestnut" "chew" "chok" "cider" "claret" "cob" "cobs" "cocoa" "cocoanut" "coconut" "coffe" "consum" "cook" "corn" "cough" "cranberry" "cream" "delicaci" "delicacy" "dessert" "devour" "diet" "digest" "dine" "dines" "dining" "dinner" "dish" "dishes" "drank" "drink" "drunk" "drunken" "eat" "eaten" "egg" "entrail" "famin" "famish" "fat" "fatten" "feast" "fed" "feed" "feeds" "fig" "figs" "flour" "food" "foodstuff" "fork" "fruit" "garlic" "gin" "ginger" "gins" "glutton" "gluttonou" "gnaw" "gobbl" "grain" "grap" "grog" "gruel" "gulp" "gum" "gums" "gut" "guts" "ham" "hams" "herb" "honey" "hunger" "hungry" "imbib" "inedibl" "intestin" "jaw" "juic" "lap" "laps" "lemon" "lick" "lime" "limes" "lip" "lips" "liqueur" "liquor" "lunch" "maiz" "meal" "meat" "melon" "menu" "milk" "mint" "morsel" "mouth" "mouthful" "mushroom" "mutton" "naus" "nectar" "nibbl" "nourish" "nourishment" "nurtur" "nut" "nuts" "oliv" "oral" "palat" "partak" "pastri" "pastry" "pea" "peanut" "pear" "peas" "pepper" "philtr" "pineappl" "poison" "pork" "porridg" "pot" "potato" "potbel" "pots" "pucker" "pumpkin" "quench" "raspberry" "raw" "rawly" "repast" "restaurant" "restaurent" "rice" "rices" "ripenes" "roast" "rum" "rums" "salad" "saliva" "salivat" "salt" "sauc" "sauerkraut" "sesam" "sherbert" "sherry" "soup" "spat" "spit" "spittl" "spoon" "starv" "starvat" "stomach" "strawberri" "strawberry" "suck" "suckl" "sugar" "supper" "swallow" "tea" "teas" "teat" "teeth" "thirst" "thirsty" "throat" "tit" "tits" "tomato" "tongu" "tooth" "uncook" "veal" "vegetabl" "venison" "vodka" "vomit" "wheat" "whiskey" "whisky" "yam" "yams" "yeast")  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '("fast" "fasts")  t) "\\>")

      primary-need-anality  (concat "\\<" (regexp-opt '("anal" "anus" "anuses" "arse" "arsehol" "ass-hol" "asshol" "beshat" "beshit" "besmear" "bile" "bowel" "buttock" "cack" "cesspool" "cloaca" "clot" "clots" "constipat" "dank" "daub" "defacat" "defil" "delous" "diarrhoea" "dirt" "dirty" "disgust" "dung" "dunghill" "effluvia" "effluvium" "enema" "excret" "fart" "farts" "fecal" "feces" "fetid" "fetor" "filth" "filthy" "impur" "latrin" "lice" "loathsom" "lous" "maggot" "maggoty" "malodorou" "malodourou" "manur" "mess" "messes" "messing" "miasma" "mud" "muddy" "muds" "offal" "ooz" "oozy" "outhous" "piss" "pollut" "putrescenc" "putrescent" "putrid" "rancid" "rectum" "reek" "rot" "rots" "rotten" "rotting" "rump" "scum" "sewer" "shat" "shit" "slimy" "smear" "sodomist" "sodomy" "soil" "stal" "stench" "stink" "sweat" "unclean" "unwash" "urin") t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '("ass" "asses")  t) "\\>")

      primary-need-sex  (concat "\\<" (regexp-opt '("venereal" "adulterer" "adultery" "allur" "bawd" "bawdy" "bitch" "brothel" "caress" "carnal" "circumcis" "clitori" "cohabit" "coitu" "concubin" "copulat" "coquett" "coquettish" "courtesan" "cuckold" "cunt" "cupid" "debauch" "deflower" "ejaculat" "erotic" "fondl" "fornicat" "fuck" "genital" "genitalia" "girdl" "groin" "harem" "harlot" "homosexual" "homosexuality" "immodest" "incest" "incestuou" "indecent" "indiscret" "infatuat" "kiss" "lasciviou" "lecher" "lecherou" "lechery" "leer" "leers" "lewd" "libertin" "licentiou" "lover" "lust" "lustful" "lusty" "masturbat" "menstrual" "menstruat" "mistres" "naked" "nude" "nudes" "obscen" "obscenity" "orgasm" "orgi" "orgy" "pander" "paramour" "peni" "pervers" "pervert" "phallic" "phallu" "pregnancy" "pregnant" "procreat" "prostitut" "prurient" "puberty" "pubi" "pubic" "rape" "raping" "ribald" "satyr" "seduc" "sensual" "sensuou" "sex" "sexed" "sexes" "sex-linked" "sexual" "sexy" "shameles" "slattern" "slut" "slutty" "testi" "testicl" "thigh" "trollop" "unblush" "undres" "vagina" "venu" "voluptuou" "vulva" "waist" "wanton" "whor" "womb" "sensation" )  t) "[A-Za-z]*\\>")

      sensation-touch  (concat "\\<" (regexp-opt '("brush" "coars" "contact" "cudd" "cuddl" "handl" "itch" "itchy" "massag" "prickl" "rough" "rub" "rubb" "rubs" "scaly" "scratch" "sharp" "slick" "slippery" "smooth" "snuggl" "sting" "stings" "strok" "textur" "thick" "tickl" "tingl" "touch" "waxy" )  t) "[A-Za-z]*\\>")

      sensation-taste  (concat "\\<" (regexp-opt '("aftertast" "bitter" "delectabl" "deliciou" "flavor" "honi" "lusciou" "piquant" "savor" "savory" "savour" "savoury" "sour" "spic" "spicy" "sugary" "sweetnes" "tang" "tangy" "tart" "tast" "tasty" "toothsom" "unpalatabl" "unsavory" "vinegar" "vinegary" )  t) "[A-Za-z]*\\>"  "\\|" "\\<" (regexp-opt '("sweet" "gall")  t) "\\>")

      sensation-odor  (concat "\\<" (regexp-opt '("aroma" "aromatic" "breath" "cologn" "fragranc" "fragrant" "fume" "fuming" "incens" "inhal" "musk" "musky" "musty" "nose" "nostril" "odor" "odour" "perfum" "pungenc" "pungent" "scent" "smel" "smell" "snif" "sniff" )  t) "[A-Za-z]*\\>")

      sensation-general  (concat "\\<" (regexp-opt '("apperceive" "apperceptive" "attent" "aware" "awarenes" "balmy" "bask" "beautiful" "beauty" "charm" "comfort" "comfortabl" "creamy" "fair" "impress" "lovelines" "lush" "luxuriou" "luxury" "milky" "oversensitiv" "perceiv" "percept" "perceptual" "physical" "pleasant" "pretty" "refresh" "relish" "revel" "sensat" "sensitiv" "stimulat" "sumptuou" )  t) "[A-Za-z]*\\>")

      sensation-sound  (concat "\\<" (regexp-opt '("auditorilly" "aloud" "audibl" "audition" "auditory" "aural" "bang" "bell" "binaural" "blar" "boom" "buzz" "chord" "choru" "clack" "clamor" "clamour" "clang" "crackl" "croak" "deaf" "dron" "drum" "ear" "ears" "echo" "hark" "heard" "hiss" "hum" "humm" "hums" "listen" "loud" "louder" "melodi" "melodiou" "melody" "muffl" "music" "musical" "nois" "noisy" "peal" "purr" "racket" "rasp" "rattl" "raucou" "resonant" "resound" "rhythm" "ring" "rumbl" "rustl" "serenad" "shrill" "snap" "sonorou" "sound" "stridant" "strident" "swish" "symphony" "tempo" "thud" "timbr" "tinkl" "tonal" "tone" "toned" "tones" "trill" "tune" "tuned" "tunes" "tuning" "unheard" "vocal" "voic" "whir" "whirr" "whistl" "after-image" )  t) "[A-Za-z]*\\>"  "\\|" "\\<" (regexp-opt '("hear")  t) "\\>")

      sensation-vision  (concat "\\<" (regexp-opt '("blink" "illuminant" "invisibility" "monocular" "amber" "appear" "appearanc" "aurora" "azur" "beam" "behold" "binocular" "blue" "bluish" "bright" "brown" "brunett" "chromatic" "color" "colour" "complex" "crimson" "discern" "dye" "emerald" "film" "flash" "flicker" "flourescent" "gaze" "gazing" "glanc" "glar" "gleam" "glimps" "glint" "glisten" "glitter" "glossy" "glow" "gray" "green" "grey" "halo" "hue" "illuminat" "imag" "invisibl" "lamp" "lantern" "lavender" "light" "lighten" "lightn" "limpid" "look" "lucid" "luminance" "luminou" "luster" "lustrou" "moonbeam" "moonlight" "notic" "observ" "opaqu" "paint" "peek" "peer" "pictur" "pink" "radianc" "radiant" "ray" "rays" "regard" "rosy" "roug" "ruby" "ruddy" "sapphir" "saw" "scan" "scann" "scans" "scarlet" "scen" "scenic" "see" "seeing" "seen" "sees" "sheen" "shimmer" "shin" "shon" "sight" "sparkl" "spied" "spies" "spy" "spying" "star" "starlight" "stars" "sunlight" "sunshin" "survey" "tan" "tanned" "tanning" "tans" "tint" "translucent" "transparent" "twinkl" "unseen" "view" "violet" "visibl" "vision" "visual" "watch" "witnes" "yellow" )  t) "[A-Za-z]*\\>")

      sensation-cold  (concat "\\<" (regexp-opt '("alaska" "arctic" "benumb" "chil" "chill" "cold" "colder" "cool" "freez" "frigid" "frost" "frostbit" "froz" "frozen" "glacier" "hoar" "ice" "icines" "icing" "icy" "north" "northern" "numb" "numbness" "polar" "shiver" "siberia" "sleet" "snow" "snowstorm" "snowy" "thul" "winter" "wintry" )  t) "[A-Za-z]*\\>")

      sensation-hard  (concat "\\<" (regexp-opt '("alabaster" "bras" "brassy" "brazen" "brittl" "bronz" "copper" "crisp" "crispy" "glas" "glassy" "granit" "gravel" "hard" "iron" "marbl" "metal" "metallic" "nail" "pebb" "porcelain" "rigid" "rock" "solid" "splinter" "steel" "stiff" "ston" "stony" "zinc" )  t) "[A-Za-z]*\\>")

      sensation-soft  (concat "\\<" (regexp-opt '("damask" "delicat" "downy" "feather" "fleec" "fleecy" "fluffy" "gentl" "gentlenes" "gossamer" "lace" "laces" "lacing" "lacy" "mellow" "mild" "murmur" "pliant" "powdery" "satin" "satiny" "silk" "soft" "tender" "ting" "velvet" "velvety" "whisper" )  t) "[A-Za-z]*\\>")

      passivity  (concat "\\<" (regexp-opt '("stagnant" "apathetic" "apathy" "bed" "bedd" "beds" "boredom" "calm" "contented" "contentment" "couch" "cozy" "dead" "death" "decay" "die" "died" "dies" "dormant" "drift" "dying" "ease" "eased" "eases" "hush" "idl" "immobil" "inactiv" "inactivity" "indifferenc" "indifferent" "indolent" "inert" "inertia" "innert" "laid" "lain" "langorou" "languid" "languish" "languor" "lassitud" "lay" "laying" "lays" "lazy" "leaden" "leisur" "lethargic" "lethargy" "lie" "lies" "linger" "listles" "lul" "lull" "motionles" "nestl" "nonchalanc" "nonchalant" "passiv" "passivity" "peaceful" "perish" "phlegmatic" "placid" "procrastinat" "quiet" "relax" "relaxat" "repos" "restful" "retir" "safe" "safely" "safety" "secur" "security" "sedentary" "seren" "serenity" "silenc" "silent" "slack" "sloth" "slow" "sluggish" "solac" "sooth" "stagnat" "static" "stillnes" "submiss" "submissiv" "submit" "succumb" "tranq" "unhurri" "vagrant" "velleity" "wearisom" "weary" "yield" )  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '("rest")  t) "\\>")

      voyage  (concat "\\<" (regexp-opt '("beyond" "caravan" "chas" "cruis" "desert" "driv" "embark" "emigrat" "explor" "immigrat" "immigrant" "journey" "migrat" "navigat" "nomad" "nomadic" "oscillat" "pilgrim" "pilgrimag" "ride" "rides" "riding" "roam" "rode" "rov" "sail" "sailor" "seafar" "search" "ship" "stray" "tour" "tourist" "travel" "trek" "trip" "vagabond" "voyag" "wander" "wanderlust" "wayfarer" "wildernes" "yonder" )  t) "[A-Za-z]*\\>")

      random-movement  (concat "\\<" (regexp-opt '("activiti" "activity" "agitat" "churn" "commot" "convuls" "expand" "expans" "fidget" "flounder" "flurri" "flurry" "jerk" "lurch" "orbit" "pitch" "pivot" "puls" "pulsat" "quak" "quiver" "reel" "revolv" "rol" "roll" "rotat" "seeth" "shak" "shook" "spasm" "spin" "spread" "stagger" "stir" "sway" "swel" "swell" "swivel" "swollen" "throb" "totter" "twich" "twist" "twitch" "undulat" "vibrat" "wave" "waved" "waves" "waving" "whirl" "wobbl" )  t) "[A-Za-z]*\\>")

      diffusion  (concat "\\<" (regexp-opt '("blur" "cloud" "cloudy" "curtain" "darken" "diffus" "dim" "dimm" "dims" "equivocal" "fade" "faded" "fades" "fading" "fog" "fogg" "fogs" "haze" "hazing" "hazy" "indefinit" "indistinct" "mist" "misty" "murkines" "murky" "nebula" "nebulou" "obscur" "overcast" "screen" "shad" "shadow" "shadowy" "shady" "twilight" "uncertain" "uncertaint" "unclear" "vagu" "vapor" "vapour" "veil" )  t) "[A-Za-z]*\\>")

      chaos  (concat "\\<" (regexp-opt '("aimles" "ambiguit" "ambiguou" "anarchy" "chanc" "chao" "char" "chars" "catastrophe" "confus" "crowd" "discord" "discordant" "dishevel" "disorder" "entangl" "gordian" "haphazard" "irregular" "jumbl" "jungl" "labyrinth" "lawles" "litter" "mob" "mobb" "mobs" "overgrown" "overrun" "perplex" "random" "ruin" "unru" "wild" )  t) "[A-Za-z]*\\>")

      unknown  (concat "\\<" (regexp-opt '("bizzar" "bodiles" "boundles" "cryptic" "enigma" "esoteric" "exotic" "fantastic" "formles" "immeasurabl" "inconceivabl" "incredibl" "indescribabl" "ineffabl" "infinity" "inscrutabl" "limitles" "magi" "magic" "magu" "marvel" "myst" "nameles" "nothingnes" "numberles" "occult" "odd" "secrecy" "secret" "shapeles" "sorcerer" "sorceres" "strang" "transcend" "unbelievabl" "unbound" "unimaginabl" "unknown" "unlimit" "unspeakabl" "untold" "void")  t) "[A-Za-z]*\\>")

      timelessness  (concat "\\<" (regexp-opt '("ceaseles" "centuri" "continual" "continuou" "endles" "endur" "eon" "eternal" "everlast" "immortal" "incessant" "lifetim" "outliv" "permanenc" "permanent" "perpetual" "timelessnes" "unceas" "undy" "unend")  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '("aeon" "century" "eternity" "everlast" "forever")  t) "\\>")

      consciousness  (concat "\\<" (regexp-opt '("amuck" "asleep" "awak" "awaken" "bedlam" "coma" "consciousness" "craz" "crazy" "deliriou" "delirium" "delphic" "dement" "doze" "dozed" "dozes" "dozing" "dream" "dreamy" "drowsy" "ecstacy" "ecstasy" "ecstatic" "enchant" "epilepsy" "epileptic" "exstasy" "faint" "fantasi" "fantasy" "febril" "fever" "feverish" "frenzy" "hallucinat" "hashish" "hibernat" "hypno" "hysteria" "hysteric" "imagin" "imaginat" "insan" "insanity" "intuit" "irrational" "laudanum" "lunacy" "lunatic" "madly" "madman" "madmen" "madnes" "madwoman" "madwomen" "mania" "maniac" "meditat" "mesmeriz" "monomania" "nap" "napp" "naps" "neurosi" "neurotic" "nightmar" "nightmarish" "opium" "opiates" "oracl" "parano" "premonit" "psychic" "psychosi" "psychotic" "raptur" "rapturou" "reveri" "revery" "reviv" "seer" "sleep" "sleepy" "slumber" "stupor" "swoon" "telepathy" "tranc" "unreason" "vertigo" "visionary" "wak" "woke" )  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '("mad")  t) "\\>")

      brink-passage  (concat "\\<" (regexp-opt '("acces" "aisl" "aqueduct" "arteri" "artery" "avenu" "barrier" "border" "boundari" "boundary" "bridg" "brim" "brink" "canal" "channel" "coast" "conduit" "corridor" "curb" "door" "doorstep" "doorway" "edg" "entranc" "entry" "fenc" "ferri" "ferry" "floor" "footpath" "foyer" "fram" "fring" "frontier" "gate" "gating" "hall" "hallway" "highway" "horizon" "lane" "lanes" "ledg" "line" "lined" "lines" "lining" "margin" "passag" "passageway" "path" "perimet" "peripher" "port" "railroad" "railway" "rim" "rimm" "rims" "road" "rout" "sidewalk" "skylin" "stair" "step" "street" "threshold" "trail" "verg" "viaduct" "vista" "wall" "window" )  t) "[A-Za-z]*\\>")

      narcissism  (concat "\\<" (regexp-opt '("arm" "arms" "beard" "blood" "bodi" "body" "bone" "bones" "brain" "brow" "brows" "cheek" "chest" "chin" "corps" "eye" "face" "faces" "facies" "feet" "flesh" "foot" "forehead" "hair" "hand" "head" "heart" "heel" "hip" "hips" "kidney" "knee" "knees" "leg" "legs" "limb" "liver" "muscl" "narciss" "navel" "neck" "organ" "palm" "rib" "ribs" "shoulder" "skin" "skull" "thumb" "toe" "toes" "vein" "wrist" )  t) "[A-Za-z]*\\>")

      concreteness  (concat "\\<" (regexp-opt '("acros" "afar" "afield" "ahead" "along" "among" "apart" "asid" "away" "back" "behind" "besid" "between" "center" "centr" "circl" "close" "closer" "corner" "concret" "curv" "distanc" "distant" "east" "eastern" "everywher" "extend" "extensiv" "extent" "far" "farther" "flat" "forward" "front" "further" "hither" "insid" "interior" "layer" "length" "level" "long" "middl" "midst" "narrow" "near" "nearby" "nearer" "nearest" "off" "open" "out" "outing" "outs" "outsid" "outward" "over" "plac" "point" "posit" "rear" "region" "round" "separat" "side" "sided" "sides" "siding" "situat" "somewher" "south" "spac" "spaciou" "spatial" "squar" "straight" "surfac" "surround" "thenc" "thither" "tip" "toward" "west" "western" "wher" "wide" "width" "within" )  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '("at" "here")  t) "\\>")

      icarian-ascend  (concat "\\<" (regexp-opt '("aloft" "aris" "arisen" "aros" "ascend" "ascens" "bounc" "climb" "dangl" "dawn" "flap" "fled" "flew" "flier" "flight" "fling" "float" "flown" "flung" "flutter" "fly" "hang" "hover" "hurl" "icarian" "icaru" "jump" "leap" "lept" "lift" "mount" "mountainsid" "rise" "risen" "rises" "rising" "soar" "sprang" "spring" "sprung" "sunris" "swing" "threw" "throw" "thrown" "toss" "uphill" "upward" "wing" )  t) "[A-Za-z]*\\>")

      icarian-height  (concat "\\<" (regexp-opt '("abov" "aerial" "airplan" "arch" "atmospher" "balcony" "battlement" "bird" "branch" "ceil" "cliff" "crag" "craggy" "dome" "domes" "doming" "elevat" "erect" "grew" "grow" "grown" "heap" "heaven" "height" "high" "higher" "hill" "hillsid" "hilltop" "hung" "ladder" "loft" "lofty" "mound" "mountain" "obelisk" "overhead" "peak" "pile" "piling" "planet" "precipic" "pyramid" "rafter" "rainbow" "rampart" "ridg" "roof" "sky" "slop" "spir" "steep" "summit" "tall" "taller" "tallest" "top" "topp" "tops" "tower" "tree" "trelli" "upper" "uppermost" "zenith" )  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '("up")  t) "\\>")

      icarian-descent  (concat "\\<" (regexp-opt '("base" "bases" "buri" "burrow" "bury" "descend" "descent" "dig" "digg" "digs" "dip" "dipp" "dips" "dive" "downhill" "downstream" "droop" "drop" "drops" "dug" "fall" "fallen" "fell" "headlong" "lean" "plung" "reced" "reclin" "sank" "sink" "slid" "slip" "stoop" "sundown" "sunk" "sunken" "sunset" "swoop" "toppl" "tumbl")  t) "[A-Za-z]*\\>")

      icarian-depth  (concat "\\<" (regexp-opt '("below" "beneath" "bottom" "canyon" "cave" "caving" "cellar" "chasm" "crevas" "deep" "deeper" "depth" "ditch" "down" "downward" "gutter" "hole" "holes" "low" "pit" "pits" "pitt" "precipitou" "ravin" "root" "submarin" "trench" "tunnel" "under" "underground" "underneath" "underworld" "valley" )  t) "[A-Za-z]*\\>")

      icarian-fire  (concat "\\<" (regexp-opt '("solar" "ablaz" "afir" "ash" "ashes" "blast" "blaz" "boil" "broil" "burn" "burnt" "candl" "charcoal" "coal" "combust" "ember" "fiery" "fire" "flam" "hearth" "heat" "hot" "ignit" "inferno" "inflam" "kindl" "lit" "melt" "scorch" "sear" "sizzl" "smok" "smolder" "smoulder" "spark" "sultry" "sun" "sunn" "suns" "sunstrok" "tropic" "tropical" "warm" "warmth" )  t) "[A-Za-z]*\\>")

      icarian-water  (concat "\\<" (regexp-opt '("bath" "beach" "brook" "bubbl" "bucket" "creek" "dam" "damm" "damp" "dams" "dew" "dews" "dewy" "dike" "downpour" "drench" "shoring" "surf" "surfing" "drip" "fen" "flood" "fluid" "foam" "fountain" "gurgl" "humid" "lake" "lakes" "liquid" "moat" "moist" "moistur" "moss" "mosses" "ocean" "overflow" "perspir" "perspirat" "pond" "pool" "pour" "rain" "rainfall" "river" "saturat" "sea" "seas" "shore" "shores" "shower" "soak" "splash" "sprinkl" "steam" "steamy" "stream" "swam" "swamp" "swampy" "swim" "swum" "tide" "tides" "tiding" "trickl" "wade" "wading" "wash" "water" "waterfall" "wet")  t) "[A-Za-z]*\\>")

      abstract-thought  (concat "\\<" (regexp-opt '("diverse" "diversification" "diversified" "diversity" "evident" "evidential" "guess" "logistic" "abstract" "almost" "alternativ" "analy" "attribut" "axiom" "basic" "belief" "believ" "calculat" "caus" "certain" "characteriz" "choic" "choos" "chos" "circumstanc" "comprehend" "compar" "comprehens" "conditional" "concentrat" "concept" "conclud" "conjectur" "consequenc" "consequent" "consider" "contriv" "criter" "criteria" "decid" "deem" "defin" "deliberat" "determin" "differenc" "different" "distinct" "distinguish" "doctrin" "effect" "establish" "estimat" "evaluat" "evidenc" "examin" "exampl" "except" "fact" "facts" "featur" "figur" "forethought" "formulat" "gues" "history" "idea" "importanc" "important" "informat" "interpret" "interpretat" "judg" "judgment" "knew" "know" "learn" "logic" "may" "meant" "mistak" "mistaken" "mistook" "model" "opin" "otherwis" "perhap" "plan" "possi" "predicat" "predict" "probab" "probabl" "problem" "proof" "prov" "purpos" "quali" "quant" "re-analy" "re-examin" "rational" "real" "reality" "reason" "reasonabl" "reconsider" "reexamin" "reformulat" "reinterpretat" "relearn" "relevanc" "relevant" "research" "resolv" "schem" "scienc" "scientific" "select" "significanc" "solut" "someth" "somewhat" "sourc" "subject" "suppos" "sure" "surely" "tend" "them" "theor" "think" "thinker" "thought" "topic" "true" "truly" "truth" "ttt1" "understand" "understood" "weigh" "weighed" "weighing" "weighs" "why" )  t) "[A-Za-z]*\\>")

      social-behavior  (concat "\\<" (regexp-opt '("guest" "quota" "quota-" "quotas" "acquiescence" "approbation" "consensus" "consult" "prosocial" "sociable" "able" "accept" "acceptanc" "addres" "admit" "advic" "advis" "agre" "aid" "allow" "announc" "answer" "apologis" "apologiz" "appeal" "approv" "approval" "ask" "asked" "asking" "asks" "assist" "assur" "bargain" "beckon" "beseech" "borrow" "call" "comment" "commit" "communicat" "conduct" "confer" "confes" "confid" "confirm" "congratulat" "consent" "consol" "consolat" "convers" "conversat" "convinc" "cooperat" "counsel" "declar" "depend" "dependent" "describ" "dialogu" "discours" "discus" "discuss" "donat" "educat" "elect" "encourag" "encouragement" "engag" "escort" "excus" "explain" "follow" "forgav" "forgiv" "forgiven" "generosity" "generou" "gift" "grant" "greet" "guid" "guidanc" "help" "imitat" "implor" "influenc" "inform" "inquir" "instruct" "interview" "introduc" "invit" "kneel" "lend" "lent" "meet" "ment" "messag" "met" "mutual" "offer" "pardon" "participat" "persuad" "persua" "plead" "pleas" "preach" "proclaim" "promis" "propos" "protect" "provid" "quot" "recit" "reeducation" "remark" "remind" "repli" "reply" "represent" "request" "rescu" "respond" "respons" "said" "sale" "sales" "say" "servic" "shar" "shelter" "signal" "social" "solicit" "speak" "speaker" "speech" "spok" "spoken" "suggest" "sworn" "talk" "taught" "teach" "tell" "thank" "told" "treat" "utter" "visit" )  t) "[A-Za-z]*\\>")

      instrumental-behavior  (concat "\\<" (regexp-opt '("avail" "caveat" "divestment" "dividend" "foundr" "laborator" "spin-off" "availability" "component" "ingredient" "logistics" "merchandise" "provision" "achiev" "achievement" "acquir" "acquisit" "afford" "aim" "applic" "applie" "apply" "architect" "assembl" "attain" "attempt" "availabl" "belong" "bid" "bought" "build" "built" "burden" "busines" "buy" "capabl" "carri" "carry" "claim" "collect" "construct" "copi" "copy" "cost" "count" "craft" "craftsman" "cultivat" "cure" "curing" "deliver" "earn" "effort" "employ" "endeavor" "factori" "factory" "feat" "feats" "find" "finish" "forge" "forges" "found" "gain" "goal" "grasp" "harvest" "hire" "hired" "hires" "hiring" "improv" "industri" "industry" "instrument" "job" "jobs" "labor" "laboriou" "labour" "labouriou" "lesson" "machin" "machinery" "mak" "manipulat" "manufactur" "market" "mend" "merchant" "money" "obtain" "occupat" "occupy" "ownership" "paid" "pay" "paying" "pays" "perform" "pick" "plough" "plow" "posses" "possess" "practic" "prepar" "pric" "privation" "produc" "profit" "profitabl" "property" "purchas" "pursu" "reach" "reconstruct" "record" "recover" "repair" "reproduce" "restor" "result" "risk" "sel" "sell" "skil" "skill" "skillful" "sold" "sow" "spend" "spent" "student" "studi" "studiou" "study" "succe" "sweep" "swept" "task" "test" "toil" "toiled" "toils" "trad" "tried" "try" "trying" "trys" "use" "used" "uses" "using" "win" "winning" "wins" "won" "work" )  t) "[A-Za-z]*\\>")

      restraint  (concat "\\<" (regexp-opt '("comptroller" "discipline" "magist" "penaliz" "peniten*(ciary" "arrest" "assign" "authoriz" "bar" "barred" "barring" "bars" "bind" "block" "blockad" "bound" "cag" "captiv" "captivity" "captur" "catch" "caught" "censur" "chastis" "chastiz" "coerc" "compel" "confin" "conform" "conformity" "constrain" "constraint" "constrict" "control" "decree" "detain" "deter" "dungeon" "enclos" "forbad" "forbid" "forbidden" "guard" "guardian" "halt" "hamper" "hinder" "hindranc" "imperativ" "imprison" "inhibit" "insist" "interfer" "interrupt" "jail" "leash" "limit" "lock" "manag" "must" "necessary" "necessity" "obedienc" "obey" "oblig" "obligat" "obstacl" "obstruct" "penalti" "penalty" "permiss" "permit" "polic" "policeman" "policemen" "prescrib" "prevail" "prevent" "prison" "prohibit" "punish" "punishment" "refus" "regulat" "reign" "requir" "requirement" "resist" "restrain" "restraint" "restrict" "scold" "shut" "stop" "strict" "summon" "suppres" "taboo" "tax" "thwart" )  t) "[A-Za-z]*\\>")

      order  (concat "\\<" (regexp-opt '("ordinal" "accurat" "arrang" "array" "balanc" "catalog" "class" "consistenc" "consistent" "constanc" "constant" "divid" "form" "formula" "grad" "index" "list" "measur" "method" "moderat" "neat" "norm" "normal" "organi" "order" "pattern" "precis" "rank" "regular" "reorganiz" "routin" "serial" "series" "simpl" "simplicity" "stability" "standard" "symmetr" "system" "uniform" "universal" )  t) "[A-Za-z]*\\>")

      temporal-representation  (concat "\\<" (regexp-opt '("full-time" "long-term" "longevit" "part-time" "short-term" "abrupt" "again" "ago" "already" "ancient" "brevity" "brief" "clock" "daily" "date" "dated" "dates" "dating" "decad" "dur" "durat" "earlier" "early" "ephemeral" "ever" "former" "frequent" "hast" "henceforth" "hour" "immediat" "immediate" "instant" "interlud" "meantim" "meanwhil" "minut" "moment" "momentary" "month" "now" "occas" "occasional" "often" "old" "older" "once" "past" "prematur" "present" "previou" "prior" "quick" "season" "seldom" "sometim" "soon" "sooner" "sudden" "temporary" "then" "till" "time" "timing" "today" "tonight" "week" "when" "whenever" "whil" "year" "yesterday" )  t) "[A-Za-z]*\\>")

      moral-imperative  (concat "\\<" (regexp-opt '("legitimacy" "respect" "birthright" "commandment" "conscienc" "conscientiou" "correct" "custom" "customer" "customiz" "duti" "duty" "ethic" "honest" "honesty" "honor" "honorabl" "honour" "honourabl" "justic" "law" "lawful" "laws" "legal" "legitimat" "moral" "morality" "ought" "prerogativ" "principl" "privileg" "proper" "rectitud" "respectful" "responsibility" "responsibl" "right" "righteou" "rightful" "sanct" "should" "trustworthy" "unjust" "upright" "virtu" "emotions" )  t) "[A-Za-z]*\\>")

      positive-affect  (concat "\\<" (regexp-opt '("amus" "amusement" "blith" "carefre" "celebrat" "cheer" "cheerful" "cheery" "chuckl" "delight" "delightful" "elat" "enjoy" "enjoyabl" "enjoyment" "entertain" "entertainment" "enthusiasm" "enthusiastic" "excit" "exhilerat" "exult" "exultant" "fun" "funny" "gaiety" "gay" "glad" "gladnes" "glee" "gleeful" "gleely" "gratifi" "gratify" "grin" "happines" "happy" "hilariou" "humor" "humorou" "humour" "humourou" "jocund" "jok" "jolly" "jovial" "joy" "joyful" "joyou" "laugh" "laughter" "merriment" "merry" "mirth" "mirthful" "overjoy" "playful" "pleasantry" "pleasur" "pleasurabl" "rejoic" "relief" "reliev" "rollick" "satisf" "smil" "thril" "thrill" "vivaciou" "vivacity" )  t) "[A-Za-z]*\\>")

      anxiety  (concat "\\<" (regexp-opt '("tremor" "afraid" "aghast" "alarm" "anguish" "anxi" "avoid" "blush" "cares" "coward" "cower" "crisi" "dangerou" "desperat" "distres" "dread" "dreadful" "fear" "fearful" "frantic" "fret" "fright" "horrifi" "horrify" "horror" "nervou" "nervousnes" "panic" "phobia" "phobic" "scare" "scared" "scares" "scary" "shriek" "shudder" "shy" "terrifi" "terrify" "terror" "timid" "trauma" "trembl" "tremulou" "troubl" "uneasines" "uneasy" "worri" "worry" )  t) "[A-Za-z]*\\>")

      sadness  (concat "\\<" (regexp-opt '("aggrieved" "alas" "deject" "depres" "depress" "despair" "despondant" "despondent" "dirg" "disappoint" "disappointment" "disconsolat" "discourag" "dishearten" "dismal" "dissatisfi" "dissatisfy" "distraught" "doldrum" "downcast" "dreary" "elegy" "forlorn" "frown" "funereal" "grie" "groan" "hopeles" "humiliat" "lament" "lamentat" "lone" "lonelines" "melanc" "miserabl" "miseri" "misery" "moan" "mourn" "mournful" "orphan" "pain" "pitiful" "plaint" "regret" "regretful" "remors" "repent" "repentanc" "repentenc" "rue" "sad" "sadden" "sadly" "sadnes" "sob" "sobb" "sobs" "somber" "sombr" "sorrow" "sorrowful" "sorry" "suffer" "tearful" "tragedy" "tragic" "unhappines" "unhappy" "wail" "weep" "wept" "whin" "woe" "woes" )  t) "[A-Za-z]*\\>")

      affection  (concat "\\<" (regexp-opt '("adore" "affect" "affectionat" "amorou" "amourou" "appreciat" "attractiv" "befriend" "belov" "bosom" "bridal" "bride" "cherish" "congenial" "cordial" "courtship" "darl" "dear" "devot" "embrac" "enamor" "enamour" "endear" "familiar" "fonder" "farewell" "favor" "favour" "fianc" "flirt" "fond" "fondnes" "fraternity" "friend" "friendship" "goodby" "grateful" "intimacy" "intimat" "kindnes" "liking" "lov" "marri" "marriag" "marry" "mate" "mated" "mates" "mating" "mercy" "pat" "pats" "patt" "piti" "pity" "romanc" "sweetheart" "sympat" "unselfish" "warmheart" "welcom" "wooed" "wooing" "woos" )  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '("kind")  t) "\\>")

      aggression  (concat "\\<" (regexp-opt '("abhor" "abus" "abusiv" "accus" "afflict" "aggress" "aggressiv" "ambush" "anger" "angri" "angrier" "angry" "annihilat" "annoy" "annoyanc" "antagoniz" "argu" "argument" "army" "arrow" "assault" "attack" "aveng" "ax" "axe" "axes" "battl" "beak" "beat" "beaten" "betray" "blade" "blam" "bloody" "bother" "brawl" "brok" "broken" "brutal" "cannon" "chid" "combat" "complain" "conflict" "condemn" "controversy" "critic" "cruel" "crush" "cut" "damag" "decei" "defeat" "degrad" "demolish" "depriv" "derid" "despis" "destroy" "destruct" "destructiv" "detest" "disagre" "disagreement" "disapprov" "discontent" "dislik" "disput" "disturb" "doubt" "enemies" "enemy" "enrag" "exasperat" "controversial" "critique" "disparag" "football" "irritable" "exploit" "exterminat" "feud" "fierc" "fight" "fought" "furiou" "fury" "gash" "grappl" "growl" "grudg" "gun" "gunn" "guns" "harm" "harsh" "hate" "hatr" "hit" "hits" "hitt" "homicid" "hostil" "hurt" "ingrat" "injur" "injury" "insult" "invad" "invas" "irat" "irk" "irritat" "jealou" "jealousy" "jeer" "kick" "kil" "kill" "knif" "kniv" "loath" "maim" "mistreat" "mock" "murder" "obliterat" "offend" "oppos" "predatory" "protest" "quarrel" "rage" "rages" "raging" "rapin" "rebel" "rebell" "rebuk" "relentles" "reproach" "resent" "resentment" "retribut" "reveng" "revolt" "ridicul" "rip" "ripp" "rips" "rob" "robb" "robs" "sarcasm" "sarcastic" "scalp" "scof" "scoff" "scourg" "seiz" "sever" "severity" "shatter" "shoot" "shot" "shov" "slain" "slander" "slap" "slaughter" "slay" "slew" "smash" "snarl" "sneer" "spear" "spiteful" "spurn" "steal" "stol" "stolen" "strangl" "strif" "strik" "struck" "struggl" "stubborn" "sword" "taunt" "temper" "threat" "threaten" "tore" "torment" "torn" "tortur" "traitor" "trampl" "treacherou" "treachery" "tyrant" "unkind" "vengeanc" "vengeful" "vex" "vexing" "violat" "violenc" "violent" "warring" "warrior" "weapon" "whip" "wound" "wrath" "wreck" )  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '("break" "stab" "war" "wars")  t) "\\>")

      expressive-behavior  (concat "\\<" (regexp-opt '("art" "arts" "bard" "bark" "bawl" "bellow" "bleat" "carol" "chant" "clown" "crie" "criing" "cry" "danc" "exclaim" "expressiv" "frisk" "frolic" "game" "guitar" "harp" "horn" "hurrah" "hurray" "lullaby" "lute" "lyre" "minstrel" "neigh" "neighs" "painter" "play" "poem" "poet" "poetic" "poetry" "roar" "sang" "scream" "shout" "sigh" "sings" "sport" "sung" "troubador" "troubadour" "violin" "warbl" )  t) "[A-Za-z]*\\>" "\\|" "\\<" (regexp-opt '("sing" "yell")  t) "\\>")

      glory (concat "\\<" (regexp-opt '("admir" "admirabl" "adventur" "applaud" "applaus" "arroganc" "arrogant" "audacity" "awe" "boast" "boastful" "brillianc" "brilliant" "caesar" "castl" "conque" "crown" "dazzl" "eagl" "elit" "emperor" "empir" "exalt" "exhibit" "exquisit" "extraordinary" "extrem" "fame" "famed" "famou" "foremost" "geniu" "glor" "gold" "golden" "grandeur" "great" "haughty" "hero" "homag" "illustriou" "kingdom" "magestic" "magnificent" "majestic" "majesty" "nobl" "outstand" "palac" "pomp" "prestig" "prid" "princ" "proud" "renown" "resplendent" "rich" "royal" "royalty" "sceptr" "scorn" "splendid" "splendor" "strut" "sublim" "superior" "superiority" "suprem" "thron" "triump" "victor" "victoriou" "victory" "wealth" "wonder" "wonderful")  t) "[A-Za-z]*\\>")
      )

;;;;;;;;;;;;;;;;;; Begin preliminary mode to provide faces
(defvar rid-mode-hook nil)

(defmacro rid-new-face (name color doc)
  (let ((prop (intern (concat "rid-" (symbol-name name) "-face"))))
    `(progn
       (defvar  ,prop ',prop)
       (defface ,prop '((t (:foreground ,(symbol-name color)))) ,doc))))

(defmacro rid-ul-face (name color doc)
  (let ((prop (intern (concat "rid-" (symbol-name name) "-face"))))
    `(progn
       (defvar  ,prop ',prop)
       (defface ,prop '((t (:foreground ,(symbol-name color) :underline t))) ,doc))))

(defmacro rid-it-face (name color doc)
  (let ((prop (intern (concat "rid-" (symbol-name name) "-face"))))
    `(progn
       (defvar  ,prop ',prop)
       (defface ,prop '((t (:foreground ,(symbol-name color) :slant italic) )) ,doc))))


(defmacro rid-box-face (name color doc)
  (let ((prop (intern (concat "rid-" (symbol-name name) "-face"))))
    `(progn
       (defvar  ,prop ',prop)
       (defface ,prop '((t (:foreground ,(symbol-name color) :box (:line-width 2 :color "grey75" :style none)) )) ,doc))))

(defmacro rid-bold-face (name color doc)
  (let ((prop (intern (concat "rid-" (symbol-name name) "-face"))))
    `(progn
       (defvar  ,prop ',prop)
       (defface ,prop '((t (:foreground ,(symbol-name color) :weight bold) )) ,doc))))

(rid-new-face orality            red              "Primary need: orality") 
(rid-new-face anality            OrangeRed        "Primary need: anality") 
(rid-new-face sex                DarkOrange2      "Primary need: sex") 
(rid-new-face touch              goldenrod1       "Sensation: touch") 
(rid-new-face taste              yellow           "Sensation: taste") 
(rid-new-face odor               LawnGreen        "Sensation: odor") 
(rid-new-face general-sensation  green4           "Sensation: general") 
(rid-new-face sound              LightSeaGreen    "Sensation: sound") 
(rid-new-face vision             DodgerBlue2      "Sensation: vision") 
(rid-new-face cold               purple1          "Sensation: cold")  
(rid-new-face hard               magenta4         "Sensation: hard") 
(rid-new-face soft               MediumVioletRed  "Sensation: soft") 
                                                                           
(rid-bold-face passivity  red                     "Defensive Symbolization: passivity") 
(rid-bold-face voyage  OrangeRed                  "Defensive Symbolization: voyage") 
(rid-bold-face random-movement  DarkOrange2       "Defensive Symbolization: random-movement") 
(rid-bold-face diffusion  goldenrod1              "Defensive Symbolization: diffusion") 
(rid-bold-face chaos  yellow                      "Defensive Symbolization: chaos") 
(rid-bold-face unknown  LawnGreen                 "Regressive Cognition: unknown") 
(rid-bold-face timelessness green4                "Regressive Cognition: timelessness") 
(rid-bold-face consciousness  LightSeaGreen       "Regressive Cognition: consciousness alteration") 
(rid-bold-face brink-passage  DodgerBlue2         "Regressive Cognition: brink-passage") 
(rid-bold-face narcissism  purple1                "Regressive Cognition: narcissism")  
(rid-bold-face concreteness magenta4              "Regressive Cognition: concreteness") 

(rid-box-face ascend  MediumVioletRed             "Icarian imagery: ascend") 
(rid-box-face height  yellow                      "Icarian imagery: height") 
(rid-box-face descent goldenrod1                  "Icarian imagery: descent") 
(rid-box-face depth   purple1                     "Icarian imagery: depth") 
(rid-box-face fire    red                         "Icarian imagery: fire") 
(rid-box-face water   DodgerBlue2                 "Icarian imagery: water") 

(rid-ul-face abstract-thought  LawnGreen          "Secondary process: abstract thought") 
(rid-ul-face social-behavior  green4              "Secondary process: social behavior") 
(rid-ul-face instrumental-behavior  LightSeaGreen "Secondary process: instrumental behavior") 
(rid-ul-face restraint  DodgerBlue2               "Secondary process: restraint") 
(rid-ul-face order  purple1                       "Secondary process: order")  
(rid-ul-face temporal-representation magenta4     "Secondary process: temporal representation") 
(rid-ul-face moral-imperative MediumVioletRed     "Secondary process: moral imperative") 
                                                                           
(rid-it-face anxiety              LawnGreen       "Emotion: anxiety") 
(rid-it-face sadness              DodgerBlue2     "Emotion: sadness") 
(rid-it-face affection            goldenrod1      "Emotion: affection") 
(rid-it-face positive-affect      yellow          "Emotion: positive-affect") 
(rid-it-face aggression           red             "Emotion: aggression") 
(rid-it-face expressive-behavior  OrangeRed       "Emotion: expressive behavior") 
(rid-it-face glory                green4          "Emotion: glory") 

(setq rid-font-lock-keywords
      (list `(,primary-need-orality
              . rid-orality-face)
            `(,primary-need-anality
              . rid-anality-face)
            `(,primary-need-sex
              . rid-sex-face)
            `(,sensation-touch
              . rid-touch-face)
            `(,sensation-taste
              . rid-taste-face)
            `(,sensation-odor
              . rid-odor-face)
            `(,sensation-general
              . rid-general-sensation-face)
            `(,sensation-sound
              . rid-sound-face)
            `(,sensation-vision
              . rid-vision-face)
            `(,sensation-cold
              . rid-cold-face)
            `(,sensation-hard
              . rid-hard-face)
            `(,sensation-soft
              . rid-soft-face)
            `(,passivity
              . rid-passivity-face)
            `(,voyage
              . rid-voyage-face)
            `(,random-movement
              . rid-random-movement-face)
            `(,diffusion
              . rid-diffusion-face)
            `(,chaos
              . rid-chaos-face)
            `(,unknown
              . rid-unknown-face)
            `(,timelessness
              . rid-timelessness-face)
            `(,consciousness
              . rid-consciousness-face)
            `(,brink-passage
              . rid-brink-passage-face)
            `(,narcissism
              . rid-narcissism-face)
            `(,concreteness
              . rid-concreteness-face)
            `(,icarian-ascend
              . rid-ascend-face)
            `(,icarian-height
              . rid-height-face)
            `(,icarian-descent
              . rid-descent-face)
            `(,icarian-depth
              . rid-depth-face)
            `(,icarian-fire
              . rid-fire-face)
            `(,icarian-water
              . rid-water-face)
            `(,abstract-thought
              . rid-abstract-thought-face)
            `(,social-behavior
              . rid-social-behavior-face)
            `(,instrumental-behavior
              . rid-instrumental-behavior-face)
            `(,restraint
              . rid-restraint-face)
            `(,order
              . rid-order-face)
            `(,temporal-representation
              . rid-temporal-representation-face)
            `(,moral-imperative
              . rid-moral-imperative-face)
            `(,positive-affect
              . rid-positive-affect-face)
            `(,anxiety
              . rid-anxiety-face)
            `(,sadness
              . rid-sadness-face)
            `(,affection
              . rid-affection-face)
            `(,aggression
              . rid-aggression-face)
            `(,expressive-behavior
              . rid-expressive-behavior-face)
            `(,glory
              . rid-glory-face)))

(defun rid-document-face ()
  (interactive)
  (message (face-documentation (get-text-property (point) 'face))))

(defvar rid-mode-map (make-sparse-keymap "rid-map"))

(if rid-mode-map
    (let ((km rid-mode-map))
      (define-key km "\C-c\C-c" 'rid-document-face)
))

(define-derived-mode rid-mode text-mode
  "RID"
  "Mode for color-coding words.
\\{rid-mode-map}"
  (set (make-local-variable 'font-lock-defaults)
       '((rid-font-lock-keywords) nil t))
  (font-lock-mode))

;;; rid-mode.el ends here
