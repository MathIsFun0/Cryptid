--I couldn't get Meme Packs to work without crashing
--yes somehow that was harder than RNJoker
--Wip Localization, putting this here since people have expressed interst in this

--[[
Progress:

Decks: Almost [ChatSigna]
    Beta Deck TODO
    Note from Jevonn: Enchanced decks are planned to have their localization done differently, don't worry about these for now
Jokers: Up to Tredecim [HastagGuigui]
Code Cards: Yes [ChatSigna]
Deck Sleeves (requires Decksleeves Mod): No
Boss Blinds: Yes [HastagGuigui]
Spectrals: No
Tarots: No
Dictonary: Yes (except RNJoker) [HastagGuigui]
Editions: Yes [HastagGuigui]
Vouchers: No
Enhancements (aka echo card): No
Tags: No
Other (packs, stickers, etc): No
Misc: No

]] --
return {
    descriptions = {
        Back = {
            b_cry_antimatter = {
                name = "Jeu d'Antimatière",
                text = {
                    "Applique les {C:legendary,E:1}effets{}",
                    "de {C:attention}tous{} les jeux",
                },
            },
	    b_cry_beta = {
                name = "Nostalgic Deck",
                text = {
                    "{C:attention}Joker{} and {C:attention}Consumable{}",
                    "slots are {C:attention}combined",
                    "{C:attention}Nostalgic{} Blinds replace",
                    "their updated Blind"
                },
            },
            b_cry_blank = {
                name = "Jeu à blanc",
                text = {
                    "{C:inactive,E:1}Ne fait rien?",
                },
            },
            b_cry_CCD = {
                name = "Jeu CCD",
                text = {
                    "Chaque carte est aussi",
                    "un consommable {C:attention}aléatoire{}",
                },
            },
            b_cry_conveyor = {
                name = "Jeu Convoyeur",
                text = {
                    "Les Jokers {C:attention}ne peuvent pas{} être déplacés",
                    "A chaque manche,",
                    "{C:attention}copie{} le Joker le plus à droite",
                    "and {C:attention}destroy{} le Joker le plus à gauche",
                },
            },
            b_cry_critical = {
                name = "Jeu Critique",
                text = {
                    "Après chaque main jouée,",
                    "{C:green}#1# chance(s) sur 4{} d'obtenir {X:dark_edition,C:white} ^2 {} Multi",
                    "{C:green}#1# chance(s) sur 8{} d'obtenir {X:dark_edition,C:white} ^0.5 {} Multi",
                },
            },
            b_cry_encoded = {
                name = "Jeu Encodé",
                text = {
                    "Démarre avec un {C:cry_code,T:j_cry_CodeJoker}Joker Code{}",
                    "et un {C:cry_code,T:j_cry_copypaste}Copier/Coller{}",
                    "Seules les {C:cry_code}Cartes Code{} apparaissent dans la boutique",
                },
            },
            b_cry_equilibrium = {
                name = "Jeu de l'Équilibrium",
                text = {
                    "Toutes les cartes ont",
                    "la {C:attention}même chance{}",
                    "d'apparaître dans la boutique,",
                    "démarre la partie avec",
                    "{C:attention,T:v_overstock_plus}Excédent Plus",
                },
            },
            b_cry_glowing = {
                name = "Jeu Brillant", --wtf is glowing? 
                text = {
                    "Multiplie les valeurs de",
                    "tous les Jokers par {X:dark_edition,C:white} X1.25 {}",
                    "quand la Boss Blinde est battue",
                    "{X:cry_jolly,C:white,s:0.8} Jolly#1#Open#1#Winner#1#-#1#wawa#1#person", --peak loc_vars right here
                },
            },
            b_cry_infinite = {
                name = "Jeu Infini",
                text = {
                    "Sélectionne {C:attention}n'importe quel",
                    "nombre de cartes",
                    "Taille de la main {C:attention}+1{} ",
                },
            },
            b_cry_misprint = {
                name = "Jeu Mal Imprimé",
                text = {
                    "La valeur des cartes",
                    "et des mains de poker",
                    "sont {C:attention}aléatoires",
                },
            },
            b_cry_redeemed = {
                name = "Jeu Acheté",
                text = {
                    "Quand un {C:attention}Bon d'Achat{} est acheté,",
                    "gagne son {C:attention}amélioration",
                },
            },
            b_cry_very_fair = {
                name = "Jeu Très Équilibré",
                text = {
                    "{C:blue}-2{} mains, {C:red}-2{} défausses",
                    "à chaque manche",
                    "Les {C:attention}Bons d'Achat{} n'apparaissent",
                    "plus dans la boutique",
                },
            },
            b_cry_wormhole = {
                name = "Jeu Vortex",
                text = {
                    "Démarre avec un Joker {C:cry_exotic}Exotique{C:attention}",
                    "Les Jokers sont {C:attention}20X{} ",
                    "plus susceptiples d'être {C:dark_edition}Négatifs",
                    "{C:attention}-2{} emplacements de Joker",
                },
            },
        },
        Blind = {
            bl_cry_box = {
                name = "La Boîte",
                text = {
                    "Tous les Jokers Communs",
                    "sont affaiblis",
                },
            },
            bl_cry_clock = {
                name = "L'Horloge",
                text = {
                    "+0.1X du score requis toutes",
                    "les 3 secondes passées dans cette Ante",
                },
            },
            bl_cry_hammer = {
                name = "Le Marteau",
                text = {
                    "Toutes les cartes avec un",
                    "rang impair sont affaiblies",
                },
            },
            bl_cry_joke = {
                name = "La Blague",
                text = {
                    "Si le score est >2X plus grand que le score requis,",
                    "saute directement à l'Ante multiple de #1# suivant",
                },
            },
            bl_cry_magic = {
                name = "La Magie",
                text = {
                    "Toutes les cartes avec un",
                    "rang pair sont affaiblies",
                },
            },
            bl_cry_lavender_loop = {
                name = "Boucle Lavande",
                text = {
                    "1.25X du score requis toutes les",
                    "1.5 secondes passées dans cette manche",
                },
            },
            bl_cry_obsidian_orb = {
                name = "Orbe d'Obsidienne",
                text = {
                    "Applique les capacités",
                    "de tous les boss battus",
                },
            },
            bl_cry_oldarm = {
                name = "Bras Nostalgique",
                text = {
                    "4 cartes ou moins",
                    "doivent être jouées",
                },
            },
            bl_cry_oldfish = {
                name = "Poisson Nostalgique",
                text = {
                    "Toutes les mains",
                    "démarrent à 1 Multi",
                },
            },
            bl_cry_oldflint = {
                name = "Silex Nostalgique",
                text = {
                    "Pas de Couleur",
                },
            },
            bl_cry_oldhouse = {
                name = "Maison Nostalgique",
                text = {
                    "Pas de Full",
                },
            },
            bl_cry_oldmanacle = {
                name = "Menottes Nostalgiques",
                text = {
                    "Divise le Mult par",
                    "les Défausses restantes",
                },
            },
            bl_cry_oldmark = {
                name = "Marque Nostalgique",
                text = {
                    "Pas de main",
                    "contenant une Paire",
                },
            },
            bl_cry_oldox = {
                name = "Bœuf Nostalgique",
                text = {
                    "Toutes les mains",
                    "démarrent avec 0 Jetons",
                },
            },
            bl_cry_oldpillar = {
                name = "Pilier Nostalgique",
                text = {
                    "Pas de Quinte",
                },
            },
            bl_cry_oldserpent = {
                name = "Serpent Nostalgique",
                text = {
                    "Divise le Mult par le niveau",
                    "de la main de poker jouée",
                },
            },
            bl_cry_pin = {
                name = "L'Épingle",
                text = {
                    "Tous les Jokers Épiques ou de",
                    "rareté supérieure sont affaiblis",
                },
            },
            bl_cry_pinkbow = {
                name = "Nœud Rose",
                text = {
                    "Le rang des cartes en main ou jouées",
                    "est altéré de manière aléatoire",
                },
            },
            bl_cry_sapphire_stamp = {
                name = "Tampon Saphir",
                text = {
                    "Sélectionnez une carte en plus, déselectionne",
                    "une carte aléatoire avant de compter les points",
                },
            },
            bl_cry_shackle = {
                name = "La Manille",
                text = {
                    "Tous les Jokers Négatifs",
                    "sont affaiblis",
                },
            },
            bl_cry_striker = {
                name = "La Butée", -- the fuck is striker meaning here
                text = {
                    "Tous les Jokers Rares",
                    "sont affaiblis",
                },
            },
            bl_cry_tax = {
                name = "La Taxe",
                text = {
                    "Le score par main est capé à",
                    "0.4X le score requis",
                },
            },
            bl_cry_tornado = {
                name = "Tornade Turquoise",
                text = {
                    "#1# chances sur #2# que",
                    "la main jouée ne score pas",
                },
            },
            bl_cry_trick = {
                name = "La Ruse",
                text = {
                    "Après chaque main, retourne",
                    "les cartes visibles en main",
                },
            },
            bl_cry_vermillion_virus = {
                name = "Virus Vermillion",
                text = {
                    "Un Joker aléatoire est",
                    "remplacé à chaque main",
                },
            },
            bl_cry_windmill = {
                name = "Le Moulin",
                text = {
                    "Tous les Jokers Peu communs",
                    "sont affaiblis",
                },
            },
        },
        Code = {
            c_cry_class = {
                name = "://CLASSE",
                text = {
                    "Convertit {C:cry_code}#1#{} carte sélectionnée",
                    "en une amélioration {C:cry_code}de votre choix{}",
                },
            },
            c_cry_commit = {
                name = "://ENGAGER",
                text = {
                    "Détruit un Joker {C:cry_code}choisi{},",
                    "crée un {C:cry_code}nouveau{} Joker",
                    "de la {C:cry_code}même rareté",
                },
            },
            c_cry_crash = {
                name = "://CRASH",
                text = {
                    "{C:cry_code,E:1}Ne le faites pas.",
                },
            },
            c_cry_delete = {
                name = "://EFFACER",
                text = {
                    "Enlève de manière {C:cry_code}permanente{}",
                    "un objet {C:cry_code}choisi{} de la boutique",
                    "{C:inactive,s:0.8}L'objet n'apparaîtra plus pendant le reste de la partie",
                },
            },
            c_cry_divide = {
                name = "://DIVISER",
                text = {
                    "{C:cry_code}Divise par 2{} tous les prix",
                    "indiqués dans la boutique actuelle",
                },
            },
            c_cry_exploit = {
                name = "://EXPLOITER",
                text = {
                    "La {C:cry_code}prochaine{} main jouée",
                    "est calculée comme la",
                    "main de poker {C:cry_code}choisie{}",
                    "{C:inactive,s:0.8}Les mains secretes doivent être",
                    "{C:inactive,s:0.8}découvertes pour être valides",
                },
            },
            c_cry_hook = {
                name = "ACCROCHER://",
                text = {
                    "Choisis deux Jokers",
                    "qui seront {C:cry_code}Accrochés",
                },
            },
            c_cry_machinecode = {
                name = "://MACHINECODE",
                text = {
                    "",
                },
            },
            c_cry_malware = {
                name = "://MALWARE",
                text = { "Ajoute {C:dark_edition}Glitché{} à toutes", " les cartes {C:cry_code}tenues en main" },
            },
            c_cry_merge = {
                name = "://FUSIONNER",
                text = {
                    "Fusionne un {C:cry_code}consommable{} sélectionné",
                    "avec une {C:cry_code}carte à jouer{} choisie",
                },
            },
            c_cry_multiply = {
                name = "://MULTIPLIER",
                text = {
                    "{C:cry_code}Double{} toutes les valeurs d'un",
                    "{C:cry_code}Joker{} sélectionné jusqu'à",
                    "la fin de la manche",
                },
            },
            c_cry_payload = {
                name = "://CHARGEUTILE",
                text = {
                    "La prochaine Blinde battue",
                    "donnera {C:cry_code}X#1#{} intérêts",
                },
            },
            c_cry_oboe = {
                name = "://DÉCALAGE",
                text = {
                    "Le prochain {C:cry_code}Paquet Booster{} a",
                    "{C:cry_code}#1#{} carte supplémentaire et",
                    "{C:cry_code}#1#{} choix supplémentaire",
                    "{C:inactive}(Currently {C:cry_code}+#2#{C:inactive})",
                },
            },
            c_cry_reboot = {
                name = "://REDÉMARRAGE",
                text = {
                    "Réapprovisionne les {C:blue}Mains{} et les {C:red}Défausses{},",
                    "remet {C:cry_code}toutes{} les cartes dans le deck",
                    "et tire une {C:cry_code}nouvelle{} main",
                },
            },
            c_cry_revert = {
                name = "://REVENIR",
                text = {
                    "Fixe {C:cry_code}l'état du jeu{} au",
                    "départ de {C:cry_code}cet Ante{}",
                },
            },
            c_cry_rework = {
                name = "://REMANIEMENT",
                text = {
                    "Détruit un Joker {C:cry_code}choisi{},",
                    "crée un {C:cry_code}Badge Remaniement{} avec",
                    "une édition {C:cry_code}améliorée{}",
                    "{C:inactive,s:0.8}Les améliorations sont",
	            "{C:inactive,s:0.8}utilisés dans l'ordre de la Collection",
                },
            },
            c_cry_run = {
                name = "://COURIR",
                text = {
                    "Visite la {C:cry_code}boutique",
                    "pendant la {C:cry_code}Blinde",
                },
            },
            c_cry_seed = {
                name = "://GRAINE",
                text = {
                    "Choisit un Joker",
                    "ou une Carte à Jouer",
                    "pour ajouter {C:cry_code}Truqué",
                },
            },
            c_cry_semicolon = {
                name = ";//",
                text = { "Finit la {C:cry_code}Blinde{} non-Boss actuelle", "{C:cry_code}sans{} encaissement" },
            },
            c_cry_spaghetti = {
                name = "://SPAGHETTI",
                text = {
                    "Crée un Joker",
                    "Nourriture {C:cry_code}Glitché",
                },
            },
            c_cry_variable = {
                name = "://VARIABLE",
                text = {
                    "Convertit {C:cry_code}#1#{} cartes sélectionnés",
                    "en un rang {C:cry_code}choisi{}",
                },
            },
        },
        Edition = {
            e_cry_astral = {
                name = "Astrale",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Multi",
                },
            },
            e_cry_blur = {
                name = "Floue",
                text = {
                    "{C:attention}Redéclenche{} cette",
                    "carte {C:attention}1{} fois",
                    "{C:green}#1# chance(s) sur #2#{}",
                    "de la redéclencher {C:attention}#3#{}",
                    "fois de plus",
                },
            },
            e_cry_double_sided = {
                name = "Double-Face",
                text = {
                    "Cette carte peut être",
                    "{C:attention}retournée{} pour révéler",
                    "une autre carte",
                },
            },
            e_cry_glass = {
                name = "Fragile",
                label = "Fragile",
                text = {
                    "{C:white,X:mult} X#3# {} Multi",
                    "{C:green}#1# chance(s) sur #2#{} de",
                    "ne pas {C:red}détruite{} cette carte",
                    "lorsqu'elle est déclenchée",
                },
            },
            e_cry_glitched = {
                name = "Glitchée",
                text = {
                    "Toutes les valeurs de cette carte",
                    "sont {C:dark_edition}randomized{}",
                    "entre {C:attention}X0.1{} et {C:attention}X10{}",
                    "{C:inactive}(si possible){}",
                },
            },
            e_cry_gold = {
                name = "Dorée",
                label = "Dorée",
                text = {
                    "{C:money}+$#1#{} lorsque cette carte",
                    "est utilisée ou déclenchée",
                },
            },
            e_cry_m = {
                name = "Joyeuse",
                text = {
                    "{C:mult}+#1#{} Multi",
                    "Cette carte a l'air",
                    "plutôt {C:attention}joyeuse{}",
                },
            },
            e_cry_mosaic = {
                name = "Mosaïque",
                text = {
                    "{X:chips,C:white} X#1# {} Jetons",
                },
            },
            e_cry_noisy = {
                name = "Bruitée",
                text = {
                    "???",
                },
            },
            e_cry_oversat = {
                name = "Super-saturée",
                text = {
                    "Toutes les valeurs",
                    "de cette carte",
                    "sont {C:attention}doublées{}",
                    "{C:inactive}(si possible)",
                },
            },
        },
        Enhanced = {
            m_cry_echo = {
                name = "Echo Card",
                text = {
                    "{C:green}#2# in #3#{} chance to",
                    "{C:attention}retrigger{} #1# additional",
                    "times when scored",
                },
            },
        },
        Joker = {
            j_cry_altgoogol = {
                name = "Carte Googol Play Nostalgique",
                text = {
                    "Vendre cette carte crée",
                    "{C:attention}1{} copies du {C:attention}Joker{} le plus à gauche",
                    "{C:inactive}(Selon la place disponible){}",
                    "{C:inactive,s:0.8}Ne copie pas les Carte Googol Play Nostalgiques{}",
                },
            },
            j_cry_antennastoheaven = {
                name = "...Like Antennas to Heaven",
                text = {
                    "Ce Joker gagne",
                    "{X:chips,C:white} X#1# {} Jetons lorsqu'un",
                    "{C:attention}7{} or {C:attention}4{} est compté",
                    "{C:inactive}(Actuellement {X:chips,C:white}X#2# {C:inactive} Jetons)",
                },
            },
            j_cry_apjoker = {
                name = "Joker AP",
                text = { "{X:mult,C:white} X#1# {} Multi contre les {C:attention}Blindes de Boss{}" },
            },
            j_cry_big_cube = {
                name = "Gros cube",
                text = {
                    "{X:chips,C:white} X#1# {} Jetons",
                },
            },
            j_cry_biggestm = {
                name = "Énorme",
                text = {
                    "{X:mult,C:white} X#1# {} Multi jusqu'à la fin",
                    "de la manche si la {C:attention}main de poker{}",
                    "est une {C:attention}#2#{}",
                    "{C:inactive}(Actuellement {C:attention}#3#{}{C:inactive}){}",
                    "{C:inactive,s:0.8}Je ne suis pas gros, juste un peu enveloppé.",
                },
            },
            j_cry_blender = {
                name = "Blender",
                text = {
                    "Crée un consommable",
                    "{C:attention}aléatoire{} lorsqu'une",
                    "carte {C:cry_code}Code{} est utilisée",
                    "{C:inactive}(Selon la place disponible){}",
                },
            },
            j_cry_blurred = {
                name = "Joker flou",
                text = {
                    "Gagne {C:blue}+#1#{} main(s) lorsque",
                    "la {C:attention}Blinde{} est sélectionnée",
                },
            },
            j_cry_bonk = {
                name = "Bonk",
                text = {
                    "Chaque {C:attention}Joker{} donne {C:chips}+#1#{} Jetons",
                    "Augmente ce nombre de {C:chips}+#2#{} si la",
                    "{C:attention}main de poker{} jouée est une {C:attention}#3#{}",
                    "{C:inactive,s:0.8}Les Jokers Joyeux donnent{} {C:chips,s:0.8}+#4#{} {C:inactive,s:0.8}jetons{}",
                },
            },
            j_cry_bonusjoker = {
                name = "Joker Bonus",
                text = {
                    "{C:green}#1# chance(s) sur #2#{} pour que chaque",
                    "carte {C:attention}Bonus{} augmente le",
                    "nombre d'emplacements {C:attention}Joker{} or {C:attention}Consommable",
                    "de {C:dark_edition}1{} lorsqu'elle est comptée",
                    "{C:red}Marche deux fois par manche",
                    "{C:inactive,s:0.8}(Les chances sont les mêmes pour les deux cas){}",
                },
            },
            j_cry_booster = {
                name = "Paquet Joker",
                text = {
                    "{C:attention}+#1#{} paquet supplémentaire",
                    "dans la boutique",
                },
            },
            j_cry_boredom = {
                name = "Ennui",
                text = {
                    "{C:green}#1# chance(s) sur #2#{} que",
                    "chaque {C:attention}Joker{} ou {C:attention}carte à jouer{}",
                    "soient {C:attention}redéclenché(e)s{}",
                    "{C:inactive,s:0.8}N'affecte pas d'autres Ennuis{}",
                },
            },
            j_cry_bubblem = {
                name = "M Bulle",
                text = {
                    "Crée un {C:attention}Joker Joyeux {C:dark_edition}Brillant",
                    "si la main jouée contient",
                    "une {C:attention}#1#{}",
                    "puis {C:red,E:2}s'auto-détruit{}",
                },
            },
            j_cry_busdriver = {
                name = "Chauffeur de bus",
                text = {
                    "{C:green}#1# chance(s) sur #3#{}",
                    "pour {C:mult}+#2#{} Multi",
                    "{C:green}1 chance(s) sur 4{}",
                    "pour {C:mult}-#2#{} Multi",
                },
            },
            j_cry_canvas = {
                name = "Canevas",
                text = {
                    "{C:attention}Redéclenche{} tous les {C:attention}Jokers{} à gauche",
                    "une fois pour {C:attention}chaque{C:attention} Joker{} non-{C:blue}Commun",
                    "à droite de ce Joker",
                },
            },
            j_cry_caramel = {
                name = "Caramel",
                text = {
                    "Chaque carte jouée donne",
                    "{X:mult,C:white}X#1#{} Multi lorsqu'elle est comptée",
                    "pour les {C:attention}#2#{} prochaines manches",
                },
            },
            j_cry_chad = {
                name = "Chad",
                text = {
                    "Redéclenche le Joker",
                    "{C:attention}le plus à gauche",
                    "{C:attention}#1#{} fois supplémentaires",
                },
            },
            j_cry_chili_pepper = {
                name = "Chili Pepper",
                text = {
                    "Ce Joker gagne {X:mult,C:white} X#2# {} Multi",
                    "à la fin de la manche,",
                    "{C:red,E:2}s'auto-détruit{} après {C:attention}#3#{} manches",
                    "{C:inactive}(Actuellement{} {X:mult,C:white} X#1# {} {C:inactive}Multi){}",
                },
            },
            j_cry_circulus_pistoris = {
                name = "Circulus Pistoris",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Jetons, {X:dark_edition,C:white}^#1#{} Multi",
                    "s'il reste {C:attention}exactement{}",
                    "#2# mains à jouer",
                },
            },
            j_cry_circus = {
                name = "Cirque",
                text = {
                    "Les Jokers {C:red}Rares{} donnent chacun {X:mult,C:white} X#1# {} Multi",
                    "Les Jokers {C:cry_epic}Épiques{} donnent chacun {X:mult,C:white} X#2# {} Multi",
                    "Les Jokers {C:legendary}Légendaires{} donnent chacun {X:mult,C:white} X#3# {} Multi",
                    "Les Jokers {C:cry_exotic}Exotiques{} donnent chacun {X:mult,C:white} X#4# {} Multi",
                },
            },
            j_cry_CodeJoker = {
                name = "Joker Code",
                text = {
                    "Crée une {C:cry_code}Carte Code",
                    "{C:dark_edition}Négative{} lorsque",
                    "la {C:attention}Blinde{} est sélectionnée",
                },
            },
            j_cry_coin = {
                name = "Crypto-monnaie",
                text = {
                    "Gagne entre",
                    "{C:money}$#1#{} et {C:money}$#2#{} pour",
                    "chaque Joker {C:attention}vendu{}",
                },
            },
            j_cry_compound_interest = {
                name = "Cumul d'intérêts",
                text = {
                    "Gagne {C:money}#1#%{} de votre argent total",
                    "à la fin de la manche,",
                    "augmente de {C:money}#2#%{} après",
                    "chaque paiement",
                },
            },
            j_cry_copypaste = {
                name = "Copier/Coller",
                text = {
                    "Lorsqu'une carte {C:cry_code}Code{} est utilisée,",
                    "{C:green}#1# chance(s) sur #2#{} pour ajouter une copie",
                    "dans votre zone de consommables",
                    "{C:inactive}(Selon la place disponible)",
                },
            },
            j_cry_crustulum = {
                name = "Crustulum",
                text = {
                    "Ce joker gagne {C:chips}+#2#{} Jetons",
                    "par {C:attention}réapprovisionnement{} dans la boutique",
                    "{C:green}Tous les réapprovisionnements sont gratuits{}",
                    "{C:inactive}(Actuellement {C:chips}+#1#{C:inactive} jetons)",
                },
            },
            j_cry_cryptidmoment = {
                name = "Chaîne de M",
                text = {
                    "Vendre cette carte ajoute",
                    "{C:money}$#1#{} à la {C:attention}valeur de vente{}",
                    "de toutes les cartes {C:attention}Joker{}",
                },
            },
            j_cry_cube = {
                name = "Cube",
                text = {
                    "{C:chips}+#1#{} Jetons",
                },
            },
            j_cry_curse = {
                name = "Pleure",
                text = {
                    "{C:edition,E:1}tu ne peux pas {} {C:cry_ascendant,E:1}t'enfuir...{}",
                    "{C:edition,E:1}tu ne peux pas{} {C:cry_ascendant,E:1}te cacher...{}",
                    "{C:dark_edition,E:1}tu ne peux pas m'échapper...{}",
                    "{C:inactive}(Selon la place disponible){}",
                },
            },
            j_cry_cursor = {
                name = "Cursor",
                text = {
                    "This Joker gains {C:chips}+#2#{} Chips",
                    "for each card {C:attention}purchased{}",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                },
            },
            j_cry_cut = {
                name = "Couper",
                text = {
                    "Ce Joker détruit",
                    "une carte {C:cry_code}Code{} aléatoire",
                    "et gagne {X:mult,C:white} X#1# {} Multi",
                    "à la fin de la {C:attention}boutique{}",
                    "{C:inactive}(Actuellement {X:mult,C:white} X#2# {C:inactive} Multi)",
                },
            },
            j_cry_delirious = {
                name = "Joker Délirant",
                text = {
                    "{C:mult}+#1#{} Multi si",
                    "la main jouée",
                    "contient une {C:attention}#2#"
                }
            },
            j_cry_discreet = {
                name = "Discreet Joker",
                text = {
                    "{C:chips}+#1#{} Jetons si",
                    "la main jouée",
                    "contient une {C:attention}#2#"
                }
            },
            j_cry_doodlem = {
                name = "M Croquis",
                text = {
                    "Crée 2 {C:attention}consommables {C:dark_edition}négatifs{}",
                    "lorsque la {C:attention}Blinde{} est sélectionnée",
                    "Crée 1 {C:attention}consommable de plus",
                    "pour chaque {C:attention}Joker Joyeux{}",
                },
            },
            ["j_cry_Double Scale"] = {
                name = "Double Échelle",
                text = {
                    "Les {C:attention}Jokers{} augmentant",
                    "augmentent de manière {C:attention}quadratique",
                    "{C:inactive,s:0.8}(par ex. +1, +3, +6, +10)",
                    "{C:inactive,s:0.8}(grandit comme +1, +2, +3)",
                },
            },
            j_cry_dropshot = {
                name = "Tir Amorti",
                text = {
                    "Ce Joker gagne {X:mult,C:white} X#1# {} Multi pour",
                    "chaque carte {V:1}#2#{} {C:attention}non-comptée{}",
                    "La couleur change toutes les manches",
                    "{C:inactive}(Actuellement {X:mult,C:white} X#3# {C:inactive} Multi)",
                },
            },
            j_cry_dubious = {
                name = "Joker douteux",
                text = {
                    "{C:chips}+#1#{} Jetons si",
                    "la main jouée",
                    "contient une {C:attention}#2#"
                }
            },
            j_cry_duos = {
                name = "Les duos",
                text = {
                    "{X:mult,C:white}X#1#{} Multi si",
                    "la main jouée",
                    "contient une {C:attention}#2#"
                },
            },
            j_cry_duplicare = {
                name = 'Duplicare',
                text = {
                    "Tous les {C:attention}Jokers{} donnent",
                    "{X:dark_edition,C:white}^#1#{} Multi"
                }
            },
            j_cry_effarcire = {
                name = "Effarcire",
                text = {
                    "Tire {C:green}toutes les cartes du deck{} en main",
                    "lorsque la {C:attention}Blinde{} est sélectionnée",
                    "{C:inactive,s:0.8}\"If you can't handle me at my 1x,",
                    "{C:inactive,s:0.8}you don't deserve me at my 2x\"",
                    -- what did they mean by that
                },
            },
            j_cry_energia = {
                name = "Energia",
                text = {
                    "Lorsqu'un {C:attention}Badge{} est obtenu,",
                    "crée {C:attention}#1#{} copies de celui-ci",
                    "et {C:attention}augmente{} le nombre de",
                    "copies de {C:attention}#2#",
                },
            },
            j_cry_equilib = {
                name = "Ace Aequilibrium",
                text = {
                    "Les Jokers apparaissent en utilisant",
                    "l'ordre de la {C:attention}Collection{}",
                    "Crée {C:attention}#1#{} Joker(s) {C:dark_edition}Négatif(s){}",
                    "lorsqu'une main est jouée",
                    "{C:inactive,s:0.8}Les Jokers {C:cry_exotic,s:0.8}Exotiques {C:inactive,s:0.8}ou mieux ne peuvent pas apparaître",
                    "{s:0.8}Dernier Joker généré: {C:attention,s:0.8}#2#",
                },
            },
            j_cry_error = {
                name = "{C:red}ERR{}{C:dark_edition}E{}{C:red}UR{}",
                text = {
                    "",
                },
            },
            j_cry_eternalflame = {
                name = "Flamme éternelle",
                text = {
                    "Ce Joker gagne {X:mult,C:white} X#1# {} Multi",
                    "pour chaque carte {C:attention}vendue{}",
                    "{C:inactive}(Actuellement {X:mult,C:white} X#2# {C:inactive} Multi)",
                },
            },
            j_cry_exoplanet = {
                name = "Exoplanète",
                text = {
                    "Les cartes {C:dark_edition}Holographiques{}",
                    "donnent toutes {C:mult}+#1#{} Multi",
                },
            },
            j_cry_exponentia = {
                name = "Exponentia",
                text = {
                    "Ce Joker gagne {X:dark_edition,C:white} ^#1# {} Multi",
                    "lorsqu'un {X:red,C:white} XMult {} est déclenché",
                    "{C:inactive}(Actuellement {X:dark_edition,C:white} ^#2# {C:inactive} Multi)",
                },
            },
            j_cry_facile = {
                name = "Facile",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Multi si",
                    "les cartes jouées n'ont été marqués",
                    "que {C:attention}#2#{} fois ou moins",
                },
            },
            j_cry_filler = {
                name = "Le filler", -- "english word used in french" moment
                text = {
                    "{X:mult,C:white}X#1#{} Multi si",
                    "la main jouée",
                    "contient une {C:attention}#2#"
                },
            },
            j_cry_fractal = {
                name = "Doigts de fractale",
                text = {
                    "{C:attention}+#1#{} à la limite de sélection de cartes",
                },
            },
            j_cry_flip_side = {
                name = "De l'autre côté",
                text = {
                    "Les jokers {C:dark_edition}Double-face{} utilisent",
                    "aussi leur face arrière pour les effets",
                    "{C:attention}Redéclenche{} tous les jokers {C:dark_edition}Double-Face{}"
                },
            },
            j_cry_foodm = {
                name = "M Fast-food",
                text = {
                    "{C:mult}+#1#{} Multi",
                    "{C:red,E:2}s'auto-détruit{} dans {C:attention}#2#{} manches",
                    "Augmente de {C:attention}#3#{} manche lorsqu'un",
                    "{C:attention}Joker Joyeux{} est {C:attention}vendu{}",
                    "{C:inactive,s:0.8}2 Double Cheese, 2 McChickens{}",
                    "{C:inactive,s:0.8}1 Grande Frite, 20 McNuggets & un muffin{}",
                },
            },
            j_cry_foxy = {
                name = "Joker narquois",
                text = {
                    "{C:chips}+#1#{} Jetons si",
                    "la main jouée",
                    "contient une {C:attention}#2#"
                }
            },
            j_cry_fspinner = {
                name = "Hand spinner",
                text = {
                    "Ce Joker gagne {C:chips}+#2#{} Jetons",
                    "si la main jouée n'est {C:attention}pas{}",
                    "la {C:attention}main de poker{} la plus jouée",
                    "{C:inactive}(Actuellement {C:chips}+#1#{C:inactive} Jetons)",
                },
            },
            j_cry_gardenfork = {
                name = "Garden of Forking Paths",
                text = {
                    "Gagne {C:money}$#1#{} si la {C:attention}main jouée{}",
                    "contient un {C:attention}As{} et un {C:attention}7{}",
                },
            },
            j_cry_gemino = {
                name = "Gemini",
                text = {
                    "{C:attention}Double{} toutes les valeurs",
                    "du {C:attention}Joker{} le plus à gauche",
                    "à la fin de la manche",
                },
            },
            j_cry_giggly = {
                name = "Joker absurde",
                text = {
                    "{C:mult}+#1#{} Multi si",
                    "la main jouée",
                    "contient une {C:attention}#2#"
                }
            },
            j_cry_goldjoker = {
                name = "Joker doré",
                text = {
                    "Gagne {C:money}#1#%{} de l'argent",
                    "total à la fin de la manche",
                    "Le gain augmente de {C:money}#2#%{}",
                    "lorsqu'une carte {C:attention}dorée{}",
                    "est comptée",
                },
            },
            j_cry_googol_play = {
                name = "Carte Googol Play",
                text = {
                    "{C:green}#1# chance(s) sur #2#{} de compter",
                    "{X:red,C:white} X#3# {} Multi",
                },
            },
            j_cry_happy = {
                name = ":D",
                text = {
                    "Crée un {C:attention}Joker{} aléatoire",
                    "à la fin de la manche",
                    "Vendre cette carte",
                    "crée un {C:attention}Joker{} aléatoire",
                    "{C:inactive}(Selon la place disponible){}",
                },
            },
            j_cry_happyhouse = {
                name = "Jolie maison",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Multi seulement après",
                    "avoir joué {C:attention}114{} mains{}",
                    "{C:inactive}(Actuellement #2#/114){}",
                    "{C:inactive,s:0.8}On n'est jamais aussi bien que chez soi !{}",
                },
            },
            j_cry_home = {
                name = "La maison",
                text = {
                    "{X:mult,C:white}X#1#{} Multi si",
                    "la main jouée",
                    "contient une {C:attention}#2#"
                },
            },
            j_cry_hunger = {
                name = "Consomme-able",
                text = {
                    "Gagne {C:money}$#1#{} lorsqu'un",
                    "{C:attention}consommable{} est utilisé",
                },
            },
            j_cry_iterum = {
                name = "Iterum",
                text = {
                    "Redéclenche toutes les cardes",
                    "{C:attention}#2#{} fois,",
                    "chaque carte jouée donne",
                    "{X:mult,C:white} X#1# {} Multi lorsqu'elle est comptée",
                },
            },
            j_cry_jimball = {
                name = "Jimboule",
                text = {
                    "Ce Joker gagne {X:mult,C:white} X#1# {} Multi",
                    "pour chaque main {C:attention}consécutive{} jouée",
                    "tant que votre {C:attention}main de poker{} la plus jouée",
                    "est jouée",
                    "{C:inactive}(Actuellement {X:mult,C:white} X#2# {C:inactive} Multi)",
                },
            },
            j_cry_jollysus = {
                name = "Joker Joyeux?",
                text = {
                    "Crée un Joker {C:dark_edition}Joyeux{}",
                    "quand un joker est {C:attention}vendu{}",
                    "{C:red}Fonctionne une fois par manche{}",
                    "{C:inactive}#1#{}",
                    "{C:inactive,s:0.8}Je vois pas de souci...{}",
                },
            },
            j_cry_kidnap = {
                name = "Kidnapping",
                text = {
                    "Gagne {C:money}$#2#{} à la fin de la manche",
                    "Augmente le gain de {C:money}$#1#{}",
                    "lorsqu'un Joker {C:attention}type {C:mult}multi{} ou",
                    "{C:attention}type chips{} est vendu",
                },
            },
            j_cry_kooky = {
                name = "Joker cinglé",
                text = {
                    "{C:mult}+#1#{} Multi si",
                    "la main jouée",
                    "contient une {C:attention}#2#"
                }
            },
            j_cry_krustytheclown = {
                name = "Krusty le clown",
                text = {
                    "Ce Joker gagne",
                    "{X:mult,C:white} X#1# {} Multi lorsqu'une",
                    "{C:attention}carte à jouer{} est marquée",
                    "{C:inactive}(Actuellement {X:mult,C:white} X#2# {C:inactive} Multi)",
                },
            },
            j_cry_kscope = {
                name = "Kaléidoscope",
                text = {
                    "Ajoute {C:dark_edition}Polychrome{} à",
                    "un {C:attention}Joker{} aléatoire lorsque",
                    "{C:attention}la Blinde de Boss{} est battue",
                },
            },
            j_cry_lightupthenight = {
                name = "Light Up the Night",
                text = {
                    "Chaque {C:attention}7{} ou {C:attention}2{} joué",
                    "donne {X:mult,C:white}X#1#{} Multi lorsqu'il est marqué",
                },
            },
            j_cry_longboi = {
                name = "Monster",
                text = {
                    "Ajoute aux prochaînes versions de",
                    "ce joker {X:mult,C:white}X#1#{} Multi",
                    "à la fin de la manche",
                    "{C:inactive}(Actuellement {X:mult,C:white}X#2#{C:inactive} Multi){}",
                },
            },
            j_cry_loopy = {
                name = "Bouclé",
                text = {
                    "{C:attention}Redéclenche{} tous les jokers",
                    "une fois pour chaque {C:attention}Joker{}",
                    "{C:attention}joyeux{} vendu cette manche",
                    "{C:inactive}(Actuellement {}{C:attention:}#1#{}{C:inactive} redéclenchement(s)){}",
                    "{C:inactive,s:0.8}Y'avait pas assez de place...{}",
                },
            },
            j_cry_lucky_joker = {
                name = "Joker chanceux",
                text = {
                    "Gagne {C:money}$#1#{} à chaque fois qu'une",
                    "carte {C:attention}Chance{} est {C:green}déclenchée",
                },
            },
            j_cry_luigi = {
                name = "Luigi",
                text = {
                    "Tous les Jokers donnent",
                    "{X:chips,C:white} X#1# {} Jetons",
                },
            },
            j_cry_m = {
                name = "m",
                text = {
                    "Ce Joker gagne {X:mult,C:white} X#1# {} Multi",
                    "lorsqu'un {C:attention}Joker joyeux{} est vendu",
                    "{C:inactive}(Actuellement {X:mult,C:white} X#2# {C:inactive} Multi)",
                },
            },
            j_cry_M = {
                name = "M",
                text = {
                    "Crée un {C:attention}Joker joyeux{}",
                    "{C:dark_edition}Négatif{} lorsque",
                    "la {C:attention}Blinde{} est sélectionnée",
                },
            },
            j_cry_macabre = {
                name = "Joker macabre",
                text = {
                    "Lorsque la {C:attention}Blinde{} est sélectionnée,",
                    "détruit chaque {C:attention}Joker{} à part les",
                    "{C:legendary}jokers M{} et {C:attention}jokers joyeux{}",
                    "et crée un {C:attention}joker joyeux{}",
                    "pour chaque carte détruite",
                },
            },
            j_cry_magnet = {
                name = "Magnet frigo",
                text = {
                    "Gagne {C:money}$#1#{} à la fin de la manche",
                    "Le gain est {X:money,C:white} X#2# {} s'il y a",
                    "{C:attention}#3#{} cartes {C:attention}Joker{} ou moins",
                },
            },
            j_cry_manic = {
                name = "Joker maniaque",
                text = {
                    "{C:mult}+#1#{} Multi si",
                    "la main jouée",
                    "contient une {C:attention}#2#"
                }
            },
            j_cry_mario = {
                name = "Mario",
                text = {
                    "Redéclenche tous les Jokers",
                    "{C:attention}#1#{} fois de plus",
                },
            },
            j_cry_maximized = {
                name = "À donf",
                text = {
                    "Toutes les cartes {C:attention}Figure{}",
                    "sont considérés des {C:attention}Rois{},",
                    "toutes les cartes {C:attention}numérotées{}",
                    "sont considérées des {C:attention}10{}",
                },
            },
            j_cry_maze = {
                name = "Labyrinthe",
                text = {
                    "Toutes les mains sont considérées la",
                    "{C:attention}première main{} de chaque manche,",
                    "toutes les défausses sont considérées la",
                    "{C:attention}première défausse{} de chaque manche",
                },
            },
            j_cry_Megg = {
                name = "Mœuf",
                text = {
                    "Vendre cette carte crée",
                    "{C:attention}#2#{} jokers joyeux #3#, augmente",
                    "de {C:attention}#1#{} à la fin de la manche",
                },
            },
            j_cry_membershipcard = {
                name = "Carte de membre",
                text = {
                    "{X:mult,C:white}X#1#{} Multi pour chaque membre",
                    "dans le {C:attention}serveur Discord{} de {C:attention}Cryptid{}",
                    "{C:inactive}(Actuellement {X:mult,C:white}X#2#{C:inactive} Multi)",
                    "{C:blue,s:0.7}https://discord.gg/eUf9Ur6RyB{}",
                },
            },
            j_cry_membershipcardtwo = {
                name = "Vieille carte de membre", --Could probably have a diff Name imo
                text = {
                    "{C:chips}+#1#{} Jetons pour chaque membre",
                    "dans le {C:attention}serveur Discord{} de {C:attention}Cryptid{}",
                    "{C:inactive}(Actuellement {C:chips}+#2#{C:inactive} Jetons)",
                    "{C:blue,s:0.7}https://discord.gg/eUf9Ur6RyB{}",
                },
            },
            j_cry_meteor = {
                name = "Pluie de météores",
                text = {
                    "Les cartes {C:dark_edition}Brillantes{} donnent",
                    "chacun {C:chips}+#1#{} Jetons",
                },
            },
            j_cry_mneon = {
                name = "M Néon",
                text = {
                    "Gagne {C:money}$#2#{} à la fin de la manche",
                    "Augmente le prix de",
                    "{C:money}$#1#{} pour tous les {C:attention}jokers joyeux{}",
                    "ou {C:attention}légendaires{} à la fin de la manche",
                    "{C:inactive}(Augmentation minimum de{} {C:money}$1{}{C:inactive}){}",
                },
            },
            j_cry_mondrian = {
                name = "Mondrian",
                text = {
                    "Ce Joker gagne {X:mult,C:white} X#1# {} Multi",
                    "si aucune {C:attention}défausse{} n'a été",
                    "utilisée cette manche",
                    "{C:inactive}(Actuellement {X:mult,C:white} X#2# {C:inactive} Multi)",
                },
            },
            j_cry_monkey_dagger = {
                name = "Dague du singe",
                text = {
                    "Lorsque la {C:attention}Blinde{} est sélectionnée,",
                    "détruit le Joker situé à sa gauche",
                    "et augmente ces {C:mult}Jetons{} de {C:attention}dix fois{}",
                    "la valeur de vente du Joker détruit",
                    "{C:inactive}(Actuellement {C:chips}+#1#{C:inactive} Jetons)",
                },
            },
            j_cry_morse = {
                name = "Code morse",
                text = {
                    "Gagne {C:money}$#2#{} à la fin de la manche",
                    "Augmente le gain de {C:money}$#1#{} lorsqu'une",
                    "carte avec une {C:attention}Édition{} est vendue",
                },
            },
            j_cry_mprime = {
                name = "Tredecim",
                text = {
                    "Crée un {C:legendary}Joker M{} à la fin de la manche",
                    "Chaque {C:attention}Joker joyeux{} ou {C:legendary}Joker M",
                    "donne {X:dark_edition,C:white}^#1#{} Multi",
                    "Augmente ce nombre de {X:dark_edition,C:white}^#2#{}",
                    "lorsqu'un {C:attention}Joker joyeux{} est {C:attention}vendu",
                    "{C:inactive,s:0.8}(Tredecim exclu)",
                },
            }, -- currently translated part ends here
            j_cry_mstack = {
                name = "M Stack",
                text = {
                    "Retrigger all cards played",
                    "once for every",
                    "{C:attention}#2#{} {C:inactive}[#3#]{} {C:attention}Jolly Jokers{} sold",
                    "{C:inactive}(Currently{}{C:attention:} #1#{}{C:inactive} retriggers){}",
                },
            },
            j_cry_multjoker = {
                name = "Mult Joker",
                text = {
                    "{C:green}#1# in #2#{} chance for each",
                    "played {C:attention}Mult{} card to create",
                    "a {C:spectral}Cryptid{} card when scored",
                    "{C:inactive}(Must have room)",
                },
            },
            j_cry_negative = {
                name = "Negative Joker",
                text = {
                    "{C:dark_edition}+#1#{C:attention} Joker{} slots",
                },
            },
            j_cry_nice = {
                name = "Nice",
                text = {
                    "{C:chips}+#1#{} Chips if played hand",
                    "contains a {C:attention}6{} and a {C:attention}9",
                    "{C:inactive,s:0.8}Nice.{}",
                },
            },
            j_cry_night = {
                name = "Night",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Mult on final",
                    "hand of round",
                    "{E:2,C:red}self destructs{} on",
                    "final hand of round",
                },
            },
            j_cry_nosound = {
                name = "No Sound, No Memory",
                text = {
                    "Retrigger each played {C:attention}7{}",
                    "{C:attention:}#1#{} additional time(s)",
                },
            },
            j_cry_notebook = {
                name = "Notebook",
                text = {
                    "{C:green} #1# in #2#{} chance to gain {C:dark_edition}+1{} Joker",
                    "slot per {C:attention}reroll{} in the shop",
                    "{C:green}Always triggers{} if there are",
                    "{C:attention}#5#{} or more {C:attention}Jolly Jokers{}",
                    "{C:red}Works once per round{}",
                    "{C:inactive}(Currently {C:dark_edition}+#3#{}{C:inactive} and #4#){}",
                },
            },
            j_cry_number_blocks = {
                name = "Number Blocks",
                text = {
                    "Earn {C:money}$#1#{} at end of round",
                    "Increase payout by {C:money}$#2#{}",
                    "for each {C:attention}#3#{} held in hand,",
                    "rank changes every round",
                },
            },
            j_cry_nuts = {
                name = "The Nuts",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                },
            },
            j_cry_nutty = {
                name = "Nutty Joker",
                text = {
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_oldblueprint = {
                name = "Old Blueprint",
                text = {
                    "Copies ability of",
                    "{C:attention}Joker{} to the right",
                    "{C:green}#1# in #2#{} chance this",
                    "card is destroyed",
                    "at end of round",
                },
            },
            j_cry_oldcandy = {
                name = "Nostalgic Candy",
                text = {
                    "Sell this card to",
                    "permanently gain",
                    "{C:attention}+#1#{} hand size",
                },
            },
            j_cry_oldinvisible = {
                name = "Nostalgic Invisible Joker",
                text = {
                    "{C:attention}Duplicate{} a random",
                    "{C:attention}Joker{} every {C:attention}4",
                    "Joker cards sold",
                    "{s:0.8}Nostalgic Invisible Joker Excluded{}",
                    "{C:inactive}(Currently #1#/4){}",
                },
            },
            j_cry_panopticon = {
                name = "Panopticon",
                text = {
                    "All hands are considered the",
                    "{C:attention}last hand{} of each round", -- +$4
                },
            },
            j_cry_pickle = {
                name = "Pickle",
                text = {
                    "When {C:attention}Blind{} is skipped, create",
                    "{C:attention}#1#{} Tags, reduced by",
                    "{C:red}#2#{} when {C:attention}Blind{} is selected",
                },
            },
            j_cry_pirate_dagger = {
                name = "Pirate Dagger",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the right",
                    "and gain {C:attention}one-fourth{} of",
                    "its sell value as {X:chips,C:white} XChips {}",
                    "{C:inactive}(Currently {X:chips,C:white} X#1# {C:inactive} Chips)",
                },
            },
            j_cry_pot_of_jokes = {
                name = "Pot of Jokes",
                text = {
                    "{C:attention}#1#{} hand size,",
                    "increases by",
                    "{C:blue}#2#{} every round",
                },
            },
            j_cry_primus = {
                name = "Primus",
                text = {
                    "This Joker gains {X:dark_edition,C:white} ^#1# {} Mult",
                    "if all cards in played hand are",
                    "{C:attention}Aces{}, {C:attention}2s{}, {C:attention}3s{}, {C:attention}5s{}, or {C:attention}7s{}",
                    "{C:inactive}(Currently {X:dark_edition,C:white} ^#2# {C:inactive} Mult)",
                },
            },
            j_cry_python = {
                name = "Python",
                text = {
                    "This Joker gains",
                    "{X:mult,C:white} X#1# {} Mult when a",
                    "{C:cry_code}Code{} card is used",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_queens_gambit = {
                name = "Queen's Gambit",
                text = {
                    "If {C:attention}poker hand{} is a",
                    "{C:attention}Royal Flush{}, destroy scored",
                    "{C:attention}Queen{} and create a",
                    "{C:dark_edition}Negative {}{C:red}Rare{}{C:attention} Joker{}",
                },
            },
            j_cry_quintet = {
                name = "The Quintet",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                },
            },
            j_cry_redbloon = {
                name = "Red Bloon",
                text = {
                    "Earn {C:money}$#1#{} in {C:attention}#2#{} round#3#",
                    "{C:red,E:2}self destructs{}",
                },
            },
            j_cry_redeo = {
                name = "Redeo",
                text = {
                    "{C:attention}-#1#{} Ante when",
                    "{C:money}$#2#{} {C:inactive}($#3#){} spent",
                    "{s:0.8}Requirements increase",
                    "{C:attention,s:0.8}exponentially{s:0.8} per use",
                    "{C:money,s:0.8}Next increase: {s:1,c:money}$#4#",
                },
            },
            j_cry_rescribere = {
                name = 'Rescribere',
                text = {
                    "When a {C:attention}Joker{} is sold,",
                    "add its effects to",
                    "every other Joker",
                    "{C:inactive,s:0.8}Does not affect other Rescribere{}"
                }
            },
            j_cry_reverse = {
                name = "Reverse Card",
                text = {
                    "Fill all empty Joker slots {C:inactive}(Max 100){}",
                    "with {C:dark_edition}Holographic{} {C:attention}Jolly Jokers{} if",
                    "{C:attention}discarded poker hand{} is a {C:attention}#1#{}",
                    "{C:red,E:2}self destructs{}",
                    "{C:inactive,s:0.8}The ULTIMATE comeback{}",
                },
            },
            j_cry_rnjoker = {
                name = "RNJoker",
                text = {
                    "Randomize abilities each {C:attention}Ante{}",
                },
            },
            j_cry_sacrifice = {
                name = "Sacrifice",
                text = {
                    "Create an {C:green}Uncommon{} Joker",
                    "and 3 {C:attention}Jolly Jokers{} when",
                    "a {C:spectral}Spectral{} card is used",
                    "{C:red}Works once per round{}",
                    "{C:inactive}#1#{}",
                },
            },
            j_cry_sapling = {
                name = "Sapling",
                text = {
                    "After scoring {C:attention}#2#{} {C:inactive}[#1#]{} Enhanced",
                    "cards, sell this card to",
                    "create an {C:cry_epic}Epic{} {C:attention}Joker{}",
                    "{C:inactive,s:0.8}Will create a {C:red,s:0.8}Rare{} {C:attention,s:0.8}Joker{}",
                    "{C:inactive,s:0.8}if {C:cry_epic,s:0.8}Epic{} {C:inactive,s:0.8}Jokers are disabled{}",
                },
            },
            j_cry_savvy = {
                name = "Savvy Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_Scalae = {
                name = "Scalae",
                text = {
                    "Scaling {C:attention}Jokers{} scale",
                    "as a degree-{C:attention}#1#{} polynomial",
                    "raise degree by {C:attention}#2#{}",
                    "at end of round",
                    "{C:inactive,s:0.8}({C:attention,s:0.8}Scalae{C:inactive,s:0.8} excluded)",
                },
            },
            j_cry_scrabble = {
                name = "Scrabble Tile",
                text = {
                    "{C:green}#1# in #2#{} chance to create",
                    "a {C:dark_edition}Jolly {C:green}Uncommon{} Joker",
                    "when hand is played",
                },
            },
            j_cry_seal_the_deal = {
                name = "Seal the Deal",
                text = {
                    "Add a {C:attention}random seal{} to each card",
                    "scored on {C:attention}final hand{} of round",
                },
            },
            j_cry_shrewd = {
                name = "Shrewd Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_silly = {
                name = "Silly Joker",
                text = {
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_smallestm = {
                name = "Tiny",
                text = {
                    "{X:chips,C:white} X#1# {} Chips until end",
                    "of round if {C:attention}poker hand{}",
                    "is a {C:attention}#2#{}",
                    "{C:inactive}(Currently {C:attention}#3#{}{C:inactive}){}",
                    "{C:inactive,s:0.8}ok so basically i'm very smol",
                },
            },
            j_cry_soccer = {
                name = "One for All", --changed the name from latin because this isn't exotic
                text = {
                    "{C:attention}+#1#{} Booster Pack slot",
                    "{C:attention}+#1#{} hand size",
                    "{C:attention}+#1#{} consumable slot",
                    "{C:attention}+#1#{} card in shop",
                },
            },
            j_cry_spaceglobe = {
                name = "Celestial Globe",
                text = {
                    "This Joker gains {X:chips,C:white}X#2#{} Chips",
                    "if {C:attention}poker hand{} is a {C:attention}#3#{},",
                    "Hand changes after increase{}",
                    "{C:inactive}(Currently{} {X:chips,C:white}X#1#{} {C:inactive}Chips){}",
                },
            },
            j_cry_speculo = {
                name = "Speculo",
                text = {
                    "Creates a {C:dark_edition}Negative{} copy",
                    "of a random {C:attention}Joker{}",
                    "at the end of the {C:attention}shop",
                    "{C:inactive,s:0.8}Does not copy other Speculo{}",
                },
            },
            j_cry_stardust = {
                name = "Stardust",
                text = {
                    "{C:dark_edition}Polychrome{} cards",
                    "each give {X:mult,C:white}X#1#{} Mult",
                    "{C:inactive,s:0.8}Effect does not trigger",
                    "{C:inactive,s:0.8}on Stardust",
                },
            },
            j_cry_stella_mortis = {
                name = "Stella Mortis",
                text = {
                    "This Joker destroys a",
                    "random {C:planet}Planet{} card",
                    "and gains {X:dark_edition,C:white} ^#1# {} Mult",
                    "at the end of the {C:attention}shop{}",
                    "{C:inactive}(Currently {X:dark_edition,C:white} ^#2# {C:inactive} Mult)",
                },
            },
            j_cry_subtle = {
                name = "Subtle Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_supercell = {
                name = "Supercell",
                text = {
                    "{X:chips,C:white}X#2#{} Chips, {X:mult,C:white}X#2#{} Mult",
                    "Earn {C:money}$#3#{} at",
                    "end of round",
                },
            },
            j_cry_sus = {
                name = "SUS",
                text = {
                    "At end of round, create",
                    "a {C:attention}copy{} of a random",
                    "card {C:attention}held in hand{},",
                    "destroy all others",
                    "{C:attention,s:0.8}Kings{s:0.8} of {C:hearts,s:0.8}Hearts{s:0.8} are prioritized",
                },
            },
            j_cry_swarm = {
                name = "The Swarm",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                },
            },
            j_cry_sync_catalyst = {
                name = "Sync Catalyst",
                text = {
                    "Balances {C:chips}Chips{} and {C:mult}Mult{}",
                    "{C:inactive,s:0.8}Hey! I've seen this one before!",
                },
            },
            j_cry_tenebris = {
                name = "Tenebris",
                text = {
                    "{C:dark_edition}+#1#{C:attention} Joker{} slots",
                    "Earn {C:money}$#2#{} at end of round",
                },
            },
            j_cry_translucent = {
                name = "Translucent Joker",
                text = {
                    "Sell this card to create",
                    "a {C:attention}Banana Perishable{} copy",
                    "of a random {C:attention}Joker{}",
                    "{s:0.8,C:inactive}(Copy bypasses perish compat)",
                },
            },
            j_cry_tricksy = {
                name = "Tricksy Joker",
                text = {
                    "{C:chips}+#1#{} Chips if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_triplet_rhythm = {
                name = "Triplet Rhythm",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if scoring hand",
                    "contains {C:attention}exactly{} three {C:attention}3s",
                },
            },
            j_cry_unity = {
                name = "The Unity",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#",
                },
            },
            j_cry_universum = {
                name = "Universum",
                text = {
                    "{C:attention}Poker hands{} gain",
                    "{X:red,C:white} X#1# {} Mult and {X:blue,C:white} X#1# {} Chips",
                    "when leveled up",
                },
            },
            j_cry_unjust_dagger = {
                name = "Unjust Dagger",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the left",
                    "and gain {C:attention}one-fifth{} of",
                    "its sell value as {X:mult,C:white} XMult {}",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
                },
            },
            j_cry_verisimile = {
                name = "Non Verisimile",
                text = {
                    "When any probability",
                    "is {C:green}successfully{} triggered,",
                    "this Joker gains {X:red,C:white}XMult{}",
                    "equal to its listed {C:attention}odds",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)",
                },
            },
            j_cry_virgo = {
                name = "Virgo",
                text = {
                    "This Joker gains {C:money}$#1#{} of {C:attention}sell value{}",
                    "if {C:attention}poker hand{} contains a {C:attention}#2#{}",
                    "Sell this card to create a",
                    "{C:dark_edition}Polychrome{} {C:attention}Jolly Joker{} for",
                    "every {C:money}$4{} of {C:attention}sell value{} {C:inactive}(Min 1){}",
                },
            },
            j_cry_wacky = {
                name = "Wacky Joker",
                text = {
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#"
                }
            },
            j_cry_waluigi = {
                name = "Waluigi",
                text = {
                    "All Jokers give",
                    "{X:mult,C:white} X#1# {} Mult",
                },
            },
            j_cry_wario = {
                name = "Wario",
                text = {
                    "All Jokers give",
                    "{C:money}$#1#{} when triggered",
                },
            },
            j_cry_wee_fib = {
                name = "Weebonacci",
                text = {
                    "This Joker gains",
                    "{C:mult}+#2#{} Mult when each played",
                    "{C:attention}Ace{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}8{}",
                    "is scored",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                },
            },
            j_cry_weegaming = {
                name = "2D",
                text = {
                    "Retrigger each played {C:attention}2{}", --wee gaming
                    "{C:attention:}#1#{} additional time(s)", --wee gaming?
                    "{C:inactive,s:0.8}Wee Gaming?{}",
                },
            },
            j_cry_wheelhope = {
                name = "Wheel of Hope",
                text = {
                    "This Joker gains",
                    "{X:mult,C:white} X#1# {} Mult when failing",
                    "a {C:attention}Wheel of Fortune{}",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_whip = {
                name = "The WHIP",
                text = {
                    "This Joker gains {X:mult,C:white} X#1# {} Mult",
                    "if {C:attention}played hand{} contains a",
                    "{C:attention}2{} and {C:attention}7{} of different suits",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
        },
        Planet = {
            c_cry_Klubi = {
                name = "Klubi",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Level up",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "and {C:attention}#3#{}",
                },
            },
            c_cry_Lapio = {
                name = "Lapio",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Level up",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "and {C:attention}#3#{}",
                },
            },
            c_cry_nstar = {
                name = "Neutron Star",
                text = {
                    "Upgrade a random",
                    "poker hand by",
                    "{C:attention}1{} level for each",
                    "{C:attention}Neutron Star{} used",
                    "in this run",
                    "{C:inactive}(Currently{C:attention} #1#{C:inactive}){}",
                },
            },
            c_cry_planetlua = {
                name = "Planet.lua",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "upgrade every",
                    "{C:legendary,E:1}poker hand{}",
                    "by {C:attention}1{} level",
                },
            },
            c_cry_Sydan = {
                name = "Sydan",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Level up",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "and {C:attention}#3#{}",
                },
            },
            c_cry_Timantti = {
                name = "Timantti",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Level up",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "and {C:attention}#3#{}",
                },
            },
        },
        Sleeve = {
            sleeve_cry_ccd_sleeve = {
                name = "CCD Sleeve",
                text = {
                    "Every card is also",
                    "a {C:attention}random{} consumable",
                },
            },
            sleeve_cry_conveyor_sleeve = {
                name = "Conveyor Sleeve",
                text = {
                    "Jokers may {C:attention}not{} be moved",
                    "At start of round,",
                    "{C:attention}duplicate{} rightmost Joker",
                    "and {C:attention}destroy{} leftmost Joker",
                },
            },
            sleeve_cry_critical_sleeve = {
                name = "Critical Sleeve",
                text = {
                    "After each hand played,",
                    "{C:green}1 in 4{} chance for {X:dark_edition,C:white} ^2 {} Mult",
                    "{C:green}1 in 8{} chance for {X:dark_edition,C:white} ^0.5 {} Mult",
                },
            },
            sleeve_cry_encoded_sleeve = {
                name = "Encoded Sleeve",
                text = {
                    "Start with a {C:cry_code,T:j_cry_CodeJoker}Code Joker{}",
                    "and a {C:cry_code,T:j_cry_copypaste}Copy/Paste{}",
                    "Only {C:cry_code}Code Cards{} appear in shop",
                },
            },
            sleeve_cry_equilibrium_sleeve = {
                name = "Balanced Sleeve",
                text = {
                    "All cards have the",
                    "{C:attention}same chance{} of",
                    "appearing in shops,",
                    "start run with",
                    "{C:attention,T:v_overstock_plus}+2 Shop Slots",
                },
            },
            sleeve_cry_infinite_sleeve = {
                name = "Unlimited Sleeve",
                text = {
                    "You can select {C:attention}any",
                    "number of cards",
                    --someone do the hand size thing for me
                },
            },
            sleeve_cry_misprint_sleeve = {
                name = "Misprinted Sleeve",
                text = {
                    "Values of cards",
                    "are {C:attention}randomized",
                },
            },
            sleeve_cry_redeemed_sleeve = {
                name = "Redeemed Sleeve",
                text = {
                    "When a {C:attention}Voucher{} is purchased,",
                    "gain its {C:attention}extra tiers",
                },
            },
            sleeve_cry_wormhole_sleeve = {
                name = "Wormhole Sleeve",
                text = {
                    "Start with an {C:cry_exotic}Exotic{C:attention} Joker",
                    "Jokers are {C:attention}20X{} more",
                    "likely to be {C:dark_edition}Negative",
                    "{C:attention}-2{} Joker slots",
                },
            },
        },
        Spectral = {
            c_cry_analog = {
                name = "Analog",
                text = {
                    "Create {C:attention}#1#{} copies of a",
                    "random {C:attention}Joker{}, destroy",
                    "all other Jokers, {C:attention}+#2#{} Ante",
                },
            },
            c_cry_gateway = {
                name = "Gateway",
                text = {
                    "Create a random",
                    "{C:cry_exotic,E:1}Exotic{C:attention} Joker{}, destroy",
                    "all other Jokers",
                },
            },
            c_cry_hammerspace = {
                name = "Hammerspace",
                text = {
                    "Apply random {C:attention}consumables{}",
                    "as if they were {C:dark_edition}Enhancements{}",
                    "to cards held in hand",
                },
            },
            c_cry_lock = {
                name = "Lock",
                text = {
                    "Remove {C:red}all{} stickers",
                    "from {C:red}all{} Jokers,",
                    "then apply {C:purple,E:1}Eternal{}",
                    "to a random {C:attention}Joker{}",
                },
            },
            c_cry_pointer = {
                name = "POINTER://",
                text = {
                    "Create a card",
                    "of {C:cry_code}your choice",
                    "{C:inactive,s:0.8}(Exotic Jokers #1#excluded)",
                },
            },
            c_cry_replica = {
                name = "Replica",
                text = {
                    "Convert all cards",
                    "held in hand",
                    "to a {C:attention}random{}",
                    "card held in hand",
                },
            },
            c_cry_source = {
                name = "Source",
                text = {
                    "Add a {C:cry_code}Green Seal{}",
                    "to {C:attention}#1#{} selected",
                    "card in your hand",
                },
            },
            c_cry_summoning = {
                name = "Summoning",
                text = {
                    "Create a random",
                    "{C:cry_epic}Epic{} {C:joker}Joker{}, destroy",
                    "one random {C:joker}Joker{}",
                },
            },
            c_cry_trade = {
                name = "Trade",
                text = {
                    "{C:attention}Lose{} a random Voucher,",
                    "gain {C:attention}2{} random Vouchers",
                },
            },
            c_cry_typhoon = {
                name = "Typhoon",
                text = {
                    "Add an {C:cry_azure}Azure Seal{}",
                    "to {C:attention}#1#{} selected",
                    "card in your hand",
                },
            },
            c_cry_vacuum = {
                name = "Vacuum",
                text = {
                    "Removes {C:red}all {C:green}modifications{}",
                    "from {C:red}all{} cards held in hand,",
                    "Earn {C:money}$#1#{} per {C:green}modification{} removed",
                    "{C:inactive,s:0.7}(ex. Enhancements, Seals, Editions)",
                },
            },
            c_cry_white_hole = {
                name = "White Hole",
                text = {
                    "{C:attention}Remove{} all hand levels,",
                    "upgrade {C:legendary,E:1}most played{} poker hand",
                    "by {C:attention}3{} for each removed level",
                },
            },
        },
        Stake = {
            stake_cry_pink = {
                name = "Pink Stake",
                colour = "Pink", --this is used for auto-generated sticker localization
                text = {
                    "Required score scales",
                    "faster for each {C:attention}Ante",
                },
            },
            stake_cry_brown = {
                name = "Brown Stake",
                colour = "Brown",
                text = {
                    "All {C:attention}stickers{} are compatible",
                    "with each other",
                },
            },
            stake_cry_yellow = {
                name = "Yellow Stake",
                colour = "Yellow",
                text = {
                    "{C:attention}Stickers{} can appear on",
                    "all purchasable items",
                },
            },
            stake_cry_jade = {
                name = "Jade Stake",
                colour = "Jade",
                text = {
                    "Cards can be drawn {C:attention}face down{}",
                },
            },
            stake_cry_cyan = {
                name = "Cyan Stake",
                colour = "Cyan",
                text = {
                    "{C:green}Uncommon{} and {C:red}Rare{} Jokers are",
                    "less likely to appear",
                },
            },
            stake_cry_gray = {
                name = "Gray Stake",
                colour = "Gray",
                text = {
                    "Rerolls increase by {C:attention}$2{} each",
                },
            },
            stake_cry_crimson = {
                name = "Crimson Stake",
                colour = "Crimson",
                text = {
                    "Vouchers restock on {C:attention}even{} Antes",
                },
            },
            stake_cry_diamond = {
                name = "Diamond Stake",
                colour = "Diamond",
                text = {
                    "Must beat Ante {C:attention}10{} to win",
                },
            },
            stake_cry_amber = {
                name = "Amber Stake",
                colour = "Amber",
                text = {
                    "{C:attention}-1{} Booster Pack slot",
                },
            },
            stake_cry_bronze = {
                name = "Bronze Stake",
                colour = "Bronze",
                text = {
                    "Vouchers are {C:attention}50%{} more expensive",
                },
            },
            stake_cry_quartz = {
                name = "Quartz Stake",
                colour = "Quartz",
                text = {
                    "Jokers can be {C:attention}Pinned{}",
                    "{s:0.8,C:inactive}(Stays pinned to the leftmost position){}",
                },
            },
            stake_cry_ruby = {
                name = "Ruby Stake",
                colour = "Ruby",
                text = {
                    "{C:attention}Big{} Blinds can become",
                    "{C:attention}Boss{} Blinds",
                },
            },
            stake_cry_glass = {
                name = "Glass Stake",
                colour = "Glass",
                text = {
                    "Cards can {C:attention}shatter{} when scored",
                },
            },
            stake_cry_sapphire = {
                name = "Sapphire Stake",
                colour = "Sapphire",
                text = {
                    "Lose {C:attention}25%{} of current money",
                    "at end of Ante",
                    "{s:0.8,C:inactive}(Up to $10){}",
                },
            },
            stake_cry_emerald = {
                name = "Emerald Stake",
                colour = "Emerald",
                text = {
                    "Cards, packs, and vouchers",
                    "can be {C:attention}face down{}",
                    "{s:0.8,C:inactive}(Unable to be viewed until purchased){}",
                },
            },
            stake_cry_platinum = {
                name = "Platinum Stake",
                colour = "Platinum",
                text = {
                    "Small Blinds are {C:attention}removed{}",
                },
            },
            stake_cry_twilight = {
                name = "Twilight Stake",
                colour = "Twilight",
                text = {
                    "Cards can be {C:attention}Banana{}",
                    "{s:0.8,C:inactive}(1 in 10 chance of being destroyed each round){}",
                },
            },
            stake_cry_verdant = {
                name = "Verdant Stake",
                colour = "Verdant",
                text = {
                    "Required score scales",
                    "faster for each {C:attention}Ante",
                },
            },
            stake_cry_ember = {
                name = "Ember Stake",
                colour = "Ember",
                text = {
                    "All items give no money when sold",
                },
            },
            stake_cry_dawn = {
                name = "Dawn Stake",
                colour = "Dawn",
                text = {
                    "Tarots and Spectrals target {C:attention}1",
                    "fewer card",
                    "{s:0.8,C:inactive}(Minimum of 1){}",
                },
            },
            stake_cry_horizon = {
                name = "Horizon Stake",
                colour = "Horizon",
                text = {
                    "When blind selected, add a",
                    "{C:attention}random card{} to deck",
                },
            },
            stake_cry_blossom = {
                name = "Blossom Stake",
                colour = "Blossom",
                text = {
                    "{C:attention}Final{} Boss Blinds can appear",
                    "in {C:attention}any{} Ante",
                },
            },
            stake_cry_azure = {
                name = "Azure Stake",
                colour = "Azure",
                text = {
                    "Values on Jokers are reduced",
                    "by {C:attention}20%{}",
                },
            },
            stake_cry_ascendant = {
                name = "Ascendant Stake",
                colour = "Ascendant",
                text = {
                    "{C:attention}-1{} Shop slot",
                },
            },
        },
        Tag = {
            tag_cry_astral = {
                name = "Astral Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Astral{}",
                },
            },
            tag_cry_banana = {
                name = "Banana Tag",
                text = {
                    "Creates {C:attention}#1#",
                    "{C:inactive}(Must have room){}",
                },
            },
            tag_cry_bettertop_up = {
                name = "Better Top-up Tag",
                text = {
                    "Creates up to {C:attention}#1#",
                    "{C:green}Uncommon{} Jokers",
                    "{C:inactive}(Must have room){}",
                },
            },
            tag_cry_better_voucher = {
                name = "Golden Voucher Tag",
                text = {
                    "Adds one Tier {C:attention}#1#{} Voucher",
                    "to the next shop",
                },
            },
            tag_cry_blur = {
                name = "Blurred Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Blurred{}",
                },
            },
            tag_cry_booster = {
                name = "Booster Tag",
                text = {
                    "Next {C:cry_code}Booster Pack{} has",
                    "{C:attention}double{} cards and",
                    "{C:attention}double{} choices",
                },
            },
            tag_cry_bundle = {
                name = "Bundle Tag",
                text = {
                    "Create a {C:attention}Standard Tag{}, {C:tarot}Charm Tag{},",
                    "{C:attention}Buffoon Tag{}, and {C:planet}Meteor Tag",
                },
            },
            tag_cry_cat = {
                name = "Cat Tag",
                text = { "Meow.", "{C:inactive}Level {C:dark_edition}#1#" },
            },
            tag_cry_console = {
                name = "Console Tag",
                text = {
                    "Gives a free",
                    "{C:cry_code}Program Pack",
                },
            },
            tag_cry_double_m = {
                name = "Double M Tag",
                text = {
                    "Shop has a",
                    "{C:dark_edition}Jolly {C:legendary}M Joker{}",
                },
            },
            tag_cry_empowered = {
                name = "Empowered Tag",
                text = {
                    "Gives a free {C:spectral}Spectral Pack",
                    "with {C:legendary,E:1}The Soul{} and {C:cry_exotic,E:1}Gateway{}",
                },
            },
            tag_cry_epic = {
                name = "Epic Tag",
                text = {
                    "Shop has a half-price",
                    "{C:cry_epic}Epic Joker",
                },
            },
            tag_cry_gambler = {
                name = "Gambler's Tag",
                text = {
                    "{C:green}#1# in #2#{} chance to create",
                    "an {C:cry_exotic,E:1}Empowered Tag",
                },
            },
            tag_cry_glass = {
                name = "Fragile Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Fragile{}",
                },
            },
            tag_cry_glitched = {
                name = "Glitched Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Glitched{}",
                },
            },
            tag_cry_gold = {
                name = "Golden Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Golden{}",
                },
            },
            tag_cry_gourmand = {
                name = "Gourmand Tag",
                text = {
                    "Shop has a free",
                    "{C:attention}Food Joker",
                },
            },
            tag_cry_loss = {
                name = "Loss",
                text = {
                    "Gives a free",
                    "{C:cry_ascendant}Meme Pack",
                },
            },
            tag_cry_m = {
                name = "Jolly Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Jolly{}",
                },
            },
            tag_cry_memory = {
                name = "Memory Tag",
                text = {
                    "Create {C:attention}#1#{} copies of",
                    "the last {C:attention}Tag{} used",
                    "during this run",
                    "{s:0.8,C:inactive}Copying Tags excluded",
                    "{s:0.8,C:inactive}Currently: {s:0.8,C:attention}#2#",
                },
            },
            tag_cry_mosaic = {
                name = "Mosaic Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Mosaic{}",
                },
            },
            tag_cry_oversat = {
                name = "Mosaic Tag",
                text = {
                    "Next base edition shop",
                    "Joker is free and",
                    "becomes {C:dark_edition}Oversaturated{}",
                },
            },
            tag_cry_quadruple = {
                name = "Quadruple Tag",
                text = {
                    "Gives {C:attention}#1#{} copies of the",
                    "next selected {C:attention}Tag",
                    "{s:0.8,C:inactive}Copying Tags excluded",
                },
            },
            tag_cry_quintuple = {
                name = "Quintuple Tag",
                text = {
                    "Gives {C:attention}#1#{} copies of the",
                    "next selected {C:attention}Tag",
                    "{s:0.8,C:inactive}Copying Tags excluded",
                },
            },
            tag_cry_rework = {
                name = "Rework Tag",
                text = {
                    "Shop has a(n)",
                    "{C:dark_edition}#1# {C:cry_code}#2#",
                },
            },
            tag_cry_schematic = {
                name = "Schematic Tag",
                text = {
                    "Shop has a",
                    "{C:attention}Brainstorm",
                },
            },
            tag_cry_scope = {
                name = "Scope Tag",
                text = {
                    "{C:attention}+#1# {C:blue}hands{} and",
                    "{C:red}discards{} next round",
                },
            },
            tag_cry_triple = {
                name = "Triple Tag",
                text = {
                    "Gives {C:attention}#1#{} copies of the",
                    "next selected {C:attention}Tag",
                    "{s:0.8,C:inactive}Copying Tags excluded",
                },
            },
        },
        Tarot = {
            c_cry_automaton = {
                name = "The Automaton",
                text = {
                    "Creates up to {C:attention}#1#",
                    "random {C:cry_code}Code{} card",
                    "{C:inactive}(Must have room)",
                },
            },
            c_cry_eclipse = {
                name = "The Eclipse",
                text = {
                    "Enhances {C:attention}#1#{} selected card",
                    "into an {C:attention}Echo Card",
                },
            },
            c_cry_meld = {
                name = "Meld",
                text = {
                    "Select a {C:attention}Joker{} or",
                    "{C:attention}playing card{} to",
                    "become {C:dark_edition}Double-Sided",
                },
            },
            c_cry_theblessing = {
                name = "The Blessing",
                text = {
                    "Creates {C:attention}1{}",
                    "random {C:attention}consumable{}",
                    "{C:inactive}(Must have room){}",
                },
            },
        },
        Voucher = {
            v_cry_asteroglyph = {
                name = "Asteroglyph",
                text = {
                    "Set Ante to {C:attention}#1#{}",
                },
            },
            v_cry_blankcanvas = {
                name = "Blank Canvas",
                text = {
                    "{C:attention}+#1#{} hand size",
                },
            },
            v_cry_clone_machine = {
                name = "Clone Machine",
                text = {
                    "Double Tags become",
                    "{C:attention}Quintuple Tags{} and",
                    "are {C:attention}4X{} as common",
                },
            },
            v_cry_command_prompt = {
                name = "Command Prompt",
                text = {
                    "{C:cry_code}Code{} cards",
                    "can appear",
                    "in the {C:attention}shop{}",
                },
            },
            v_cry_copies = {
                name = "Copies",
                text = {
                    "Double Tags become",
                    "{C:attention}Triple Tags{} and are",
                    "{C:attention}2X{} as common",
                },
            },
            v_cry_curate = {
                name = "Curate",
                text = {
                    "All cards",
                    "appear with",
                    "an {C:dark_edition}Edition{}",
                },
            },
            v_cry_dexterity = {
                name = "Dexterity",
                text = {
                    "Permanently",
                    "gain {C:blue}+#1#{} hand(s)",
                    "each round",
                },
            },
            v_cry_double_down = {
                name = "Double Down",
                text = {
                    "After every round,",
                    "{X:dark_edition,C:white} X1.5 {} to all values",
                    "on the back of",
                    "{C:dark_edition}Double-Sided{} cards"
                },
            },
            v_cry_double_slit = {
                name = "Double Slit",
                text = {
                    "{C:attention}Meld{} can appear",
                    "in the shop and",
                    "Arcana Packs",
                },
            },
            v_cry_double_vision = {
                name = "Double Vision",
                text = {
                    "{C:dark_edition}Double-Sided{} cards appear",
                    "{C:attention}4X{} more frequently",
                },
            },
            v_cry_fabric = {
                name = "Universal Fabric",
                text = {
                    "{C:dark_edition}+#1#{} Joker slot(s)",
                },
            },
            v_cry_massproduct = {
                name = "Mass Production",
                text = {
                    "All cards and packs",
                    "in shop cost {C:attention}$1{}",
                },
            },
            v_cry_moneybean = {
                name = "Money Beanstalk",
                text = {
                    "Raise the cap on",
                    "interest earned in",
                    "each round to {C:money}$#1#{}",
                },
            },
            v_cry_overstock_multi = {
                name = "Multistock",
                text = {
                    "{C:attention}+#1#{} card slot(s) and",
                    "{C:attention}+#1#{} booster pack slot(s)",
                    "available in shop",
                },
            },
            v_cry_pacclimator = {
                name = "Planet Acclimator",
                text = {
                    "{C:planet}Planet{} cards appear",
                    "{C:attention}X#1#{} more frequently",
                    "in the shop",
                    "All future {C:planet}Planet{}",
                    "cards are {C:green}free{}",
                },
            },
            v_cry_pairamount_plus = {
                name = "Pairamount Plus",
                text = {
                    "{C:attention}Retrigger{} all M Jokers",
                    "once for every Pair",
                    "{C:attention}contained{} in played hand",
                },
            },
            v_cry_pairing = {
                name = "Pairing",
                text = {
                    "{C:attention}Retrigger{} all M Jokers",
                    "if played hand is a {C:attention}Pair",
                },
            },
            v_cry_quantum_computing = {
                name = "Quantum Computing",
                text = {
                    "{C:cry_code}Code{} cards can spawn",
                    "with {C:dark_edition}Negative{} edition",
                },
            },
            v_cry_repair_man = {
                name = "Repair Man",
                text = {
                    "{C:attention}Retrigger{} all M Jokers",
                    "if played hand contains a {C:attention}Pair",
                },
            },
            v_cry_rerollexchange = {
                name = "Reroll Exchange",
                text = {
                    "All rerolls",
                    "cost {C:attention}$2{}",
                },
            },
            v_cry_satellite_uplink = {
                name = "Satellite Uplink",
                text = {
                    "{C:cry_code}Code{} cards may",
                    "appear in any of",
                    "the {C:attention}Celestial Packs{}",
                },
            },
            v_cry_scope = {
                name = "Galactic Scope",
                text = {
                    "Create the {C:planet}Planet",
                    "card for played",
                    "{C:attention}poker hand{}",
                    "{C:inactive}(Must have room){}",
                },
            },
            v_cry_tacclimator = {
                name = "Tarot Acclimator",
                text = {
                    "{C:tarot}Tarot{} cards appear",
                    "{C:attention}X#1#{} more frequently",
                    "in the shop",
                    "All future {C:tarot}Tarot{}",
                    "cards are {C:green}free{}",
                },
            },
            v_cry_tag_printer = {
                name = "Tag Printer",
                text = {
                    "Double Tags become",
                    "{C:attention}Quadruple Tags{} and",
                    "are {C:attention}3X{} as common",
                },
            },
            v_cry_threers = {
                name = "The 3 Rs",
                text = {
                    "Permanently",
                    "gain {C:red}+#1#{} discard(s)",
                    "each round",
                },
            },
            v_cry_stickyhand = {
                name = "Sticky Hand",
                text = {
                    "{C:attention}+#1#{} card",
                    "selection limit",
                },
            },
            v_cry_grapplinghook = {
                name = "Grappling Hook",
                text = {
                    "{C:attention}+#1#{} card",
                    "selection limit",
                    "{C:inactive,s:0.7}NOTE: Will have extra{}",
                    "{C:inactive,s:0.7}functionality later{}",
                },
            },
            v_cry_hyperspacetether = {
                name = "Hyperspace Tether",
                text = {
                    "{C:attention}+#1#{} card",
                    "selection limit",
                    "{C:inactive,s:0.7}NOTE: Will have extra{}",
                    "{C:inactive,s:0.7}functionality later{}",
                },
            },
        },
        Other = {
            banana = {
                name = "Banana",
                text = {
                    "{C:green}#1# in #2#{} chance of being",
                    "destroyed each round",
                },
            },
            cry_rigged = {
                name = "Rigged",
                text = {
                    "All {C:cry_code}listed{} probabilities",
                    "are {C:cry_code}guaranteed",
                },
            },
            cry_hooked = {
                name = "Hooked",
                text = {
                    "When this Joker is {C:cry_code}triggered{},",
                    "trigger {C:cry_code}#1#",
                },
            },
            food_jokers = {
                name = "Food Jokers",
                text = {
                    "{s:0.8}Gros Michel, Egg, Ice Cream, Cavendish,",
                    "{s:0.8}Turtle Bean, Diet Cola, Popcorn, Ramen,",
                    "{s:0.8}Seltzer, Pickle, Chili Pepper, Caramel,",
                    "{s:0.8}Nostalgic Candy, Fast Food M, etc.",
                },
            },
            cry_https_disabled = {
                name = "M",
                text = {
                    "{C:attention,s:0.7}Updating{s:0.7} is disabled by default ({C:attention,s:0.7}HTTPS Module{s:0.7})",
                },
            },
            --i am so sorry for this
            --actually some of this needs to be refactored at some point
            cry_eternal_booster = {
                name = "Eternal",
                text = {
                    "All cards in pack",
                    "are {C:attention}Eternal{}",
                },
            },
            cry_perishable_booster = {
                name = "Perishable",
                text = {
                    "All cards in pack",
                    "are {C:attention}Perishable{}",
                },
            },
            cry_rental_booster = {
                name = "Rental",
                text = {
                    "All cards in pack",
                    "are {C:attention}Rental{}",
                },
            },
            cry_pinned_booster = {
                name = "Pinned",
                text = {
                    "All cards in pack",
                    "are {C:attention}Pinned{}",
                },
            },
            cry_banana_booster = {
                name = "Banana",
                text = {
                    "All cards in pack",
                    "are {C:attention}Banana{}",
                },
            },
            cry_eternal_voucher = {
                name = "Eternal",
                text = {
                    "Can't be traded",
                },
            },
            cry_perishable_voucher = {
                name = "Perishable",
                text = {
                    "Debuffed after",
                    "{C:attention}#1#{} rounds",
                    "{C:inactive}({C:attention}#2#{C:inactive} remaining)",
                },
            },
            cry_rental_voucher = {
                name = "Rental",
                text = {
                    "Lose {C:money}$#1#{} at",
                    "end of round",
                },
            },
            cry_pinned_voucher = {
                name = "Pinned",
                text = {
                    "Remains in shop",
                    "until redeemed",
                },
            },
            cry_banana_voucher = {
                name = "Banana",
                text = {
                    "{C:green}#1# in #2#{} chance of being",
                    "unredeemed each round",
                },
            },
            cry_perishable_consumeable = {
                name = "Perishable",
                text = {
                    "Debuffed at",
                    "end of round",
                },
            },
            cry_rental_consumeable = {
                name = "Rental",
                text = {
                    "Lose {C:money}$#1#{} at end of",
                    "round, and on use",
                },
            },
            cry_pinned_consumeable = {
                name = "Pinned",
                text = {
                    "Can't use other",
                    "non-{C:attention}Pinned{} consumables",
                },
            },
            cry_banana_consumeable = {
                name = "Banana",
                text = {
                    "{C:green}#1# in #2#{} chance to do",
                    "nothing on use",
                },
            },
            p_cry_code_normal_1 = {
                name = "Program Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:cry_code} Code{} cards",
                },
            },
            p_cry_code_normal_2 = {
                name = "Program Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:cry_code} Code{} cards",
                },
            },
            p_cry_code_jumbo_1 = {
                name = "Jumbo Program Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:cry_code} Code{} cards",
                },
            },
            p_cry_code_mega_1 = {
                name = "Mega Program Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:cry_code} Code{} cards",
                },
            },
            p_cry_empowered = {
                name = "Spectral Pack [Empowered Tag]",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{C:spectral} Spectral{} cards",
                    "{s:0.8,C:inactive}(Generated by Empowered Tag)",
                },
            },
            p_cry_meme_1 = {
                name = "Meme Pack",
                text = {
                    "Choose {C:attention}#1#{} of",
                    "up to {C:attention}#2# Meme Jokers{}",
                },
            },
            p_cry_meme_two = {
                name = "Meme Pack",
                text = {
                    "Choose {C:attention}#1#{} of",
                    "up to {C:attention}#2# Meme Jokers{}",
                },
            },
            p_cry_meme_three = {
                name = "Meme Pack",
                text = {
                    "Choose {C:attention}#1#{} of",
                    "up to {C:attention}#2# Meme Jokers{}",
                },
            },
            undiscovered_code = {
                name = "Not Discovered",
                text = {
                    "Purchase or use",
                    "this card in an",
                    "unseeded run to",
                    "learn what it does"
                }
            },
            cry_green_seal = {
                name = "Green Seal",
                text = {
                    "Creates a {C:cry_code}Code{} card",
                    "when played and unscoring",
                    "{C:inactive}(Must have room)",
                },
            },
            cry_azure_seal = {
                name = "Azure Seal",
                text = {
                    "Create {C:attention}#1#{} {C:dark_edition}Negative{}",
                    "{C:planet}Planets{} for played",
                    "{C:attention}poker hand{}, then",
                    "{C:red}destroy{} this card",
                },
            },
        },
    },
    misc = {
        achievement_names = {
            ach_cry_ace_in_crash = "Pocket ACE",
            ach_cry_blurred_blurred_joker = "Legally Blind",
            ach_cry_bullet_hell = "Bullet Hell",
            ach_cry_break_infinity = "Break Infinity",
            ach_cry_cryptid_the_cryptid = "Cryptid the Cryptid",
            ach_cry_exodia = "Exodia",
            ach_cry_freak_house = "Freak House",
            ach_cry_googol_play_pass = "Googol Play Pass",
            ach_cry_haxxor = "H4xx0r",
            ach_cry_home_realtor = "Home Realtor",
            ach_cry_jokes_on_you = "Joke's on You, Pal!",
            ach_cry_niw_uoy = "!niW uoY",
            ach_cry_now_the_fun_begins = "Now the Fun Begins",
            ach_cry_patience_virtue = "Patience is a Virtue",
            ach_cry_perfectly_balanced = "Perfectly Balanced",
            ach_cry_pull_request = "Pull Request",
            ach_cry_traffic_jam = "Traffic Jam",
            ach_cry_ult_full_skip = "Ultimate Full Skip",
            ach_cry_used_crash = "We Told You Not To",
            ach_cry_what_have_you_done = "WHAT HAVE YOU DONE?!",
        },
        achievement_descriptions = {
            ach_cry_ace_in_crash = 'check_for_unlock({type = "ace_in_crash"})',
            ach_cry_blurred_blurred_joker = "Obtain Blurred Blurred Joker",
            ach_cry_bullet_hell = "Have 15 AP Jokers",
            ach_cry_break_infinity = "Score 1.79e308 Chips in a single hand",
            ach_cry_cryptid_the_cryptid = "Use Cryptid on Cryptid",
            ach_cry_exodia = "Have 5 Exotic Jokers",
            ach_cry_freak_house = "Play a Flush House consisting of 6s and 9s of Hearts whilst possessing Nice",
            ach_cry_googol_play_pass = "Rig a Googol Play Card",
            ach_cry_haxxor = "Use a cheat code",
            ach_cry_home_realtor = "Activate Happy House before Ante 8 (without DoE/Antimatter)",
            ach_cry_jokes_on_you = "Trigger The Joke's effect on Ante 1 and win the run",
            ach_cry_niw_uoy = "Reach Ante -8",
            ach_cry_now_the_fun_begins = "Obtain Canvas",
            ach_cry_patience_virtue = "Wait out Lavender Loop for 2 minutes before playing first hand and beat the blind",
            ach_cry_perfectly_balanced = "Beat Very Fair Deck on Ascendant Stake",
            ach_cry_pull_request = "Have ://COMMIT spawn the same Joker that it destroyed",
            ach_cry_traffic_jam = "Beat all Rush Hour challenges",
            ach_cry_ult_full_skip = "Win in 1 round",
            ach_cry_used_crash = "Use ://CRASH",
            ach_cry_what_have_you_done = "Delete or Sacrifice an Exotic Joker",
        },
        challenge_names = {
            c_cry_ballin = "Ballin'",
            c_cry_boss_rush = "Enter the Gungeon",
            c_cry_dagger_war = "Dagger War",
            c_cry_onlycard = "Solo Card",
            c_cry_rng = "RNG",
            c_cry_rush_hour = "Rush Hour I",
            c_cry_rush_hour_ii = "Rush Hour II",
            c_cry_rush_hour_iii = "Rush Hour III",
            c_cry_sticker_sheet = "Sticker Sheet",
            c_cry_sticker_sheet_plus = "Sticker Sheet+",
        },
        dictionary = {
            --Settings Menu
            cry_set_features = "Fonctionnalités",
            cry_set_music = "Musique",
            cry_set_enable_features = "Sélectionnez les fonctionnalités à activer (appliqué au prochain redémarrage):",
            cry_feat_achievements = "Succès",
            ["cry_feat_antimatter deck"] = "Jeu Anti-matière",
            cry_feat_blinds = "Blindes",
            cry_feat_challenges = "Challenges",
            ["cry_feat_code cards"] = "Cartes Code",
            ["cry_feat_misc. decks"] = "Jeux divers",
            ["cry_feat_https module"] = "Module HTTPS",
            ["cry_feat_timer mechanics"] = "Mécaniques Chrono",
            ["cry_feat_enhanced decks"] = "Decks Améliorés",
            ["cry_feat_epic jokers"] = "Jokers épiques",
            ["cry_feat_exotic jokers"] = "Jokers exotiques",
            ["cry_feat_m jokers"] = "Jokers M",
            cry_feat_menu = "Menu principal personnalisé",
            ["cry_feat_misc."] = "Divers",
            ["cry_feat_misc. jokers"] = "Jokers divers",
            cry_feat_planets = "Planètes",
            cry_feat_jokerdisplay = "JokerDisplay (Fait rien)",
            cry_feat_tags = "Badges",
            cry_feat_sleeves = "Pochettes",
            cry_feat_spectrals = "Cartes spectrales",
            ["cry_feat_more stakes"] = "Mises",
            cry_feat_vouchers = "Coupons",
            cry_mus_jimball = "Jimboule (Funkytown par Lipps Inc. - Sous droits d'auteur)",
            cry_mus_code = "Cartes Code (://LETS_BREAK_THE_GAME par HexaCryonic)",
            cry_mus_exotic = "Jokers exotiques (Joker in Latin par AlexZGreat)",
            cry_mus_high_score = "High Score (Final Boss [For Your Computer] par AlexZGreat)",

            k_cry_program_pack = "Paquet Programme",
            k_cry_meme_pack = "Paquet Meme",

            cry_critical_hit_ex = "Coup critique!",
            cry_critical_miss_ex = "Échec critique!",

            cry_debuff_oldhouse = "Pas de Full",
            cry_debuff_oldarm = "4 cartes ou moins doivent être jouées",
            cry_debuff_oldpillar = "Pas de Quinte",
            cry_debuff_oldflint = "Pas de Couleur",
            cry_debuff_oldmark = "No hands containing a Pair",
            cry_debuff_obsidian_orb = "Applique les capacités de tous les boss battus",

            k_code = "Code",
            b_code_cards = "Cartes Code",
            b_pull = "TIRER",
            cry_hooked_ex = "Accroché!",
            k_end_blind = "End Blind",

            cry_code_rank = "ENTRER UN RANG",
            cry_code_enh = "ENTRER UNE AMELIORATION",
            cry_code_hand = "ENTRER MAIN DE POKER",
            cry_code_enter_card = "ENTRER UNE CARTE",
            cry_code_apply = "APPLIQUER",
            cry_code_apply_previous = "APPLIQUER PRECEDENT",
            cry_code_exploit = "EXPLOITER",
            cry_code_exploit_previous = "EXPLOITER PRECEDENT",
            cry_code_create = "CREER",
            cry_code_create_previous = "CREER PRECEDENT",
            cry_code_execute = "EXECUTER",
            cry_code_cancel = "ANNULER",

            b_flip = "RETOURNER",
            b_merge = "FUSIONNER",

            cry_again_q = "Encore?",
            cry_curse = "Malédiction",
            cry_curse_ex = "Malédiction!",
            cry_sobbing = "À l'aide...",
            cry_gaming = "Gaming",
            cry_gaming_ex = "Gaming!",
            cry_sus_ex = "Imposteur!",
            cry_jolly_ex = "Plus joyeux!",
            cry_m_minus = "m",
            cry_m = "M",
            cry_m_ex = "M!",
            cry_minus_round = "-1 Tour",
            cry_plus_cryptid = "+1 Cryptide",
            cry_no_triggers = "Pas de redéclenchements restants!",
            cry_unredeemed = "Plus échangé...",
            cry_active = "Actif",
            cry_inactive = "Inactif",
        },
        labels = {
            food_jokers = "Jokers nourriture",
            banana = "Banane",
            code = "Code",
            cry_rigged = "Truqué",
            cry_hooked = "Accroché",

            cry_green_seal = "Sceau vert",
            cry_azure_seal = "Sceau azur",

            cry_astral = "Astral",
            cry_blur = "Flou",
            cry_double_sided = "Double-Face",
            cry_glass = "Fragile",
            cry_glitched = "Glitché",
            cry_gold = "Doré",
            cry_m = "Joyeux",
            cry_mosaic = "Mosaïque",
            cry_noisy = "Bruité",
            cry_oversat = "Super-saturée",
        },
        rnj_loc_txts = {
            stats = {
                plus_mult = { "{C:red}+#2#{} Mult" },
                plus_chips = { "{C:blue}+#2#{} Chips" },
                x_mult = { "{X:red,C:white} X#2#{} Mult" },
                x_chips = { "{X:blue,C:white} X#2#{} Chips" },
                h_size = { "{C:attention}+#2#{} Hand Size" },
                money = { "{C:money}+$#2#{} at payout" },
            },
            stats_inactive = {
                plus_mult = { "{C:inactive}(Currently {C:red}+#1#{C:inactive} Mult)" },
                plus_chips = { "{C:inactive}(Currently {C:blue}+#1#{C:inactive} Chips)" },
                x_mult = { "{C:inactive}(Currently {X:red,C:white} X#1# {C:inactive} Mult)" },
                x_chips = { "{C:inactive}(Currently {X:blue,C:white} X#1# {C:inactive} Chips)" },
                h_size = { "{C:inactive}(Currently {C:attention}+#1#{C:inactive} Hand Size)" },
                money = { "{C:inactive}(Currently {C:money}+$#1#{C:inactive})" },
            },
            actions = {
                make_joker = { "Create {C:attention}#2# Joker{}" },
                make_tarot = { "Create {C:attention}#2#{C:tarot} Tarot{} card" },
                make_planet = { "Create {C:attention}#2#{C:planet} Planet{} card" },
                make_spectral = { "Create {C:attention}#2#{C:spectral} Spectral{} card" },
                add_dollars = { "Earn {C:money}$#2#{}" },
            },
            contexts = {
                open_booster = { "when a {C:attention}Booster{} is opened" },
                buying_card = { "when a card is bought" },
                selling_self = { "when this card is sold" },
                selling_card = { "when a card is sold" },
                reroll_shop = { "on reroll" },
                ending_shop = { "at the end of the {C:attention}shop{}" },
                skip_blind = { "when a {C:attention}blind{} is skipped" },
                skipping_booster = { "when any {C:attention}Booster Pack{} is skipped" },
                playing_card_added = { "every time a {C:attention}playing card{} is added to your deck" },
                first_hand_drawn = { "when round begins" },
                setting_blind = { "when {C:attention}Blind{} is selected" },
                remove_playing_cards = { "when a card is destroyed" },
                using_consumeable = { "when a {C:attention}consumable{} card is used" },
                debuffed_hand = { "if played {C:attention}hand{} is not allowed" },
                pre_discard = { "before each discard" },
                discard = { "for each discarded card" },
                end_of_round = { "at end of {C:attention}round{}" },
                individual_play = { "for each card scored" },
                individual_hand_score = { "for each card held in hand during scoring" },
                individual_hand_end = { "for each card held in hand at end of {C:attention}round{}" },
                repetition_play = { "Retrigger played cards" },
                repetition_hand = { "Retrigger held in hand cards" },
                other_joker = { "per {C:attention}Joker{}" },
                before = { "before each {C:attention}hand{}" },
                after = { "after each {C:attention}hand{}" },
                joker_main = {},
            },
            conds = {
                buy_common = { "if it is a {C:blue}Common{} {C:attention}Joker{}" },
                buy_uncommon = { "if it is a {C:green}Uncommon{} {C:attention}Joker{}" },
                tarot = { "if card is a {C:tarot}Tarot{} card" },
                planet = { "if card is a {C:planet}Planet{} card" },
                spectral = { "if card is a {C:spectral}Spectral{} card" },
                joker = { "if card is a {C:attention}Joker{}" },
                suit = { "if card is a {V:1}#3#{}" },
                rank = { "if card is rank {C:attention}#3#{}" },
                face = { "if card is a {C:attention}face{} card" },
                boss = { "if {C:attention}blind{} is a {C:attention}Boss {C:attention}Blind{}" },
                non_boss = { "if {C:attention}blind{} is a {C:attention}Non-Boss {C:attention}Blind{}" },
                small = { "if {C:attention}blind{} is a {C:attention}Small {C:attention}Blind{}" },
                big = { "if {C:attention}blind{} is a {C:attention}Big {C:attention}Blind{}" },
                first = { "if it's the {C:attention}first {C:attention}hand{}" },
                last = { "if it's the {C:attention}last {C:attention}hand{}" },
                common = { "if it is a {C:blue}Common{} {C:attention}Joker{}" },
                uncommon = { "if it is an {C:green}Uncommon{} {C:attention}Joker{}" },
                rare = { "if it is a {C:red}Rare{} {C:attention}Joker{}" },
                poker_hand = { "if hand is a {C:attention}#3#{}" },
                or_more = { "if hand contains {C:attention}#3#{} or more cards" },
                or_less = { "if hand contains {C:attention}#3#{} or less cards" },
                hands_left = { "if #3# {C:blue}hands{} remaining at end of round" },
                discards_left = { "if #3# {C:red}discards{} remaining at end of round" },
                first_discard = { "if it's the {C:attention}first {C:attention}discard{}" },
                last_discard = { "if it's the {C:attention}last {C:attention}discard{}" },
                odds = { "with a {C:green}#4# {C:green}in {C:green}#3#{} chance" },
            },
        },
        v_dictionary = {
            a_xchips = { "X#1# Jetons" },
            a_powmult = { "^#1# Multi" },
            a_powchips = { "^#1# Jetons" },
            a_powmultchips = { "^#1# Multi+Jetons" },
            a_round = { "+#1# Manche(s)" },
            a_xchips_minus = { "-X#1# Jetons" },
            a_powmult_minus = { "-^#1# Multi" },
            a_powchips_minus = { "-^#1# Jetons" },
            a_powmultchips_minus = { "-^#1# Multi+Jetons" },
            a_round_minus = { "-#1# Manche(s)" },

            a_tag = { "#1# Badge" },
            a_tags = { "#1# Badges" },

            cry_sticker_name = { "Sticker #1#" },
            cry_sticker_desc = {
                "Vous avez remporté",
                "la #2#Mise #1##3#",
                "avec ce Joker"
            }
        },
        v_text = {
            ch_c_cry_all_perishable = { "Tous les jokers sont {C:eternal}Périssables{}" },
            ch_c_cry_all_rental = { "Tous les jokers sont {C:eternal}en Location{}" },
            ch_c_cry_all_pinned = { "Tous les jokers sont {C:eternal}Épinglés{}" },
            ch_c_cry_all_banana = { "Tous les jokers sont {C:eternal}Bananes{}" },
            ch_c_all_rnj = { "Tous les jokers sont {C:attention}RNJoker{}" },
            ch_c_cry_sticker_sheet_plus = { "Tous les objets achetables ont tous les stickers" },
            ch_c_cry_rush_hour = { "Toutes les Blindes de Boss sont {C:attention}L'Horloge{} ou la {C:attention}Boucle Lavande" },
            ch_c_cry_rush_hour_ii = { "Toutes les blindes sont des {C:attention}Blindes de Boss{}" },
            ch_c_cry_rush_hour_iii = { "{C:attention}L'Horloge{} et la {C:attention}Boucle Lavande{} augmentent {C:attention}deux fois{} plus vite" },
            ch_c_cry_no_tags = { "Passer la blinde n'est {C:attention}plus possible{}" }
        },
        -- Thanks to many members of the community for contributing to all of these quips!
        -- There's too many to credit so just go here: https://discord.com/channels/1116389027176787968/1209506360987877408/1237971471146553406
        -- And here: https://discord.com/channels/1116389027176787968/1219749193204371456/1240468252325318667
        very_fair_quips = {
            { "L",                           "NO VOUCHERS",                         "FOR YOU" },
            { "BOZO",                        "DID YOU THINK I WOULD",               "GIVE YOU A VOUCHER?" },
            { "NOPE!",                       "NO VOUCHERS HERE!",                   "(SLUMPAGE EDITION)" },
            { "SKILL ISSUE",                 "IMAGINE BEING GOOD ENOUGH",           "FOR A VOUCHER" },
            { "JIMBO",                       "FROM MANAGEMENT",                     "FORGOT TO RESTOCK" },
            { "OOPS!",                       "NO VOUCHERS",                         "" },
            { "YOU JOKER,",                  "WHY ARE YOU LOOKING",                 "OVER HERE? LOL" },
            { "THE VOUCHER",                 "IS IN",                               "ANOTHER CASTLE" },
            { "$0",                          "BLANK VOUCHER",                       "(GET IT?)" },
            { "ERROR",                       "CANNOT DO ARITHMETIC ON A NIL VALUE", "(tier4vouchers.lua)" },
            { "100% OFF",                    "ON ALL VOUCHERS",                     "(SOMEONE ALREADY BOUGHT THEM)" },
            { "TRY AGAIN LATER",             "HINT: YOU WON'T HAVE",                "ENOUGH MONEY ANYWAYS" },
            { "HUH?",                        '"VOUCHER"?',                          "THAT'S NOT EVEN A WORD..." },
            { 'HOLD "R"',                    "TO RESTOCK",                          "ALL VOUCHERS" },
            { "DID YOU KNOW?",               "PRESSING ALT+F4",                     "GIVES FREE VOUCHERS!" },
            { "SORRY,",                      "THERE ARE NO VOUCHERS",               "DUE TO BUDGET CUTS" },
            { "CALL 1-600-JIMBO",            "TO RATE YOUR",                        "VOUCHER EXPERIENCE" },
            { "DEFEAT",                      "ANTE 39 BOSS BLIND",                  "TO RESTOCK" },
            { "MAGIC TRICK",                 "I MADE THIS VOUCHER",                 "DISAPPEAR" },
            { "WHY IS A",                    "VOUCHER LIKE",                        "A WRITING DESK?" },
            { "WE HAVE RETRACTED",           "YOUR VOUCHERS, THEY WOULD BE",        "BETTER USED IN OTHER RUNS" },
            { "WHY DO THEY CALL IT VOUCHER", "WHEN MULT OUT THE HOT",               "IN COLD EAT EAT THE CHIP" },
            { "SORRY",                       "THE VOUCHERS ARE EXPERIENCING",       "VOUCHIFIA ABORTUS" },
            { "UNFORTUNATELY",               "THE VOUCHRX REWRITE UPDATE",          "HAS BEEN CANCELLED" },
            { "DEFEAT",                      "BOSS BLIND",                          "TO CHANGE NOTHING" },
            { "BIRDS ARE SINGING",           "FLOWERS ARE BLOOMING",                "KIDS LIKE YOU..." },
            { "WE ARE SORRY TO SAY",         "ALL VOUCHERS HAVE BEEN RECALLED",     "DUE TO SALMONELLA EXPOSURE" },
            { "VOUCHERS COULDN'T ARRIVE",    "DUE TO SHOP LAYOUT BEING",            "200% OVERBUDGET" },
            { "YOU LIKE",                    "BUYING VOUCHERS, DON'T YOU",          "YOU'RE A VOUCHERBUYER" },
            { "VOUCHERS",                    "!E",                                  "VOUCHER POOL" },
            { "THERE",                       "IS NO",                               "VOUCHER" },
            { "THERE IS",                    "NO SANTA",                            "AND THERE ARE NO VOUCHERS" },
            { "",                            "VOUCHERN'T",                          "" },
            { "YOU",                         "JUST LOST",                           "THE GAME" },
            { "CAN I OFFER YOU",             "A NICE EGG",                          "IN THESE TRYING TIMES?" },
            { "GO TOUCH GRASS",              "INSTEAD OF USING",                    "THIS DECK" },
            { "YOU COULD BE",                "PLAYING ON BLUE DECK",                "RIGHT NOW" },
            { "FREE EXOTICS",                "GET THEM BEFORE ITS",                 "TOO LATE (sold out)" },
            { "PROVE THEM WRONG",            "BUY BUYING AN INVISIBLE",             "VOUCHER FOR $10" },
            { "",                            "no vouchers?",                        "" },
            { "see this ad?",                "if you are, then it's working",       "and you could have it for your own" },
            { "YOU'RE MISSING OUT ON",       "AT LEAST 5 VOUCHERS RIGHT NOW",       "tonktonktonktonktonk" },
            { "10",                          "20 NO VOUCHER XD",                    "30 GOTO 10" },
            { "VOUCHERS",                    "ARE A PREMIUM FEATURE",               "$199.99 JOLLARS TO UNLOCK" },
            { "TRUE VOUCHERLESS!?!?",        "ASCENDANT STAKE ONLY",                "VERY FAIR DECK" },
            { "ENJOYING YOUR",               "VOUCHER EXPERIENCE? GIVE US A",       "FIVE STAR RATING ON JESTELP" },
            { "FREE VOUCHERS",               "HOT VOUCHERS NEAR YOU",               "GET VOUCHERS QUICK WITH THIS ONE TRICK" },
            { "INTRODUCING",                 "THE VERY FIRST TIER 0 VOUCHER!",      "(coming to Cryptid 1.0 soon)" },
            { "A VOUCHER!",                  "IT'S JUST IMAGINARY",                 "WE IMAGINED YOU WOULD WANT IT, THAT IS" },
            { "TURN OFF ADBLOCKER",          "WITHOUT ADS, WE WOULDN'T",            "BE ABLE TO SELL YOU VOUCHERS" },
            { "IF YOU HAVE",                 "A PROBLEM WITH THIS",                 "EMAIL IT TO US AT NORESPONSE@JMAIL.COM" },
            { "NOT ENOUGH MONEY",            "TO BUY THIS VOUCHER",                 "SO WHY WOULD WE PUT IT HERE?" },
            { "WANT A VOUCHER?",             "WELL SHUT UP",                        "YOU CAN'T HAVE ANY LOL" },
            { "^$%& NO",                     "VOUCHERS ^%&% %&$^% FOR",             "$%&%%$ %&$&*%$^ YOU" },
            { "A VOUCHER (TRUST)",           "|\\/|",                               "|/\\|" },
            {
                "... --- ...",
                ".--. .-.. .- -.-- . .-. -.. . -.-. --- -.. . -.. -- --- .-. ... .",
                "-.-. --- -.. . - --- ..-. .. -. -.. .- ...- --- ..- -.-. .... . .-.",
            },
            { "RUN > NEW",         "STARE AT NOTHING",          "FOR AN HOUR OR TWO" },
            { "WE'RE VERY SORRY",  "THE LAST GUY PANIC BOUGHT", "ALL THE VOUCHERS" },
            { "HOW IT FEELS",      "TO BUY NO",                 "VOUCHERS" },
            { "JIMBO GOT A NAT 1", "AND DUMPED ALL THE",        "VOUCHERS IN A DITCH" },
            { "ATTEMPT TO INDEX",  "FIELD 'VOUCHER'",           "(A NIL VALUE)" },
            {
                "OH YOU REALLY THOUGHT THAT READING ALL THESE LINES WOULD BRING YOUR VOUCHERS BACK?",
                "SORRY TO TELL YOU, BUT THIS DECK DOESN'T CONTAIN THE VOUCHERS YOU SEEK.",
                "THIS ABNORMALLY LONG TEXT IS HERE AND DESIGNED TO WASTE YOUR TIME AND EFFORT WHILE YOU READ IT.",
            },
            { "GO TO", "https://youtu.be/p7YXXieghto", "FOR FREE VOUCHERS" },
        }
    }
}
