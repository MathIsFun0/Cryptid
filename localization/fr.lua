--[[
Progress:

Decks: Yes [ChatSigna]
Jokers: Yes [HastagGuigui]
Code Cards: Yes [ChatSigna]
Deck Sleeves (requires Decksleeves Mod): Yes [HastagGuigui]
Boss Blinds: Yes [HastagGuigui]
Spectrals: Yes [HastagGuigui]
Tarots: Yes [HastagGuigui]
Planets: Yes [HastagGuigui]
Dictonary: Yes [HastagGuigui]
Editions: Yes [HastagGuigui]
Vouchers: Yes [HastagGuigui]
Enhancements: Yes [HastagGuigui]
Tags: Yes [HastagGuigui]
Other (packs, stickers, etc): Yes [HastagGuigui]
Misc: Yes [HastagGuigui]
Spooky Update: Yes [HastagGuigui]
Refactor Update: ??
]]
--
return {
	descriptions = {
		Back = {
			b_cry_antimatter = {
				name = "Jeu d'Antimatière",
				text = {
					"Applique les {C:legendary,E:1}effets{}",
					"de {C:attention}tous{} les jeux",
				},
				unlock = {
					"Gagner une partie",
					"avec le {C:attention}Jeu à Blanc",
					"et la {C:attention}Mise Or",
				},
			},
			b_cry_antimatter_balanced = {
				name = "Jeu d'Antimatière",
				text = {
					"Applique les {C:legendary,E:1}effets{}",
					"de {C:attention}tous{} les jeux",
					"battus avec la {C:attention}Mise Or",
				},
			},
			b_cry_beige = {
				name = "Jeu Beige",
				text = {
					"Les Jokers {C:attention}communs{} ont",
					"leur valeurs {C:attention}quadruplées{}",
				},
				unlock = {
					"Découvrir au moins",
					"{C:attention}200{} objets dans",
					"la collection",
				},
			},
			b_cry_beta = {
				name = "Jeu Nostalgique",
				text = {
					"{C:attention}Joker{} and {C:attention}Consumable{}",
					"slots are {C:attention}combined",
					"{C:attention}Nostalgic{} Blinds replace",
					"their updated Blind",
				},
				unlock = {
					"Gagner une partie",
					"avec la {C:attention}Mise Rose",
				},
			},
			b_cry_blank = {
				name = "Jeu à blanc",
				text = {
					"{C:inactive,E:1}Ne fait rien?",
				},
			},
			b_cry_bountiful = {
				name = "Jeu généreux",
				text = {
					"Après avoir utilisé une {C:blue}main{} ou une {C:red}défausse{},",
					"{C:attention}5{} cartes sont toujours tirées",
				},
				unlock = {
					"Battre {C:attention}le Serpent",
					"sans {C:red}défausser",
				},
			},
			b_cry_CCD = {
				name = "Jeu CCD",
				text = {
					"Chaque carte est aussi",
					"un consommable {C:attention}aléatoire{}",
				},
				unlock = {
					"Utiliser {C:spectral}Hammerspace",
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
				unlock = {
					"Utiliser {C:spectral}Analogue",
				},
			},
			b_cry_critical = {
				name = "Jeu Critique",
				text = {
					"Après chaque main jouée,",
					"{C:green}#1# chance#<s>1# sur 4{} d'obtenir {X:dark_edition,C:white} ^2 {} Multi",
					"{C:green}#1# chance#<s>1# sur 8{} d'obtenir {X:dark_edition,C:white} ^0.5 {} Multi",
				},
				unlock = {
					"Obtenir un {C:attention}Joker Truqué",
				},
			},
			b_cry_e_deck = {
				name = "Jeu Édition",
				text = {
					"Toutes les cartes sont {C:dark_edition}#1#{}",
					"Les cartes ne peuvent pas changer d'édition",
					"{C:inactive}(Cliquez pour modifier)",
				},
				unlock = {
					"Découvrir toutes",
					"les {C:dark_edition}Éditions",
				},
			},
			b_cry_encoded = {
				name = "Jeu Encodé",
				text = {
					"Démarre avec un {C:cry_code,T:j_cry_CodeJoker}Joker Code{}",
					"et un {C:cry_code,T:j_cry_copypaste}Copier/Coller{}",
					"Seules les {C:cry_code}Cartes Code{} apparaissent dans la boutique",
				},
				unlock = {
					"Utiliser {C:spectral}POINTEUR://",
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
				unlock = {
					"Avoir {C:attention}100 Jokers",
					"en même temps",
				},
			},
			b_cry_et_deck = {
				name = "Jeu Amélioré",
				text = {
					"Toutes les {C:attention}cartes à jouer{}",
					"sont {C:attention}#1#{}(s)",
					"{C:inactive}(Cliquez pour modifier)",
				},
				unlock = {
					"Utiliser {C:spectral}Aspiration",
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
				unlock = {
					"Gagner une partie",
					"avec le {C:attention}Jeu Beige",
				},
			},
			b_cry_infinite = {
				name = "Jeu Infini",
				text = {
					"Sélectionne {C:attention}n'importe quel",
					"nombre de cartes",
					"Taille de la main {C:attention}+1{} ",
				},
				unlock = {
					"Jouer une main avec",
					"{C:attention}6{} cartes ou plus",
				},
			},
			b_cry_misprint = {
				name = "Jeu Mal Imprimé",
				text = {
					"La valeur des cartes",
					"et des mains de poker",
					"sont {C:attention}aléatoires",
				},
				unlock = {
					"Obtenir un Joker {C:dark_edition}Glitché{C:attention}",
				},
			},
			b_cry_redeemed = {
				name = "Jeu Acheté",
				text = {
					"Quand un {C:attention}Bon d'Achat{} est acheté,",
					"gagne son {C:attention}amélioration",
				},
				unlock = {
					"Découvrir tous les",
					"{C:attention}Coupons",
				},
			},
			b_cry_sk_deck = {
				name = "Jeu d'autocollants",
				text = {
					"Toutes les cartes sont {C:attention}#1#{}",
					"{C:inactive}(Cliquez pour modifier)",
				},
				unlock = {
					"Utiliser {C:spectral}Verrou",
				},
			},
			b_cry_sl_deck = {
				name = "Jeu scellé",
				text = {
					"Toutes les cartes à jouer ont un {C:dark_edition}#1#{}",
					"Les cartes ne peuvent pas changer de sceau",
					"{C:inactive}(Cliquez pour modifier)",
				},
				unlock = {
					"Utiliser {C:spectral}Typhon",
				},
			},
			b_cry_spooky = {
				name = "Jeu fantôme",
				text = {
					"Démarre avec un {C:attention,T:j_cry_chocolate_dice}Dé en chocolat{} {C:eternal}éternel",
					"Après chaque {C:attention}Ante{}, crée un",
					"{C:cry_candy}Bonbon{} ou un Joker {X:cry_cursed,C:white}Maudit{}",
				},
				unlock = {
					"Obtenir un Joker {C:cry_candy}Bonbon{C:attention}",
				},
			},
			b_cry_st_deck = {
				name = "Jeu Couleur",
				text = {
					"Toutes les cartes à jouer sont des {C:dark_edition}#1#",
					"et ne peuvent pas changer de couleur",
					"{C:inactive}(Cliquez pour modifier)",
				},
				unlock = {
					"Utiliser {C:spectral}Réplique",
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
				unlock = {
					"Gagner une partie",
					"avec le {C:attention}Jeu à Blanc",
				},
			},
			b_cry_wormhole = {
				name = "Jeu Vortex",
				text = {
					"Démarre avec un Joker {C:cry_exotic}Exotique{C:attention}",
					"Les Jokers sont {C:attention}20X{} ",
					"plus susceptibles d'être {C:dark_edition}Négatifs",
					"{C:attention}-2{} emplacements de Joker",
				},
				unlock = {
					"Obtenir un Joker {C:cry_exotic}Exotique{C:attention}",
				},
			},
			b_cry_legendary = {
				name = "Jeu Légendaire",
				text = {
					"Démarre avec un Joker {C:legendary}Légendaire{C:legendary}",
					"{C:green}1 chance sur 5{} d'en créer un autre",
					"lorsque la Blinde de Boss est battue",
					"{C:inactive}(selon la place disponible)",
				},
				unlock = {
					"Avoir {C:attention}2 Jokers Légendaires",
					"en même temps",
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
					"les 12 secondes passées dans cette Ante",
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
					"6 secondes passées dans cette manche",
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
			bl_cry_scorch = {
				name = "La Grille",
				text = {
					"Must play 5 cards,",
					"destroy played and",
					"discarded cards",
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
			bl_cry_trophy = {
				name = "Trophée Citron",
				text = {
					"Le multi ne peut pas",
					"dépasser les jetons",
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
			c_cry_alttab = {
				name = "://ALTTAB",
				text = {
					"Crée le badge de",
					"la {C:cry_code}blinde actuelle{}",
					"{C:inactive}(Actuellement: {C:cry_code}#1#{C:inactive})",
				},
			},
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
			c_cry_ctrl_v = {
				name = "://CTRL+V",
				text = {
					"Crée une {C:cry_code}copie{} d'une",
					"carte à jouer ou d'un consommable",
					"sélectionné",
				},
			},
			c_cry_delete = {
				name = "://EFFACER",
				text = {
					"Enlève de manière {C:cry_code}permanente{}",
					"un objet {C:cry_code}choisi{} de la boutique, il n'apparaîtra plus",
					"pendant le reste de la partie",
					"{C:inactive}Multiuse: ({C:cry_code}#1#{C:inactive} restantes)",
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
					"Chaque main jouée est calculée",
					"comme {C:cry_code}contenant{} une main de poker {C:cry_code}choisie,",
					"réinitialisé à la fin de la manche",
					"{C:inactive,s:0.8}Les mains secretes doivent être",
					"{C:inactive,s:0.8}découvertes pour être valides",
				},
			},
			c_cry_hook = {
				name = "ACCROCHER://",
				text = {
					"Les deux jokers sélectionnés deviennent {C:cry_code}Accrochés",
					"{C:inactive,s:0.8}Ne marche seulement si les Jokers se déclenchent dans le même contexte,",
					"{C:inactive,s:0.8}comme Joker et Le Duo (les deux après le compte)",
				},
			},
			c_cry_inst = {
				name = "://INSTANCIER",
				text = {
					"Tire une carte avec la {C:cry_code}couleur{} de la carte sélectionnée",
					"et une carte avec le {C:cry_code}rang{} de la carte sélectionnée",
					"{C:inactive}(si possible){}",
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
			c_cry_patch = {
				name = "://PATCH",
				text = {
					"Enlève tous les {C:cry_code}affaiblissements",
					"de tous les objets visibles",
					"{C:cry_code}Réinitialise{} la boutique",
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
		["Content Set"] = {
			set_cry_blind = {
				name = "Blindes",
				text = {
					"Les {C:attention}Blindes de Boss{} ajoutés",
					"par Cryptid",
				},
			},
			set_cry_code = {
				name = "Cartes Code",
				text = {
					"Les {C:cry_code}Cartes Code{} et",
					"tout ce qui en dépend",
				},
			},
			set_cry_cursed = {
				name = "Jokers maudits",
				text = {
					"Les Jokers dangeureux",
					"de rareté {X:cry_cursed,C:white}Maudit{}",
				},
			},
			set_cry_deck = {
				name = "Jeux",
				text = {
					"Les différents {C:attention}jeux{}",
					"ajoutés par Cryptid",
				},
			},
			set_cry_epic = {
				name = "Jokers épiques",
				text = {
					"Les Jokers de",
					"rareté {C:cry_epic}Épique{}",
					"{C:inactive,s:0.8}(Entre Rare et Légendaire)",
				},
			},
			set_cry_exotic = {
				name = "Jokers exotiques",
				text = {
					"Les Jokers surpuissants",
					"de rareté {C:cry_exotic}Exotique{}",
				},
			},
			set_cry_m = {
				name = "Jokers M",
				text = {
					"Les Jokers liés",
					"à la lettre {C:attention}M{}",
					"et au {C:attention}Joker Joyeux",
				},
			},
			set_cry_misc = {
				name = "Divers",
				text = {
					"Tout ce qui est lié à Cryptid",
					"mais n'est lié à aucun",
					"{C:cry_ascendant}Set thématique",
				},
			},
			set_cry_misc_joker = {
				name = "Jokers divers",
				text = {
					"Tous les {C:attention}Jokers{} de Cryptid",
					"qui ne rentrent dans aucun autre",
					"{C:cry_ascendant}Set thématique",
				},
			},
			set_cry_planet = {
				name = "Cartes planète",
				text = {
					"Les diverses cartes {C:planet}Planète{}",
					"ajoutés par Cryptid",
				},
			},
			set_cry_poker_hand_stuff = {
				name = "Mains de poker supplémentaires",
				text = {
					"Rajoute 4 nouvelles {C:attention}mains de poker",
					"et active les {C:attention}mains ascensionnées",
				},
			},
			set_cry_spectral = {
				name = "Cartes spectrales",
				text = {
					"Les cartes {C:spectral}Spectrales{}",
					"ajoutées par Cryptid",
				},
			},
			set_cry_spooky = {
				name = "Mise à jour Spooky",
				text = {
					"Tout le contenu de la mise à jour Spooky,",
					"comme les Jokers {C:cry_candy}Bonbon{}",
				},
			},
			set_cry_tag = {
				name = "Badges",
				text = {
					"Les {C:attention}Badges{} ajoutés",
					"par Cryptid",
				},
			},
			set_cry_tier3 = {
				name = "Coupons niveau 3",
				text = {
					"Un {C:attention}niveau supérieur{}",
					"de Coupons",
				},
			},
			set_cry_timer = {
				name = "Mécaniques chrono",
				text = {
					"Les effets et mécaniques",
					"basés sur le {C:attention}temps",
				},
			},
			set_cry_voucher = {
				name = "Autres coupons",
				text = {
					"Les {C:attention}Coupons{} de niveau 1 et 2",
					"ajoutés par Cryptid",
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
					"{C:green}#1# chance#<s>1# sur #2#{}",
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
					"{C:inactive}(La face vierge peut être fusionnée",
					"{C:inactive}avec une autre carte)",
				},
			},
			e_cry_glass = {
				name = "Fragile",
				label = "Fragile",
				text = {
					"{C:white,X:mult} X#3# {} Multi",
					"{C:green}#1# chance#<s>1# sur #2#{} de",
					"ne pas {C:red}détruire{} cette carte",
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
				name = "Carte Écho",
				text = {
					"{C:green}#2# chance#<s>2# sur #3#{} de",
					"{C:attention}redéclencher{} cette carte #1# fois",
					"lorsqu'elle est marquée",
				},
			},
			m_cry_light = {
				name = "Carte lumière",
				text = {
					"Lorsque déclenchée avec {C:attention}#4#{} {C:inactive}(#3#){} autre#<s>4# carte#<s>4#",
					"marquée#<s>4#, gagne {X:mult,C:white}X#1#{} Multi et",
					"augmente le nombre de cartes avant la prochaîne augmentation de {C:attention}5{}",
					"{C:inactive}(Actuellement {X:mult,C:white}X#2#{C:inactive} Multi)",
				},
			},
		},
		Joker = {
			j_cry_test_modest = {
				name = "Joker de test",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1#",
					"{C:inactive}Salut! :3",
				},
			},
			j_cry_test_mainline = {
				name = "Joker de test",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1#",
					"{C:money}+$44{} lorsque la {C:attention}Blinde{} est sélectionnée",
					"{C:inactive}Salut! :3",
				},
			},
			j_cry_test_madness = {
				name = "Joker de test",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1#",
					"{C:money}+$44444{} lorsque la {C:attention}Blinde{} est sélectionnée",
					"{C:inactive}Salut! :3",
				},
			},
			j_cry_test_cryptid_in_2025 = {
				name = "Joker de test",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1#",
					"{C:money}+$44444{} lorsque la {C:attention}Blinde{} est sélectionnée",
					"{C:inactive}On est où, là, Jen's Almanac?",
				},
			},
			j_cry_adroit = {
				name = "Joker adroit",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1# si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
			},
			j_cry_altgoogol = {
				name = "Carte Googol Play Nostalgique",
				text = {
					"Vendre cette carte crée",
					"{C:attention}2{} copies du {C:attention}Joker{} le plus à gauche",
					"{C:inactive,s:0.8}Ne copie pas les Carte Googol Play Nostalgiques{}",
				},
			},
			j_cry_altgoogol_balanced = {
				name = "Carte Googol Play Nostalgique",
				text = {
					"Vendre cette carte crée",
					"{C:attention}2{} copies du {C:attention}Joker{} le plus à gauche",
					"{C:inactive,s:0.8}Ne copie pas les Carte Googol Play Nostalgiques{}",
					"{C:inactive}(Selon la place disponible){}",
					--todo: add "removes negative from copy" like Ankh/Invis Joker
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
			j_cry_arsonist = {
				name = "Pyromane",
				text = {
					"Si la main jouée",
					"contient un {C:attention}Full{},",
					"{C:red}détruit{} toutes les cartes",
					"après avoir été marqué",
				},
			},
			j_cry_astral_bottle = {
				name = "Astres en Bouteille",
				text = {
					"Lorsque cette carte est vendue,",
					"applique {C:dark_edition}Astral{}",
					"et {C:attention}Périssable{} à",
					"un {C:attention}Joker{} aléatoire",
				},
			},
			j_cry_astral_bottle_mainline = {
				name = "Astres en Bouteille",
				text = {
					"Lorsque cette carte est vendue,",
					"applique {C:dark_edition}Astral{}",
					"et {C:attention}Périssable{} à",
					"des Jokers {C:attention}Jokers{} différents, aléatoirement",
				},
			},
			j_cry_astral_bottle_madness = {
				name = "Astres en Bouteille",
				text = {
					"Lorsque cette carte est vendue,",
					"applique {C:dark_edition}Astral{}",
					"à un {C:attention}Joker{} aléatoire",
				},
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
			j_cry_blacklist = {
				name = "Liste noire",
				text = {
					"Si un {C:attention}#1#{} est tenu en main ou joué,",
					"fixe les {C:chips}Jetons{} et {C:mult}Multi{} à 0",
					"{C:red,E:2}s'auto-détruit{} s'il n'y a pas de {C:attention}#1#{} dans le jeu",
					"{C:inactive,s:0.8}Le rang ne change pas",
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
					"Gagne {C:blue}+#1#{} main#<s>1# lorsque",
					"la {C:attention}Blinde{} est sélectionnée",
				},
			},
			j_cry_bonk = {
				name = "Bonk",
				text = {
					"Chaque {C:attention}Joker{} donne {C:chips}+#1#{} Jeton#<s>1#",
					"Augmente ce nombre de {C:chips}+#2#{} si la",
					"{C:attention}main de poker{} jouée est une {C:attention}#3#{}",
					"{C:inactive,s:0.8}Les Jokers Joyeux donnent{} {C:chips,s:0.8}+#4#{} {C:inactive,s:0.8}jeton#<s>4#{}",
				},
			},
			j_cry_bonkers = {
				name = "Joker dingue",
				text = {
					"{C:red}+#1#{} Multi si",
					"la main jouée",
					"contient un {C:attention}#2#",
				},
			},
			j_cry_bonusjoker = {
				name = "Joker Bonus",
				text = {
					"{C:green}#1# chance#<s>1# sur #2#{} pour que chaque",
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
					"{C:green}#1# chance#<s>1# sur #2#{} que",
					"chaque {C:attention}Joker{} ou {C:attention}carte à jouer{}",
					"soient {C:attention}redéclenché(e)s{}",
					"{C:inactive,s:0.8}N'affecte pas d'autres Ennuis{}",
				},
				unlock = {
					"Ne rien faire dans",
					"l'écran titre pendant",
					"{C:attention}10 minutes",
				},
			},
			j_cry_brittle = {
				name = "Nougatine",
				text = {
					"Pour les {C:attention}#1#{} prochaines mains,",
					"ajoute {C:attention}Pierre{}, {C:attention}Or{}, ou {C:attention}Acier{} à",
					"la carte marquante la plus à droite",
				},
			},
			j_cry_bubblem = {
				name = "M Bulle",
				text = {
					"Crée un {C:attention}Joker Joyeux {C:dark_edition}Brillant",
					"si la main jouée contient",
					"un {C:attention}#1#{}",
					"puis {C:red,E:2}s'auto-détruit{}",
				},
			},
			j_cry_busdriver = {
				name = "Chauffeur de bus",
				text = {
					"{C:green}#1# chance#<s>1# sur #3#{}",
					"pour {C:mult}+#2#{} Multi",
					"{C:green}1 chance sur 4{}",
					"pour {C:mult}-#2#{} Multi",
				},
			},
			j_cry_candy_basket = {
				name = "Panier de bonbons",
				text = {
					"Vendre cette carte crée {C:attention}#1#{} {C:cry_candy}bonbons",
					"{C:attention}+#2#{} {C:cry_candy}bonbons{} tous les {C:attention}2{} Blindes battues",
					"{C:attention}+#3#{} {C:cry_candy}bonbons{} lorsque la {C:attention}Blinde de Boss{} est battue",
				},
			},
			j_cry_candy_buttons = {
				name = "Bonbons boutons",
				text = {
					"Les {C:attention}#1#{} prochains réassorts",
					"coûtent {C:money}$1{}",
				},
			},
			j_cry_candy_cane = {
				name = "Bonbon canne à sucre",
				text = {
					"Pour #<les,la>1# {C:attention}#1#{} prochaine#<s>1# manche#<s>1#,",
					"les cartes à jouer donnent {C:money}$#2#",
					"lorsqu'elles sont {C:attention}redéclenchées",
				},
			},
			j_cry_candy_dagger = {
				name = "Dague bonbon",
				text = {
					"Lorsque la {C:attention}Blinde{} est sélectionnée,",
					"détruit le Joker à droite de celui-ci",
					"pour créer un {C:cry_candy}Bonbon{}",
				},
			},
			j_cry_candy_sticks = {
				name = "Bonbon stick",
				text = {
					"L'effet de la prochaine blinde de boss n'est pas actif",
					"avant que vous ayez joué {C:attention}#1#{} main",
				},
			},
			j_cry_canvas = {
				name = "Canevas",
				text = {
					"{C:attention}Redéclenche{} tous les {C:attention}Jokers{} à gauche",
					"une fois pour {C:attention}chaque{C:attention} Joker{} non-{C:blue}Commun",
					"à droite de ce Joker",
				},
				unlock = {
					"Redéclencher un {C:attention}Joker",
					"{C:attention}114{} fois",
					"en une main",
				},
			},
			j_cry_canvas_balanced = {
				name = "Canevas",
				text = {
					"{C:attention}Redéclenche{} tous les {C:attention}Jokers{} à gauche",
					"une fois pour {C:attention}chaque{C:attention} Joker{} non-{C:blue}Commun",
					"à droite de ce Joker",
					"{C:inactive}(Jusqu'à 2 redéclenchements)", -- wow il s'est fait grave nerf
				},
				unlock = {
					"Redéclencher un {C:attention}Joker",
					"{C:attention}114{} fois",
					"en une main",
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
			j_cry_cat_owl = {
				name = "Chat Hibou",
				text = {
					"Les {C:attention}Cartes Chance{} sont aussi",
					"considérées des {C:attention}Cartes Écho",
					"Les {C:attention}Cartes Écho{} sont aussi",
					"considérées des {C:attention}Cartes Chance",
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
				name = "Piment",
				text = {
					"Ce Joker gagne {X:mult,C:white} X#2# {} Multi",
					"à la fin de la manche,",
					"{C:red,E:2}s'auto-détruit{} après {C:attention}#3#{} manches",
					"{C:inactive}(Actuellement{} {X:mult,C:white} X#1# {} {C:inactive}Multi){}",
				},
			},
			j_cry_chocolate_dice = {
				name = "Dé en chocolat",
				text = {
					"Lance un {C:green}d10{} lorsque",
					"la {C:attention}Blinde de Boss{} est battue",
					"pour démarrer un {C:cry_ascendant,E:1}événement",
					"{C:inactive}(Actuellement: #1#)",
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
				unlock = {
					"Obtenir un Joker {C:red}Rare{},",
					"{C:cry_epic}Épique{} et {C:legendary}Légendaire{}",
					"avant l'{C:attention}Ante 9",
				},
			},
			j_cry_clash = {
				name = "Le clash",
				text = {
					"{X:mult,C:white}x#1#{} Multi si",
					"la main jouée",
					"contient un {C:attention}#2#",
				},
				unlock = {
					"Gagner une partie",
					"en jouant une {E:1,C:attention}Paire Ultime",
					"comme main gagnante",
				},
			},
			j_cry_clicked_cookie = {
				name = "Cookie cliqué", -- the joke works better in french :3c
				text = {
					"{C:chips}+#1#{} Jeton#<s>1#",
					"{C:chips}-#2#{} Jeton#<s>2# à chaque",
					"{C:attention}clic",
				},
			},
			j_cry_clockwork = {
				name = "Joker horloger",
				text = {
					"Redéclenche toutes les cartes Acier toutes les {C:attention}#9#{} {C:inactive}(#1#){} mains",
					"Ce Joker gagne {X:mult,C:white}X#6#{} Multi {C:inactive}(X#5#){} toutes les {C:attention}#10#{} {C:inactive}(#2#){} mains",
					"Ajoute Acier à la première carte jouée toutes les {C:attention}#11#{} {C:inactive}(#3#){} mains",
					"Les cartes Acier en main donnent +{X:mult,C:white}X#8#{} Multi {C:inactive}(X#7#){} toutes les {C:attention}#12#{} {C:inactive}(#4#){} mains",
				},
			},
			j_cry_CodeJoker = {
				name = "Joker Code",
				text = {
					"Crée une {C:cry_code}Carte Code",
					"{C:dark_edition}Négative{} lorsque",
					"la {C:attention}Blinde{} est sélectionnée",
				},
				unlock = {
					"Découvrir {C:attention}toutes",
					"les {C:cry_code}Cartes Code",
				},
			},
			j_cry_CodeJoker_modest = {
				name = "Joker Code",
				text = {
					"Crée une {C:cry_code}Carte Code",
					"{C:dark_edition}Négative{} lorsque",
					"la {C:attention}Blinde Boss{} est sélectionnée",
				},
				unlock = {
					"Découvrir {C:attention}toutes",
					"les {C:cry_code}Cartes Code",
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
					"{C:green}#1# chance#<s>1# sur #2#{} pour ajouter une copie",
					"dans votre zone de consommables",
					"{C:red}Ne fonctionne qu'une seule fois par manche{}",
					"{C:inactive}(Selon la place disponible)",
				},
			},
			j_cry_copypaste_modest = {
				name = "Copy/Paste",
				text = {
					"Duplique les",
					"cartes {C:cry_code}Code{} tirées",
					"{C:inactive}(Selon la place disponible)",
				},
			},
			j_cry_copypaste_madness = {
				name = "Copy/Paste",
				text = {
					"Lorsqu'une carte {C:cry_code}Code{} est utilisée,",
					"{C:green}#1# chance#<s>1# sur #2#{} pour ajouter une copie",
					"dans votre zone de consommables",
					"{C:inactive}(Selon la place disponible)",
				},
			},
			j_cry_cotton_candy = {
				name = "Barbe-à-papa", -- admit it, you only wish it was as crazy sounding in english
				text = {
					"Lorsque cette carte est vendue,",
					"les {C:attention}Jokers{} adjacents deviennent {C:dark_edition}Négatifs{}",
				},
			},
			j_cry_crustulum = {
				name = "Crustulum",
				text = {
					"Ce joker gagne {C:chips}+#2#{} Jeton#<s>2#",
					"par {C:attention}réapprovisionnement{} dans la boutique",
					"{C:green}Tous les réapprovisionnements sont gratuits{}",
					"{C:inactive}(Actuellement {C:chips}+#1#{C:inactive} jeton#<s>1#)",
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
					"{C:chips}+#1#{} Jeton#<s>1#",
				},
			},
			j_cry_curse_sob = {
				name = "Pleure",
				text = {
					"{C:edition,E:1}tu ne peux pas {} {C:cry_ascendant,E:1}t'enfuir...{}",
					"{C:edition,E:1}tu ne peux pas{} {C:cry_ascendant,E:1}te cacher...{}",
					"{C:dark_edition,E:1}tu ne peux pas m'échapper...{}",
					"{C:inactive}(Selon la place disponible){}",
				},
				unlock = {
					"Obtenir un {C:attention}Obélisque",
					"{C:purple}Éternel{}",
				},
			},
			j_cry_cursor = {
				name = "Curseur",
				text = {
					"Ce Joker gagne {C:chips}+#2#{} Jeton#<s>2#",
					"pour chaque carte {C:attention}achetée{}",
					"{C:inactive}(Actuellement {C:chips}+#1#{C:inactive} Jeton#<s>1#)",
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
					"contient une {C:attention}#2#",
				},
			},
			j_cry_digitalhallucinations = {
				name = "Hallucinations digitales",
				text = {
					"Lorsqu'un {C:attention}Paquet{} est ouvert,",
					"{C:green}#1# chance#1s# sur #2#{} de créer",
					"une carte {C:dark_edition}Negative{} aléatoire",
					"du même {C:attention}type{} que le paquet",
				},
			},
			j_cry_discreet = {
				name = "Joker discret",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1# si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
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
			["j_cry_Double Scale_modest"] = {
				name = "Double Échelle",
				text = {
					"Les {C:attention}Jokers{} augmentant",
					"augmentent {C:attention}deux fois{} plus vite",
					"{C:inactive,s:0.8}\"Ça s'appelle la double échelle, pas l'échelle quadratique!\"",
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
				unlock = {
					"Jouer une {C:attention}Carte Haute{}",
					"avec {C:attention}4{} cartes",
					"de la {C:attention}même couleur",
				},
			},
			j_cry_dubious = {
				name = "Joker douteux",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1# si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
			},
			j_cry_duos = {
				name = "Les duos",
				text = {
					"{X:mult,C:white}X#1#{} Multi si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
				unlock = {
					"Gagner une partie",
					"sans jouer",
					"de {E:1,C:attention}Double Paire",
				},
			},
			j_cry_duplicare = {
				name = "Duplicare",
				text = {
					"Ce Joker gagne {X:mult,C:white} X#2# {} Multi",
					"lorsqu'un {C:attention}Joker{} ou une",
					"carte à jouer est marquée",
					"{C:inactive}(Actuellement {X:mult,C:white} X#1# {C:inactive} Multi)",
				},
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
					"crée {C:attention}#1#{} copie#<s>1# de celui-ci",
					"et {C:attention}augmente{} le nombre de",
					"copies de {C:attention}#2#",
				},
			},
			j_cry_equilib = {
				name = "Ace Aequilibrium",
				text = {
					"Les Jokers apparaissent en utilisant",
					"l'ordre de la {C:attention}Collection{}",
					"Crée {C:attention}#1#{} Joker#<s>1# {C:dark_edition}Négatif#<s>1#{}",
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
					"pour chaque carte {C:attention}vendue{} avec",
					"une {C:attention}valeur de vente{} de {C:money}$3{} ou plus",
					"{C:inactive}(Actuellement {X:mult,C:white} X#2# {C:inactive} Multi)",
				},
			},
			j_cry_eternalflame2 = {
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
			j_cry_exposed = {
				name = "Exposé",
				text = {
					"Redéclenche toutes les cartes {C:attention}non figure{}",
					"{C:attention}#1#{} fois de plus",
					"Les cartes {C:attention}figure{} sont affaiblies",
				},
			},
			j_cry_eyeofhagane = {
				name = "l'Œil d'Hagane",
				text = {
					"Toutes les cartes {C:attention}Figure{} marquées",
					"deviennent des cartes {C:attention}Acier{}",
				},
			},
			j_cry_highfive = {
				name = "High five",
				text = {
					"Si le rang le plus haut {C:attention}marqué{}",
					"est un {C:attention}5{}, convertit {C:attention}toutes{} les cartes marquées",
					"en des {C:attention}5{}",
					"{s:0.8,C:inactive}Les As sont considérés des 1",
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
					"contient une {C:attention}#2#",
				},
				unlock = {
					"Gagner une partie",
					"sans jouer",
					"de {E:1,C:attention}Carte Haute",
				},
			},
			j_cry_fractal = {
				name = "Doigts de fractale",
				text = {
					"{C:attention}+#1#{} à la limite de sélection de cartes",
				},
				unlock = {
					"Jouer une {C:attention}Quinte Flush{}",
					"où la {C:attention}Quinte",
					"n'est pas un {C:attention}Flush",
				},
			},
			j_cry_flip_side = {
				name = "De l'autre côté",
				text = {
					"Les jokers {C:dark_edition}Double-face{} utilisent",
					"leur face arrière pour les effets",
					"au lieu de leur face avant",
					"{C:attention}Redéclenche{} tous les jokers {C:dark_edition}Double-Face{}",
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
			j_cry_foolhardy = {
				name = "Joker imprudent",
				text = {
					"{C:red}+#1#{} Multi si la",
					"main jouée contient",
					"une {C:attention}#2#",
				},
			},
			j_cry_formidiulosus = {
				name = "Formidiulosus",
				text = {
					"Lorsqu'un Joker {X:cry_cursed,C:white}Maudit{} est obtenu, le détruit",
					"Crée {C:attention}#1#{} {C:cry_candy}Bonbons {C:dark_edition}négatifs{} à la fin de la boutique",
					"Gagne {X:dark_edition,C:white}+^#2#{} Multi pour chaque {C:cry_candy}Bonbon{} tenu",
					"{C:inactive}(Actuellement {X:dark_edition,C:white}^#3#{C:inactive} Multi)",
					-- another word instead of "détenu" i thought of would have been "possédé"
					-- but. the ghost. possession. the misunderstanding writes itself
					--  - #Guigui
				},
			},
			j_cry_foxy = {
				name = "Joker narquois",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1# si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
			},
			j_cry_fspinner = {
				name = "Hand spinner",
				text = {
					"Ce Joker gagne {C:chips}+#2#{} Jeton#<s>2#",
					"si la main jouée n'est {C:attention}pas{}",
					"la {C:attention}main de poker{} la plus jouée",
					"{C:inactive}(Actuellement {C:chips}+#1#{C:inactive} Jeton#<s>1#)",
				},
			},
			j_cry_fuckedup = {
				name = Cryptid_config.family_mode and "Joker insensé" or "Joker merdique",
				text = {
					"{C:mult}+#1#{} Multi si",
					"la main jouée",
					"contient une {C:attention}#2#",
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
			j_cry_ghost = {
				name = "Fantôme",
				text = {
					"À la fin de la manche:",
					"{C:green}#1# chance#<s>1# sur #2#{} de",
					"{C:attention}posséder{} un {C:attention}Joker{} aléatoire",
					"{C:green}#1# chance#<s>1# sur #3#{} de",
					"{E:2,C:red}s'auto-détruire",
				},
			},
			j_cry_giggly = {
				name = "Joker absurde",
				text = {
					"{C:mult}+#1#{} Multi si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
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
					"{C:green}#1# chance#<s>1# sur #2#{} de compter",
					"{X:red,C:white} X#3# {} Multi",
				},
				unlock = {
					"Marquer {C:attention}1.0e100{} Jetons",
					"en une seule main",
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
					"contient une {C:attention}#2#",
				},
				unlock = {
					"Gagner une partie",
					"sans jouer",
					"de {E:1,C:attention}Full",
				},
			},
			j_cry_hunger = {
				name = "Consomme-able",
				text = {
					"Gagne {C:money}$#1#{} lorsqu'un",
					"{C:attention}consommable{} est utilisé",
				},
			},
			j_cry_huntingseason = {
				name = "Saison de chasse",
				text = {
					"Si la main jouée contient exactement {C:attention}3{} cartes,",
					"{C:red}détruit{} la carte du {C:attention}centre{} après qu'elle soit comptée",
				},
			},
			j_cry_iterum = {
				name = "Iterum",
				text = {
					"Redéclenche toutes les cartes",
					"{C:attention}#2#{} fois,",
					"chaque carte jouée donne",
					"{X:mult,C:white} X#1# {} Multi lorsqu'elle est comptée",
				},
			},
			j_cry_jawbreaker = {
				name = "Casse-dent",
				text = {
					"Lorsque la {C:attention}Blinde de Boss{} est battue,",
					"{C:attention}double{} toutes les valeurs des Jokers adjacents",
					"puis {E:2,C:red}s'auto-détruit{}",
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
				unlock = {
					"Gagner une partie",
					"en ne jouant",
					"qu'{C:attention}un seul type{}",
					"de {C:attention}main de poker",
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
			j_cry_jtron = {
				name = "Jimbo-tron 9000",
				text = {
					"Ce Joker gagne {X:dark_edition,C:white} ^#1# {} Multi",
					"pour chaque {C:attention}Joker{} par défaut",
					"{C:inactive}(Actuellement {X:dark_edition,C:white}^#2#{C:inactive} Multi)",
				},
			},
			j_cry_kidnap = {
				name = "Kidnapping",
				text = {
					"Donne {C:money}$#1#{} à la fin de la manche",
					"pour chaque Joker {C:attention}type {C:mult}multi{}",
					"ou {C:attention}type chips{} vendu durant cette partie",
					"{C:inactive}(Actuellement {C:money}$#2#{C:inactive})",
				},
			},
			j_cry_kittyprinter = {
				name = "Chat-primante",
				text = {
					"{X:mult,C:white} X#1# {} Multi",
					"Tous les badges {C:attention}passés{}",
					"deviennent des {C:attention}Badges Chat{}",
				},
			},
			j_cry_kooky = {
				name = "Joker cinglé",
				text = {
					"{C:mult}+#1#{} Multi si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
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
				unlock = {
					"Battre une {C:attention}Blinde de Boss",
					"avec {C:attention}5 cartes avec édition",
					"et {C:attention}jokers",
					"ou plus",
				},
			},
			j_cry_lebaron_james = {
				name = "LeBaron James",
				text = {
					"Les {C:attention}Rois{} comptés donnent",
					"{C:attention}+#1#{} à la taille de la main cette manche",
					"et redéclenchent les effets des cartes {C:attention}tenues en main{}",
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
				name = "Monstre",
				text = {
					"Ajoute aux prochaines versions",
					"de ce joker {X:mult,C:white}X#1#{} Multi",
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
					"{C:inactive}(Actuellement {}{C:attention:}#1#{}{C:inactive} redéclenchement#<s>1#){}",
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
					"contient une {C:attention}#2#",
				},
			},
			j_cry_mario = {
				name = "Mario",
				text = {
					"Redéclenche tous les Jokers",
					"{C:attention}#1#{} fois de plus",
				},
			},
			j_cry_mask = {
				name = "Masque",
				text = {
					"Redéclenche toutes les cartes {C:attention}Figure{}",
					"{C:attention}#1#{} fois supplémentaire#<s>1#",
					"Toutes les cartes non-{C:attention}Figure{} sont affaiblies",
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
				unlock = {
					"Jouer un {C:attention}Flush Five{}",
					"de {C:attention}Rois",
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
			j_cry_mellowcreme = {
				name = "Bonbon citrouille",
				text = {
					"Vendre cette carte {C:attention}multiplie",
					"la valeur de vente de tous",
					"les {C:attention}consommables{} par {C:attention}X#1#",
				},
			},
			j_cry_membershipcard = {
				name = "Carte de membre",
				text = {
					"{X:mult,C:white}X#1#{} Multi pour chaque membre",
					"dans le {C:attention}serveur Discord{} de {C:attention}Cryptid{}",
					"{C:inactive}(Actuellement {X:mult,C:white}X#2#{C:inactive} Multi)",
					"{C:blue,s:0.7}https://discord.gg/cryptid{}",
				},
			},
			j_cry_membershipcardtwo = {
				name = "Vieille carte de membre", --Could probably have a diff Name imo
				text = {
					"{C:chips}+#1#{} Jeton#<s>1# pour chaque membre",
					"dans le {C:attention}serveur Discord{} de {C:attention}Cryptid{}",
					"{C:inactive}(Actuellement {C:chips}+#2#{C:inactive} Jeton#<s>2#)",
					"{C:blue,s:0.7}https://discord.gg/cryptid{}",
				},
			},
			j_cry_membershipcardtwo_balanced = {
				name = "Vieille carte de membre", --Could probably have a diff Name imo
				text = {
					"{C:chips}+#1#{} Jeton#<s>1# tous les {C:attention}8{} membres",
					"dans le {C:attention}serveur Discord{} de {C:attention}Cryptid{}",
					"{C:inactive}(Actuellement {C:chips}+#2#{C:inactive} Jeton#<s>2#)",
					"{C:blue,s:0.7}https://discord.gg/cryptid{}",
				},
			},
			j_cry_meteor = {
				name = "Pluie de météores",
				text = {
					"Les cartes {C:dark_edition}Brillantes{} donnent",
					"chacun {C:chips}+#1#{} Jeton#<s>1#",
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
					"{C:inactive}(Actuellement {C:chips}+#1#{C:inactive} Jeton#<s>1#)",
				},
			},
			j_cry_monopoly_money = {
				name = "Billet de Monopoly",
				text = {
					"{C:green}#1# chance#<s>1# sur #2#{} de",
					"{C:attention}détruire{} les objets achetés",
					"Divise l'argent par 2 si {C:attention}vendu",
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
			},
			j_cry_mstack = {
				name = "Pile de Ms",
				text = {
					"Redéclenche toutes les cartes jouées",
					"une fois pour chaque",
					"{C:attention}#2#{} {C:inactive}[#3#]{} {C:attention}Jokers Joyeux{} vendus",
					"{C:inactive}(Actuellement {C:attention:}#1#{C:inactive} redéclenchements)",
				},
			},
			j_cry_multjoker = {
				name = "Joker Multi",
				text = {
					"{C:green}#1# chance#<s>1# sur #2#{} pour chaque",
					"carte {C:attention}Multi{} jouée de créer",
					"une carte {C:spectral}Cryptide{} lorsqu'elle est marquée",
					"{C:inactive}(Selon la place disponible)",
				},
			},
			j_cry_necromancer = {
				name = "Nécromancien",
				text = {
					"Lorsqu'un Joker est {C:attention}vendu{} pour plus de {C:attention}$0{},",
					"gagne un Joker {C:attention}aléatoire{} {C:attention}vendu{} durant cette partie",
					"et fixe sa {C:attention}valeur de vente{} à {C:attention}$0{}",
				},
			},
			j_cry_negative = {
				name = "Joker négatif",
				text = {
					"{C:dark_edition}+#1#{C:attention} Joker{} max",
				},
			},
			j_cry_nice = {
				name = "Nice",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1# si la main jouée",
					"contient un {C:attention}6{} et un {C:attention}9",
					"{C:inactive,s:0.8}Nice.{}",
				},
			},
			j_cry_night = {
				name = "Nuit",
				text = {
					"{X:dark_edition,C:white}^#1#{} Multi sur la",
					"main finale de la manche",
					"{E:2,C:red}S'auto-détruit{} après déclenchement",
				},
			},
			j_cry_nosound = {
				name = "No Sound, No Memory",
				text = {
					"Redéclenche chaque {C:attention}7{} joué",
					"{C:attention:}#1#{} fois supplémentaires",
				},
			},
			j_cry_notebook = {
				name = "Carnet",
				text = {
					"{C:green} #1# chance#<s>1# sur #2#{} de gagner {C:dark_edition}+1{} Joker max",
					"à chaque {C:attention}réapprovisionnement{} de la boutique",
					"Se {C:green}déclenche toujours{} s'il y a",
					"{C:attention}#5# Jokers Joyeux{} ou plus",
					"{C:red}Fonctionne une seule fois par manche{}",
					"{C:inactive}(Actuellement {C:dark_edition}+#3#{}{C:inactive} et #4#){}",
				},
			},
			j_cry_number_blocks = {
				name = "Blocs numéros",
				text = {
					"Gagne {C:money}$#1#{} à la fin de la manche",
					"Augmente le gain de {C:money}$#2#{}",
					"pour chaque {C:attention}#3#{} tenu en main,",
					"le rang change à chaque manche",
				},
			},
			j_cry_nuts = {
				name = "Les noix",
				text = {
					"{X:mult,C:white}X#1#{} Multi si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
				unlock = {
					"Gagner une partie",
					"sans jouer",
					"de {E:1,C:attention}Quinte Flush",
				},
			},
			j_cry_nutty = {
				name = "Joker foldingue",
				text = {
					"{C:mult}+#1#{} Multi si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
			},
			j_cry_oil_lamp = {
				name = "Lampe à huile",
				text = {
					"Augmente les valeurs du Joker {C:attention}à la droite{} de celui-ci",
					"de {C:attention}x#1#{} à la fin de la manche",
				},
			},
			j_cry_oldblueprint = {
				name = "Vieux modèle",
				text = {
					"Copie les capacités du",
					"{C:attention}Joker{} à sa droite",
					"{C:green}#1# chance#<s>1# sur #2#{} que",
					"cette carte soit détruite",
					"à la fin de la manche",
				},
			},
			j_cry_oldcandy = {
				name = "Bonbon rétro",
				text = {
					"Vendre cette carte",
					"augmente la taille de la main de",
					"{C:attention}+#1#{} de manière permanente",
				},
			},
			j_cry_oldinvisible = {
				name = "Joker Invisible Nostalgique",
				text = {
					"{C:attention}Duplique{} un {C:attention}Joker{}",
					"aléatoire tous les {C:attention}4",
					"cartes Joker vendues",
					"{s:0.8}Joker Invisible Nostalgique exclu{}",
					"{C:inactive}(Actuellement #1#/4){}",
				},
			},
			j_cry_panopticon = {
				name = "Panoptique",
				text = {
					"Toutes les mains sont considérés",
					"la {C:attention}dernière main{} de chaque manche", -- +$4
				},
			},
			j_cry_penetrating = {
				name = "Joker perçant",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1# si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
			},
			j_cry_pickle = {
				name = "Cornichon",
				text = {
					"Lorsque la {C:attention}Blinde{} est passée, crée",
					"{C:attention}#1#{} Badges, réduit de",
					"{C:red}#2#{} lorsque la {C:attention}Blinde{} est sélectionnée",
				},
			},
			j_cry_pirate_dagger = {
				name = "Dague pirate",
				text = {
					"Lorsque la {C:attention}Blinde{} est sélectionnée,",
					"détruit le Joker à droite de celui-ci",
					"et gagne {C:attention}un quart{} de",
					"sa valeur de vente en tant que {X:chips,C:white} XJetons {}",
					"{C:inactive}(Actuellement {X:chips,C:white} X#1# {C:inactive} Jetons)",
				},
			},
			j_cry_pity_prize = {
				name = "Lot de pitié",
				text = {
					"Lorsqu'un {C:attention}Paquet Booster{} est passé,",
					"donne un {C:attention}Badge{} aléatoire",
				},
			},
			j_cry_pot_of_jokes = {
				name = "Pot de Blagues",
				text = {
					"{C:attention}#1#{} à la taille de la main,",
					"mais augmente de",
					"{C:blue}#2#{} à la fin de la manche",
					"{C:inactive}({}{C:attention}#3#{}{C:inactive} taille de main maximum){}",
				},
				unlock = {
					"Augmenter la {C:attention}taille de la main",
					"à {C:attention}12",
				},
			},
			j_cry_primus = {
				name = "Primus",
				text = {
					"Ce Joker gagne {X:dark_edition,C:white} ^#1# {} Multi",
					"si toutes les cartes jouées sont des",
					"{C:attention}As{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, ou {C:attention}7{}",
					"{C:inactive}(Actuellement {X:dark_edition,C:white} ^#2# {C:inactive} Multi)",
				},
			},
			j_cry_pumpkin = {
				name = "Citrouille",
				text = {
					"Empêche la mort si les jetons marqués",
					"comptent au moins {C:attention}50%{} des jetons nécessaires",
					"{C:attention}Devient une Citrouille sculptée",
					"{C:attention}lorsqu'elle est{} {C:red}détruite",
				},
			},
			j_cry_carved_pumpkin = {
				name = "Carved Pumpkin",
				text = {
					"Les {C:attention}#1#{} prochaînes Blindes de Boss",
					"auront leur fonctionnalité",
					"{C:attention}désactivée",
				},
			},
			j_cry_python = {
				name = "Python",
				text = {
					"Ce Joker gagne",
					"{X:mult,C:white} X#1# {} Multi lorsqu'une",
					"carte {C:cry_code}Code{} est utilisée",
					"{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
				},
			},
			j_cry_queens_gambit = {
				name = "Gambit de la Dame",
				text = {
					"Si la {C:attention}main de poker{} jouée est une",
					"{C:attention}Quinte flush royale{}, détruit la",
					"{C:attention}Dame{} marquante et crée",
					"un {C:attention}Joker {C:red}Rare {C:dark_edition}Negativé",
				},
			},
			j_cry_quintet = {
				name = "Le Quintet",
				text = {
					"{X:mult,C:white}X#1#{} Multi si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
				unlock = {
					"Gagner une partie",
					"avec comme dernière main",
					"un {E:1,C:attention}Five of a Kind",
					-- TODO: Do we want to use vanilla or betterfr hand names?
				},
			},
			j_cry_redbloon = {
				name = "Bloon Rouge",
				text = {
					"Gagne {C:money}$#1#{} dans {C:attention}#2#{} manche#<s>2#",
					"{C:red,E:2}s'auto-détruit{}",
				},
			},
			j_cry_redeo = {
				name = "Redeo",
				text = {
					"{C:attention}-#1#{} Ante lorsque",
					"{C:money}$#2#{} {C:inactive}($#3#){} sont dépensés",
					"{s:0.8}Cette condition croît",
					"{C:attention,s:0.8}exponentiellement{s:0.8} à chaque déclenchement",
					"{C:money,s:0.8}Prochaine augmentation: {s:1,c:money}$#4#",
				},
			},
			j_cry_rescribere = {
				name = "Rescribere",
				text = {
					"Lorsqu'un {C:attention}Joker{} est vendu,",
					"ajoute ses effets à",
					"tous les autres jokers",
					"{C:inactive,s:0.8}N'affecte pas d'autres Rescribere{}",
				},
			},
			j_cry_reverse = {
				name = "Carte Inversion",
				text = {
					"Remplit tous les emplacements de Joker vides {C:inactive}(100 max){}",
					"avec des {C:attention}Jokers Joyeux {C:dark_edition}Holographiques{} si",
					"la {C:attention}main de poker défaussée{} est une {C:attention}#1#{}",
					"{C:red,E:2}s'auto-détruit{}",
					"{C:inactive,s:0.8}The ULTIMATE comeback{}",
				},
			},
			j_cry_rnjoker = {
				name = "RNJoker",
				text = {
					"Les capacités sont changées à chaque {C:attention}Ante{}",
				},
				unlock = {
					"{C:green}1 chance sur 20{}",
					"de débloquer cette carte",
					"après un {C:attention}Game Over",
				},
			},
			j_cry_sacrifice = {
				name = "Sacrifice",
				text = {
					"Crée un Joker {C:green}Peu commun{}",
					"et 3 {C:attention}Jokers Joyeux{} lorsqu'une",
					"carte {C:spectral}Spectrale{} est utilisée",
					"{C:red}Ne marche qu'une fois par manche{}",
					"{C:inactive}#1#{}",
				},
			},
			j_cry_sapling = {
				name = "Arbuste",
				text = {
					"Après avoir marqué {C:attention}#2#{} {C:inactive}[#1#]{}",
					"cartes améliorées, vendre cette carte",
					"crée un {C:attention}Joker{} {V:1}#3#",
				},
			},
			j_cry_savvy = {
				name = "Joker avisé",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1# si",
					"la main jouée",
					"contient un {C:attention}#2#",
				},
			},
			j_cry_Scalae = {
				name = "Scalae",
				text = {
					"Les {C:attention}Jokers{} augmentant augmentent",
					"comme un polynome de degré {C:attention}#1#{}",
					"élève le degré de {C:attention}#2#{}",
					"à la fin de la manche",
					"{C:inactive,s:0.8}({C:attention,s:0.8}Scalae{C:inactive,s:0.8} exclu)",
					"{C:inactive,s:0.8}(par ex. +1, +#3#, +#4#, +#5#)",
				},
			},
			j_cry_scrabble = {
				name = "Lettre de Scrabble",
				text = {
					"{C:green}#1# chance#<s>1# sur #2#{} de créer",
					"un Joker {C:dark_edition}Joyeux {C:green}Peu commun{}",
					"lorsque la main est jouée",
				},
			},
			j_cry_seal_the_deal = {
				name = "Affaire scellée",
				text = {
					"Ajoute un {C:attention}sceau aléatoire{} à chaque carte",
					"marquée lors de la {C:attention}dernière main{} de la manche",
				},
			},
			j_cry_shrewd = {
				name = "Joker astucieux",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1# si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
			},
			j_cry_silly = {
				name = "Joker farfelu",
				text = {
					"{C:mult}+#1#{} Multi si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
			},
			j_cry_smallestm = {
				name = "Riquiqui",
				text = {
					"{X:chips,C:white} X#1# {} Jetons jusqu'à la",
					"fin de la manche si la {C:attention}main de poker{} jouée",
					"est un(e) {C:attention}#2#{}",
					"{C:inactive}(Actuellement {C:attention}#3#{}{C:inactive}){}",
					"{C:inactive,s:0.8}ok so basically i'm very smol",
				},
			},
			j_cry_soccer = {
				name = "One for All", --changed the name from latin because this isn't exotic
				text = {
					"{C:attention}+#1#{} Joker max",
					"{C:attention}+#1#{} Paquet Booster max",
					"{C:attention}+#1#{} taille de main",
					"{C:attention}+#1#{} emplacement#<s>1# de consommable",
					"{C:attention}+#1#{} carte#<s>1# dans la boutique",
					"{C:attention}+#1#{} emplacement#<s>1# de coupon",
				},
				unlock = {
					"Gagner une partie",
					"en ne jouant que des {C:attention}Carte Haute",
				},
			},
			j_cry_soccer_balanced = {
				name = "One for All", --changed the name from latin because this isn't exotic
				text = {
					"{C:attention}+#1#{} Booster Pack max",
					"{C:attention}+#1#{} taille de main",
					"{C:attention}+#1#{} emplacement#<s>1# de consommable",
					"{C:attention}+#1#{} carte#<s>1# dans la boutique",
					"{C:attention}+#1#{} emplacement#<s>1# de coupon",
				},
				unlock = {
					"Win a run with",
					"only {C:attention}High Card",
				},
			},
			j_cry_fleshpanopticon = {
				name = "Flesh Panopticon",
				text = {
					"{C:red}X#1#{} à la taille de la {C:attention}Blinde de Boss{}",
					"Lorsque la {C:attention}Boss Blind{} est battue,",
					"{C:red}s'auto-détruit{}, et crée",
					"une carte {C:spectral}Portail{} {C:dark_edition}Négative{}",
					'{C:inactive,s:0.8}"This prison... to hold... me?"',
				},
			},
			j_cry_spaceglobe = {
				name = "Globe Céleste",
				text = {
					"Ce Joker gagne {X:chips,C:white}X#2#{} Jetons",
					"si la {C:attention}main de poker{} jouée est un(e) {C:attention}#3#{},",
					"La main change après chaque gain{}",
					"{C:inactive}(Actuellement{} {X:chips,C:white}X#1#{} {C:inactive}Jetons){}",
				},
			},
			j_cry_spectrogram = {
				name = "Spectrogramme",
				text = {
					"{C:attention}Redéclenche{} le Joker le plus à droite",
					"une fois pour chaque {C:attention}Carte Écho",
					"jouée et comptée",
				},
			},
			j_cry_speculo = {
				name = "Speculo",
				text = {
					"Crée une copie {C:dark_edition}Négative{}",
					"d'un {C:attention}Joker{} aléatoire",
					"à la fin de la {C:attention}boutique",
					"{C:inactive,s:0.8}Ne copie pas d'autres Speculo{}",
				},
			},
			j_cry_spy = {
				name = "Le Spy",
				text = {
					"{X:mult,C:white} X#2# {} Multi, {C:dark_edition}+1{} emplacement {C:attention}Joker{}",
					"{C:inactive}Ce #1# est un Espion!",
				},
			},
			j_cry_stardust = {
				name = "Poussière d'étoile",
				text = {
					"Les cartes {C:dark_edition}Polychrome{}",
					"donnent chacun {X:mult,C:white}X#1#{} Multi",
					"{C:inactive,s:0.8}L'effet ne se déclenche pas",
					"{C:inactive,s:0.8}sur Poussière d'étoile",
				},
			},
			j_cry_stella_mortis = {
				name = "Stella Mortis",
				text = {
					"Ce Joker détruit une",
					"carte {C:planet}Planète{} aléatoire",
					"et gagne {X:dark_edition,C:white} ^#1# {} Multi",
					"à la fin de la {C:attention}boutique{}",
					"{C:inactive}(Actuellement {X:dark_edition,C:white} ^#2# {C:inactive} Multi)",
				},
			},
			j_cry_stronghold = {
				name = "La Forteresse",
				text = {
					"{X:mult,C:white}x#1#{} Multi si",
					"la main jouée",
					"contient un {C:attention}#2#",
				},
				unlock = {
					"Gagner une partie",
					"avec comme dernière main",
					"un {E:1,C:attention}Rempart",
				},
			},
			j_cry_subtle = {
				name = "Joker subtil",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1# si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
			},
			j_cry_supercell = {
				name = "Supercell",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1#, {C:mult}+#1#{} Multi,",
					"{X:chips,C:white}X#2#{} Jetons, {X:mult,C:white}X#2#{} Multi",
					"Gagne {C:money}$#3#{} à",
					"la fin de la manche",
				},
			},
			j_cry_supercell_balanced = {
				name = "Supercell",
				text = {
					"{X:chips,C:white}X#2#{} Jetons, {X:mult,C:white}X#2#{} Multi",
					"Gagne {C:money}$#3#{} à",
					"la fin de la manche",
				},
			},
			j_cry_sus = {
				name = "SUS",
				text = {
					"À la fin de la manche, crée",
					"une {C:attention}copie{} d'une carte",
					"aléatoire {C:attention}tenue en main{},",
					"détruit toutes les autres",
					"{s:0.8}Les {C:attention,s:0.8}Rois{s:0.8} de {C:hearts,s:0.8}Cœur{s:0.8} sont prioritaires",
				},
			},
			j_cry_swarm = {
				name = "L'essaim",
				text = {
					"{X:mult,C:white}x#1#{} Multi si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
				unlock = {
					"Gagner une partie",
					"avec comme dernière main",
					"un {E:1,C:attention}Pentacle flush", -- TODO: *what* do we use for hand names??
				},
			},
			j_cry_sync_catalyst = {
				name = "Catalyse Synchro",
				text = {
					"Balance les {C:chips}Jetons{} et le {C:mult}Multi{}",
					"{C:inactive,s:0.8}Hey! I've seen this one before!",
				},
			},
			j_cry_tax_fraud = {
				name = "Évasion Fiscale",
				text = {
					"Octroie {C:attention}#1#${} par {C:attention}Joker en Location",
					"à la fin de la manche",
				},
			},
			j_cry_tenebris = {
				name = "Tenebris",
				text = {
					"{C:dark_edition}+#1#{C:attention} Joker{} max",
					"Gagne {C:money}$#2#{} à la fin de la manche",
				},
			},
			j_cry_translucent = {
				name = "Joker translucent",
				text = {
					"Vendre cette carte crée",
					"une copie {C:attention}Périssable Banane{}",
					"d'un {C:attention}Joker{} aléatoire",
					"{s:0.8,C:inactive}(La copie ignore les compatibilités Périssable)",
				},
			},
			j_cry_treacherous = {
				name = "Joker traître",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1# si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
			},
			j_cry_trick_or_treat = {
				name = "Des bonbons ou un sort!",
				text = {
					"Lorsque cette carte est {C:attention}vendue{}:",
					"{C:green}#1# chance#<s>1# sur #2#{} de créer {C:attention}2{} {C:cry_candy}bonbons",
					"Sinon, crée un Joker {X:cry_cursed,C:white}Maudit{}",
					"{C:inactive}(Peut dépasser les maximums)",
				},
			},
			j_cry_tricksy = {
				name = "Joker espiègle",
				text = {
					"{C:chips}+#1#{} Jeton#<s>1# si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
			},
			j_cry_triplet_rhythm = {
				name = "Rythme triolet",
				text = {
					"{X:mult,C:white} X#1# {} Multi si la main marquée",
					"contient {C:attention}exactement{} trois cartes {C:attention}3",
				},
			},
			j_cry_tropical_smoothie = {
				name = "Smoothie tropical",
				text = {
					"Vendre cette carte",
					"{C:attention}multiplie{} les valeurs",
					"des jokers possédés de {C:attention}X1.5{}",
				},
			},
			j_cry_unity = {
				name = "L'Unité",
				text = {
					"{X:mult,C:white}x#1#{} Multi si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
				unlock = {
					"Gagner une partie",
					"avec comme dernière main",
					"un {E:1,C:attention}Full flush",
					-- okay for this one i think the betterfr hand name fits better
				},
			},
			j_cry_universe = {
				name = "L'Univers",
				text = {
					"Les cartes {C:dark_edition}Astrales{}",
					"donnent toutes {X:dark_edition,C:white}^#1#{} Multi",
				},
			},
			j_cry_universum = {
				name = "Universum",
				text = {
					"Les {C:attention}mains de poker{} gagnent",
					"{X:red,C:white} X#1# {} Multi et {X:blue,C:white} X#1# {} Jetons",
					"à chaque amélioration",
				},
			},
			j_cry_unjust_dagger = {
				name = "Dague injuste",
				text = {
					"Lorsque la {C:attention}Blind{} est sélectionnée,",
					"détruit le Joker le plus à droite",
					"et gagne {C:attention}un cinquième{} de",
					"sa valeur de vente en tant que {X:mult,C:white} XMulti {}",
					"{C:inactive}(Actuellement {X:mult,C:white} X#1# {C:inactive} Multi)",
				},
			},
			j_cry_verisimile = {
				name = "Non Verisimile",
				text = {
					"Lorsqu'une probabilitée",
					"est déclenchée et {C:green}succainte{},",
					"ce Joker gagne {X:red,C:white}XMulti{}",
					"égal à ses {C:attention}probabilités{} listées",
					"{C:inactive}(Actuellement {X:mult,C:white} X#1# {C:inactive} Multi)",
				},
			},
			j_cry_virgo = {
				name = "Vierge",
				text = {
					"Ce Joker gagne {C:money}$#1#{} à sa {C:attention}valeur de vente{}",
					"si la {C:attention}main de poker{} contient une {C:attention}#2#{}",
					"Vendre cette carte crée",
					"un {C:attention}Joker Joyeux{} {C:dark_edition}Polychrome{}",
					"tous les {C:money}$4{} de {C:attention}valeur de vente{} {C:inactive}(1 minimum){}",
				},
			},
			j_cry_wacky = {
				name = "Joker loufoque",
				text = {
					"{C:mult}+#1#{} Multi si",
					"la main jouée",
					"contient une {C:attention}#2#",
				},
			},
			j_cry_waluigi = {
				name = "Waluigi",
				text = {
					"Tous les Jokers donnent",
					"{X:mult,C:white} X#1# {} Multi",
				},
			},
			j_cry_wario = {
				name = "Wario",
				text = {
					"Tous les Jokers donnent",
					"{C:money}$#1#{} à chaque déclenchement",
				},
			},
			j_cry_wee_fib = {
				name = "Weebonacci",
				text = {
					"Ce Joker gagne",
					"{C:mult}+#2#{} Multi lorsque chaque",
					"{C:attention}As{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, ou {C:attention}8{}",
					"joué est compté",
					"{C:inactive}(Actuellement {C:mult}+#1#{C:inactive} Multi)",
				},
			},
			j_cry_weegaming = {
				name = "2D",
				text = {
					"Redéclenche chaque {C:attention}2{} joué", --wee gaming
					"{C:attention:}#1#{} fois supplémentaire#<s>1#", --wee gaming?
					"{C:inactive,s:0.8}Wee Gaming?{}",
				},
			},
			j_cry_wheelhope = {
				name = "la Roue de l'espérance",
				text = {
					"Ce Joker gagne",
					"{X:mult,C:white} X#1# {} Multi à chaque échec",
					"de la {C:attention}Roue de la Fortune{}",
					"{C:inactive}(Actuellement {X:mult,C:white} X#2# {C:inactive} Multi)",
				},
			},
			j_cry_whip = {
				name = "The WHIP",
				text = {
					"Ce Joker gagne {X:mult,C:white} X#1# {} Multi",
					"si la {C:attention}main jouée{} contient",
					"un {C:attention}2{} et un {C:attention}7{} de couleur différentes",
					"{C:inactive}(Actuellement {X:mult,C:white} X#2# {C:inactive} Multi)",
				},
			},
			j_cry_wonka_bar = {
				name = "Wonka Bar",
				text = {
					"Vendre cette carte",
					"augmente de {C:attention}+#1#{} la",
					"limite de sélection de cartes",
				},
			},
			j_cry_wrapped = {
				name = "Bonbon enveloppé",
				text = {
					"Crée un {C:attention}Joker Nourriture{}",
					"dans {C:attention}#1#{} manche#<s>1#",
					"puis {C:red,E:2}s'auto-détruit{}",
				},
			},
			j_cry_wtf = {
				name = Cryptid_config.family_mode and "Le Capharnaüm" or "Le Bordel",
				text = {
					"{X:mult,C:white}x#1#{} Multi si",
					"la main jouée",
					"contient un {C:attention}#2#",
				},
				unlock = {
					"Gagner une partie",
					"avec comme dernière main",
					"un {E:1,C:attention}Bordel",
					-- now do we have the family friendly mode here too or
				},
			},
			j_cry_zooble = {
				name = "Zooble",
				text = {
					"Si la main jouée",
					"ne contient {C:attention}pas{} de {C:attention}Quinte{},",
					"ce Joker gagne {C:mult}+#2#{} Multi pour chaque",
					"{C:attention}rang unique{} marqué dans la main",
					"{C:inactive}(Actuellement {C:mult}+#1#{C:inactive} Multi)",
				},
			},
		},
		Planet = {
			c_cry_Klubi = {
				name = "Klubi",
				text = {
					"({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
					"Améliore",
					"{C:attention}#1#{},",
					"{C:attention}#2#{},",
					"et {C:attention}#3#{}",
				},
			},
			c_cry_Lapio = {
				name = "Lapio",
				text = {
					"({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
					"Améliore",
					"{C:attention}#1#{},",
					"{C:attention}#2#{},",
					"et {C:attention}#3#{}",
				},
			},
			c_cry_Kaikki = {
				name = "Kaikki",
				text = {
					"({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
					"Améliore",
					"{C:attention}#1#{},",
					"{C:attention}#2#{},",
					"et {C:attention}#3#{}",
				},
			},
			c_cry_nstar = {
				name = "Étoile à neutrons",
				text = {
					"Améliore une main de poker",
					"aléatoire d'{C:attention}1{} niveau",
					"pour chaque utilisation",
					"d'{C:attention}Étoile à neutrons{}",
					"durant cette partie",
					"{C:inactive}(Actuellement{C:attention} #1#{C:inactive}){}",
				},
			},
			c_cry_planetlua = {
				name = "Planete.lua",
				text = {
					"{C:green}#1# chance#<s>1# sur #2#{}",
					"d'améliorer toutes",
					"les {C:legendary,E:1}mains de poker{}",
					"d'{C:attention}1{} niveau",
				},
			},
			c_cry_Sydan = {
				name = "Sydan",
				text = {
					"({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
					"Améliore",
					"{C:attention}#1#{},",
					"{C:attention}#2#{},",
					"et {C:attention}#3#{}",
				},
			},
			c_cry_Timantti = {
				name = "Timantti",
				text = {
					"({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
					"Améliore",
					"{C:attention}#1#{},",
					"{C:attention}#2#{},",
					"et {C:attention}#3#{}",
				},
			},
			c_cry_marsmoons = {
				name = "Phobos & Déimos",
				text = {
					"{S:0.8}({S:0.8,V:1}niv.#1#{S:0.8}){} Améliore",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Multi et",
					"{C:chips}+#4#{} Jeton#<s>4#",
				},
			},
			c_cry_void = {
				name = "Vide",
				text = {
					"{S:0.8}({S:0.8,V:1}niv.#1#{S:0.8}){} Améliore",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Multi et",
					"{C:chips}+#4#{} Jeton#<s>4#",
				},
			},
			c_cry_asteroidbelt = {
				name = "Ceinture d'astéroïdes",
				text = {
					"{S:0.8}({S:0.8,V:1}niv.#1#{S:0.8}){} Améliore",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Multi et",
					"{C:chips}+#4#{} Jeton#<s>4#",
				},
			},
			c_cry_universe = {
				name = Cryptid_config.family_mode and "L'entièreté de l'univers observable"
					or "l'entièreté du putain d'univers",
				text = {
					"{S:0.8}({S:0.8,V:1}niv.#1#{S:0.8}){} Améliore",
					"{C:attention}#2#",
					"{C:mult}+#3#{} Multi et",
					"{C:chips}+#4#{} Jeton#<s>4#",
				},
			},
			c_cry_sunplanet = {
				name = "Soleil",
				text = {
					"{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){}",
					"Augmente la puissance des",
					"mains {C:attention}ascensionnées{} de {X:gold,C:white}#2#{}",
					"{C:inactive}(Actuellement {X:gold,C:white}X(#3#^asc){C:inactive})",
				},
			},
		},
		Sleeve = {
			sleeve_cry_beige_sleeve = {
				name = "Pochette Beige",
				text = {
					"Les Jokers {C:attention}Communs{} ont leur",
					"valeurs {C:attention}quadruplées{}",
				},
			},
			sleeve_cry_beige_sleeve_alt = {
				name = "Beige Sleeve",
				text = {
					"Les Jokers {C:attention}peu communs{} ont leur",
					"valeurs {C:attention}quadruplées{}",
				},
			},
			sleeve_cry_beta_sleeve = {
				name = "Nostalgic Sleeve",
				text = {
					"Les emplacements de {C:attention}Joker{} et {C:attention}Consommable{}",
					"sont {C:attention}combinés",
					"Les blindes {C:attention}Nostalgiques{} remplacent",
					"leur équivalent",
				},
			},
			sleeve_cry_bountiful_sleeve = {
				name = "Pochette généreuse",
				text = {
					"Après chaque main {C:blue}jouée{} ou {C:red}défaussée{},",
					"tire toujours {C:attention}5{} cartes",
				},
			},
			sleeve_cry_ccd_sleeve = {
				name = "Pochette CCD",
				text = {
					"Chaque carte est aussi",
					"un consommable {C:attention}aléatoire{}",
				},
			},
			sleeve_cry_conveyor_sleeve = {
				name = "Pochette Convoyeur",
				text = {
					"Les Jokers {C:attention}ne peuvent pas{} être déplacés",
					"A chaque manche,",
					"{C:attention}copie{} le Joker le plus à droite",
					"and {C:attention}destroy{} le Joker le plus à gauche",
				},
			},
			sleeve_cry_critical_sleeve = {
				name = "Pochette Critique",
				text = {
					"Après chaque main jouée,",
					"{C:green}1 chance sur 4{} d'obtenir {X:dark_edition,C:white} ^2 {} Multi",
					"{C:green}1 chance sur 8{} d'obtenir {X:dark_edition,C:white} ^0.5 {} Multi",
				},
			},
			sleeve_cry_encoded_sleeve = {
				name = "Pochette encodée",
				text = {
					"Démarre avec un {C:cry_code,T:j_cry_CodeJoker}Joker Code{}",
					"et un {C:cry_code,T:j_cry_copypaste}Copier/Coller{}",
					"Seules les {C:cry_code}Cartes Code{} apparaissent dans la boutique",
				},
			},
			sleeve_cry_equilibrium_sleeve = {
				name = "Pochette équilibrée",
				text = {
					"Toutes les cartes ont",
					"la {C:attention}même chance{}",
					"d'apparaître dans la boutique,",
					"démarre la partie avec",
					"{C:attention,T:v_overstock_plus}+2 cartes dans la boutique",
				},
			},
			sleeve_cry_glowing_sleeve = {
				name = "Pochette brillante",
				text = {
					"Multiplie les valeurs de",
					"tous les Jokers de {X:dark_edition,C:white} X1.25 {}",
					"lorsque la Blinde Boss est battue",
					"{X:cry_jolly,C:white,s:0.8} Jolly#1#Open#1#Winner#1#-#1#wawa#1#person", --peak loc_vars right here
				},
			},
			sleeve_cry_infinite_sleeve = {
				name = "Pochette illimitée",
				text = {
					"Vous pouvez sélectionner",
					"{C:attention}n'importe quel{} nombre de cartes",
					--someone do the hand size thing for me
				},
			},
			sleeve_cry_misprint_sleeve = {
				name = "Pochette défective",
				text = {
					"La valeur des cartes",
					"sont {C:attention}aléatoires",
				},
			},
			sleeve_cry_redeemed_sleeve = {
				name = "Pochette 2-pour-le-prix-d'un",
				text = {
					"Quand un {C:attention}coupon{} est acheté,",
					"gagne ses {C:attention}améliorations",
				},
			},
			sleeve_cry_spooky_sleeve = {
				name = "Pochette Effroi",
				text = {
					"Démarre avec un {C:attention,T:j_cry_chocolate_dice}Dé en chocolat{} {C:eternal}éternel",
					"Après chaque {C:attention}Ante{}, crée un",
					"{C:cry_candy}Bonbon{} ou un Joker {X:cry_cursed,C:white}Maudit{}",
				},
			},
			sleeve_cry_very_fair_sleeve = {
				name = "Pochette Super Équilibrée",
				text = {
					"{C:blue}-2{} mains, {C:red}-2{} défausses",
					"à chaque manche",
					"Les {C:attention}Bons d'Achat{} n'apparaissent",
					"plus dans la boutique",
				},
			},
			sleeve_cry_wormhole_sleeve = {
				name = "Pochette Vortex",
				text = {
					"Démarre avec un Joker {C:cry_exotic}Exotique{C:attention}",
					"Les Jokers sont {C:attention}20X{} ",
					"plus susceptibles d'être {C:dark_edition}Négatifs",
					"{C:attention}-2{} emplacements de Joker",
				},
			},
			sleeve_cry_legendary_sleeve = {
				name = "Pochette Légendaire",
				text = {
					"Démarre avec un Joker {C:legendary}Légendaire{C:legendary}",
					"{C:green}1 chance sur 5{} d'en créer un autre",
					"lorsque la Blinde de Boss est battue",
					"{C:inactive}(selon la place disponible)",
				},
			},
			sleeve_cry_antimatter_sleeve = {
				name = "Pochette d'Antimatière",
				text = {
					"Applique les {C:attention}effects{}",
					"et autres {C:attention}effets spéciaux{}",
					"de toutes les autres pochettes",
					"{C:red}WIP",
				},
			},
		},
		Spectral = {
			c_cry_adversary = {
				name = "Opposition",
				text = {
					"{C:red}Tous{} vos {C:attention}Jokers{} deviennent {C:dark_edition}Négatifs{},",
					"{C:red}tous{} les {C:attention}Jokers{} dans la boutique coûteront",
					"{C:red}2X{} plus cher pour le reste de la partie",
				},
			},
			c_cry_analog = {
				name = "Analogue",
				text = {
					"Crée {C:attention}#1#{} copie#<s>1# d'un",
					"{C:attention}Joker{} aléatoire, détruit",
					"tous les autres Jokers, {C:attention}+#2#{} Ante",
				},
			},
			c_cry_chambered = {
				name = "Chambré",
				text = {
					"Crée {C:attention}#1#{} copie#<s>1# {C:dark_edition}Négatives{}",
					"d'un consommable {C:attention}aléatoire",
					"{C:inactive,s:0.8}Ne copie pas Chambré{}",
				},
			},
			c_cry_conduit = {
				name = "Conduit",
				text = {
					"Échange les {C:attention}éditions{} de",
					"{C:attention}2{} cartes ou {C:attention}Jokers{} sélectionnées",
				},
			},
			c_cry_gateway = {
				name = "Portail",
				text = {
					"Crée un {C:attention}Joker{} {C:cry_exotic,E:1}Exotique",
					"aléatoire, détruit",
					"tous les autres Jokers",
				},
			},
			c_cry_hammerspace = {
				name = "Hammerspace",
				text = {
					"Applique des {C:attention}consommables{} aléatoires",
					"comme des {C:dark_edition}Améliorations{}",
					"à toutes les cartes tenues en main",
				},
			},
			c_cry_lock = {
				name = "Verrou",
				text = {
					"Enlève {C:red}tous{} les stickers",
					"de {C:red}tous{} les Jokers,",
					"puis applique {C:purple,E:1}Éternel{}",
					"à un {C:attention}Joker{} aléatoire",
				},
			},
			c_cry_pointer = {
				name = "POINTEUR://",
				text = {
					"Crée une carte",
					"de {C:cry_code}votre choix",
					"{C:inactive,s:0.8}(Jokers exotiques #1#exclus)",
				},
			},
			c_cry_replica = {
				name = "Réplique",
				text = {
					"Convertit toutes les",
					"cartes en main",
					"en une carte {C:attention}aléatoire{}",
					"tenue en main",
				},
			},
			c_cry_ritual = {
				name = "Rituel",
				text = {
					"Applique {C:dark_edition}Négatif{}, {C:dark_edition}Mosaïque",
					"ou {C:dark_edition}Astral{} à {C:attention}#1#{}",
					"carte sélectionnée",
				},
			},
			c_cry_source = {
				name = "Source",
				text = {
					"Ajoute un {C:cry_code}Sceau vert{}",
					"à {C:attention}#1#{} carte",
					"sélectionnée",
				},
			},
			c_cry_summoning = {
				name = "Invocation",
				text = {
					"Crée un {C:joker}Joker{} {C:cry_epic}Épique{}",
					"aléatoire, détruit un",
					"autre {C:joker}Joker{} aléatoire",
				},
			},
			c_cry_trade = {
				name = "Échange",
				text = {
					"{C:attention}Perdez{} un Coupon aléatoire,",
					"gagnez {C:attention}2{} Coupons aléatoires",
				},
			},
			c_cry_typhoon = {
				name = "Typhon",
				text = {
					"Ajoute un {C:cry_azure}Sceau Azur{}",
					"à {C:attention}#1#{} carte",
					"sélectionnée",
				},
			},
			c_cry_vacuum = {
				name = "Aspiration",
				text = {
					"Enlève {C:red}toutes{} les {C:green}modifications{}",
					"de {C:red}toutes{} les cartes en main",
					"Gagne {C:money}$#1#{} par {C:green}modification{} enlevée",
					"{C:inactive,s:0.7}(par ex. Améliorations, Sceaux, Éditions)",
				},
			},
			c_cry_white_hole = {
				name = "Trou blanc",
				text = {
					"Améliore la main de poker",
					"la {C:legendary,E:1}plus jouée{} de {C:attention}4{}",
					"{C:attention}Enlève les niveaux{} de toutes les autres mains",
				},
			},
			c_cry_white_hole2 = {
				name = "Trou blanc",
				text = {
					"{C:attention}Enlève{} toues les niveaux de toutes les mains,",
					"améliore la main de poker {C:legendary,E:1}la plus jouée{}",
					"de {C:attention}3{} pour chaque niveau enlevé",
				},
			},
		},
		Stake = {
			stake_cry_pink = {
				name = "Mise rose",
				colour = "Pink", --this is used for auto-generated sticker localization
				text = {
					"Le score requis augmente (beaucoup)",
					"plus rapidement pour chaque {C:attention}Ante",
				},
			},
			stake_cry_brown = {
				name = "Mise marron",
				colour = "Brown",
				text = {
					"Tous les {C:attention}stickers{} sont",
					"compatibles entre eux",
				},
			},
			stake_cry_yellow = {
				name = "Mise jaune",
				colour = "Yellow",
				text = {
					"Les {C:attention}stickers{} peuvent apparaître",
					"sur tous les objets achetables",
				},
			},
			stake_cry_jade = {
				name = "Mise jade",
				colour = "Jade",
				text = {
					"Les cartes peuvent être tirées {C:attention}face cachée{}",
				},
			},
			stake_cry_cyan = {
				name = "Mise cyan",
				colour = "Cyan",
				text = {
					"Les Jokers {C:green}Peu-communs{} et {C:red}Rares{} ont",
					"moins de chances d'apparaître",
				},
			},
			stake_cry_gray = {
				name = "Mise grise",
				colour = "Gray",
				text = {
					"Rerolls increase by {C:attention}$2{} each",
				},
			},
			stake_cry_crimson = {
				name = "Mise pourpre",
				colour = "Crimson",
				text = {
					"Les coupons sont réapprovisionnés aux Antes {C:attention}pairs{}",
				},
			},
			stake_cry_diamond = {
				name = "Mise diamant",
				colour = "Diamond",
				text = {
					"Gagner nécessite de battre l'Ante {C:attention}10{}",
				},
			},
			stake_cry_amber = {
				name = "Mise ambre",
				colour = "Amber",
				text = {
					"{C:attention}-1{} emplacement de Paquet Booster",
				},
			},
			stake_cry_bronze = {
				name = "Mise bronze",
				colour = "Bronze",
				text = {
					"Les coupons coûtent {C:attention}50%{} plus cher",
				},
			},
			stake_cry_quartz = {
				name = "Mise quartz",
				colour = "Quartz",
				text = {
					"Les jokers peuvent être {C:attention}Épinglés{}",
					"{s:0.8,C:inactive}(Restent épinglés à la position la plus à gauche){}",
				},
			},
			stake_cry_ruby = {
				name = "Mise rubis",
				colour = "Ruby",
				text = {
					"Les {C:attention}Grosses{} Blindes peuvent être",
					"des Blindes de {C:attention}Boss{}",
				},
			},
			stake_cry_glass = {
				name = "Mise verre",
				colour = "Glass",
				text = {
					"Les cartes peuvent se {C:attention}briser{}",
					"lorsqu'elles sont marquées",
				},
			},
			stake_cry_sapphire = {
				name = "Mise saphir",
				colour = "Sapphire",
				text = {
					"À la fin de l'ante,",
					"perdez {C:attention}25%{} de votre argent",
					"{s:0.8,C:inactive}(Jusqu'à $10){}",
				},
			},
			stake_cry_emerald = {
				name = "Mise émeraude",
				colour = "Emerald",
				text = {
					"Les cartes, paquets et coupons",
					"peuvent être {C:attention}face cachée{}",
					"{s:0.8,C:inactive}(Impossible de les voir avant de les acheter){}",
				},
			},
			stake_cry_platinum = {
				name = "Mise platine",
				colour = "Platinum",
				text = {
					"Les Petites Blindes sont {C:attention}enlevées{}",
				},
			},
			stake_cry_twilight = {
				name = "Mise aube",
				colour = "Twilight",
				text = {
					"Les cartes peuvent être {C:attention}Banane{}",
					"{s:0.8,C:inactive}(1 chance sur 10 d'être détruite à la fin de la manche){}",
				},
			},
			stake_cry_verdant = {
				name = "Mise verdoyante",
				colour = "Verdant",
				text = {
					"Le score requis augmente (toujours)",
					"plus rapidement pour chaque {C:attention}Ante",
				},
			},
			stake_cry_ember = {
				name = "Mise embre",
				colour = "Ember",
				text = {
					"Tous les objets ne donnent pas d'argent",
					"lorsqu'ils sont vendus",
				},
			},
			stake_cry_dawn = {
				name = "Mise aurore",
				colour = "Dawn",
				text = {
					"Les cartes Tarots et Spectrales ciblent",
					"{C:attention}1{} carte de moins",
					"{s:0.8,C:inactive}(Minimum 1){}",
				},
			},
			stake_cry_horizon = {
				name = "Mise horizon",
				colour = "Horizon",
				text = {
					"Lorsque la blinde est sélectionnée,",
					"une {C:attention}carte aléatoire{} est",
					"ajoutée au deck",
				},
			},
			stake_cry_blossom = {
				name = "Mise éclat",
				colour = "Blossom",
				text = {
					"Les Blindes {C:attention}Finales{} peuvent apparaître",
					"dans {C:attention}n'importe quel{} Ante",
				},
			},
			stake_cry_azure = {
				name = "Mise azur",
				colour = "Azure",
				text = {
					"Les valeurs sur les Jokers",
					"sont réduits de {C:attention}20%{}",
				},
			},
			stake_cry_ascendant = {
				name = "Mise ascendante",
				colour = "Ascendant",
				text = {
					"{C:attention}-1{} emplacement",
					"dans la boutique",
				},
			},
		},
		Tag = {
			tag_cry_astral = {
				name = "Badge Astral",
				text = {
					"Le prochain Joker sans Édition dans",
					"la boutique devient gratuit et {C:dark_edition}Astral",
				},
			},
			tag_cry_banana = {
				name = "Badge Banane",
				text = {
					"Crée un {C:attention}#1#",
					"{C:inactive}(Selon la place disponible){}",
				},
			},
			tag_cry_bettertop_up = {
				name = "Badge de remplissage (en mieux)",
				text = {
					"Crée jusqu'à {C:attention}#1#",
					"Jokers {C:green}Peu-Communs{}",
					"{C:inactive}(Selon la place disponible){}",
				},
			},
			tag_cry_better_voucher = {
				name = "Badge Ticket d'Or", -- base cryptid isn't crazy enough with their badge names smh
				text = {
					"Ajoute un coupon de catégorie {C:attention}#1#{}",
					"dans la prochaine boutique",
				},
			},
			tag_cry_blur = {
				name = "Badge Flou",
				text = {
					"Le prochain Joker sans Édition dans",
					"la boutique devient gratuit et {C:dark_edition}Flou",
				},
			},
			tag_cry_booster = {
				name = "Badge Booster",
				text = {
					"Le prochain {C:cry_code}Paquet Booster{} a",
					"{C:attention}2X plus{} de cartes et",
					"{C:attention}2X plus{} de choix",
				},
			},
			tag_cry_bundle = {
				name = "Lot de Badges",
				text = {
					"Crée un {C:attention}Badge Standard{}, {C:tarot}Badge Breloque{},",
					"{C:attention}Badge Bouffon{}, and {C:planet}Badge Météore",
				},
			},
			tag_cry_cat = {
				name = "Badge Chat",
				text = {
					"Miaou !",
					"{C:inactive}Niveau {C:dark_edition}#1#",
				},
			},
			tag_cry_console = {
				name = "Badge Commande",
				text = {
					"Octroie un",
					"{C:cry_code}Paquet Code",
				},
			},
			tag_cry_double_m = {
				name = "Badge Double M",
				text = {
					"La boutique a un",
					"{C:red}Joker M {C:dark_edition}Joyeux{}",
				},
			},
			tag_cry_empowered = {
				name = "Badge Renforcé",
				text = {
					"Octroie un {C:spectral}Paquet Spectral",
					"avec {C:legendary,E:1}l'Âme{} et {C:cry_exotic,E:1}Portail{}",
				},
			},
			tag_cry_epic = {
				name = "Badge Épique",
				text = {
					"La boutique a un",
					"{C:cry_epic}Joker Épique{} à moitié prix",
				},
			},
			tag_cry_gambler = {
				name = "Badge du Parieur",
				text = {
					"{C:green}#1# chance#<s>1# sur #2#{} de créer",
					"un {C:cry_exotic,E:1}Badge Renforcé",
				},
			},
			tag_cry_glass = {
				name = "Badge Fragile",
				text = {
					"Le prochain Joker sans Édition dans",
					"la boutique devient gratuit et {C:dark_edition}Fragile",
				},
			},
			tag_cry_glitched = {
				name = "Badge Buggé",
				text = {
					"Le prochain Joker sans Édition dans",
					"la boutique devient gratuit et {C:dark_edition}Glitché",
				},
			},
			tag_cry_gold = {
				name = "Badge Doré",
				text = {
					"Le prochain Joker sans Édition dans",
					"la boutique devient gratuit et {C:dark_edition}Doré",
				},
			},
			tag_cry_gourmand = {
				name = "Badge à Emporter", -- the icon is a bag so
				text = {
					"La boutique a un",
					"{C:cry_epic}Joker Nourriture{} gratuit",
				},
			},
			tag_cry_loss = {
				name = "Loss",
				text = {
					"Octroie un",
					"{C:cry_ascendant}Paquet Mème",
				},
			},
			tag_cry_m = {
				name = "Badge Sourire",
				text = {
					"Le prochain Joker sans Édition dans",
					"la boutique devient gratuit et {C:dark_edition}Joyeux",
				},
			},
			tag_cry_memory = {
				name = "Badge Mémoire",
				text = {
					"Crée {C:attention}#1#{} copies du",
					"dernier {C:attention}Badge{} utilisé",
					"durant cette partie",
					"{s:0.8,C:inactive}Les Badges de Copie sont exclus",
					"{s:0.8,C:inactive}Actuellement : {s:0.8,C:attention}#2#",
				},
			},
			tag_cry_mosaic = {
				name = "Badge Mosaïque",
				text = {
					"Le prochain Joker sans Édition dans",
					"la boutique devient gratuit et {C:dark_edition}Mosaïque",
				},
			},
			tag_cry_oversat = {
				name = "Badge Sur-saturé",
				text = {
					"Le prochain Joker sans Édition dans",
					"la boutique devient gratuit et {C:dark_edition}Sur-saturé",
				},
			},
			tag_cry_quadruple = {
				name = "Badge Quadruple",
				text = {
					"Octroiera {C:attention}#1#{} copies du",
					"prochain {C:attention}Badge{} sélectionné",
					"{s:0.8,C:inactive}Badges de Copie exclus",
				},
			},
			tag_cry_quintuple = {
				name = "Badge Quintuple",
				text = {
					"Octroiera {C:attention}#1#{} copies du",
					"prochain {C:attention}Badge{} sélectionné",
					"{s:0.8,C:inactive}Badges de Copie exclus",
				},
			},
			tag_cry_rework = {
				name = "Badge Remaniement",
				text = {
					"La boutique a un",
					"{C:dark_edition}#1# {C:cry_code}#2#",
				},
			},
			tag_cry_schematic = {
				name = "Badge Schéma",
				text = {
					"La boutique a un",
					"{C:attention}Remue-méninges",
				},
			},
			tag_cry_scope = {
				name = "Badge Mesuré",
				text = {
					"{C:attention}+#1# {C:blue}mains{} et",
					"{C:red}défausses{} à la prochaine manche",
				},
			},
			tag_cry_triple = {
				name = "Badge Triple",
				text = {
					"Octroiera {C:attention}#1#{} copies du",
					"prochain {C:attention}Badge{} sélectionné",
					"{s:0.8,C:inactive}Badges de Copie exclus",
				},
			},
		},
		Tarot = {
			c_cry_automaton = {
				name = "l'Automate",
				text = {
					"Crée jusqu'à {C:attention}#1#",
					"cartes {C:cry_code}Code{} aléatoires",
					"{C:inactive}(Selon la place disponible)",
				},
			},
			c_cry_eclipse = {
				name = "l'Éclipse",
				text = {
					"Transforme jusqu'à {C:attention}#1#",
					"carte#<s>1# sélectionnée#<s>1# en",
					"{C:attention}Carte#<s>1# écho",
				},
			},
			c_cry_meld = {
				name = "le Mélange",
				text = {
					"Transforme un {C:attention}Joker{} ou",
					"une {C:attention}carte à jouer{} en",
					"carte {C:dark_edition}Double-face",
				},
			},
			c_cry_theblessing = {
				name = "la Bénédiction",
				text = {
					"Crée {C:attention}1{}",
					"{C:attention}consommable{} aléatoire",
					"{C:inactive}(Selon la place disponible){}",
				},
			},
			c_cry_seraph = {
				name = "le Séraphin",
				text = {
					"Transforme jusqu'à {C:attention}#1#",
					"carte#<s>1# sélectionnée#<s>1# en",
					"{C:attention}Carte#<s>1# Lumière",
				},
			},
		},
		Voucher = {
			v_cry_asteroglyph = {
				name = "Astéroglyphe",
				text = {
					"Règle l'Ante sur {C:attention}#1#{}",
				},
				unlock = {
					"Atteindre l'Ante {C:attention}36",
				},
			},
			v_cry_blankcanvas = {
				name = "Tableau Blanc",
				text = {
					"{C:attention}+#1#{} à la taille de la main",
				},
				unlock = {
					"Réduire la {C:attention}taille de la main",
					"à {C:attention}0",
				},
			},
			v_cry_clone_machine = {
				name = "Machine de Clones",
				text = {
					"Les Badges double deviennent",
					"des {C:attention}Badges Quintuple{} et",
					"sont {C:attention}4X{} plus communs",
				},
			},
			v_cry_command_prompt = {
				name = "Invite de Commandes",
				text = {
					"Les cartes {C:cry_code}Code{}",
					"peuvent apparaître",
					"dans la {C:attention}boutique{}",
				},
			},
			v_cry_copies = {
				name = "Copies",
				text = {
					"Les Badges double deviennent",
					"des {C:attention}Badges Triple{} et",
					"sont {C:attention}2X{} plus communs",
				},
			},
			v_cry_curate = {
				name = "Curation",
				text = {
					"Toutes les cartes",
					"apparaissent avec",
					"une {C:dark_edition}Édition{}",
				},
				unlock = {
					"Découvrir toutes",
					"les {C:attention}Éditions",
				},
			},
			v_cry_dexterity = {
				name = "Dextérité",
				text = {
					"{C:blue}+#1#{} main#<s>1# par manche",
					"{C:inactive}(oui, encore)",
				},
				unlock = {
					"Jouer {C:attention}5000{}",
					"{C:attention}cartes à jouer{}",
					"en tout",
				},
			},
			v_cry_double_down = {
				name = "Double ou double",
				text = {
					"Après chaque manche,",
					"{X:dark_edition,C:white} X1.5 {} à toutes les valeurs",
					"à l'arrière des",
					"cartes {C:dark_edition}Double-Face{}",
				},
			},
			v_cry_double_slit = {
				name = "Double fente",
				text = {
					"{C:attention}le Mélange{} peut apparaître",
					"dans la boutique et dans",
					"les Paquets Arcana",
				},
			},
			v_cry_double_vision = {
				name = "Double Vision",
				text = {
					"Les cartes {C:dark_edition}Double-Face{} apparaîssent",
					"{C:attention}4X{} plus souvent",
				},
			},
			v_cry_fabric = {
				name = "Toile Universelle",
				text = {
					"{C:dark_edition}+#1#{} emplacement#<s>1# de Joker",
				},
				unlock = {
					"Récupérer {C:dark_edition}Antimatière",
					"{C:attention}10{} fois",
				},
			},
			v_cry_massproduct = {
				name = "Production de Masse",
				text = {
					"Toutes les cartes et tous les paquets",
					"dans la boutique coutent {C:attention}$1{}",
				},
				unlock = {
					"Récupérer {C:attention}25",
					"{C:attention}coupons",
					"en une partie",
				},
			},
			v_cry_moneybean = {
				name = "Haricot d'Argent",
				text = {
					"Augmente le plafond",
					"des intérêts perçus",
					"par manche à {C:money}#1#${}",
				},
				unlock = {
					"Atteindre le maximum",
					"{C:attention}du gain d'intérêts{}",
					"durant {C:attention}toute la partie",
				},
			},
			v_cry_overstock_multi = {
				name = "Multi-stock",
				text = {
					"{C:attention}+#1#{} emplacement#<s>1# de carte#<s>1#,",
					"{C:attention}+#1#{} emplacement#<s>1# de paquet#<s>1# et",
					"and {C:attention}+#1#{} emplacements#<s>1# de coupon",
					"disponibles dans la boutique",
				},
				unlock = {
					"Dépenser {C:attention}1000$",
					"dans la boutique",
					"en une partie",
				},
			},
			v_cry_pacclimator = {
				name = "Acclimateur de Planète",
				text = {
					"Les cartes {C:planet}Planète{} apparaissent",
					"{C:attention}X#1#{} plus souvent",
					"dans la boutique",
					"Toutes les futures cartes",
					"{C:planet}Planète{} sont {C:green}gratuites{}",
				},
				unlock = {
					"Acheter {C:attention}100{} cartes",
					"{C:planet}Planète{} en tout",
					"dans la boutique",
				},
			},
			v_cry_pairamount_plus = {
				name = "Pair'amount Plus",
				text = {
					"{C:attention}Redéclenche{} tous les Jokers M",
					"une fois pour chaque Paire",
					"{C:attention}contenue{} dans la main jouée",
				},
			},
			v_cry_pairing = {
				name = "Lapaire",
				text = {
					"{C:attention}Redéclenche{} tous les Jokers M",
					"si la main jouée est une {C:attention}Paire",
					"{C:inactive,s:0.8}Y'en a pas deux!",
				},
			},
			v_cry_quantum_computing = {
				name = "Informatique Quantique",
				text = {
					"Les cartes {C:cry_code}Code{} peuvent apparaître",
					"avec l'édition {C:dark_edition}Négative{}",
				},
			},
			v_cry_repair_man = {
				name = "Ré-paire-ation",
				text = {
					"{C:attention}Redéclenche{} tous les Jokers M",
					"si la main jouée contient une {C:attention}Paire",
				},
			},
			v_cry_rerollexchange = {
				name = "Réassorts en Folie",
				text = {
					"{C:green}Réassortir{} la boutique",
					"coûte {C:money}2${}",
				},
				unlock = {
					"{C:attention}Réassortir{} la boutique",
					"un total de {C:attention}250 fois{}",
					"en une partie",
				},
			},
			v_cry_satellite_uplink = {
				name = "Liaison Astrale",
				text = {
					"Les Cartes {C:cry_code}Code{} peuvent",
					"apparaître dans n'importe lequel",
					"des {C:attention}Paquets Célestes{}",
				},
			},
			v_cry_scope = {
				name = "Portée Galactique",
				text = {
					"Crée la carte {C:planet}Planète",
					"de la {C:attention}main de poker",
					"jouée",
					"{C:inactive}(Selon la place disponible){}",
				},
				unlock = {
					"Utiliser {C:attention}50{} cartes",
					"{C:planet}Planète{} des",
					"{C:attention}Paquets Booster{}",
					"en une partie",
				},
			},
			v_cry_tacclimator = {
				name = "Acclimateur de Tarot",
				text = {
					"Les cartes {C:tarot}Tarot{} apparaissent",
					"{C:attention}X#1#{} plus souvent",
					"dans la boutique",
					"Toutes les futures cartes",
					"{C:tarot}Tarot{} seront {C:green}gratuites{}",
				},
				unlock = {
					"Acheter {C:attention}100{} cartes",
					"{C:tarot}Tarot{} en tout",
					"dans la boutique",
				},
			},
			v_cry_tag_printer = {
				name = "Imprimante à Badge",
				text = {
					"Les Badges Double deviennent des",
					"{C:attention}Badges Quadruple{} et",
					"sont {C:attention}3X{} plus communs",
				},
			},
			v_cry_threers = {
				name = "Les 3 R",
				text = {
					"{C:red}+#1#{} défausse#<s>1#",
					"par manche",
				},
				unlock = {
					"Défausser {C:attention}5000{}",
					"{C:attention}cartes à jouer{}",
					"en tout",
				},
			},
			v_cry_stickyhand = {
				name = "Main Collante",
				text = {
					"{C:attention}+#1#{} limite",
					"de sélection de cartes",
				},
			},
			v_cry_grapplinghook = {
				name = "Grappin",
				text = {
					"{C:attention}+#1#{} limite",
					"de sélection de cartes",
					"{C:inactive,s:0.7}Il est possible de faire beacuoup plus que ce que vous pensez.{}",
				},
			},
			v_cry_hyperspacetether = {
				name = "Accroche Intersidérale",
				text = {
					"{C:attention}+#1#{} limite",
					"de sélection de cartes",
					"{C:inactive,s:0.7}NOTE: Aura plus de{}",
					"{C:inactive,s:0.7}fonctionnalités plus tard{}",
				},
			},
		},
		Other = {
			disabled = {
				name = "Désactivé",
				text = {
					"N'apparaîtra plus",
					"durant les parties",
				},
			},
			disabled_card_dependency = {
				name = "Désactivé",
				text = {
					"Nécessite {C:attention}#1#",
				},
			},
			disabled_mod_dependency = {
				name = "Désactivé",
				text = {
					"Nécessite le mod:",
					"{C:attention}#1#",
				},
			},
			disabled_mod_conflict = {
				name = "Désactivé",
				text = {
					"Incompatible avec le mod:",
					"{C:attention}#1#",
				},
			},
			banana = {
				name = "Banane",
				text = {
					"{C:green}#1# chance#<s>1# sur #2#{} d'être",
					"détruit après chaque manche",
				},
			},
			cry_absolute = {
				name = "Absolu",
				text = {
					"Ne peut pas être vendu",
					"ou détruit",
					"{C:attention}Impossible à enlever{}",
				},
			},
			cry_rigged = {
				name = "Truqué",
				text = {
					"Toutes les probabilités {C:cry_code}listées{}",
					"sont {C:cry_code}garanties",
				},
			},
			cry_hooked = {
				name = "Accroché",
				text = {
					"Quand ce joker est {C:cry_code}déclenché{},",
					"déclenche {C:cry_code}#1#",
				},
			},
			cry_flickering = {
				name = "Luisant",
				text = {
					"Détruit après",
					"{C:attention}#1#{} déclenchements",
					"{C:inactive}({C:attention}#2#{C:inactive} restants)",
				},
			},
			cry_flickering_desc = { --used by choco dice
				name = "Luisant",
				text = {
					"Détruit après",
					"{C:attention}#1#{} déclenchements",
				},
			},
			cry_possessed = {
				name = "Possédé",
				text = {
					"{C:attention}Désactive{} et {C:attention}inverse{}",
					"les effets, si possible",
					"Détruit en même temps que {C:attention}Fantôme",
				},
			},
			food_jokers = {
				name = "Jokers Nourriture",
				text = {
					"{s:0.8}Gros Michel, Œuf, Crème Glacée, Cavendish,",
					"{s:0.8}Haricot Noir, Cola zéro, Popcorn, Ramen,",
					"{s:0.8}Eau de Seltz, Cornichon, Piment, Caramel,",
					"{s:0.8}Bonbon Nostalgique, M Fast Food, etc.",
				},
			},
			cry_https_disabled = {
				name = "M",
				text = {
					"{C:attention,s:0.7}La mise à jour{s:0.7} est désactivée par défaut ({C:attention,s:0.7}Module HTTPS{s:0.7})",
				},
			},
			ev_cry_choco0 = {
				name = "",
				text = {
					"Les détails d'un {C:cry_ascendant,E:1}événement",
					"seront affichés ici",
				},
			},
			ev_cry_choco1 = {
				name = "1: Possession",
				text = {
					"Les {C:attention}Jokers{} et cartes à jouer ont",
					"{C:green}1 chance sur 3{} de gagner Luisant",
					"Crée un {C:attention}Fantôme",
					"{C:inactive,s:0.7}Vous avez été possédé par un fantôme, et",
					"{C:inactive,s:0.7}votre conscience vacille.",
				},
			},
			ev_cry_choco2 = {
				name = "2: Maison Hantée",
				text = {
					"Impossible de passer une Blinde {C:attention}Blinde{}",
					"Un {C:attention}réassort{} autorisé par boutique",
					"Les prix des {C:attention}coupons{} ont doublé",
					"{C:inactive,s:0.7}Les esprits d'Halloween ont pris d'assaut cette partie!",
					"{C:inactive,s:0.7}Ne touchez à rien et échappez-vous au plus vite!",
				},
			},
			ev_cry_choco3 = {
				name = "3: Les préparations de la sorcière",
				text = {
					"Crée 3 {C:attention}Potions",
					"Utilises-en une avant la fin de la {C:attention}Petite Blinde{},",
					"ou {C:attention}tous{} les malus seront appliqués durant cet {C:attention}Ante",
					"{C:inactive,s:0.7}Vous avez été kidnappé par une sorcière!",
					"{C:inactive,s:0.7}Elle vous scrute, et vous offre trois potions.",
					"{C:inactive,s:0.7}Choisis-en une, ou elle va choisir pour toi.",
				},
			},
			ev_cry_choco4 = {
				name = "4: Abysse Lunaire",
				text = {
					"Les cartes à jouer ont {C:green}1 chance sur 4{}",
					"de devenir une carte figure {C:club}Trèfle{}",
					"Divise le {C:attention}Multi{} par le nombre de cartes face joués",
					"{C:inactive,s:0.7}Même un homme au cœur pur",
					"{C:inactive,s:0.7}qui fait ses prières le soir...",
				},
			},
			ev_cry_choco5 = {
				name = "5: Sangsue",
				text = {
					"Enlève les {C:attention}Améliorations{} de toutes les cartes jouées",
					"{C:green}1 chance sur 3{} de détruire",
					"les cartes {C:heart}Cœur{} et {C:diamond}Carreau{}",
					"{C:inactive,s:0.7}Méfiez vous à la tombée de la nuit, car",
					"{C:inactive,s:0.7,E:1}ceux dans les ombres {C:inactive,s:0.7} cherchent à assouvir leur soif...",
				},
			},
			ev_cry_choco6 = {
				name = "6: Prenez-en qu'un",
				text = {
					"À la {C:attention}fin de la manche{}, ouvre un",
					"Paquet {C:attention}Booster{} aléatoire",
					"{C:inactive,s:0.7}Tandis que vous déambulez dans les rues, vous apercevez une",
					"{C:inactive,s:0.7}boîte remplie de Paquets Booster. Autant se servir !",
				},
			},
			ev_cry_choco7 = {
				name = "7: L'heure de la fête",
				text = {
					"Crée 3 {C:attention}Des bonbons ou un sort!{} et 1 {C:attention}Panier de bonbons",
					"Les boutiques ont un {C:attention}Des bonbons ou un sort!{} à chaque manche",
					"Les {C:cry_candy}bonbons{} donnent {C:money}$3{} lorsqu'ils sont obtenus",
					"{C:inactive,s:0.7}Tout le quartier est décoré pour les festivités fantasmagoriques,",
					"{C:inactive,s:0.7}venez rejoindre l'ambience!",
				},
			},
			ev_cry_choco8 = {
				name = "8: Pluie de bonbons",
				text = {
					"Lorsque la {C:attention}Blinde{} est battue, obtenez 1 {C:cry_candy}bonbon{}",
					"par main restante; Obtenez un {C:attention}Joker Nourriture{}",
					"lorsqu'un {C:cry_candy}bonbon{} est généré",
					"{C:inactive,s:0.7}Il pleut des bonbons ! Dépechez vous et",
					"{C:inactive,s:0.7,E:1}attrappez-en autant que vous pouvez !",
				},
			},
			ev_cry_choco9 = {
				name = "9: Richesse spirituelle",
				text = {
					"Donne {C:money}$20",
					"Tout {C:money}l'argent{} gagné est {C:attention}doublé",
					"{C:inactive,s:0.7}Le spectre d'un proche disparu depuis longtemps",
					"{C:inactive,s:0.7}vous visite au milieu de la nuit!",
					"{C:inactive,s:0.7}Sans un mot, il place un sac d'argent dans vos mains,",
					"{C:inactive,s:0.7}arbore un grand sourire, et vous salue avant de disparaitre dans l'air.",
				},
			},
			ev_cry_choco10 = {
				name = "10: Antiquité vénérée",
				text = {
					"Un {C:attention}Joker{} {C:legendary}Légendaire{} apparaît",
					"dans l'emplacement {C:attention}Coupon{} pour {C:money}$50",
					"Ne peut être acheté qu'en tant que le {C:attention}dernier{} objet de la boutique",
					"{C:inactive,s:0.7}Vous avez attiré l'attention de l'esprit d'une relique,",
					"{C:inactive,s:0.7}mais cet esprit ne va pas se laisser apaiser si facilement.",
				},
			},
			--i am so sorry for this
			--actually some of this needs to be refactored at some point
			cry_eternal_booster = {
				name = "Éternel",
				text = {
					"Toutes les cartes du paquet",
					"sont {C:attention}Éternelles{}",
				},
			},
			cry_perishable_booster = {
				name = "Périssable",
				text = {
					"Toutes les cartes du paquet",
					"sont {C:attention}Périssables{}",
				},
			},
			cry_rental_booster = {
				name = "Location",
				text = {
					"Toutes les cartes du paquet",
					"sont {C:attention}en Location{}",
				},
			},
			cry_pinned_booster = {
				name = "Épinglé",
				text = {
					"Toutes les cartes du paquet",
					"sont {C:attention}Épinglées{}",
				},
			},
			cry_banana_booster = {
				name = "Banane",
				text = {
					"Toutes les cartes du paquet",
					"sont {C:attention}Bananes{}",
				},
			},
			cry_eternal_voucher = {
				name = "Éternel",
				text = {
					"Ne peut pas être échangé",
				},
			},
			cry_perishable_voucher = {
				name = "Périssable",
				text = {
					"Affaibli après",
					"{C:attention}#1#{} manches",
					"{C:inactive}({C:attention}#2#{C:inactive} restantes)",
				},
			},
			cry_rental_voucher = {
				name = "Location",
				text = {
					"Coûte {C:money}#1#${} à",
					"la fin de la manche",
				},
			},
			cry_pinned_voucher = {
				name = "Épinglé",
				text = {
					"Reste dans la boutique",
					"jusqu'à ce qu'il soit échangé",
				},
			},
			cry_banana_voucher = {
				name = "Banane",
				text = {
					"{C:green}#1# chance#<s>1# sur #2#{} d'être",
					"enlevé à la fin de la manche",
				},
			},
			cry_perishable_consumeable = {
				name = "Périssable",
				text = {
					"Affaibli à la",
					"fin de la manche",
				},
			},
			cry_rental_consumeable = {
				name = "Location",
				text = {
					"Coûte {C:money}#1#${} à",
					"la fin de la manche, et",
					"à l'utilisation",
				},
			},
			cry_pinned_consumeable = {
				name = "Épinglé",
				text = {
					"Vous ne pouvez pas utiliser",
					"de consommables non-{C:attention}Épinglés{}",
				},
			},
			cry_banana_consumeable = {
				name = "Banane",
				text = {
					"{C:green}#1# chance(s) sur #2#{} de",
					"ne rien faire à l'utilisation",
				},
			},
			p_cry_code_normal_1 = {
				name = "Paquet Programme",
				text = {
					"Jusqu'à {C:attention}#1#{} cartes",
					"{C:cry_code}Code{} parmi {C:attention}#2#",
				},
			},
			p_cry_code_normal_2 = {
				name = "Paquet Programme",
				text = {
					"Jusqu'à {C:attention}#1#{} cartes",
					"{C:cry_code}Code{} parmi {C:attention}#2#",
				},
			},
			p_cry_code_jumbo_1 = {
				name = "Super Paquet Programme",
				text = {
					"Jusqu'à {C:attention}#1#{} cartes",
					"{C:cry_code}Code{} parmi {C:attention}#2#",
				},
			},
			p_cry_code_mega_1 = {
				name = "Méga Paquet Programme",
				text = {
					"Jusqu'à {C:attention}#1#{} cartes",
					"{C:cry_code}Code{} parmi {C:attention}#2#",
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
				name = "Paquet Mème",
				text = {
					"Jusqu'à {C:attention}#1#{} cartes",
					"{C:attention}Joker Mème{} parmi {C:attention}#2#{}",
				},
			},
			p_cry_meme_two = {
				name = "Paquet Mème",
				text = {
					"Jusqu'à {C:attention}#1#{} cartes",
					"{C:attention}Joker Mème{} parmi {C:attention}#2#{}",
				},
			},
			p_cry_meme_three = {
				name = "Paquet Mème",
				text = {
					"Jusqu'à {C:attention}#1#{} cartes",
					"{C:attention}Joker Mème{} parmi {C:attention}#2#{}",
				},
			},
			undiscovered_code = {
				name = "Non découvert",
				text = {
					"Acheter ou utiliser",
					"cette carte dans une",
					"partie sans seed pour",
					"révéler son effet",
				},
			},
			undiscovered_unique = {
				name = "Non découvert",
				text = {
					"Acheter ou utiliser",
					"cet objet dans une",
					"partie sans seed pour",
					"révéler son effet",
				},
			},
			cry_green_seal = {
				name = "Sceau vert",
				text = {
					"Crée une carte {C:cry_code}Code{}",
					"lorsque la carte est jouée",
					"et non comptée",
					"{C:inactive}(Selon la place disponible)",
				},
			},
			cry_azure_seal = {
				name = "Sceau azur",
				text = {
					"Crée {C:attention}#1#{} {C:planet}Planètes",
					"{C:dark_edition}négatives{} pour la",
					"{C:attention}main de poker jouée{},",
					"puis {C:red}détruit{} cette carte",
				},
			},
			blurred_sdm0 = {
				name = "a",
				text = {
					'{C:inactive,s:0.7}"Je déteste cette carte" - SDM_0, 2024{}{}',
				},
			},
		},
		Unique = {
			c_cry_potion = {
				name = "Potion",
				text = {
					"Applique un {C:attention}malus{}",
					"inconnu lorsqu'elle est utilisée",
					"{C:inactive,s:0.7}Obtenu du Dé en chocolat",
				},
			},
		},
	},
	misc = {
		tutorial = {
			cry_intro_1 = {
				"Salut, je suis {C:attention}Joseph J. Joker{},",
				"et bienvenue dans {C:cry_exotic,E:1}Cryptid{} !",
			},
			cry_intro_2 = {
				"On dirait que vous n'avez jamais joué",
				"à {C:cry_exotic,E:1}Cryptid{} sur ce profil auparavant.",
				"Laisse-moi te montrer comment ça marche, par ici !",
			},
			cry_intro_3 = {
				"*obtient des mains*",
			},
			cry_intro_4 = {
				"C'est très dur d'expliquer ce mod",
				"en quelques phrases, mais ce que je peux te dire",
				"c'est que tu vas avoir des parties de {C:cry_exotic,E:1}taré !",
				"On est très loin du {C:attention}Joker Poker{} classique, tu vois...",
			},
			cry_intro_5 = {
				"Comme tu peux le remarquer par ces",
				"{C:cry_ascendant}styles de jeu{}, j'adore la lettre {C:attention}M{}.",
				"Sélectionne un style de jeu pour que je t'explique le tout...",
				"{s:0.8}À noter: L'équilibrage des styles de jeu est un gros work in progress.",
				"{s:0.8}Attends-toi à avoir plein de changements!",
			},
			cry_modest_1 = {
				"Tu cherches une expérience qui reste proche du vanilla?",
				"Le style {C:cry_ascendant}Modeste{} est fait pour toi!",
			},
			cry_modest_2 = {
				"Mais modeste ne veut pas non plus dire nul, tu pourras",
				"toujours rencontrer les nouvelles gimmicks de Cryptid !",
				"Qui sait ce qu'il se passera dans tes prochaines manches...",
			},
			cry_mainline_1 = {
				"Envie de {E:1,C:attention}casser{} le jeu ? Bonne nouvelle,",
				"avec le style {C:cry_ascendant}Médian{}, tu peux maintenant le faire",
				"sans que tout parte en sucette immédiatement !",
			},
			cry_mainline_2 = {
				"La folie est toujours là, mais il y a un",
				"{C:cry_ascendant}système de progression{} qui t'attend pour t'acclimater",
				"au gameplay déjanté. Mais reste quand même sur tes gardes...",
			},
			cry_mainline_3 = {
				"Tu seras totalement plus puissant, mais",
				"j'ai aussi créé de nombreux {E:1,C:dark_edition}boss{} qui vont",
				"te faire regretter d'avoir choisi ce {C:cry_ascendant}style{}...",
			},
			cry_madness_1 = {
				"T'as envie de complètement {C:red,E:1}réduire en cendres{} ton PC ?",
				"C'est génial ! Le style {C:cry_ascendant}Maboul{} est plus du genre",
				"à envoyer {E:1,C:red}tout équilibrage par la fenêtre !",
			},
			cry_madness_2 = {
				"Et pour ça, j'ai passé de nombreuses nuits blanches",
				"à bosser sur ce style pour qu'il soit",
				"{C:cry_ascendant}PARFAITEMENT ÉQUILIBRÉ{}, comme tu le souhaitais !",
			},
			cry_madness_3 = {
				"Tu commences avec tout ce qui est possible débloqué",
				"comme ça tu peux libérer tout le {C:red,E:1}potentiel ultime{}",
				"de Cryptid dès le début ! Mais fais attention, il y a plus de chances",
				"que tu {C:attention,E:1}plantes le jeu{} plus que tu ne perds de partie...",
			},
		},
		poker_hands = {
			["cry_Bulwark"] = "Rempart",
			["cry_Clusterfuck"] = Cryptid_config.family_mode and "Capharnaüm" or "Foutoir",
			["cry_UltPair"] = "Super Paire",
			["cry_WholeDeck"] = Cryptid_config.family_mode and "Jeu complet" or "un putain de jeu complet",
			["cry-Cluster Bulwark"] = "Capharna-rempart",
		},
		poker_hand_descriptions = {
			["cry_Bulwark"] = {
				"5 cartes sans rang ni couleur",
			},
			["cry_Clusterfuck"] = {
				"Au moins 8 cartes sans",
				"Paire, Couleur, ou Quinte",
			},
			["cry_UltPair"] = {
				"Deux Doubles Paires, où chaque",
				"Double Paire est une couleur unique,",
				"pour un total de deux couleurs entre elles",
			},
			["cry_WholeDeck"] = {
				"Une main qui contient toutes les cartes",
				"d'un jeu standard de 52 cartes.",
				"Je sais pas quoi dire, mais tu es fou.",
			},
		},
		achievement_names = {
			ach_cry_ace_in_crash = "ACE de poche",
			ach_cry_blurred_blurred_joker = "Cécité totale",
			ach_cry_bullet_hell = "Pluie de balles",
			ach_cry_break_infinity = "Atteindre l'infini",
			ach_cry_cryptid_the_cryptid = "Cryptid un Cryptid",
			ach_cry_exodia = "Exodia",
			ach_cry_freak_house = "Full tordu",
			ach_cry_googol_play_pass = "Pass Googol Play",
			ach_cry_haxxor = "H4xx0r",
			ach_cry_home_realtor = "Agent immobilier",
			ach_cry_jokes_on_you = "On fait moins le malin, maintenant !",
			ach_cry_niw_uoy = "! éngag zeva suoV",
			ach_cry_now_the_fun_begins = "Le fun peut commencer",
			ach_cry_patience_virtue = "La patience est une vertue.",
			ach_cry_perfectly_balanced = "Équilibre parfait",
			ach_cry_pull_request = "Pull Request",
			ach_cry_traffic_jam = "Embouteillages",
			ach_cry_ult_full_skip = "Je passe",
			ach_cry_used_crash = "Tu t'attendais à quoi ?",
			ach_cry_what_have_you_done = "QU'EST-CE QUE TU AS FAIT ?!",
			ach_cry_pin = "L'épingle de la honte",
			ach_cry_youre_fucking_kidding = Cryptid_config.family_mode and "J'ai plus besoin de ça"
				or "Tu te fous de moi",
		},
		achievement_descriptions = {
			ach_cry_ace_in_crash = 'check_for_unlock({type = "ace_in_crash"})',
			ach_cry_blurred_blurred_joker = "Obtenir un Joker Flou flou",
			ach_cry_bullet_hell = "Avoir 15 Jokers AP",
			ach_cry_break_infinity = "Marquer 1.79e308 Jetons en une seule main",
			ach_cry_cryptid_the_cryptid = "Utiliser une carte Cryptide sur une carte Cryptide",
			ach_cry_exodia = "Avoir 5 Jokers exotiques",
			ach_cry_freak_house = "Jouer un Full flush composé de 6 et 9 tout en ayant Nice",
			ach_cry_googol_play_pass = "Truquer une Carte Googol Play",
			ach_cry_haxxor = "Utiliser un code de triche",
			ach_cry_home_realtor = "Activer Jolie Maison avant l'Ante 8 (sans Équilibrium/Antimatière)",
			ach_cry_jokes_on_you = "Déclencher l'effet de La Blague à l'Ante 1 puis gagner la partie",
			ach_cry_niw_uoy = "Atteindre l'Ante -8",
			ach_cry_now_the_fun_begins = "Obtenir un Canevas",
			ach_cry_patience_virtue = "Attendre 2 minutes face à la Boucle Lavande avant de jouer la première main, puis battre la blinde",
			ach_cry_perfectly_balanced = "Battre le Jeu Très Équilibré avec la Mise Ascendante",
			ach_cry_pull_request = "Faire ://ENGAGER apparaître le même joker qu'il a détruit",
			ach_cry_traffic_jam = "Battre tous les challenges Heure de Pointe",
			ach_cry_ult_full_skip = "Gagner en 1 tour",
			ach_cry_used_crash = "Utiliser ://CRASH",
			ach_cry_what_have_you_done = "Supprimer ou sacrifier un Joker exotique",
			ach_cry_pin = "Perdre une partie face à l'Épingle",
			ach_cry_youre_fucking_kidding = "Défausser " .. localize("cry_WholeDeck", "poker_hands"),
		},
		challenge_names = {
			c_cry_ballin = "Ballin'",
			c_cry_boss_rush = "Enter the Gungeon",
			c_cry_dagger_war = "Bataille de dagues",
			c_cry_joker_poker = "Joker Poker",
			c_cry_onlycard = "La carte unique",
			c_cry_rng = "Aléas de l'aléatoire", -- okay i think i cooked with this one
			c_cry_rush_hour = "Heure de pointe I",
			c_cry_rush_hour_ii = "Heure de pointe II",
			c_cry_rush_hour_iii = "Heure de pointe III",
			c_cry_sticker_sheet = "Feuille d'autocollants",
			c_cry_sticker_sheet_plus = "Feuille d'autocollants +",
		},
		dictionary = {
			--Settings Menu
			cry_set_features = "Fonctionnalités",
			cry_set_music = "Musique",
			cry_set_enable_features = "Utilisez cette section pour activer ou désactiver des Sets thématiques tout entier.",
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
			cry_feat_spooky = "Mise à jour Spooky",
			["cry_feat_more stakes"] = "Mises",
			cry_feat_vouchers = "Coupons",
			cry_mus_jimball = "Jimboule (Funkytown par Lipps Inc. - Sous droits d'auteur)",
			cry_mus_code = "Cartes Code (://LETS_BREAK_THE_GAME par HexaCryonic)",
			cry_mus_exotic = "Jokers exotiques (Joker in Latin par AlexZGreat)",
			cry_mus_high_score = "High Score (Final Boss [For Your Computer] par AlexZGreat)",
			cry_mus_alt_bg = "Musique de titre (par MathIsFun_)",
			cry_force_tooltips = "Forcer l'affichage des info-bulles",
			cry_family = "Mode family-friendly",
			cry_experimental = "Mode expérimental",

			k_cry_program_pack = "Paquet Programme",
			k_cry_meme_pack = "Paquet Meme",

			cry_critical_hit_ex = "Coup critique!",
			cry_critical_miss_ex = "Échec critique!",

			cry_potion1 = "-1 à tous les niveaux de main",
			cry_potion2 = "X1.15 à la taille de la Blinde",
			cry_potion3 = "-1 main et défausse",

			cry_debuff_oldhouse = "Pas de Full",
			cry_debuff_oldarm = "4 cartes ou moins doivent être jouées",
			cry_debuff_oldpillar = "Pas de Quinte",
			cry_debuff_oldflint = "Pas de Couleur",
			cry_debuff_oldmark = "No hands containing a Pair",
			cry_debuff_obsidian_orb = "Applique les capacités de tous les boss battus",

			cry_tax_placeholder = "(X0.4 taille de la blinde)",
			cry_joke_placeholder = "(multiple de 8)",

			k_code = "Code",
			k_content_set = "Set à thème",
			b_content_sets = "Sets à thème",
			--Why aren't these in vanilla?
			b_tag = "Badge",
			b_blind = "Blinde",

			b_tarot_rate = "Taux de tarot",
			b_planet_rate = "Taux de planète",

			k_unique = "Unique",
			b_code_cards = "Cartes Code",
			b_unique_cards = "Cartes uniques",
			b_pull = "TIRER",
			cry_hooked_ex = "Accroché!",
			k_end_blind = "Finir la blinde",
			k_cry_shiny = "Étincelant",

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

			cry_asc_hands = "Mains Asc.",
			cry_p_star = "Étoile",

			cry_hand_bulwark = "Muraille",
			cry_hand_clusterfuck = "Foutoir",
			cry_hand_ultpair = "Super Paire",

			cry_again_q = "Encore?",
			cry_curse = "Malédiction",
			cry_curse_ex = "Malédiction!",
			cry_sobbing = "À l'aide...",
			cry_gaming = "Gaming",
			cry_gaming_ex = "Gaming!",
			cry_good_luck_ex = "Bonne chance!",
			cry_sus_ex = "Imposteur!",
			cry_jolly_ex = "Plus joyeux!",
			cry_highfive_ex = "Tope-là!",
			cry_m_minus = "m",
			cry_m = "M",
			cry_m_ex = "M!",
			cry_minus_round = "-1 Tour",
			cry_plus_cryptid = "+1 Cryptide",
			cry_plus_card = "+1 Carte",
			cry_plus_code = "+1 Code",
			cry_no_triggers = "Pas de redéclenchements restants!",
			cry_unredeemed = "Plus échangé...",
			cry_active = "Actif",
			cry_inactive = "Inactif",

			k_disable_music = "Désactiver la musique",

			k_cry_epic = "Épique",
			k_cry_exotic = "Exotique",
			k_cry_candy = "Bonbon",
			k_cry_cursed = "Maudit",
			k_planet_disc = "Disque Circumstellaire",
			k_planet_satellite = "Satellites Naturels",
			k_planet_universe = Cryptid_config.family_mode and "Univers" or "Le putain d'univers",

			cry_notif_jimball_1 = "Jimboule",
			cry_notif_jimball_2 = "Notice de droits d'auteur",
			cry_notif_jimball_d1 = 'Jimboule joue la musique "Funkytown",',
			cry_notif_jimball_d2 = "qui est soumise aux droits d'auteur et ne peut",
			cry_notif_jimball_d3 = "pas être utilisée dans des streams ou vidéos.",

			cry_gameset_explanation = {
				"Sélectionne un style de jeu",
				"à appliquer sur cette carte.",
			},
			cry_gameset_disabled = "Désactivé",
			cry_gameset_modest = "Modeste",
			cry_gameset_mainline = "Médian",
			cry_gameset_madness = "Maboul",
			cry_gameset_custom = "Modifié",
			cry_gameset_exp = "Expérimental",
			cry_gameset_exp_modest = "Expérimental (Modeste)",
			cry_gameset_exp_mainline = "Expérimental (Médian)",
			cry_gameset_exp_madness = "Expérimental (Maboul)",

			cry_view_set_contents = "Voir les objets dans le set",

			-- These two are left empty because they aren't used here
			cry_sapling_an = "", -- "un Joker Exotique"
			cry_sapling_a = "", -- "un Joker Rare"

			b_reset_gameset_modest = "Réinitialiser la configuration du style (Modeste)",
			b_reset_gameset_mainline = "Réinitialiser la configuration du style (Médian)",
			b_reset_gameset_madness = "Réinitialiser la configuration du style (Maboul)",
		},
		labels = {
			food_jokers = "Jokers nourriture",
			banana = "Banane",
			pinned = "Épinglé",
			cry_absolute = "Absolu",
			code = "Code",
			unique = "Unique",
			cry_rigged = "Truqué",
			cry_hooked = "Accroché",
			cry_flickering = "Luisant",
			cry_possessed = "Possédé",

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

			k_cry_epic = "Épique",
			k_cry_exotic = "Exotique",
			k_cry_candy = "Candy",
			k_cry_cursed = "Cursed",
		},
		rnj_loc_txts = {
			stats = {
				plus_mult = { "{C:red}+#2#{} Multi" },
				plus_chips = { "{C:blue}+#2#{} Jeton#<s>2#" },
				x_mult = { "{X:red,C:white} X#2#{} Multi" },
				x_chips = { "{X:blue,C:white} X#2#{} Jetons" },
				h_size = { "{C:attention}+#2#{} à la taille de main" },
				money = { "gagne {C:money}+$#2#{}" },
			},
			stats_inactive = {
				plus_mult = { "{C:inactive}(Actuellement {C:red}+#1#{C:inactive} Multi)" },
				plus_chips = { "{C:inactive}(Actuellement {C:blue}+#1#{C:inactive} Jeton#<s>1#)" },
				x_mult = { "{C:inactive}(Actuellement {X:red,C:white} X#1# {C:inactive} Multi)" },
				x_chips = { "{C:inactive}(Actuellement {X:blue,C:white} X#1# {C:inactive} Jetons)" },
				h_size = { "{C:inactive}(Actuellement {C:attention}+#1#{C:inactive} taille de main)" },
				money = { "{C:inactive}(Actuellement {C:money}+$#1#{C:inactive})" },
			},
			actions = {
				make_joker = { "Crée un {C:attention}#2# Joker{}" },
				make_tarot = { "Crée une carte {C:attention}#2#{C:tarot} Tarot" },
				make_planet = { "Crée une carte {C:attention}#2#{C:planet} Planète" },
				make_spectral = { "Crée une carte {C:attention}#2#{C:spectral} Spectrale{}" },
				add_dollars = { "Gagne {C:money}$#2#{}" },
			},
			contexts = {
				open_booster = { "lorsqu'un {C:attention}paquet{} est ouvert" },
				buying_card = { "lorsqu'une carte est achetée" },
				selling_self = { "lorsque cette carte est vendue" },
				selling_card = { "lorsqu'une carte est vendue" },
				reroll_shop = { "lors d'un réassort" },
				ending_shop = { "à la fin de la {C:attention}boutique{}" },
				skip_blind = { "lorsqu'une {C:attention}blinde{} est passée" },
				skipping_booster = { "lorsque n'importe quel {C:attention}paquet{} est passé" },
				playing_card_added = { "à chaque fois qu'une {C:attention}carte à jouer{} est ajoutée à votre jeu" },
				first_hand_drawn = { "au début de la manche" },
				setting_blind = { "lorsque la {C:attention}Blinde{} est sélectionnée" },
				remove_playing_cards = { "lorsqu'une carte est détruite" },
				using_consumeable = { "lorsq'une carte {C:attention}consommable{} est utilisée" },
				debuffed_hand = { "si la {C:attention}main jouée{} n'est pas autorisée" },
				pre_discard = { "avant chaque défausse" },
				discard = { "pour chaque carte défaussée" },
				end_of_round = { "à la fin de {C:attention}la manche{}" },
				individual_play = { "pour chaque carte marquée" },
				individual_hand_score = { "pour chaque carte en main lors du compte" },
				individual_hand_end = { "pour chaque carte en main à la fin de la {C:attention}manche{}" },
				repetition_play = { "Redéclenche les cartes jouées" },
				repetition_hand = { "Redéclenche les cartes en main" },
				other_joker = { "pour chaque {C:attention}Joker{}" },
				before = { "avant chaque {C:attention}main{}" },
				after = { "après chaque {C:attention}main{}" },
				joker_main = {},
			},
			conds = {
				buy_common = { "si c'est un {C:attention}Joker{} {C:blue}Commun{}" },
				buy_uncommon = { "si c'est un {C:attention}Joker{} {C:blue}Peu commun{}" },
				tarot = { "si cette carte est une carte {C:tarot}Tarot{}" },
				planet = { "si cette carte est une carte {C:planet}Planète{}" },
				spectral = { "si cette carte est une carte {C:spectral}Spectrale{}" },
				joker = { "si cette carte est un {C:attention}Joker{}" },
				suit = { "si cette carte est un {V:1}#3#{}" },
				rank = { "si cette carte est un {C:attention}#3#{}" },
				face = { "si cette carte est une carte {C:attention}figure{}" },
				boss = { "si la {C:attention}blinde{} est une {C:attention}Blinde de Boss{}" },
				non_boss = { "si la {C:attention}blinde{} n'est pas une {C:attention}Blinde de Boss{}" },
				small = { "si la {C:attention}blinde{} est une {C:attention}Petite Blinde{}" },
				big = { "si la {C:attention}blinde{} est une {C:attention}Grosse Blinde{}" },
				first = { "si c'est la {C:attention}première main{}" },
				last = { "si c'est la {C:attention}dernière main{}" },
				common = { "si c'est un {C:attention}Joker {C:blue}Commun{}" },
				uncommon = { "si c'est un {C:attention}Joker{} {C:green}Peu commun{}" },
				rare = { "si c'est un {C:attention}Joker{} {C:red}Rare{}" },
				poker_hand = { "si la main contient une {C:attention}#3#{}" },
				or_more = { "si la main contient au moins {C:attention}#3#{} cartes" },
				or_less = { "si la main contient au plus {C:attention}#3#{} cartes" },
				hands_left = { "s'il reste #3# {C:blue}mains{} à la fin de la manche" },
				discards_left = { "s'il reste #3# {C:red}défausses{} à la fin de la manche" },
				first_discard = { "si c'est la {C:attention}première défausse{}" },
				last_discard = { "si c'est la {C:attention}dernière défausse{}" },
				odds = { "avec {C:green}#4# chances sur {C:green}#3#{}" },
			},
		},
		v_dictionary = {
			a_xchips = { "X#1# Jetons" },
			a_powmult = { "^#1# Multi" },
			a_powchips = { "^#1# Jetons" },
			a_powmultchips = { "^#1# Multi+Jetons" },
			a_round = { "+#1# Manche#<s>1#" },
			a_candy = { "+#1# bonbon" },
			a_xchips_minus = { "-X#1# Jetons" },
			a_powmult_minus = { "-^#1# Multi" },
			a_powchips_minus = { "-^#1# Jetons" },
			a_powmultchips_minus = { "-^#1# Multi+Jetons" },
			a_round_minus = { "-#1# Manche#<s>1#" },
			a_tag_minus = { "-#1# Badge" },
			a_tags_minus = { "-#1# Badges" },
			a_tag = { "#1# Badge" },
			a_tags = { "#1# Badges" },

			cry_sticker_name = { "Sticker #1#" },
			cry_sticker_desc = {
				"Vous avez remporté",
				"la #2#Mise #1##3#",
				"avec ce Joker",
			},

			cry_art = { "Graphismes : #1#" },
			cry_code = { "Code : #1#" },
			cry_idea = { "Idée : #1#" },
		},
		v_text = {
			ch_c_cry_all_perishable = { "Tous les jokers sont {C:eternal}Périssables{}" },
			ch_c_cry_all_rental = { "Tous les jokers sont {C:eternal}en Location{}" },
			ch_c_cry_all_pinned = { "Tous les jokers sont {C:eternal}Épinglés{}" },
			ch_c_cry_all_banana = { "Tous les jokers sont {C:eternal}Bananes{}" },
			ch_c_all_rnj = { "Tous les jokers sont {C:attention}RNJoker{}" },
			ch_c_cry_sticker_sheet_plus = { "Tous les objets achetables ont tous les stickers" },
			ch_c_cry_rush_hour = {
				"Toutes les Blindes de Boss sont {C:attention}L'Horloge{} ou la {C:attention}Boucle Lavande",
			},
			ch_c_cry_rush_hour_ii = { "Toutes les blindes sont des {C:attention}Blindes de Boss{}" },
			ch_c_cry_rush_hour_iii = {
				"{C:attention}L'Horloge{} et la {C:attention}Boucle Lavande{} augmentent {C:attention}deux fois{} plus vite",
			},
			ch_c_cry_no_tags = { "Passer la blinde n'est {C:attention}plus possible{}" },
			ch_c_cry_no_vouchers = { "Les {C:attention}coupons{} n'apparaissent plus dans la boutique" },
			ch_c_cry_no_boosters = { "Les {C:attention}Paquets Booster{} n'apparaissent plus dans la boutique" },
			ch_c_cry_no_rerolls = { "Le réapprovisionnement n'est {C:attention}plus possible{}" },
			ch_c_cry_no_consumables = { "Les {C:attention}consommables{} n'apparaissent plus" },
		},
		-- Thanks to many members of the community for contributing to all of these quips!
		-- There's too many to credit so just go here: https://discord.com/channels/1116389027176787968/1209506360987877408/1237971471146553406
		-- And here: https://discord.com/channels/1116389027176787968/1219749193204371456/1240468252325318667
		very_fair_quips = {
			{ "L", "NO VOUCHERS", "FOR YOU" },
			{ "BOZO", "DID YOU THINK I WOULD", "GIVE YOU A VOUCHER?" },
			{ "NOPE!", "NO VOUCHERS HERE!", "(SLUMPAGE EDITION)" },
			{ "SKILL ISSUE", "IMAGINE BEING GOOD ENOUGH", "FOR A VOUCHER" },
			{ "JIMBO", "FROM MANAGEMENT", "FORGOT TO RESTOCK" },
			{ "OOPS!", "NO VOUCHERS", "" },
			{ "YOU JOKER,", "WHY ARE YOU LOOKING", "OVER HERE? LOL" },
			{ "THE VOUCHER", "IS IN", "ANOTHER CASTLE" },
			{ "$0", "BLANK VOUCHER", "(GET IT?)" },
			{ "ERROR", "CANNOT DO ARITHMETIC ON A NIL VALUE", "(tier4vouchers.lua)" },
			{ "100% OFF", "ON ALL VOUCHERS", "(SOMEONE ALREADY BOUGHT THEM)" },
			{ "TRY AGAIN LATER", "HINT: YOU WON'T HAVE", "ENOUGH MONEY ANYWAYS" },
			{ "HUH?", '"VOUCHER"?', "THAT'S NOT EVEN A WORD..." },
			{ 'HOLD "R"', "TO RESTOCK", "ALL VOUCHERS" },
			{ "DID YOU KNOW?", "PRESSING ALT+F4", "GIVES FREE VOUCHERS!" },
			{ "SORRY,", "THERE ARE NO VOUCHERS", "DUE TO BUDGET CUTS" },
			{ "CALL 1-600-JIMBO", "TO RATE YOUR", "VOUCHER EXPERIENCE" },
			{ "DEFEAT", "ANTE 39 BOSS BLIND", "TO RESTOCK" },
			{ "MAGIC TRICK", "I MADE THIS VOUCHER", "DISAPPEAR" },
			{ "WHY IS A", "VOUCHER LIKE", "A WRITING DESK?" },
			{ "WE HAVE RETRACTED", "YOUR VOUCHERS, THEY WOULD BE", "BETTER USED IN OTHER RUNS" },
			{ "WHY DO THEY CALL IT VOUCHER", "WHEN MULT OUT THE HOT", "IN COLD EAT EAT THE CHIP" },
			{ "SORRY", "THE VOUCHERS ARE EXPERIENCING", "VOUCHIFIA ABORTUS" },
			{ "UNFORTUNATELY", "THE VOUCHRX REWRITE UPDATE", "HAS BEEN CANCELLED" },
			{ "DEFEAT", "BOSS BLIND", "TO CHANGE NOTHING" },
			{ "BIRDS ARE SINGING", "FLOWERS ARE BLOOMING", "KIDS LIKE YOU..." },
			{ "WE ARE SORRY TO SAY", "ALL VOUCHERS HAVE BEEN RECALLED", "DUE TO SALMONELLA EXPOSURE" },
			{ "VOUCHERS COULDN'T ARRIVE", "DUE TO SHOP LAYOUT BEING", "200% OVERBUDGET" },
			{ "YOU LIKE", "BUYING VOUCHERS, DON'T YOU", "YOU'RE A VOUCHERBUYER" },
			{ "VOUCHERS", "!E", "VOUCHER POOL" },
			{ "THERE", "IS NO", "VOUCHER" },
			{ "THERE IS", "NO SANTA", "AND THERE ARE NO VOUCHERS" },
			{ "", "VOUCHERN'T", "" },
			{ "YOU", "JUST LOST", "THE GAME" },
			{ "CAN I OFFER YOU", "A NICE EGG", "IN THESE TRYING TIMES?" },
			{ "GO TOUCH GRASS", "INSTEAD OF USING", "THIS DECK" },
			{ "YOU COULD BE", "PLAYING ON BLUE DECK", "RIGHT NOW" },
			{ "FREE EXOTICS", "GET THEM BEFORE ITS", "TOO LATE (sold out)" },
			{ "PROVE THEM WRONG", "BUY BUYING AN INVISIBLE", "VOUCHER FOR $10" },
			{ "", "no vouchers?", "" },
			{
				"see this ad?",
				"if you are, then it's working",
				"and you could have it for your own",
			},
			{ "YOU'RE MISSING OUT ON", "AT LEAST 5 VOUCHERS RIGHT NOW", "tonktonktonktonktonk" },
			{ "10", "20 NO VOUCHER XD", "30 GOTO 10" },
			{ "VOUCHERS", "ARE A PREMIUM FEATURE", "$199.99 JOLLARS TO UNLOCK" },
			{ "TRUE VOUCHERLESS!?!?", "ASCENDANT STAKE ONLY", "VERY FAIR DECK" },
			{ "ENJOYING YOUR", "VOUCHER EXPERIENCE? GIVE US A", "FIVE STAR RATING ON JESTELP" },
			{
				"FREE VOUCHERS",
				"HOT VOUCHERS NEAR YOU",
				"GET VOUCHERS QUICK WITH THIS ONE TRICK",
			},
			{ "INTRODUCING", "THE VERY FIRST TIER 0 VOUCHER!", "(coming to Cryptid 1.0 soon)" },
			{
				"A VOUCHER!",
				"IT'S JUST IMAGINARY",
				"WE IMAGINED YOU WOULD WANT IT, THAT IS",
			},
			{ "TURN OFF ADBLOCKER", "WITHOUT ADS, WE WOULDN'T", "BE ABLE TO SELL YOU VOUCHERS" },
			{
				"IF YOU HAVE",
				"A PROBLEM WITH THIS",
				"EMAIL IT TO US AT NORESPONSE@JMAIL.COM",
			},
			{ "NOT ENOUGH MONEY", "TO BUY THIS VOUCHER", "SO WHY WOULD WE PUT IT HERE?" },
			{ "WANT A VOUCHER?", "WELL SHUT UP", "YOU CAN'T HAVE ANY LOL" },
			{ "^$%& NO", "VOUCHERS ^%&% %&$^% FOR", "$%&%%$ %&$&*%$^ YOU" },
			{ "A VOUCHER (TRUST)", "|\\/|", "|/\\|" },
			{
				"... --- ...",
				".--. .-.. .- -.-- . .-. -.. . -.-. --- -.. . -.. -- --- .-. ... .",
				"-.-. --- -.. . - --- ..-. .. -. -.. .- ...- --- ..- -.-. .... . .-.",
			},
			{ "RUN > NEW", "STARE AT NOTHING", "FOR AN HOUR OR TWO" },
			{ "WE'RE VERY SORRY", "THE LAST GUY PANIC BOUGHT", "ALL THE VOUCHERS" },
			{ "HOW IT FEELS", "TO BUY NO", "VOUCHERS" },
			{ "JIMBO GOT A NAT 1", "AND DUMPED ALL THE", "VOUCHERS IN A DITCH" },
			{ "ATTEMPT TO INDEX", "FIELD 'VOUCHER'", "(A NIL VALUE)" },
			{
				"OH YOU REALLY THOUGHT THAT READING ALL THESE LINES WOULD BRING YOUR VOUCHERS BACK?",
				"SORRY TO TELL YOU, BUT THIS DECK DOESN'T CONTAIN THE VOUCHERS YOU SEEK.",
				"THIS ABNORMALLY LONG TEXT IS HERE AND DESIGNED TO WASTE YOUR TIME AND EFFORT WHILE YOU READ IT.",
			},
			{ "GO TO", "https://youtu.be/p7YXXieghto", "FOR FREE VOUCHERS" },
		},
	},
}
