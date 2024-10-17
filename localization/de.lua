--Translation by Foegro
return {
    descriptions = {
        Back = {
            b_cry_antimatter = {
                name = "Antimaterie Deck",
                text = {
                    "Hat die {C:legendary,E:1}positiven Effekte{}",
                    "von {C:attention}jedem{} Deck",
                },
            },
            b_cry_beta = {
                name = "Nostalgisches Deck",
                text = {
                    "{C:attention}Joker{} und {C:attention}Verbrauchgegenstände{}",
                    "Slots sind {C:attention}zusammengefasst",
                    "{C:attention}Nostalgische{} Blinds ersetzen",
                    "ihre neuen Versionen."
                },
            },
            b_cry_blank = {
                name = "Unbedrucktes Deck",
                text = {
                    "{C:inactive,E:1}Tut nichts?",
                },
            },
            b_cry_CCD = {
                name = "CCD Deck",
                text = {
                    "Jede Karte ist auch",
                    "ein {C:attention}zufälliger{} Verbrauchsgegenstand",
                },
            },
            b_cry_conveyor = {
                name = "Fließband Deck",
                text = {
                    "Joker können {C:attention}nicht{} bewegt werden",
                    "Am Anfang der Runde,",
                    "{C:attention}dupliziere{} den rechtesten Joker",
                    "und {C:attention}zerstöre{} den linkesten Joker",
                },
            },
            b_cry_critical = {
                name = "Kritisches Deck",
                text = {
                    "Nach jeder gespielten Hand,",
                    "Chance von {C:green}#1# zu 4{} für {X:dark_edition,C:white} ^2 {} Mult",
                    "Chance von {C:green}#1# zu 8{} für {X:dark_edition,C:white} ^0.5 {} Mult",
                },
            },
            b_cry_encoded = {
                name = "Verschlüsseltes Deck",
                text = {
                    "Starte mit einem {C:cry_code,T:j_cry_CodeJoker}Code Joker{}",
                    "und einem {C:cry_code,T:j_cry_copypaste}Copy/Paste{}",
                    "Nur {C:cry_code}Code Karten{} erscheinen im Shop",
                },
            },
            b_cry_equilibrium = {
                name = "Deck des Gleichgewichts",
                text = {
                    "Alle Karten haben die",
                    "{C:attention}selbe Chance{}",
                    "im Shop aufzutauchen,",
                    "beginne den Durchlauf mit",
                    "{C:attention,T:v_overstock_plus}Überbestand Plus",
                },
            },
            b_cry_glowing = {
                name = "Glühendes Deck",
                text = {
                    "Multipliziere die Werte",
                    "aller Joker mit {X:dark_edition,C:white} X1.25 {}",
                    "wenn die Boss Blind besiegt wurde.",
                    "{X:cry_jolly,C:white,s:0.8} Jolly#1#Open#1#Winner#1#-#1#wawa#1#person", --peak loc_vars right here
                },
            },
            b_cry_infinite = {
                name = "Unendliches Deck",
                text = {
                    "Du kannst {C:attention}unendlich{} viele",
                    "Karten auswählen.",
                    "{C:attention}+1{} Handgröße",
                },
            },
            b_cry_misprint = {
                name = "Fehlgedrucktes Deck",
                text = {
                    "Werte von Karten",
                    "und Pokerhänden",
                    "sind {C:attention}zufällig",
                },
            },
            b_cry_redeemed = {
                name = "Eingelöstes Deck",
                text = {
                    "Wenn ein {C:attention}Gutschein{} gekauft wird,",
                    "bekomme seine {C:attention}verbesserten Versionen",
                },
            },
            b_cry_very_fair = {
                name = "Sehr Faires Deck",
                text = {
                    "{C:blue}-2{} Hände, {C:red}-2{} Abwürfe",
                    "jede Runde",
                    "{C:attention}Gutscheine{} erscheinen",
                    "nicht mehr im Shop",
                },
            },
            b_cry_wormhole = {
                name = "Wurmloch Deck",
                text = {
                    "Beginne mit einem {C:cry_exotic}Exotischen{C:attention} Joker",
                    "Joker sind {C:attention}20X{} warscheinlicher",
                    "{C:dark_edition}Negativ{} zu sein",
                    "{C:attention}-2{} Joker-Slots",
                },
            },
        },
        Blind = {
            bl_cry_box = {
                name = "Die Box",
                text = {
                    "Alle Gewöhnlichen Joker",
                    "sind geschwächt.",
                },
            },
            bl_cry_clock = {
                name = "Die Uhr",
                text = {
                    "+0.1X Blindgröße für alle",
                    "3 Sekunden, die du in dieser Ante verbringst.",
                },
            },
            bl_cry_hammer = {
                name = "Der Hammer",
                text = {
                    "Alle Karten mit ungeradem",
                    "Rang sind geschwächt.",
                },
            },
            bl_cry_joke = {
                name = "Der Witz",
                text = {
                    "Wenn deine Chips mehr als 2x die benötigten sind,",
                    "setze die Ante zu einer mehrzahl von #1#",
                },
            },
            bl_cry_magic = {
                name = "Die Magie",
                text = {
                    "Alle Karten mit geradem",
                    "Rang sind geschwächt",
                },
            },
            bl_cry_lavender_loop = {
                name = "Lavendelschleife",
                text = {
                    "1.25X Blindgröße für alle",
                    "1.5 Sekunden, die du in dieser Runde verbringst",
                },
            },
            bl_cry_obsidian_orb = {
                name = "Obsidian Kugel",
                text = {
                    "Hat die Fähigkeiten",
                    "aller besiegten Bosse",
                },
            },
            bl_cry_oldarm = {
                name = "Nostalgischer Arm",
                text = {
                    "Du musst 4 oder weniger",
                    "Karten spielen",
                },
            },
            bl_cry_oldfish = {
                name = "Nostalgischer Fisch",
                text = {
                    "Alle Hände starten",
                    "mit 1 Mult",
                },
            },
            bl_cry_oldflint = {
                name = "Nostalgischer Feuerstein",
                text = {
                    "Keine Flushes",
                },
            },
            bl_cry_oldhouse = {
                name = "Nostalgisches Haus",
                text = {
                    "Keine Full Houses",
                },
            },
            bl_cry_oldmanacle = {
                name = "Nostalgische Handfessel",
                text = {
                    "Dividiere Mult durch Abwürfe",
                },
            },
            bl_cry_oldmark = {
                name = "Nostalgische Marke",
                text = {
                    "Keine Hände die",
                    "ein Paar enthalten",
                },
            },
            bl_cry_oldox = {
                name = "Nostalgischer Ochse",
                text = {
                    "Alle Hände starten",
                    "mit 0 Chips",
                },
            },
            bl_cry_oldpillar = {
                name = "Nostalgische Säule",
                text = {
                    "Keine Straßen",
                },
            },
            bl_cry_oldserpent = {
                name = "Nostalgische Schlange",
                text = {
                    "Dividiere Mult durch das Level",
                    "der gespielten Poker Hand",
                },
            },
            bl_cry_pin = {
                name = "Die Stecknadel",
                text = {
                    "Joker mit epischer oder höherer",
                    "Seltenheit sind geschwächt.",
                },
            },
            bl_cry_pinkbow = {
                name = "Pinke Schleife",
                text = {
                    "Rang der Karten in der Hand",
                    "werden beim Spielen einer Hand verzufälligt",
                },
            },
            bl_cry_sapphire_stamp = {
                name = "Saphirstempel",
                text = {
                    "Du kannst eine weitere Karte auswählen, vor der",
                    "Auswertung wird die Auswahl einer zufälligen Karte aufgehoben",
                },
            },
            bl_cry_shackle = {
                name = "Die Schelle",
                text = {
                    "Alle negativen Joker",
                    "sind geschwächt",
                },
            },
            bl_cry_striker = {
                name = "Der Stürmer",
                text = {
                    "Alle seltenen Joker",
                    "sind geschwächt",
                },
            },
            bl_cry_tax = {
                name = "Die Steuer",
                text = {
                    "Wert einer Hand kann nicht",
                    "mehr als 0.4 mal das benötigte sein",
                },
            },
            bl_cry_tornado = {
                name = "Türkiser Tornado",
                text = {
                    "Chance von #1# zu #2#, dass",
                    "die gespielte Hand nicht gewertet wird",
                },
            },
            bl_cry_trick = {
                name = "Der Trick",
                text = {
                    "Nach jeder Hand, drehe alle Karten",
                    "mit dem Gesicht oben in der Hand um",
                },
            },
            bl_cry_vermillion_virus = {
                name = "Zinnober Virus",
                text = {
                    "Ein zufälliger Joker wird",
                    "jede Hand ersetzt",
                },
            },
            bl_cry_windmill = {
                name = "Die Windmühle",
                text = {
                    "Alle ungewöhnlichen Joker",
                    "sind geschwächt",
                },
            },
        },
        Code = {
            c_cry_class = {
                name = "://CLASS",
                text = {
                    "Mache {C:cry_code}#1#{} ausgewählte Karte",
                    "zu einer {C:cry_code}gewählten{} Verstärkung",
                },
            },
            c_cry_commit = {
                name = "://COMMIT",
                text = {
                    "Zerstöre einen {C:cry_code}gewählten{} Joker,",
                    "erstelle einen {C:cry_code}neuen{} Joker",
                    "mit der {C:cry_code}selben Seltenheit",
                },
            },
            c_cry_crash = {
                name = "://CRASH",
                text = {
                    "{C:cry_code,E:1}Nein",
                },
            },
            c_cry_delete = {
                name = "://DELETE",
                text = {
                    "Entferne ein {C:cry_code}gewählten{}",
                    "Shopgegenstand {C:cry_code}permanent{}",
                    "{C:inactive,s:0.8}Item kann in diesem Durchlauf nicht mehr auftauchen.",
                },
            },
            c_cry_divide = {
                name = "://DIVIDE",
                text = {
                    "{C:cry_code}Halbiere{} alle gelisteten Preise",
                    "Im momentanen Shop",
                },
            },
            c_cry_exploit = {
                name = "://EXPLOIT",
                text = {
                    "Die {C:cry_code}nächste{} gespielte Hand",
                    "wird als {C:cry_code}chosen{} Pokerhand gewertet.",
                    "{C:inactive,s:0.8}Geheime Hände müssen",
                    "{C:inactive,s:0.8}entdeckt weden um gültig zu sein.",
                },
            },
            c_cry_hook = {
                name = "HOOK://",
                text = {
                    "Wähle zwei Joker",
                    "die {C:cry_code}Verhackt{} werden",
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
                text = { "Füge {C:dark_edition}Fehlerhaft{} zu allen", "Karten {C:cry_code}in der Hand{} hinzu" },
            },
            c_cry_merge = {
                name = "://MERGE",
                text = {
                    "Verschmelze ein gewählten {C:cry_code}Verbrauchsgegenstand",
                    "mit einer gewählten {C:cry_code}Spielkarte",
                },
            },
            c_cry_multiply = {
                name = "://MULTIPLY",
                text = {
                    "{C:cry_code}Verdopple{} alle Werte",
                    "eines gewählten {C:cry_code}Jokers{} bis",
                    "zum ende der Runde.",
                },
            },
            c_cry_payload = {
                name = "://PAYLOAD",
                text = {
                    "Nächste besiegte Blind",
                    "gibt {C:cry_code}X#1#{} Zinsen",
                },
            },
            c_cry_oboe = {
                name = "://OFFBYONE",
                text = {
                    "Nächstes {C:cry_code}Booster Packet{} hat",
                    "{C:cry_code}#1#{} zusätzliche Karte und",
                    "{C:cry_code}#1#{} zusätzliche Auswahl",
                    "{C:inactive}(Momentan {C:cry_code}+#2#{C:inactive})",
                },
            },
            c_cry_reboot = {
                name = "://REBOOT",
                text = {
                    "Erfrische {C:blue}Hände{} und {C:red}Abwürfe{},",
                    "tue {C:cry_code}alle{} Karten zurück ins Deck",
                    "und ziehe eine {C:cry_code}neue{} Hand",
                },
            },
            c_cry_revert = {
                name = "://REVERT",
                text = {
                    "Setzt {C:cry_code}Spielstand{} zum",
                    "Start {C:cry_code}dieser Ante{}",
                },
            },
            c_cry_rework = {
                name = "://REWORK",
                text = {
                    "Zerstöre einen {C:cry_code}gewählten{} Joker,",
                    "erstelle einen {C:cry_code}Überarbeitungs-Tag{} mit",
                    "einer Edition {C:cry_code}besser{}",
                    "{C:inactive,s:0.8}Nutzt Reinfolge in der Sammlung",
                },
            },
            c_cry_run = {
                name = "://RUN",
                text = {
                    "Besuche einen {C:cry_code}Shop",
                    "während einer {C:cry_code}Blind",
                },
            },
            c_cry_seed = {
                name = "://SEED",
                text = {
                    "Wähle einen Joker",
                    "oder eine Spielkarte",
                    "um {C:cry_code}Manipuliert{} zu werden",
                },
            },
            c_cry_semicolon = {
                name = ";//",
                text = { "Enden momentane nicht-Boss {C:cry_code}Blind{}", "{C:cry_code}ohne{} Preisgeld zu bekommen" },
            },
            c_cry_spaghetti = {
                name = "://SPAGHETTI",
                text = {
                    "Erstelle einen {C:cry_code}Fehlerhaften{}",
                    "Essen Joker",
                },
            },
            c_cry_variable = {
                name = "://VARIABLE",
                text = {
                    "Mache {C:cry_code}#1#{} gewählte Karten",
                    "zu einem {C:cry_code}gewählten{} Rang",
                },
            },
        },
        Edition = {
            e_cry_astral = {
                name = "Astral",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Mult",
                },
            },
            e_cry_blur = {
                name = "Verschwommen",
                text = {
                    "{C:attention}Löse{} diese Karte",
                    "{C:attention}1{} mal mehr {C:attention}aus{}",
                    "Chance von {C:green}#1# zu #2#{}",
                    "sie {C:attention}#3#{} weiteres",
                    "mal {C:attention}auszulösen",
                },
            },
            e_cry_double_sided = {
                name = "Doppelseitig",
                text = {
                    "Diese Karte kann",
                    "{C:attention}gedreht{} werden um",
                    "eine andere Karte zu zeigen.",
                },
            },
            e_cry_glass = {
                name = "Zerbrechlich",
                label = "Zerbrechlich",
                text = {
                    "{C:white,X:mult} X#3# {} Mult",
                    "Chance von {C:green}#1# zu #2#{}, dass diese",
                    "Karte beim auslösen",
                    "{C:attention}nicht{} {C:red}zerstört{} wird",
                },
            },
            e_cry_glitched = {
                name = "Fehlerhaft",
                text = {
                    "Alle Werte auf dieser Karte sind",
                    "ein {C:dark_edition}zufälliger{} Wert",
                    "zwichen {C:attention}X0.1{} und {C:attention}X10{} des originalen.",
                    "{C:inactive}(Wenn möglich){}",
                },
            },
            e_cry_gold = {
                name = "Golden",
                label = "Golden",
                text = {
                    "Verdiene {C:money}$#1#{} bei Benutzung",
                    "oder beim Auslösen",
                },
            },
            e_cry_m = {
                name = "Lustig",
                text = {
                    "{C:mult}+#1#{} Mult",
                    "Diese Karte fühlt sich",
                    "ziemlich {C:attention}lustig{}",
                },
            },
            e_cry_mosaic = {
                name = "Mosaik",
                text = {
                    "{X:chips,C:white} X#1# {} Chips",
                },
            },
            e_cry_noisy = {
                name = "Geräuchvoll",
                text = {
                    "???",
                },
            },
            e_cry_oversat = {
                name = "Übersättigt",
                text = {
                    "Alle Werte",
                    "auf dieser Karte",
                    "sind {C:attention}verdoppelt{}",
                    "{C:inactive}(Wenn möglich)",
                },
            },
        },
        Enhanced = {
            m_cry_echo = {
                name = "Echo Karte",
                text = {
                    "Chance von {C:green}#2# zu #3#{} um diese Karte",
                    "#1# weiteres mal {C:attention}auszulösen{}",
                    "wenn sie gewertet wird",
                },
            },
        },
        Joker = {
            j_cry_altgoogol = {
                name = "Nostalgische Googol Play Karte",
                text = {
                    "Verkaufe diese Karte um",
                    "{C:attention}1{} Kopien von dem linkesten {C:attention}Joker{} zu machen",
                    "{C:inactive}(Muss Platz haben){}",
                    "{C:inactive,s:0.8}Kopiert keine Nostalgischen Googol Play Karten{}",
                },
            },
            j_cry_antennastoheaven = {
                name = "...Wie Antennen zum Himmel",
                text = {
                    "Dieser Joker bekommt",
                    "{X:chips,C:white} X#1# {} Chips wenn jede",
                    "gespielte {C:attention}7{} oder {C:attention}4{} gewertet wurde",
                    "{C:inactive}(Momentan {X:chips,C:white}X#2# {C:inactive} Chips)",
                },
            },
            j_cry_apjoker = {
                name = "AP Joker",
                text = { "{X:mult,C:white} X#1# {} Mult gegen {C:attention}Boss Blinds{}" },
            },
            j_cry_big_cube = {
                name = "Großer Würfel",
                text = {
                    "{X:chips,C:white} X#1# {} Chips",
                },
            },
            j_cry_biggestm = {
                name = "Riesig",
                text = {
                    "{X:mult,C:white} X#1# {} Mult bis zum Ende",
                    "der Runde wenn {C:attention}Pokerhand{}",
                    "ein {C:attention}#2#{} ist",
                    "{C:inactive}(Momentan {C:attention}#3#{}{C:inactive}){}",
                    "{C:inactive,s:0.8}nicht fett, hat nur große Knochen.",
                },
            },
            j_cry_blender = {
                name = "Blender",
                text = {
                    "Erstelle ein {C:attention}zufäligen{}",
                    "Verbrauchsgegenstand wenn eine",
                    "{C:cry_code}Code{} Karte benutzt wird.",
                    "{C:inactive}(Muss Platz haben){}",
                },
            },
            j_cry_blurred = {
                name = "Verschwommener Joker",
                text = {
                    "Gain {C:blue}+#1#{} Hand/Hände wenn",
                    "{C:attention}Blind{} ausgewählt wird",
                },
            },
            j_cry_bonk = {
                name = "Bonk",
                text = {
                    "Jeder {C:attention}Joker{} gibt {C:chips}+#1#{} Chips",
                    "Erhöhe anzahl um {C:chips}+#2#{} wenn",
                    "{C:attention}Pokerhand{} ein {C:attention}#3#{} ist",
                    "{C:inactive,s:0.8}Lustige Joker geben statdessen{} {C:chips,s:0.8}+#4#{} {C:inactive,s:0.8}Chips{}",
                },
            },
            j_cry_bonusjoker = {
                name = "Bonus Joker",
                text = {
                    "Chance von {C:green}#1# zu #2#{} für jede",
                    "gespielte {C:attention}Bonus{} Karte die",
                    "{C:attention}Joker{} or {C:attention}Verbrauchgegenstand Slots",
                    "um {C:dark_edition}1{} zu erhöhen wenn sie gewertet werden.",
                    "{C:red}Funktioniert einmal pro Runde",
                    "{C:inactive,s:0.8}(Gleiche Chance für beide){}",
                },
            },
            j_cry_booster = {
                name = "Booster Joker",
                text = {
                    "{C:attention}+#1#{} Booster Packet Slot",
                    "im Shop verfügbar",
                },
            },
            j_cry_boredom = {
                name = "Lange Weile",
                text = {
                    "Chance von {C:green}#1# zu #2#{} um",
                    "jeden {C:attention}Joker{} oder jede",
                    "{C:attention}Spielkarte{} erneut {C:attention}auszulösen{}",
                    "{C:inactive,s:0.8}Funktioniert nicht auf andere Lange Weilen{}",
                },
            },
            j_cry_bubblem = {
                name = "Blasen M",
                text = {
                    "Erstelle einen {C:dark_edition}Foil {C:attention}Lustigen Joker{}",
                    "wenn gespielte Hand einen",
                    "{C:attention}#1#{} enthält.",
                    "{C:red,E:2}Zerstört sich selbst{}",
                },
            },
            j_cry_busdriver = {
                name = "Bus Fahrer",
                text = {
                    "Chance von {C:green}#1# zu #3#{}",
                    "für {C:mult}+#2#{} Mult",
                    "Chance von {C:green}1 zu 4{}",
                    "für {C:mult}-#2#{} Mult",
                },
            },
            j_cry_canvas = {
                name = "Leinwand",
                text = {
                    "{C:attention}Löse{} alle {C:attention}Jokers{} auf der linken Seite",
                    "{C:attention}so oft neu aus{} wie du nicht-{C:blue}Gewöhnliche{C:attention} Joker{}",
                    "auf der rechten Seite hast",
                },
            },
            j_cry_caramel = {
                name = "Karamel",
                text = {
                    "Jede gespielte Karte gibt",
                    "{X:mult,C:white}X#1#{} Mult wenn gewertet",
                    "für die nächsten {C:attention}#2#{} Runden",
                },
            },
            j_cry_chad = {
                name = "Chad",
                text = {
                    "Löse {C:attention}linkesten{} Joker",
                    "{C:attention}#1#{} weitere(s) mal(e) aus",
                },
            },
            j_cry_chili_pepper = {
                name = "Chilischote",
                text = {
                    "Dieser Joker bekommt {X:mult,C:white} X#2# {} Mult",
                    "am Ende der Runde,",
                    "{C:red,E:2}zerstört sich selbst{} nach {C:attention}#3#{} Runden",
                    "{C:inactive}(Momentan{} {X:mult,C:white} X#1# {} {C:inactive}Mult){}",
                },
            },
            j_cry_circulus_pistoris = {
                name = "Circulus Pistoris",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Chips und {X:dark_edition,C:white}^#1#{} Mult",
                    "wenn {C:attention}genau{} #2#",
                    "Hände ubrig sind.",
                },
            },
            j_cry_circus = {
                name = "Zirkus",
                text = {
                    "{C:red}Seltene{} Joker geben {X:mult,C:white} X#1# {} Mult",
                    "{C:cry_epic}Epische{} Joker geben {X:mult,C:white} X#2# {} Mult",
                    "{C:legendary}Legendäre{} Joker geben {X:mult,C:white} X#3# {} Mult",
                    "{C:cry_exotic}Exotische{} Joker geben {X:mult,C:white} X#4# {} Mult",
                },
            },
            j_cry_CodeJoker = {
                name = "Code Joker",
                text = {
                    "Erstelle eine {C:dark_edition}Negative{}",
                    "{C:cry_code}Code Karte{} wenn",
                    "{C:attention}Blind{} ausgewählt wird",
                },
            },
            j_cry_coin = {
                name = "Crypto Coin",
                text = {
                    "Verdiene zwischen",
                    "{C:money}$#1#{} und {C:money}$#2#{} für",
                    "jeden {C:attention}verkauften{} Joker",
                },
            },
            j_cry_compound_interest = {
                name = "Zinseszins",
                text = {
                    "Bekomme {C:money}#1#%{} deines gesammten Geldes",
                    "am ende der Runde,",
                    "erhöht sich um {C:money}#2#%{} für jede",
                    "aufeinenderfolgende Auszahlung",
                },
            },
            j_cry_copypaste = {
                name = "Copy/Paste",
                text = {
                    "Wenn eine {C:cry_code}Code{} Karte benutzt wird,",
                    "Chance von {C:green}#1# zu #2#{} um eine Kopie",
                    "zu deinen Verbrauchsgegenständen hinzuzufügen",
                    "{C:inactive}(Muss Platz haben)",
                },
            },
            j_cry_crustulum = {
                name = "Crustulum",
                text = {
                    "Dieser Joker bekommt {C:chips}+#2#{} Chips",
                    "für jede {C:attention}Aktualisierung{} im Shop",
                    "{C:green}Alle Aktualisierungen sind kostenlos{}",
                    "{C:inactive}(Momentan {C:chips}+#1#{C:inactive} chips)",
                },
            },
            j_cry_cryptidmoment = {
                name = "M Kette",
                text = {
                    "Verkaufe diese Karte um",
                    "{C:money}$#1#{} {C:attention}Verkaufswert{} zu jeder",
                    "{C:attention}Joker{} Karte hinzuzufügen",
                },
            },
            j_cry_cube = {
                name = "Würfel",
                text = {
                    "{C:chips}+#1#{} Chips",
                },
            },
            j_cry_curse = {
                name = "Schluchz",
                text = {
                    "{C:edition,E:1}du kannst nicht{} {C:cry_ascendant,E:1}rennen...{}",
                    "{C:edition,E:1}du kannst dich nicht{} {C:cry_ascendant,E:1}verstecken...{}",
                    "{C:dark_edition,E:1}du kannst nicht entkommen...{}",
                    "{C:inactive}(Muss Platz haben){}",
                },
            },
            j_cry_cursor = {
                name = "Cursor",
                text = {
                    "Dieser Joker bekommt {C:chips}+#2#{} Chips",
                    "für jede {C:attention}gekaufte{} Karte",
                    "{C:inactive}(Momentan {C:chips}+#1#{C:inactive} Chips)",
                },
            },
            j_cry_cut = {
                name = "Ausschneiden",
                text = {
                    "Dieser Joker zerstört",
                    "eine zufällige {C:cry_code}Code{} Karte",
                    "und bekommt {X:mult,C:white} X#1# {} Mult",
                    "am ende des {C:attention}Shops{}",
                    "{C:inactive}(Momentan {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_delirious = {
                name = "Deliriouser Joker",
                text = {
                    "{C:red}+#1#{} Mult wenn",
                    "gespielte Hand",
                    "einen {C:attention}#2#{} enthält"
                }
            },
            j_cry_discreet = {
                name = "Diskreter Joker",
                text = {
                    "{C:chips}+#1#{} Chips wenn",
                    "gespielte Hand",
                    "einen {C:attention}#2#{} enthält"
                }
            },
            j_cry_doodlem = {
                name = "Gekritzeltes M",
                text = {
                    "Erstelle 2 {C:dark_edition}Negative{} {C:attention}Verbrauchsgegenstände{}",
                    "wenn {C:attention}Blind{} ausgewählt wird",
                    "Erstelle 1 weiteren {C:attention}Verbrauchsgegenstand",
                    "für jeden {C:attention}Lustigen Joker{}",
                },
            },
            ["j_cry_Double Scale"] = {
                name = "Doppelwage",
                text = {
                    "Steigende {C:attention}Jokers{}",
                    "steigen {C:attention}Quadratisch",
                    "{C:inactive,s:0.8}(z.B. +1, +3, +6, +10)",
                    "{C:inactive,s:0.8}(wächst um +1, +2, +3)",
                },
            },
            j_cry_dropshot = {
                name = "Dropshot",
                text = {
                    "Dieser Joker bekommt {X:mult,C:white} X#1# {} Mult für",
                    "jede gespielte, {C:attention}nicht gewertete{} {V:1}#2#{} Karte,",
                    "Farbe ändert sich jede Runde",
                    "{C:inactive}(Momentan {X:mult,C:white} X#3# {C:inactive} Mult)",
                },
            },
            j_cry_dubious = {
                name = "Dubioser Joker",
                text = {
                    "{C:chips}+#1#{} Chips wenn",
                    "gespielte Hand",
                    "eine {C:attention}#2#{} enthält"
                }
            },
            j_cry_duos = {
                name = "Die Duos",
                text = {
                    "{X:mult,C:white} X#1# {} Mult wenn",
                    "gespielte Hand",
                    "ein {C:attention}#2#{} enthält",
                },
            },
            j_cry_duplicare = {
                name = 'Duplicare',
                text = {
                    "Jeder {C:attention}Joker{} gibt",
                    "{X:dark_edition,C:white}^#1#{} Mult"
                }
            },
            j_cry_effarcire = {
                name = "Effarcire",
                text = {
                    "Zieht {C:green}volles Deck{} zur Hand",
                    "wenn {C:attention}Blind{} ausgewählt wird",
                    "{C:inactive,s:0.8}\"Wenn du mich bei meinem 1x nicht aushälst,",
                    "{C:inactive,s:0.8}verdienst du much bei meinem 2x nicht\"",
                },
            },
            j_cry_energia = {
                name = "Energia",
                text = {
                    "Wenn du einen {C:attention}Tag{} erhälst,",
                    "erställe {C:attention}#1#{} Kopien",
                    "und {C:attention}erhöhe{} die Nummer der",
                    "Kopien um {C:attention}#2#",
                },
            },
            j_cry_equilib = {
                name = "Ass Aequilibrium",
                text = {
                    "Joker erscheinen in der",
                    "Reinfolge der {C:attention}Sammlung{}",
                    "Erstelle {C:attention}#1#{} {C:dark_edition}Negative(n){} Joker",
                    "wenn eine Hand gespielt wird.",
                    "{C:cry_exotic,s:0.8}Exotische {C:inactive,s:0.8}oder höhere Joker können nicht erscheinen",
                    "{s:0.8}Letzter erstellter Joker: {C:attention,s:0.8}#2#",
                },
            },
            j_cry_error = {
                name = "{C:red}ERR{}{C:dark_edition}O{}{C:red}R{}",
                text = {
                    "",
                },
            },
            j_cry_eternalflame = {
                name = "Ewige Flamme",
                text = {
                    "Dieser Joker bekommt {X:mult,C:white} X#1# {} Mult",
                    "für jede {C:attention}verkaufte{} Karte",
                    "{C:inactive}(Momentan {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_exoplanet = {
                name = "Exoplanet",
                text = {
                    "{C:dark_edition}Holographische{} Karten",
                    "geben {C:mult}+#1#{} Mult",
                },
            },
            j_cry_exponentia = {
                name = "Exponentia",
                text = {
                    "Dieser Joker bekommt {X:dark_edition,C:white} ^#1# {} Mult",
                    "wenn {X:red,C:white} XMult {} ausgelöst wird.",
                    "{C:inactive}(Momentan {X:dark_edition,C:white} ^#2# {C:inactive} Mult)",
                },
            },
            j_cry_facile = {
                name = "Facile",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Mult wenn",
                    "gespielte Karten {C:attention}#2#{}",
                    "oder weniger mal ausgelöst werden.",
                },
            },
            j_cry_filler = {
                name = "Der Füller",
                text = {
                    "{X:mult,C:white} X#1# {} Mult wenn",
                    "gespielte Hand",
                    "eine {C:attention}#2#{} enthält",
                },
            },
            j_cry_fractal = {
                name = "Fraktal Finger",
                text = {
                    "{C:attention}+#1#{} Karten auswahl Limit",
                },
            },
            j_cry_flip_side = {
                name = "Auf der anderen Seite...",
                text = {
                    "{C:dark_edition}Doppelseitige{} Joker nutzen",
                    "ihre Rückseite für Effekte",
		    "statt der Vorderseite",
                    "{C:attention}Löse{} alle {C:dark_edition}Doppelseitigen{} Joker erneut {C:attention}aus"
                },
            },
            j_cry_foodm = {
                name = "Fast Food M",
                text = {
                    "{C:mult}+#1#{} Mult",
                    "{C:red,E:2}zerstört sich selbst{} in {C:attention}#2#{} Runde(n)",
                    "Erhöht sich um {C:attention}#3#{} Runden wenn",
                    "{C:attention}Lustiger Joker verkauft{} wird",
                    "{C:inactive,s:0.8}2 McDoubles, 2 McChickens{}",
                    "{C:inactive,s:0.8}Größe Pommes, 20 Stücke & Großer Kuchen{}",
                },
            },
            j_cry_foxy = {
                name = "Fuchsiger Joker",
                text = {
                    "{C:chips}+#1#{} Chips wenn",
                    "gespielte Hand",
                    "ein {C:attention}#2#{} enthält"
                }
            },
            j_cry_fspinner = {
                name = "Fidget Spinner",
                text = {
                    "Dieser Joker bekommt {C:chips}+#2#{} Chips",
                    "wenn gespielte hand {C:attention}nicht{}",
                    "die meistgespielte {C:attention}Pokerhand{} ist",
                    "{C:inactive}(Momentan {C:chips}+#1#{C:inactive} Chips)",
                },
            },
            j_cry_gardenfork = {
                name = "Garden der Kreuzungen",
                text = {
                    "Verdiene {C:money}$#1#{} wenn {C:attention}gespielte Hand{}",
                    "Ein {C:attention}Ass{} und eine {C:attention}7{} enthält",
                },
            },
            j_cry_gemino = {
                name = "Gemini",
                text = {
                    "{C:attention}Verdoppelt{} alle Werte",
                    "des linkesten {C:attention}Jokers",
                    "am Ende der Runde",
                },
            },
            j_cry_giggly = {
                name = "Absurder Joker",
                text = {
                    "{C:red}+#1#{} Mult wenn",
                    "gespielte Hand",
                    "eine {C:attention}#2#{} enthält"
                }
            },
            j_cry_goldjoker = {
                name = "Gold Joker",
                text = {
                    "Verdiene {C:money}#1#%{} des gesammten",
                    "Geldes am ende der Runde",
                    "Auszahlung erhöht sich um {C:money}#2#%{}",
                    "wenn eine {C:attention}Gold{}",
                    "Karte gewertet wird.",
                },
            },
            j_cry_googol_play = {
                name = "Googol Play Karte",
                text = {
                    "Chance von {C:green}#1# zu #2#{} für",
                    "{X:red,C:white} X#3# {} Mult",
                },
            },
            j_cry_happy = {
                name = ":D",
                text = {
                    "Erstelle einen zufälligen {C:attention}Joker{}",
                    "am Ende der Runde",
                    "Verkaufe diese Karte um",
                    "einen zufälligen {C:attention}Joker{} zu erstellen",
                    "{C:inactive}(Muss Platz haben){}",
                },
            },
            j_cry_happyhouse = {
                name = "Fröhliches Haus",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Mult nachdem du",
                    "{C:attention}114{} Hände{} gespielt hast",
                    "{C:inactive}(Momentan #2#/114){}",
                    "{C:inactive,s:0.8}Es gibt keinen Platz so schön wie dein Zuhause!{}",
                },
            },
            j_cry_home = {
                name = "Das Zuhause",
                text = {
                    "{X:mult,C:white} X#1# {} Mult wenn",
                    "gespielte Hand",
                    "ein {C:attention}#2#{} enthält",
                },
            },
            j_cry_hunger = {
                name = "Consume-able",
                text = {
                    "Verdiene {C:money}$#1#{} wenn",
                    "ein {C:attention}Verbrauchsgegenstand{} benutzt wird",
                },
            },
            j_cry_iterum = {
                name = "Iterum",
                text = {
                    "Löse alle Karten",
                    "{C:attention}#2#{} mal mehr aus,",
                    "jede Karte gibt",
                    "{X:mult,C:white} X#1# {} Mult wenn sie gewertet wird",
                },
            },
            j_cry_jimball = {
                name = "Jimball",
                text = {
                    "Dieser Joker bekommt {X:mult,C:white} X#1# {} Mult",
                    "für jede {C:attention}aufeinenderfolgende{} gespielte Hand",
                    "währende du deine",
                    "am meisten gespielte {C:attention}Pokerhand{} spielst",
                    "{C:inactive}(Momentan {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_jollysus = {
                name = "Lustiger Joker?",
                text = {
                    "Erstelle einen {C:dark_edition}Lustigen{} Joker",
                    "Wenn ein Joker {C:attention}verkauft{} wird",
                    "{C:red}Funktioniert einmal pro Runde{}",
                    "{C:inactive}#1#{}",
                    "{C:inactive,s:0.8}Seems legit...{}",
                },
            },
            j_cry_kidnap = {
                name = "Entführung",
                text = {
                    "Verdiene {C:money}$#2#{} am Ende der Runde",
                    "Erhöhe Auszahlung um {C:money}$#1#{}",
                    "wenn ein {C:attention}Mult Typ{} oder",
                    "{C:attention}Chip Typ{} Joker verkauft wird",
                },
            },
            j_cry_kooky = {
                name = "Wahnsinniger Joker",
                text = {
                    "{C:red}+#1#{} Mult wenn",
                    "gespielte Hand",
                    "ein {C:attention}#2#{} enthält"
                }
            },
            j_cry_krustytheclown = {
                name = "Krusty der Clown",
                text = {
                    "Dieser Joker bekommt",
                    "{X:mult,C:white} X#1# {} Mult wenn",
                    "jede gespielte {C:attention}Karte{} gewertet wird",
                    "{C:inactive}(Momenan {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_kscope = {
                name = "Kaleidoskop",
                text = {
                    "Füge {C:dark_edition}Polychrome{} zu",
                    "einem zufälligen {C:attention}Joker{} hinzu",
                    "wenn {C:attention}Boss Blind{} besiegt wird",
                },
            },
            j_cry_lightupthenight = {
                name = "Erläuchte die Nacht",
                text = {
                    "Jede gespielte {C:attention}7{} oder {C:attention}2{}",
                    "gibt {X:mult,C:white}X#1#{} Mult wenn gewertet",
                },
            },
            j_cry_longboi = {
                name = "Monster",
                text = {
                    "Gib zukünftigen Kopien",
                    "dieses Jokers {X:mult,C:white}X#1#{} Mult",
                    "am Ende der Runde",
                    "{C:inactive}(Momentan {X:mult,C:white}X#2#{C:inactive} Mult){}",
                },
            },
            j_cry_loopy = {
                name = "Loopy",
                text = {
                    "{C:attention}Löse{} alle Joker für jeden",
                    "{C:attention}Jolly Joker{}, der in dieser Runder",
                    "verkauft wurde erneut {C:attention}aus",
                    "{C:inactive}(Momentan{}{C:attention:} #1#{}{C:inactive} Auslösung(en)){}",
                    "{C:inactive,s:0.8}Es war nicht genug Platz...{}",
                },
            },
            j_cry_lucky_joker = {
                name = "Glücksjoker",
                text = {
                    "Verdiene {C:money}$#1#{} jedes mal wenn eine",
                    "{C:attention}Glückskarte{} {C:green}erfolgreich{}",
                    "ausgelöst wird",
                },
            },
            j_cry_luigi = {
                name = "Luigi",
                text = {
                    "Alle Joker geben",
                    "{X:chips,C:white} X#1# {} Chips",
                },
            },
            j_cry_m = {
                name = "m",
                text = {
                    "Dieser Joker bekommt {X:mult,C:white} X#1# {} Mult",
                    "wenn {C:attention}Lustiger Joker{} verkauft wird",
                    "{C:inactive}(Momentan {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_M = {
                name = "M",
                text = {
                    "Erstelle einen {C:dark_edition}Negativen{}",
                    "{C:attention}Lustigen Joker{} wenn",
                    "{C:attention}Blind{} ausgewählt wird",
                },
            },
            j_cry_macabre = {
                name = "Makaberer Joker",
                text = {
                    "Wenn {C:attention}Blind{} ausgewählt wird,",
                    "zerstöre jeden {C:attention}Joker{} außer",
                    "{C:legendary}M-Joker{} und {C:attention}Lustige Jokers{}",
                    "und erstelle 1 {C:attention}Lustigen Joker{}",
                    "für jede zerstörte Karte",
                },
            },
            j_cry_magnet = {
                name = "Kühlschrankmagnet",
                text = {
                    "Verdiene {C:money}$#1#{} am Ende der Runde",
                    "Es verdient {X:money,C:white} X#2# {} wenn du",
                    "{C:attention}#3#{} oder weniger {C:attention}Joker{} Karten hast",
                },
            },
            j_cry_manic = {
                name = "Manischer Joker",
                text = {
                    "{C:red}+#1#{} Mult wenn",
                    "gespielte Hand",
                    "einen {C:attention}#2#{} enthält"
                }
            },
            j_cry_mario = {
                name = "Mario",
                text = {
                    "Löse alle Joker",
                    "{C:attention}#1#{} weitere(s) mal aus",
                },
            },
            j_cry_maximized = {
                name = "Maximiert",
                text = {
                    "Alle {C:attention}Bildkarten{}",
                    "zählen als {C:attention}Könige{},",
                    "alle {C:attention}Zahlkarten{}",
                    "zählen als {C:attention}10{}",
                },
            },
            j_cry_maze = {
                name = "Labyrint",
                text = {
                    "Alle Hände zählen als",
                    "{C:attention}erste Hand{} der Runde,",
                    "alle Abwürfe zählen als",
                    "{C:attention}erster Abwurf{} der Runde",
                },
            },
            j_cry_Megg = {
                name = "Mei",
                text = {
                    "Verkaufe diese Karte um",
                    "{C:attention}#2#{} Lustige #3# zu erstellen, erhöhe",
                    "um {C:attention}#1#{} am Ende der Runde",
                },
            },
            j_cry_membershipcard = {
                name = "Mitgliedskarte",
                text = {
                    "{X:mult,C:white}X#1#{} Mult für jedes Mitglied",
                    "im {C:attention}Cryptid Discord{}",
                    "{C:inactive}(Momentan {X:mult,C:white}X#2#{C:inactive} Mult)",
                    "{C:blue,s:0.7}https://discord.gg/eUf9Ur6RyB{}",
                },
            },
            j_cry_membershipcardtwo = {
                name = "Alte Mitgliedskarte", --Could probably have a diff Name imo
                text = {
                    "{C:chips}+#1#{} Chips für jedes Mitglied",
                    "im {C:attention}Cryptid Discord{}",
                    "{C:inactive}(Momentan {C:chips}+#2#{C:inactive} Chips)",
                    "{C:blue,s:0.7}https://discord.gg/eUf9Ur6RyB{}",
                },
            },
            j_cry_meteor = {
                name = "Meteorschauer",
                text = {
                    "{C:dark_edition}Foil{} Karten",
                    "geben {C:chips}+#1#{} Chips",
                },
            },
            j_cry_mneon = {
                name = "Neon M",
                text = {
                    "Bekomme {C:money}$#2#{} am Ende der Runde",
                    "Erhöhe Auszahlung um",
                    "{C:money}$#1#{} für jeden {C:attention}Lustigen Joker{}",
                    "oder {C:legendary}M Joker{} am",
                    "Ende der Runde",
                },
            },
            j_cry_mondrian = {
                name = "Mondrian",
                text = {
                    "Dieser Joker erhält {X:mult,C:white} X#1# {} Mult",
                    "wenn keine {C:attention}Abwürfe{}",
                    "am Ende der Runde genutzt wurden",
                    "{C:inactive}(Momentan {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_monkey_dagger = {
                name = "Affendolch",
                text = {
                    "Wenn {C:attention}Blind{} ausgewählt wird,",
                    "wird der linke Joker zerstört",
                    "und {C:attention}10 mal{} der Verkaufswert",
                    "zu den {C:chips}Chips{} hinzugefügt",
                    "{C:inactive}(Momentan {C:chips}+#1#{C:inactive} Chips)",
                },
            },
            j_cry_morse = {
                name = "Morse Code",
                text = {
                    "Verdiene {C:money}$#2#{} am Ende der Runde",
                    "Erhöhe die Auszahlung um {C:money}$#1#{} wenn",
                    "eine Karte mit {C:attention}Edition{} verkauft wird",
                },
            },
            j_cry_mprime = {
                name = "Tredecim",
                text = {
                    "Erstelle einen {C:legendary}M Joker{} am Ende der Runde",
                    "Jeder {C:attention}Lustige Joker{} oder {C:legendary}M Joker",
                    "gibt {X:dark_edition,C:white}^#1#{} Mult",
                    "Erhöhe anzahl um {X:dark_edition,C:white}^#2#{}",
                    "wenn {C:attention}Lustiger Joker verkauft{} wird",
                    "{C:inactive,s:0.8}(Tredecim exkludiert)",
                },
            },
            j_cry_mstack = {
                name = "M Stapel",
                text = {
                    "Führe alle gespielten Karten einmal",
                    "für alle {C:attention}#2#{} {C:inactive}[#3#]{} {C:attention}Lustige Joker{} verkauft",
					"erneut aus",
                    "{C:inactive}(Currently{}{C:attention:} #1#{}{C:inactive} Auslösungen){}",
                },
            },
            j_cry_multjoker = {
                name = "Mult Joker",
                text = {
                    "Chance von {C:green}#1# zu #2#{} für jede",
                    "gespielte {C:attention}Mult{} Karte eine",
                    "{C:spectral}Cryptid{} Karte zu erstellen wenn sie Ausgewertet wird",
                    "{C:inactive}(Muss Platz haben)",
                },
            },
            j_cry_negative = {
                name = "Negativer Joker",
                text = {
                    "{C:dark_edition}+#1#{C:attention} Joker{} Slots",
                },
            },
            j_cry_nice = {
                name = "Nice",
                text = {
                    "{C:chips}+#1#{} Chips wenn gespielte Hand",
                    "eine {C:attention}6{} und eine {C:attention}9{} enthält",
                    "{C:inactive,s:0.8}Nice.{}",
                },
            },
            j_cry_night = {
                name = "Nacht",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Mult für die letzte",
                    "Hand der Runde",
                    "{E:2,C:red}zerstört sich selbst{} bei",
                    "der letzten Hand der Runde",
                },
            },
            j_cry_nosound = {
                name = "Kein Geräuch, keine Errinerung",
                text = {
                    "Löse alle {C:attention}7{}",
                    "{C:attention:}#1#{} weitere(s) mal(e) aus",
                },
            },
            j_cry_notebook = {
                name = "Notizbuch",
                text = {
                    "Chance von {C:green} #1# zu #2#{} um {C:dark_edition}+1{} Joker",
                    "Slot pro {C:attention}Aktualisierung{} im Shop zu erhalten",
                    "{C:green}Funktioniert immer{} wenn du",
                    "{C:attention}#5#{} oder mehr {C:attention}Lustige Joker{} hast",
                    "{C:red}Funktioniert einmal pro Runde{}",
                    "{C:inactive}(Momentan {C:dark_edition}+#3#{}{C:inactive} and #4#){}",
                },
            },
            j_cry_number_blocks = {
                name = "Zahlblöcke",
                text = {
                    "Verdiene {C:money}$#1#{} am Ende der Runde",
                    "Erhöhe Auszahlung um {C:money}$#2#{}",
                    "für jede {C:attention}#3#{} in der Hand,",
                    "Rang ändert sich jede Runde",
                },
            },
            j_cry_nuts = {
                name = "Die Nuts",
                text = {
                    "{X:mult,C:white} X#1# {} Mult wenn",
                    "gespielte Hand",
                    "einen {C:attention}#2#{} enthält",
                },
            },
            j_cry_nutty = {
                name = "Nutty Joker",
                text = {
                    "{C:red}+#1#{} Mult wenn",
                    "gespielte Hand",
                    "einen {C:attention}#2#{} enthält"
                }
            },
            j_cry_oldblueprint = {
                name = "Alter Bauplan",
                text = {
                    "Kopiert Fähigkeit des",
                    "rechten {C:attention}Jokers{}",
                    "Chance von {C:green}#1# zu #2#{}, dass diese",
                    "Karte am Ende der Runde",
                    "zerstört wird",
                },
            },
            j_cry_oldcandy = {
                name = "Nostalgische Süßigkeit",
                text = {
                    "Verkaufe diese Karte um",
                    "permantent {C:attention}+#1#{} Handgröße",
                    "zu bekommen",
                },
            },
            j_cry_oldinvisible = {
                name = "Nostalgischer Unsichtbarer Joker",
                text = {
                    "{C:attention}Dupliziere{} einen zufälligen",
                    "{C:attention}Joker{} für alle {C:attention}4",
                    "verkauften Joker Karten",
                    "{s:0.8}Nostalgischer unsichbarer Joker Excludiert{}",
                    "{C:inactive}(Momentan #1#/4){}",
                },
            },
            j_cry_panopticon = {
                name = "Panoptikum",
                text = {
                    "Alle Hände zählen als",
                    "{C:attention}letzte Hand{} der Runde", -- +$4
                },
            },
            j_cry_pickle = {
                name = "Saure Gurke",
                text = {
                    "Wenn {C:attention}Blind{} übersprungen wird, erstelle",
                    "{C:attention}#1#{} Tags, reduziere um",
                    "{C:red}#2#{} wenn {C:attention}Blind{} ausgewählt wird",
                },
            },
            j_cry_pirate_dagger = {
                name = "Piratendolch",
                text = {
                    "Wenn {C:attention}Blind{} ausgewählt wird,",
                    "zerstöre rechten Joker",
                    "und füge {C:attention}ein Viertel{} seines",
                    "Verkaufwertes zu seinem {X:chips,C:white} XChips {} hinzugefügt",
                    "{C:inactive}(Momentan {X:chips,C:white} X#1# {C:inactive} Chips)",
                },
            },
            j_cry_pot_of_jokes = {
                name = "Topf der Witze",
                text = {
                    "{C:attention}#1#{} Handgröße,",
                    "Erhöht sich um",
                    "{C:blue}#2#{} jede Runde",
                },
            },
            j_cry_primus = {
                name = "Primus",
                text = {
                    "Dieser Joker erhält {X:dark_edition,C:white} ^#1# {} Mult",
                    "Wenn alle Karten in der Hand",
                    "{C:attention}Asse{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, oder {C:attention}7{} sind",
                    "{C:inactive}(Momentan {X:dark_edition,C:white} ^#2# {C:inactive} Mult)",
                },
            },
            j_cry_python = {
                name = "Python",
                text = {
                    "Dieser Joker erhält",
                    "{X:mult,C:white} X#1# {} Mult wenn eine",
                    "{C:cry_code}Code{} Karte benutzt wird",
                    "{C:inactive}(Momentan {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_queens_gambit = {
                name = "Queen's Gambit",
                text = {
                    "Wenn {C:attention}Pokerhand{} ein",
                    "{C:attention}Royal Flush{} ist, zerstöre die gewertete",
                    "{C:attention}Dame{} und erstelle einen",
                    "{C:dark_edition}Negativen {}{C:red}Seltenen{}{C:attention} Joker{}",
                },
            },
            j_cry_quintet = {
                name = "Das Quintett",
                text = {
                    "{X:mult,C:white} X#1# {} Mult wenn",
                    "gespielte Hand",
                    "einen {C:attention}#2#{} enthält",
                },
            },
            j_cry_redbloon = {
                name = "Roter Ballon",
                text = {
                    "Verdiene {C:money}$#1#{} in {C:attention}#2#{} Runde(n)",
                    "{C:red,E:2}zerstört sich selbst{}",
                },
            },
            j_cry_redeo = {
                name = "Redeo",
                text = {
                    "{C:attention}-#1#{} Ante wenn",
                    "{C:money}$#2#{} {C:inactive}($#3#){} ausgegeben wurde",
                    "{s:0.8}Bedingung erhöht sich",
                    "{C:attention,s:0.8}expotentiel{s:0.8} für jede benutzung",
                    "{C:money,s:0.8}Nächste erhöhung: {s:1,c:money}$#4#",
                },
            },
            j_cry_rescribere = {
                name = 'Rescribere',
                text = {
                    "Wenn ein {C:attention}Joker{} verkauft wird,",
                    "füge seinen Effekt",
                    "zu jeden anderen Joker hinzu",
                    "{C:inactive,s:0.8}Hat keinen effekt auf andere Rescribere{}"
                }
            },
            j_cry_reverse = {
                name = "Reverse Card",
                text = {
                    "Fülle alle Joker slots {C:inactive}(Max 100){}",
                    "mit {C:dark_edition}Holographischen{} {C:attention}Lustigen Jokers{} wenn",
                    "{C:attention}Abgewurfene Pokerhand{} ein {C:attention}#1#{} ist",
                    "{C:red,E:2}zerstört sich selbst{}",
                    "{C:inactive,s:0.8}Das ULTIMATIVE comeback{}",
                },
            },
            j_cry_rnjoker = {
                name = "RNJoker",
                text = {
                    "Zufälliger effekt jede {C:attention}Ante{}",
                },
            },
            j_cry_sacrifice = {
                name = "Opfer",
                text = {
                    "Erstelle einen {C:green}Ungewönlichen{} Joker",
                    "und 3 {C:attention}Lustige Jokers{} wenn",
                    "eine {C:spectral}Geisterkarte{} benutzt wird",
                    "{C:red}Funktioniert einmal pro Runde{}",
                    "{C:inactive}#1#{}",
                },
            },
            j_cry_sapling = {
                name = "Setzling",
                text = {
                    "Nachdem {C:attention}#2#{} {C:inactive}[#1#]{} Verstärkte",
                    "Karten gewertet wurden, verkaufe diese Karte um",
                    "einen {C:cry_epic}Epischen{} {C:attention}Joker{} zu erstellen",
                    "{C:inactive,s:0.8}Erstellt einen {C:red,s:0.8}Seltenen{} {C:attention,s:0.8}Joker{}",
                    "{C:inactive,s:0.8}wenn {C:cry_epic,s:0.8}Epische{} {C:inactive,s:0.8}Joker deaktiviert sind{}",
                },
            },
            j_cry_savvy = {
                name = "Versierter Joker",
                text = {
                    "{C:chips}+#1#{} Chips wenn",
                    "gespielte Hand",
                    "einen {C:attention}#2#{} enthält"
                }
            },
            j_cry_Scalae = {
                name = "Scalae",
                text = {
                    "Steigende {C:attention}Joker{} steigen",
                    "als ein Grad-{C:attention}#1#{} Polynom",
                    "erhöhe Grad um {C:attention}#2#{}",
                    "am Ende der Runde",
                    "{C:inactive,s:0.8}({C:attention,s:0.8}Scalae{C:inactive,s:0.8} exkludiert)",
                },
            },
            j_cry_scrabble = {
                name = "Scrabble Kachel",
                text = {
                    "Chance von {C:green}#1# zu #2#{} um einen",
                    "{C:dark_edition}Lustigen {C:green}Ungewöhnlichen{} Joker",
                    "zu erstellen wenn eine Hand gespielt wird",
                },
            },
            j_cry_seal_the_deal = {
                name = "Seal the Deal",
                text = {
                    "Füge ein {C:attention}zufälliges Siegel{} zu jeder Karte,",
                    "die in der {C:attention}letzten Hand{} der Runde gewertet wird",
                },
            },
            j_cry_shrewd = {
                name = "Kluger Joker",
                text = {
                    "{C:chips}+#1#{} Chips wenn",
                    "gespielte Hand",
                    "einen {C:attention}#2#{} enthält"
                }
            },
            j_cry_silly = {
                name = "Doofer Joker",
                text = {
                    "{C:red}+#1#{} Mult wenn",
                    "gespielte Hand",
                    "ein {C:attention}#2#{} enthält"
                }
            },
            j_cry_smallestm = {
                name = "Winzig",
                text = {
                    "Erstelle ein {C:cry_jolly}Doppel M",
                    "Tag wenn {C:attention}Poker Hand{}",
                    "ein {C:attention}#1#{} ist",
                    "{C:inactive,s:0.8}ok, also im wesentlichen bin ich richtig klen",
                },
            },
            j_cry_soccer = {
                name = "Einer für Alle", --changed the name from latin because this isn't exotic
                text = {
                    "{C:attention}+#1#{} Booster Packer Slot",
                    "{C:attention}+#1#{} Handgröße",
                    "{C:attention}+#1#{} Verbrauchsgegenstand Slot",
                    "{C:attention}+#1#{} Karte im Shop",
                },
            },
            j_cry_spaceglobe = {
                name = "Himmelsglobus",
                text = {
                    "Dieser Joker bekommt {X:chips,C:white}X#2#{} Chips",
                    "wenn {C:attention}poker hand #3#{} ist,",
                    "Hand ändert sich jede Runde",
                    "{C:inactive}(Momentan{} {X:chips,C:white}X#1#{} {C:inactive}Chips){}",
                },
            },
            j_cry_speculo = {
                name = "Speculo",
                text = {
                    "Erstellt eine {C:dark_edition}Negative{} Kopie",
                    "Eines Zufälligen {C:attention}Jokers{}",
                    "am Ende des {C:attention}Shops",
                    "{C:inactive,s:0.8}Kopiert keine anderen Speculo{}",
                },
            },
            j_cry_stardust = {
                name = "Sternstaub",
                text = {
                    "{C:dark_edition}Polychrome{} Karten",
                    "geben {X:mult,C:white}X#1#{} Mult",
                },
            },
            j_cry_stella_mortis = {
                name = "Stella Mortis",
                text = {
                    "Dieser Joker zerstört eine",
                    "zufällige {C:planet}Planeten{} Karte",
                    "und erhält {X:dark_edition,C:white} ^#1# {} Mult",
                    "am Ende das {C:attention}Shops{}",
                    "{C:inactive}(Momentan {X:dark_edition,C:white} ^#2# {C:inactive} Mult)",
                },
            },
            j_cry_subtle = {
                name = "Subtiler Joker",
                text = {
                    "{C:chips}+#1#{} Chips wenn",
                    "gespielte Hand",
                    "ein {C:attention}#2#{} enthält"
                }
            },
            j_cry_supercell = {
                name = "Supercell",
                text = {
                    "{X:chips,C:white}X#2#{} Chips, {X:mult,C:white}X#2#{} Mult",
                    "Verdiene {C:money}$#3#{} am",
                    "Ende der Runde",
                },
            },
            j_cry_sus = {
                name = "SUS",
                text = {
                    "Am Ende der Runde, erstelle",
                    "eine {C:attention}Kopie{} einer Zufälligen",
                    "Karte {C:attention}in der Hand{},",
                    "zerstöre alle anderen",
                    "{C:attention,s:0.8}Könige{s:0.8} von {C:hearts,s:0.8}Herz{s:0.8} sind priorisiert",
                },
            },
            j_cry_swarm = {
                name = "Der Schwarm",
                text = {
                    "{X:mult,C:white} X#1# {} Mult wenn",
                    "gespielte Hand",
                    "ein {C:attention}#2#{} enthält",
                },
            },
            j_cry_sync_catalyst = {
                name = "Sync Katalysator",
                text = {
                    "Gleicht {C:chips}Chips{} und {C:mult}Mult{} aus",
                    "{C:inactive,s:0.8}Hey! Das habe ich schonmal gesehen!",
                },
            },
            j_cry_tenebris = {
                name = "Tenebris",
                text = {
                    "{C:dark_edition}+#1#{C:attention} Joker{} Slots",
                    "Verdiene {C:money}$#2#{} am Ende der Runde",
                },
            },
            j_cry_translucent = {
                name = "Durchscheinender Joker",
                text = {
                    "Verkaufe diese Karte um",
                    "eine {C:attention}Bananen Verderbliche{} Kopie",
                    "eines zufälligen {C:attention}Jokers{} zu erstellen",
                    "{s:0.8,C:inactive}(Egal ob der Joker kompatibel ist)",
                },
            },
            j_cry_tricksy = {
                name = "Tricksy Joker",
                text = {
                    "{C:chips}+#1#{} Chips wenn",
                    "gespielte Hand",
                    "einen {C:attention}#2#{} enthält"
                }
            },
            j_cry_triplet_rhythm = {
                name = "Triolenrhythmus",
                text = {
                    "{X:mult,C:white} X#1# {} Mult wenn gewertete Hand",
                    "{C:attention}exakt{} drei {C:attention}3{} enthält",
                },
            },
            j_cry_unity = {
                name = "The Einigkeit",
                text = {
                    "{X:mult,C:white} X#1# {} Mult wenn",
                    "gespielte Hand",
                    "ein {C:attention}#2#{} enthält",
                },
            },
            j_cry_universum = {
                name = "Universum",
                text = {
                    "{C:attention}Pokerhände{} erhalten",
                    "{X:red,C:white} X#1# {} Mult und {X:blue,C:white} X#1# {} Chips",
                    "wenn ihr Level erhöht wird",
                },
            },
            j_cry_unjust_dagger = {
                name = "Ungerechter Dolch",
                text = {
                    "Wenn {C:attention}Blind{} ausgewählt wird,",
                    "zerstöre linken Joker",
                    "und füge {C:attention}ein Fünftel{} des",
                    "Verkaufwertes als {X:mult,C:white} XMult {} hinzu",
                    "{C:inactive}(Momentan {X:mult,C:white} X#1# {C:inactive} Mult)",
                },
            },
            j_cry_verisimile = {
                name = "Non Verisimile",
                text = {
                    "Wenn eine Warscheinlichkeit",
                    "{C:green}erfolgreich{} auslöst,",
                    "erhällt dieser Joker {X:red,C:white}XMult{}",
                    "gleich der {C:attention}Warscheinlichkeit",
                    "{C:inactive}(Momentan {X:mult,C:white} X#1# {C:inactive} Mult)",
                },
            },
            j_cry_virgo = {
                name = "Virgo",
                text = {
                    "Dieser Joker erhält {C:money}$#1#{} {C:attention}Verkaufswert{}",
                    "wenn {C:attention}Pokerhand{} ein {C:attention}#2#{} enthält",
                    "Verkaufe diese Karte um einen",
                    "{C:dark_edition}Polychrome{} {C:attention}Lustigen Joker{} für",
                    "alle {C:money}$4{} {C:attention}Verkaufswert{} zu erstellen {C:inactive}(Min 1){}",
                },
            },
            j_cry_wacky = {
                name = "Spinner Joker",
                text = {
                    "{C:red}+#1#{} Mult wenn",
                    "gespielte Hand",
                    "ein {C:attention}#2#{} enthält"
                }
            },
            j_cry_waluigi = {
                name = "Waluigi",
                text = {
                    "Alle Joker geben",
                    "{X:mult,C:white} X#1# {} Mult",
                },
            },
            j_cry_wario = {
                name = "Wario",
                text = {
                    "Alle Joker geben",
                    "{C:money}$#1#{} wenn ausgelöst",
                },
            },
            j_cry_wee_fib = {
                name = "Weebonacci",
                text = {
                    "Dieser Joker bekommt",
                    "{C:mult}+#2#{} Mult wenn ein",
                    "{C:attention}Ass{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, oder {C:attention}8{}",
                    "gewertet wird",
                    "{C:inactive}(Momentan {C:mult}+#1#{C:inactive} Mult)",
                },
            },
            j_cry_weegaming = {
                name = "2D",
                text = {
                    "Löse jede gespielte {C:attention}2{}", --wee gaming
                    "{C:attention:}#1#{} weitere(s) mal aus", --wee gaming?
                    "{C:inactive,s:0.8}Wee Gaming?{}",
                },
            },
            j_cry_wheelhope = {
                name = "Rad der Hoffnung",
                text = {
                    "Dieser Joker erhält",
                    "{X:mult,C:white} X#1# {} Mult wenn ein",
                    "{C:attention}Rad des Schicksals{} nicht erfolgreich auslöst",
                    "{C:inactive}(Momentan {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_cry_whip = {
                name = "Die PEITCHE",
                text = {
                    "Dieser Joker erhält {X:mult,C:white} X#1# {} Mult",
                    "wenn die {C:attention}Poker hand{} eine",
                    "{C:attention}2{} und {C:attention}7{} unterschiedlicher Farben enthält",
                    "{C:inactive}(Momentan {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
        },
        Planet = {
            c_cry_Klubi = {
                name = "Klubi",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Aufwertung für",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "und {C:attention}#3#{}",
                },
            },
            c_cry_Lapio = {
                name = "Lapio",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Aufwertung für",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "und {C:attention}#3#{}",
                },
            },
            c_cry_nstar = {
                name = "Neutronenstern",
                text = {
                    "Verbessere eine zufällige",
                    "Pokerhand um",
                    "{C:attention}1{} level für jeden",
                    "{C:attention}Neutronenstern{}",
                    "der in diesem Durchlauf",
					"genutzt wurde",
                    "{C:inactive}(Momentan{C:attention} #1#{C:inactive}){}",
                },
            },
            c_cry_planetlua = {
                name = "Planet.lua",
                text = {
                    "Chance von {C:green}#1# zu #2#{} jede",
                    "{C:legendary,E:1}Pokerhand{}",
                    "um {C:attention}1{} Level aufzuwerten",
                },
            },
            c_cry_Sydan = {
                name = "Sydan",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Aufwertung für",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "und {C:attention}#3#{}",
                },
            },
            c_cry_Timantti = {
                name = "Timantti",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Aufwertung für",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "und {C:attention}#3#{}",
                },
            },
        },
        Sleeve = {
            sleeve_cry_ccd_sleeve = {
                name = "CCD Hülle",
                text = {
                    "Jede Karte ist auch",
                    "ein {C:attention}zufälliger{} Verbrauchsgegenstand",
                },
            },
            sleeve_cry_conveyor_sleeve = {
                name = "Fließbandhülle",
                text = {
                    "Joker können {C:attention}nicht{} bewegt werden",
                    "Am Anfang der Runde,",
                    "{C:attention}dupliziere{} den rechtesten Joker",
                    "und {C:attention}zerstöre{} den linkesten Joker",
                },
            },
            sleeve_cry_critical_sleeve = {
                name = "Kritische Hülle",
                text = {
                    "Nach jeder gespielten Hand,",
                    "Chance von {C:green}#1# zu 4{} für {X:dark_edition,C:white} ^2 {} Mult",
                    "Chance von {C:green}#1# zu 8{} für {X:dark_edition,C:white} ^0.5 {} Mult",
                },
            },
            sleeve_cry_encoded_sleeve = {
                name = "Verschlüsselte Hülle",
                text = {
                    "Starte mit einem {C:cry_code,T:j_cry_CodeJoker}Code Joker{}",
                    "und einem {C:cry_code,T:j_cry_copypaste}Copy/Paste{}",
                    "Nur {C:cry_code}Code Karten{} erscheinen im Shop",
                },
            },
            sleeve_cry_equilibrium_sleeve = {
                name = "Balancierte Hülle",
                text = {
                    "Alle Karten haben die",
                    "{C:attention}selbe Chance{}",
                    "im Shop aufzutauchen,",
                    "beginne den Durchlauf mit",
                    "{C:attention,T:v_overstock_plus}Überbestand Plus",
                },
            },
            sleeve_cry_infinite_sleeve = {
                name = "Unendliche Hülle",
                text = {
                    "Du kannst {C:attention}unendlich{} viele",
                    "Karten auswählen.",
                    "{C:attention}+1{} Handgröße",
                },
            },
            sleeve_cry_misprint_sleeve = {
                name = "Fehlgedruckte Hülle",
                text = {
                    "Werte von Karten",
                    "und Pokerhänden",
                    "sind {C:attention}zufällig",
                },
            },
            sleeve_cry_redeemed_sleeve = {
                name = "Eingelöste Hülle",
                text = {
                    "Wenn ein {C:attention}Gutschein{} gekauft wird,",
                    "bekomme seine {C:attention}verbesserten Versionen",
                },
            },
            sleeve_cry_wormhole_sleeve = {
                name = "Wurmlochhülle",
                text = {
                    "Beginne mit einem {C:cry_exotic}Exotischen{C:attention} Joker",
                    "Joker sind {C:attention}20X{} warscheinlicher",
                    "{C:dark_edition}Negativ{} zu sein",
                    "{C:attention}-2{} Joker-Slots",
                },
            },
        },
        Spectral = {
            c_cry_analog = {
                name = "Analog",
                text = {
                    "Erstelle {C:attention}#1#{} Kopien eines",
                    "zufälligen {C:attention}Jokers{}, zerstöre",
                    "alle anderen Joker, {C:attention}+#2#{} Ante",
                },
            },
            c_cry_gateway = {
                name = "Portal",
                text = {
                    "Erstelle einen zufälligen",
                    "{C:cry_exotic,E:1}Exotischen{C:attention} Joker{}, zerstöre",
                    "alle anderen Joker",
                },
            },
            c_cry_hammerspace = {
                name = "Hammerspace",
                text = {
                    "Füge einen zufälligen {C:attention}Verbrauchsgegenstand{}",
                    "als währen sie {C:dark_edition}Verstärkungen{}",
                    "zu allen Karten in der Hand hinzu",
                },
            },
            c_cry_lock = {
                name = "Schloss",
                text = {
                    "Entferne {C:red}alle{} Sticker",
                    "von {C:red}allen{} Jokern,",
                    "dann füge {C:purple,E:1}Ewig{}",
                    "zu einem zufälligen {C:attention}Joker{} hinzu",
                },
            },
            c_cry_pointer = {
                name = "POINTER://",
                text = {
                    "Erstelle eine Karte",
                    "{C:cry_code}deiner Wahl",
                    "{C:inactive,s:0.8}(Exotische Joker exkludiert)",
                },
            },
            c_cry_replica = {
                name = "Replik",
                text = {
                    "Verwandle alle Karten",
                    "in der Hand",
                    "in eine {C:attention}zufällige{}",
                    "Karte in der Hand",
                },
            },
            c_cry_source = {
                name = "Quelle",
                text = {
                    "Füge ein {C:cry_code}Grünes Siegel{}",
                    "zu {C:attention}#1#{} gewählten",
                    "Karte(n) hinzu",
                },
            },
            c_cry_summoning = {
                name = "Beschwörung",
                text = {
                    "Erstelle einen zufälligen",
                    "{C:cry_epic}Epischen{} {C:joker}Joker{}, zerstöre",
                    "einen zufälligen {C:joker}Joker{}",
                },
            },
            c_cry_trade = {
                name = "Handel",
                text = {
                    "{C:attention}Verliere{} einen zufälligen Gutschein,",
                    "bekomme {C:attention}2{} zufällige Gutscheine",
                },
            },
            c_cry_typhoon = {
                name = "Taifun",
                text = {
                    "Füge ein {C:cry_azure}Azurblaues Siegel{}",
                    "zu {C:attention}#1#{} gewählten",
                    "Karte(n) hinzu",
                },
            },
            c_cry_vacuum = {
                name = "Vakuum",
                text = {
                    "Entferne {C:red}alle {C:green}Modifikationen{}",
                    "von {C:red}allen{} Karten in der Hand,",
                    "Verdiene {C:money}$#1#{} pro entfernte {C:green}Modifikation{}",
                    "{C:inactive,s:0.7}(z.B. Verstärkungen, Siegel, Editionen)",
                },
            },
            c_cry_white_hole = {
                name = "Weißes Loch",
                text = {
                    "{C:attention}Entferne{} alle Handlevel,",
                    "verbessere {C:legendary,E:1}meistgespielte{} Pokerhand",
                    "um {C:attention}3{} für jedes entfernte Level",
                },
            },
        },
        Stake = {
            stake_cry_pink = {
                name = "Pinker Einsatz",
                colour = "Pink", --this is used for auto-generated sticker localization
                text = {
                    "Benötigte Punktzahl skaliert",
                    "schneller für jede {C:attention}Ante",
                },
            },
            stake_cry_brown = {
                name = "Brauner Einsatz",
                colour = "Brown",
                text = {
                    "Alle {C:attention}Sticker{} sind",
                    "gegenseitig Kompatibel",
                },
            },
            stake_cry_yellow = {
                name = "Gelber Einsatz",
                colour = "Yellow",
                text = {
                    "{C:attention}Sticker{} können auf",
                    "allen kaufbaren Gegenständen erscheinen",
                },
            },
            stake_cry_jade = {
                name = "Jade Einsatz",
                colour = "Jade",
                text = {
                    "Karten können mit {C:attention}Gesicht unten{} gezogen werden",
                },
            },
            stake_cry_cyan = {
                name = "Cyan Einsatz",
                colour = "Cyan",
                text = {
                    "{C:green}Ungewöhnliche{} und {C:red}Seltene{} Joker sind",
                    "seltener",
                },
            },
            stake_cry_gray = {
                name = "Grauer Einsatz",
                colour = "Gray",
                text = {
                    "Aktualisierungen erhöhen sich um {C:attention}$2{}",
                },
            },
            stake_cry_crimson = {
                name = "Karmesin Einsatz",
                colour = "Crimson",
                text = {
                    "Gutscheine füllen sich auf allen {C:attention}geraden{} Antes auf",
                },
            },
            stake_cry_diamond = {
                name = "Diamant Einsatz",
                colour = "Diamond",
                text = {
                    "Zum gewinnen must du Ante {C:attention}10{} besiegen",
                },
            },
            stake_cry_amber = {
                name = "Bernstein Einsatz",
                colour = "Amber",
                text = {
                    "{C:attention}-1{} Booster Packet Slots",
                },
            },
            stake_cry_bronze = {
                name = "Bronze Einsatz",
                colour = "Bronze",
                text = {
                    "Gutscheine sind {C:attention}50%{} teurer",
                },
            },
            stake_cry_quartz = {
                name = "Quartz Einsatz",
                colour = "Quartz",
                text = {
                    "Joker können {C:attention}Angeheftet{} sein",
                    "{s:0.8,C:inactive}(Bleibt an der Position ganz links angeheftet){}",
                },
            },
            stake_cry_ruby = {
                name = "Rubin Einsatz",
                colour = "Ruby",
                text = {
                    "{C:attention}Big{} Blinds können",
                    "{C:attention}Boss{} Blinds werden",
                },
            },
            stake_cry_glass = {
                name = "Glass Einsatz",
                colour = "Glass",
                text = {
                    "Karten können {C:attention}zerbrechen{} wenn sie gewertet werden",
                },
            },
            stake_cry_sapphire = {
                name = "Saphir Einsatz",
                colour = "Sapphire",
                text = {
                    "Verliere {C:attention}25%{} deines momentanen Geldes",
                    "am Ende der Ante",
                    "{s:0.8,C:inactive}(Maximal $10){}",
                },
            },
            stake_cry_emerald = {
                name = "Smaragd Einsatz",
                colour = "Emerald",
                text = {
                    "Karten, Packete und Gutscheine",
                    "können mit {C:attention}Gesicht unten{} sein",
                    "{s:0.8,C:inactive}(Nicht sichtbar bis gekauft){}",
                },
            },
            stake_cry_platinum = {
                name = "Platin Einsatz",
                colour = "Platinum",
                text = {
                    "Small Blinds sind {C:attention}entfernt{}",
                },
            },
            stake_cry_twilight = {
                name = "Zwielichtiger Einsatz",
                colour = "Twilight",
                text = {
                    "Karten können {C:attention}Banane{} sein",
                    "{s:0.8,C:inactive}(Chance von 1 zu 10, dass die Karte am Ende der Runde zerstört wird){}",
                },
            },
            stake_cry_verdant = {
                name = "Grassgrüner Einsatz",
                colour = "Verdant",
                text = {
                    "Benötigte Punktzahl skaliert",
                    "schneller für jede {C:attention}Ante",
                },
            },
            stake_cry_ember = {
                name = "Glühender Einsatz",
                colour = "Ember",
                text = {
                    "Alle Gegenstände geben beim verkaufen kein Geld",
                },
            },
            stake_cry_dawn = {
                name = "Dämmernder Einsatz",
                colour = "Dawn",
                text = {
                    "Tarot- und Geisterkarten beinflussen {C:attention}1",
                    "Karte weniger",
                    "{s:0.8,C:inactive}(Minimal 1){}",
                },
            },
            stake_cry_horizon = {
                name = "Horizont Einsatz",
                colour = "Horizon",
                text = {
                    "Wenn Blind asgewählt ist, füge eine",
                    "{C:attention}zufällige Karte{} zum Deck hinzu",
                },
            },
            stake_cry_blossom = {
                name = "Blühender Einsatz",
                colour = "Blossom",
                text = {
                    "{C:attention}Letzte{} Boss Blinds können nun",
                    "in {C:attention}allen{} Antes auftauchen",
                },
            },
            stake_cry_azure = {
                name = "Azurblauer Einsatz",
                colour = "Azure",
                text = {
                    "Werte auf Jokern sind",
                    "um {C:attention}20%{} reduziert",
                },
            },
            stake_cry_ascendant = {
                name = "Aufgestiegener Einsatz",
                colour = "Ascendant",
                text = {
                    "{C:attention}-1{} Shop Slots",
                },
            },
        },
        Tag = {
            tag_cry_astral = {
                name = "Astral-Tag",
                text = {
                    "Nächster Basisedition",
                    "Joker ist kostenlos und",
                    "wird {C:dark_edition}Astral{}",
                },
            },
            tag_cry_banana = {
                name = "Bananen-Tag",
                text = {
                    "Erstellt {C:attention}#1#",
                    "{C:inactive}(Muss Platz haben){}",
                },
            },
            tag_cry_bettertop_up = {
                name = "Besserer Auffüllungs-Tag",
                text = {
                    "Erstellt bis zu {C:attention}#1#",
                    "{C:green}Ungewöhnliche{} Joker",
                    "{C:inactive}(Muss Platz haben){}",
                },
            },
            tag_cry_better_voucher = {
                name = "Golder Gutschein-Tag",
                text = {
                    "Fügt einen Level {C:attention}#1#{} Gutschein",
                    "zum Shop hinzu",
                },
            },
            tag_cry_blur = {
                name = "Verschwommener Tag",
                text = {
                    "Nächster Basisedition",
                    "Joker ist kostenlos und",
                    "wird {C:dark_edition}Verschwommen{}",
                },
            },
            tag_cry_booster = {
                name = "Booster-Tag",
                text = {
                    "Nächstes {C:cry_code}Booster Packet{} hat",
                    "{C:attention}doppelt so viele{} Karten und",
                    "{C:attention}doppelt so viele{} Auswahlen",
                },
            },
            tag_cry_bundle = {
                name = "Bündel-Tag",
                text = {
                    "Erstelle einen {C:attention}Standard-Tag{}, {C:tarot}Charme-Tag{},",
                    "{C:attention}Clown-Tag{}, und {C:planet}Meteor-Tag",
                },
            },
            tag_cry_cat = {
                name = "Katzen-Tag",
                text = { "Meow.", "{C:inactive}Level {C:dark_edition}#1#" },
            },
            tag_cry_console = {
                name = "Konsolen-Tag",
                text = {
                    "Gibt ein kostenloses",
                    "{C:cry_code}Program Packet",
                },
            },
            tag_cry_double_m = {
                name = "Doppel M Tag",
                text = {
                    "Shop hat einen",
                    "{C:dark_edition}Lustigen {C:legendary}M Joker{}",
                },
            },
            tag_cry_empowered = {
                name = "Ermächtigter Tag",
                text = {
                    "Gibt ein kostenloses {C:spectral}Geisterpacket",
                    "mit {C:legendary,E:1}Die Seele{} und {C:cry_exotic,E:1}Portal{}",
                },
            },
            tag_cry_epic = {
                name = "Epischer Tag",
                text = {
                    "Shop hat einen",
                    "{C:cry_epic}Epischen Joker{} mit halben Preis",
                },
            },
            tag_cry_gambler = {
                name = "Zocker Tag",
                text = {
                    "Chance von {C:green}#1# zu #2#{} einen",
                    "{C:cry_exotic,E:1}Ermächtigten Tag{} zu erstellen",
                },
            },
            tag_cry_glass = {
                name = "Zerbrechlicher Tag",
                text = {
                    "Nächster Basisedition",
                    "Joker ist kostenlos und",
                    "wird {C:dark_edition}Zerbrechlich{}",
                },
            },
            tag_cry_glitched = {
                name = "Fehlerhafter Tag",
                text = {
                    "Nächster Basisedition",
                    "Joker ist kostenlos und",
                    "wird {C:dark_edition}Fehlerhaft{}",
                },
            },
            tag_cry_gold = {
                name = "Goldener Tag",
                text = {
                    "Nächster Basisedition",
                    "Joker ist kostenlos und",
                    "wird {C:dark_edition}Gold{}",
                },
            },
            tag_cry_gourmand = {
                name = "Vielfraß Tag",
                text = {
                    "Shop hat einen Kostenlosen",
                    "{C:attention}Essen Joker",
                },
            },
            tag_cry_loss = {
                name = "Loss",
                text = {
                    "Gibt ein Kostenloses",
                    "{C:cry_ascendant}Meme Packet",
                },
            },
            tag_cry_m = {
                name = "Lustiger Tag",
                text = {
                    "Nächster Basisedition",
                    "Joker ist kostenlos und",
                    "wird {C:dark_edition}Lustig{}",
                },
            },
            tag_cry_memory = {
                name = "Erinnerungs Tag",
                text = {
                    "Erstelle {C:attention}#1#{} Kopien des",
                    "als letztes genutzen {C:attention}Tag{}",
                    "in diesem Durchlauf",
                    "{s:0.8,C:inactive}Kopierende Tags exkludiert",
                    "{s:0.8,C:inactive}Momentan: {s:0.8,C:attention}#2#",
                },
            },
            tag_cry_mosaic = {
                name = "Mosaik Tag",
                text = {
                    "Nächster Basisedition",
                    "Joker ist kostenlos und",
                    "wird {C:dark_edition}Mosaik{}",
                },
            },
            tag_cry_oversat = {
                name = "Übersättigter Tag",
                text = {
                    "Nächster Basisedition",
                    "Joker ist kostenlos und",
                    "wird {C:dark_edition}Übersättigt{}",
                },
            },
            tag_cry_quadruple = {
                name = "Vierfach Tag",
                text = {
                    "Gibt {C:attention}#1#{} Kopien des",
                    "als nächstes erhaltenen {C:attention}Tags",
                    "{s:0.8,C:inactive}Kopierende Tags exkludiert",
                },
            },
            tag_cry_quintuple = {
                name = "Fünffach Tag",
                text = {
                    "Gibt {C:attention}#1#{} Kopien des",
                    "als nächstes erhaltenen {C:attention}Tags",
                    "{s:0.8,C:inactive}Kopierende Tags exkludiert",
                },
            },
            tag_cry_rework = {
                name = "Überarbeitungs-Tag",
                text = {
                    "Shop hat einen",
                    "{C:dark_edition}#1# {C:cry_code}#2#",
                },
            },
            tag_cry_schematic = {
                name = "Schema-Tag",
                text = {
                    "Shop hat einen",
                    "{C:attention}Brainstorming",
                },
            },
            tag_cry_scope = {
                name = "Scope-Tag",
                text = {
                    "{C:attention}+#1# {C:blue}Hände{} und",
                    "{C:red}Abwürfe{} nächste Runde",
                },
            },
            tag_cry_triple = {
                name = "Dreifach Tag",
                text = {
                    "Gibt {C:attention}#1#{} Kopien des",
                    "als nächstes erhaltenen {C:attention}Tags",
                    "{s:0.8,C:inactive}Kopierende Tags exkludiert",
                },
            },
        },
        Tarot = {
            c_cry_automaton = {
                name = "Der Automat",
                text = {
                    "Erstelle bis zu {C:attention}#1#",
                    "zufällige {C:cry_code}Code{} Karte",
                    "{C:inactive}(Muss Platz haben)",
                },
            },
            c_cry_eclipse = {
                name = "Die Finsterniss",
                text = {
                    "Verstärkt {C:attention}#1#{} gewählte Karte",
                    "in eine {C:attention}Echo Karte",
                },
            },
            c_cry_meld = {
                name = "Verschmelzen",
                text = {
                    "Wähle einen {C:attention}Joker{} oder eine",
                    "{C:attention}Spielkarte{} welche",
                    "{C:dark_edition}Doppelseitig{} wird",
                },
            },
            c_cry_theblessing = {
                name = "Der Segen",
                text = {
                    "Erstellt {C:attention}1{}",
                    "zufälligen {C:attention}Verbrauchsgegenstand{}",
                    "{C:inactive}(Muss Platz haben){}",
                },
            },
        },
        Voucher = {
            v_cry_asteroglyph = {
                name = "Astroglyphe",
                text = {
                    "{C:attention}-#1#{} Ante",
                },
            },
            v_cry_blankcanvas = {
                name = "Lehre Leinwand",
                text = {
                    "{C:attention}+#1#{} Handgröße",
                },
            },
            v_cry_clone_machine = {
                name = "Klonmaschine",
                text = {
                    "Doppeltags werden",
                    "{C:attention}Fünffach-Tags{} und",
                    "erscheinen {C:attention}4X{} öfter",
                },
            },
            v_cry_command_prompt = {
                name = "Eingabeaufforderung",
                text = {
                    "{C:cry_code}Code{} Karten",
                    "können im",
                    "{C:attention}shop{} auftauchen",
                },
            },
            v_cry_copies = {
                name = "Kopien",
                text = {
                    "Doppeltags werden",
                    "{C:attention}Dreifach-Tags{} und",
                    "erscheinen {C:attention}2X{} öfter",
                },
            },
            v_cry_curate = {
                name = "Kurat",
                text = {
                    "Alle Karten",
                    "erscheinen mit",
                    "einer {C:dark_edition}Edition{}",
                },
            },
            v_cry_dexterity = {
                name = "Geschicklichkeit",
                text = {
                    "Bekomme permanent",
                    "{C:blue}+#1#{} Hand/Hände",
                    "pro Runde",
                },
            },
            v_cry_double_down = {
                name = "Double Down",
                text = {
                    "Nach jeder runde,",
                    "{X:dark_edition,C:white} X1.5 {} zu allen Werten",
                    "auf der Rückseite von",
                    "{C:dark_edition}Doppelseitigen{} Karten"
                },
            },
            v_cry_double_slit = {
                name = "Doppelschlitz",
                text = {
                    "{C:attention}Verschmelzen{} kann im",
                    "Shop und in",
                    "Arkana Packeten auftauchen",
                },
            },
            v_cry_double_vision = {
                name = "Doppelsicht",
                text = {
                    "{C:dark_edition}Doppelseitige{} Karten erscheinen",
                    "{C:attention}4X{} öfter",
                },
            },
            v_cry_fabric = {
                name = "Universal Fabric",
                text = {
                    "{C:dark_edition}+#1#{} Joker Slot(s)",
                },
            },
            v_cry_massproduct = {
                name = "Massenproduktion",
                text = {
                    "Alle Karten und Parkete",
                    "im Shop kosten {C:attention}$1{}",
                },
            },
            v_cry_moneybean = {
                name = "Geld Bohnenranke",
                text = {
                    "Erhöhe Obergrenze",
                    "für Zinsen",
                    "zu {C:money}$#1#{}",
                },
            },
            v_cry_overstock_multi = {
                name = "Multibestand",
                text = {
                    "{C:attention}+#1#{} Karten Slot(s) und",
                    "{C:attention}+#1#{} Booster Packet Slot(s)",
                    "im Shop",
                },
            },
            v_cry_pacclimator = {
                name = "Planetenakklimatisierung",
                text = {
                    "Alle zukünftigen {C:planet}Planeten{}",
                    "Karten sind {C:green}kostenlos{}",
                },
            },
            v_cry_pairamount_plus = {
                name = "Pairamount Plus",
                text = {
                    "{C:attention}Löse{} alle M Joker",
                    "für jedes Paar in",
                    "der gespielten Hand",
					"{C:attention}erneut aus"
                },
            },
            v_cry_pairing = {
                name = "Paarung",
                text = {
                    "{C:attention}Löse{} alle M Joker {C:attention}erneut aus",
                    "wenn gespielte Hand ein {C:attention}Paar{} ist",
                },
            },
            v_cry_quantum_computing = {
                name = "Quantum Computer",
                text = {
                    "{C:cry_code}Code{} Karten können",
                    "{C:dark_edition}Negativ{} erscheinen",
                },
            },
            v_cry_repair_man = {
                name = "Reparaturmann",
                text = {
                    "{C:attention}Löse{} alle M Joker {C:attention}erneut aus",
                    "wenn gespielte Hand ein {C:attention}Paar{} enthält",
                },
            },
            v_cry_rerollexchange = {
                name = "Aktualisierungsaustausch",
                text = {
                    "Alle Aktualisierungen",
                    "kosten {C:attention}$2{}",
                },
            },
            v_cry_satellite_uplink = {
                name = "Satelitenverbindung",
                text = {
                    "{C:cry_code}Code{} Karten können",
                    "in allen {C:attention}Himmelpacketen{}",
                    "erscheinen",
                },
            },
            v_cry_scope = {
                name = "Galaktischer Umfang",
                text = {
                    "Erstelle die {C:planet}Planeten",
                    "Karte für die gespielte",
                    "{C:attention}Pokerhand{}",
                    "{C:inactive}(Muss Platz haben){}",
                },
            },
            v_cry_tacclimator = {
                name = "Tarotakklimatisierung",
                text = {
                    "Alle zukünftigen {C:tarot}Tarot{}",
                    "Karten sind {C:green}kostenlos{}",
                },
            },
            v_cry_tag_printer = {
                name = "Tag Drucker",
                text = {
                    "Doppeltags werden",
                    "{C:attention}Vierfach-Tags{} und",
                    "erscheinen {C:attention}3X{} öfter",
                },
            },
            v_cry_threers = {
                name = "Die 3 Rs",
                text = {
                    "Bekomme permanent",
                    "{C:red}+#1#{} Abwurf/Abwürfe",
                    "pro Runde",
                },
            },
            v_cry_stickyhand = {
                name = "Klebrige Hand",
                text = {
                    "{C:attention}+#1#{} Karten",
                    "auswahl limit",
                },
            },
            v_cry_grapplinghook = {
                name = "Enterhaken",
                text = {
                    "{C:attention}+#1#{} Karten",
                    "auswahl limit",
                    "{C:inactive,s:0.7}NOTE: Bekommt später noch{}",
                    "{C:inactive,s:0.7}mehr funktionen{}",
                },
            },
            v_cry_hyperspacetether = {
                name = "Hyperraum-Halteleine",
                text = {
                    "{C:attention}+#1#{} Karten",
                    "auswahl limit",
                    "{C:inactive,s:0.7}NOTE: Bekommt später noch{}",
                    "{C:inactive,s:0.7}mehr funktionen{}",
                },
            },
        },
        Other = {
            banana = {
                name = "Banane",
                text = {
                    "Chance von {C:green}#1# zu #2#{} jede Runde",
                    "zerstört zu werden",
                },
            },
            cry_rigged = {
                name = "Manipuliert",
                text = {
                    "Alle {C:cry_code}aufgelisteten{} Warscheinlichkeiten",
                    "sind {C:cry_code}garantiert",
                },
            },
            cry_hooked = {
                name = "Verhackt",
                text = {
                    "Wenn dieser Joker {C:cry_code}ausgelöst{} wird,",
                    "löse {C:cry_code}#1#{} aus",
                },
            },
            food_jokers = {
                name = "Essen Joker",
                text = {
                    "{s:0.8}Gros Michel, Ei, Eiscreme, Cavendish,",
                    "{s:0.8}Schwarze Bohne, Diät-Cola, Popcorn, Ramen,",
                    "{s:0.8}Selters, Saure Gurke, Chilischote, Karamel,",
                    "{s:0.8}Nostalgische Süßigkeit, Fast Food M, etc.",
                },
            },
            cry_https_disabled = {
                name = "M",
                text = {
                    "{C:attention,s:0.7}Updating{s:0.7} ist von den standard ({C:attention,s:0.7}HTTPS Modul{s:0.7} deaktiviert)",
                },
            },
            --i am so sorry for this
            --actually some of this needs to be refactored at some point
            cry_eternal_booster = {
                name = "Ewig",
                text = {
                    "Alle Karten im Packet",
                    "sind {C:attention}Ewig{}",
                },
            },
            cry_perishable_booster = {
                name = "Verderblich",
                text = {
                    "Alle Karten im Packet",
                    "sind {C:attention}Verderblich{}",
                },
            },
            cry_rental_booster = {
                name = "Gemietet",
                text = {
                    "Alle Karten im Packet",
                    "sind {C:attention}Gemietet{}",
                },
            },
            cry_pinned_booster = {
                name = "Angeheftet",
                text = {
                    "Alle Karten im Packet",
                    "sind {C:attention}Angeheftet{}",
                },
            },
            cry_banana_booster = {
                name = "Banane",
                text = {
                    "Alle Karten im Packet",
                    "sind {C:attention}Banane{}",
                },
            },
            cry_eternal_voucher = {
                name = "Ewig",
                text = {
                    "Can nicht gehandelt werden",
                },
            },
            cry_perishable_voucher = {
                name = "Verderblich",
                text = {
                    "Geschwächt nach",
                    "{C:attention}#1#{} Runden",
                    "{C:inactive}({C:attention}#2#{C:inactive} übrig)",
                },
            },
            cry_rental_voucher = {
                name = "Gemietet",
                text = {
                    "Verliere {C:money}$#1#{} am",
                    "Ende der Runde",
                },
            },
            cry_pinned_voucher = {
                name = "Angeheftet",
                text = {
                    "Bleibt im Shop",
                    "bis eingelöst",
                },
            },
            cry_banana_voucher = {
                name = "Banane",
                text = {
                    "Chance von {C:green}#1# zu #2#{} die",
                    "Einlösung am Ende der Runde aufzuheben",
                },
            },
            cry_perishable_consumeable = {
                name = "Verderblich",
                text = {
                    "Geschwächt am",
                    "Ende der Runde",
                },
            },
            cry_rental_consumeable = {
                name = "Gemietet",
                text = {
                    "Verliere {C:money}$#1#{} am Ende der",
                    "Runde und bei Nutzung",
                },
            },
            cry_pinned_consumeable = {
                name = "Angeheftet",
                text = {
                    "Du kannst keine",
                    "nicht-{C:attention}Angeheftetn{} Verbrauchsgegenstände nutzen",
                },
            },
            cry_banana_consumeable = {
                name = "Banana",
                text = {
                    "Chance von {C:green}#1# zu #2#{} beim nutzen",
                    "nichts zu tuhen",
                },
            },
            p_cry_code_normal_1 = {
                name = "Program Packet",
                text = {
                    "Wähle {C:attention}#1#{} aus bis zu",
                    "{C:attention}#2#{C:cry_code} Code{} Karten",
                },
            },
            p_cry_code_normal_2 = {
                name = "Program Packet",
                text = {
                    "Wähle {C:attention}#1#{} aus bis zu",
                    "{C:attention}#2#{C:cry_code} Code{} Karten",
                },
            },
            p_cry_code_jumbo_1 = {
                name = "Jumbo Program Packet",
                text = {
                    "Wähle {C:attention}#1#{} aus bis zu",
                    "{C:attention}#2#{C:cry_code} Code{} Karten",
                },
            },
            p_cry_code_mega_1 = {
                name = "Mega Program Packet",
                text = {
                    "Wähle {C:attention}#1#{} aus bis zu",
                    "{C:attention}#2#{C:cry_code} Code{} Karten",
                },
            },
            p_cry_empowered = {
                name = "Geister Packet [Ermächtigter Tag]",
                text = {
                    "Wähle {C:attention}#1#{} von bis zu",
                    "{C:attention}#2#{C:spectral} Geister{} Karten",
                    "{s:0.8,C:inactive}(Erstellt von Ermächtigten Tag)",
                },
            },
            p_cry_meme_1 = {
                name = "Meme Packet",
                text = {
                    "Wähle {C:attention}#1#{} von bis zu",
                    "{C:attention}#2# Meme Jokern{}",
                },
            },
            p_cry_meme_two = {
                name = "Meme Packet",
                text = {
                    "Wähle {C:attention}#1#{} von bis zu",
                    "{C:attention}#2# Meme Jokern{}",
                },
            },
            p_cry_meme_three = {
                name = "Meme Packet",
                text = {
                    "Wähle {C:attention}#1#{} von bis zu",
                    "{C:attention}#2# Meme Jokern{}",
                },
            },
            undiscovered_code = {
                name = "Nicht entdeckt",
                text = {
                    "Kaufe oder nutze",
                    "diese Karte in einem",
                    "Durchlauf ohne Code",
                    "um zu lernen was es tuht"
                }
            },
            cry_green_seal = {
                name = "Grünen Siegel",
                text = {
                    "Erstellt eine {C:cry_code}Code{} Karte",
                    "wenn gespielt aber nicht gewertet",
                    "{C:inactive}(Muss Platz haben)",
                },
            },
            cry_azure_seal = {
                name = "Azurblaues Siegel",
                text = {
                    "Erstelle {C:attention}#1#{} {C:dark_edition}Negative{}",
                    "{C:planet}Planeten{} für gespielte",
                    "{C:attention}Pokerhand{}, dann",
                    "{C:red}zerstöre{} diese Karte",
                },
            },
        },
    },
    misc = {
        achievement_names = {
            ach_cry_ace_in_crash = "Pocket ACE",
            ach_cry_blurred_blurred_joker = "Gesetzlich blind",
            ach_cry_bullet_hell = "Bullet Hell",
            ach_cry_break_infinity = "Durchbreche Unendlichkeit",
            ach_cry_cryptid_the_cryptid = "Cryptid das Cryptid",
            ach_cry_exodia = "Exodia",
            ach_cry_freak_house = "Freak House",
            ach_cry_googol_play_pass = "Googol Play Pass",
            ach_cry_haxxor = "H4xx0r",
            ach_cry_home_realtor = "Immobilienmakler",
            ach_cry_jokes_on_you = "Der Witz geht auf dich, Kumpel!",
            ach_cry_niw_uoy = "!nennoweg tsah uD",
            ach_cry_now_the_fun_begins = "Hier fängt der Spaß erst richtig an.",
            ach_cry_patience_virtue = "Geduld ist eine Tugend",
            ach_cry_perfectly_balanced = "Perfekt ausgeglichen",
            ach_cry_pull_request = "Pull Request",
            ach_cry_traffic_jam = "Stau",
            ach_cry_ult_full_skip = "Ultimativer Full Skip",
            ach_cry_used_crash = "Wir haben dich gewarnt",
            ach_cry_what_have_you_done = "WAS HAST DU GETAHN?!",
        },
        achievement_descriptions = {
            ach_cry_ace_in_crash = 'check_for_unlock({type = "ace_in_crash"})',
            ach_cry_blurred_blurred_joker = "Bekomme einen verschwommen Verschwommen Joker",
            ach_cry_bullet_hell = "Habe 15 AP Joker",
            ach_cry_break_infinity = "Bekomme 1.79e308 Chips in einer einzigen Hand",
            ach_cry_cryptid_the_cryptid = "Benutze Cryptid auf Cryptid",
            ach_cry_exodia = "Habe 5 Exotische Joker",
            ach_cry_freak_house = "Spiele ein Flush House aus 6 und 9 von Herz während du Nice hast",
            ach_cry_googol_play_pass = "Manipuliere eine Googol Play Karte",
            ach_cry_haxxor = "Benutze einen cheat code",
            ach_cry_home_realtor = "Aktiviere Fröhliches Haus vor Ante 8 (ohne DoE/Antimaterie)",
            ach_cry_jokes_on_you = "Löse den Effect von dem Witz in Ante 1 aus und gewinne den Durchlauf trotzdem.",
            ach_cry_niw_uoy = "Erreiche Ante -8",
            ach_cry_now_the_fun_begins = "Bekomme Leinwand",
            ach_cry_patience_virtue = "Warte bei der Lavendelschleife für 2 minuten bevor du sie besiegst",
            ach_cry_perfectly_balanced = "Besiege das Sehr Faire Deck auf Aufgestiegenen Einsatz",
            ach_cry_pull_request = "Lass ://COMMIT den Joker erstellen den es zerstört hat.",
            ach_cry_traffic_jam = "Besiege alle Rush Hour Herausforderungen",
            ach_cry_ult_full_skip = "Gewinne in einer Runde",
            ach_cry_used_crash = "Benutze ://CRASH",
            ach_cry_what_have_you_done = "Lösche oder opfere einen Exotischen Joker",
        },
        challenge_names = {
            c_cry_ballin = "Ballin'",
            c_cry_boss_rush = "Enter the Gungeon",
            c_cry_dagger_war = "Dolchkrieg",
            c_cry_onlycard = "Solo Karte",
            c_cry_rng = "RNG",
            c_cry_rush_hour = "Rush Hour I",
            c_cry_rush_hour_ii = "Rush Hour II",
            c_cry_rush_hour_iii = "Rush Hour III",
            c_cry_sticker_sheet = "Stickerbogen",
            c_cry_sticker_sheet_plus = "Stickerbogen+",
        },
        dictionary = {
            --Settings Menu
            cry_set_features = "Features",
            cry_set_music = "Musik",
            cry_set_enable_features = "Wähle features zum Aktivieren (wird beim Neustart angewendet):",
            cry_feat_achievements = "Erfolge",
            ["cry_feat_antimatter deck"] = "Antimaterie Deck",
            cry_feat_blinds = "Blinds",
            cry_feat_challenges = "Herausforderungen",
            ["cry_feat_code cards"] = "Code Karten",
            ["cry_feat_misc. decks"] = "Verschiedene Decks",
            ["cry_feat_https module"] = "HTTPS Module",
            ["cry_feat_timer mechanics"] = "Timer Mechaniken",
            ["cry_feat_enhanced decks"] = "Verstärkte Karten",
            ["cry_feat_epic jokers"] = "Epische Joker",
            ["cry_feat_exotic jokers"] = "Exotische Joker",
            ["cry_feat_m jokers"] = "M Joker",
            cry_feat_menu = "Eigene Main Menu",
            ["cry_feat_misc."] = "Verschiedenes",
            ["cry_feat_misc. jokers"] = "Verschiedene Joker",
            cry_feat_planets = "Planeten",
            cry_feat_jokerdisplay = "JokerDisplay (Macht nichts)",
            cry_feat_tags = "Tags",
            cry_feat_sleeves = "Hüllen",
            cry_feat_spectrals = "Geisterkarten",
            ["cry_feat_more stakes"] = "Einsätze",
            cry_feat_vouchers = "Gutscheine",
            cry_mus_jimball = "Jimball (Funkytown by Lipps Inc. - Copyrighted)",
            cry_mus_code = "Code Cards (://LETS_BREAK_THE_GAME by HexaCryonic)",
            cry_mus_exotic = "Exotic Jokers (Joker in Latin by AlexZGreat)",
            cry_mus_high_score = "High Score (Final Boss [For Your Computer] by AlexZGreat)",

            k_cry_program_pack = "Program Packet",
            k_cry_meme_pack = "Meme Packet",

            cry_critical_hit_ex = "Kritischer Treffer!",
            cry_critical_miss_ex = "Kritisch verfehlt!",

            cry_debuff_oldhouse = "Keine Full Houses",
            cry_debuff_oldarm = "Must 4 oder weniger Karten spielen",
            cry_debuff_oldpillar = "Keine Straßen",
            cry_debuff_oldflint = "Keine Flushes",
            cry_debuff_oldmark = "Keine Hände die ein Paar enthalten",
            cry_debuff_obsidian_orb = "Hat die Fähigkeiten aller besiegten Bosse",

            k_code = "Code",
            b_code_cards = "Code Karten",
            b_pull = "PULL",
            cry_hooked_ex = "Verhackt!",
            k_end_blind = "Beende Blind",

            cry_code_rank = "RANG EINGEBEN",
            cry_code_enh = "VERSTÄRKUNG EINGEBEN",
            cry_code_hand = "POKERHAND EINGEBEN",
            cry_code_enter_card = "KARTE EINGEBEN",
            cry_code_apply = "ANWENDEN",
            cry_code_apply_previous = "VORHERIGES ANWENDEN",
            cry_code_exploit = "HACKEN",
            cry_code_exploit_previous = "VORHERIGES HACKEN",
            cry_code_create = "ERSTELLEN",
            cry_code_create_previous = "VERHERIGES ERSTELLEN",
            cry_code_execute = "AUSFÜHREN",
            cry_code_cancel = "ABBRECHEN",

            b_flip = "UMDREHEN",
            b_merge = "KOMBINIEREN",

            cry_again_q = "Nochmal?",
            cry_curse = "Verflucht",
            cry_curse_ex = "Verflucht!",
            cry_sobbing = "Hilf mir...",
            cry_gaming = "Gaming",
            cry_gaming_ex = "Gaming!",
            cry_sus_ex = "Verräter!",
            cry_jolly_ex = "Jolly Up!",
            cry_m_minus = "m",
            cry_m = "M",
            cry_m_ex = "M!",
            cry_minus_round = "-1 Runde",
            cry_plus_cryptid = "+1 Cryptid",
            cry_no_triggers = "Keine Auslösungen übrig!",
            cry_unredeemed = "Einlöung aufgehoben...",
            cry_active = "Aktiv",
            cry_inactive = "Inaktiv",

	    k_disable_music = "Musik deaktivieren",

            cry_epic = "Episch",
            cry_exotic = "Exotisch",

	    cry_notif_jimball_1 = "Jimball",
            cry_notif_jimball_2 = "Copyright Anmerkung",
            cry_notif_jimball_d1 = "Jimball spielt den Song \"Funkytown\",",
            cry_notif_jimball_d2 = "welcher urheberrechtlich geschützt ist und nicht",
            cry_notif_jimball_d3 = "für Streams und Videos genutzt werden kann.",
        },
        labels = {
            food_jokers = "Essen Joker",
            banana = "Banane",
            code = "Code",
            cry_rigged = "Manipuliert",
            cry_hooked = "Verhackt",

            cry_green_seal = "Grünes Siegel",
            cry_azure_seal = "Azurblaues Siegel",

            cry_astral = "Astral",
            cry_blur = "Verschwommen",
            cry_double_sided = "Doppelseitig",
            cry_glass = "Zerbrechlich",
            cry_glitched = "Fehlerhaft",
            cry_gold = "Golden",
            cry_m = "Lustig",
            cry_mosaic = "Mosaik",
            cry_noisy = "Geräuchvoll",
            cry_oversat = "Übersättigt",

            cry_epic = "Episch",
            cry_exotic = "Exotisch"
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
                plus_mult = { "{C:inactive}(Momentan {C:red}+#1#{C:inactive} Mult)" },
                plus_chips = { "{C:inactive}(Momentan {C:blue}+#1#{C:inactive} Chips)" },
                x_mult = { "{C:inactive}(Momentan {X:red,C:white} X#1# {C:inactive} Mult)" },
                x_chips = { "{C:inactive}(Momentan {X:blue,C:white} X#1# {C:inactive} Chips)" },
                h_size = { "{C:inactive}(Momentan {C:attention}+#1#{C:inactive} Handgröße)" },
                money = { "{C:inactive}(Momentan {C:money}+$#1#{C:inactive})" },
            },
            actions = {
                make_joker = { "Erstelle {C:attention}#2# Joker{}" },
                make_tarot = { "Erstelle {C:attention}#2#{C:tarot} Tarot{} Karte" },
                make_planet = { "Erstelle {C:attention}#2#{C:planet} Planet{} Karte" },
                make_spectral = { "Erstelle {C:attention}#2#{C:spectral} Spectral{} Karte" },
                add_dollars = { "Earn {C:money}$#2#{}" },
            },
            contexts = {
                open_booster = { "wenn ein {C:attention}Booster{} geöffnet wird" },
                buying_card = { "wenn eine Karte gekauft wird" },
                selling_self = { "wenn diese Karte verkauft wird" },
                selling_card = { "wenn eine Karte verkauft wird" },
                reroll_shop = { "beim Aktualisieren" },
                ending_shop = { "am Ende des {C:attention}Shops{}" },
                skip_blind = { "wenn ein {C:attention}Blind{} übersprungen wird" },
                skipping_booster = { "wenn ein {C:attention}Booster Packet{} übersprungen wird" },
                playing_card_added = { "wenn eine {C:attention}Spielkarte{} zum Deck hinzugefügt wird" },
                first_hand_drawn = { "wenn die Runde beginnt" },
                setting_blind = { "wenn {C:attention}Blind{} ausgewählt wird" },
                remove_playing_cards = { "wenn eine Karte zerstört wird" },
                using_consumeable = { "wenn ein {C:attention}Verbrauchsgegenstand{} genutzt wird" },
                debuffed_hand = { "wenn gespielte {C:attention}Hand{} nicht erlaubt ist" },
                pre_discard = { "vor jedem Abwurf" },
                discard = { "für jede Abgewurfene Karte" },
                end_of_round = { "am Ende der {C:attention}Runde{}" },
                individual_play = { "für jede gewertete Karte" },
                individual_hand_score = { "für jede Karte in der Hand während der Auswertung" },
                individual_hand_end = { "für jede Karte in der Hand am Ende der {C:attention}Runde{}" },
                repetition_play = { "Löse gespielte Karten erneut aus" },
                repetition_hand = { "Löse alle Karten in der Hand erneut aus" },
                other_joker = { "für jeden {C:attention}Joker{}" },
                before = { "vor jeder {C:attention}Hand{}" },
                after = { "nach jeder {C:attention}Hand{}" },
                joker_main = {},
            },
            conds = {
                buy_common = { "wenn dies ein {C:blue}Gewöhnlicher{} {C:attention}Joker{} ist" },
                buy_uncommon = { "wenn dies ein {C:green}Ungewöhnlicher{} {C:attention}Joker{} ist" },
                tarot = { "wenn die Karte eine {C:tarot}Tarot{} Karte ist" },
                planet = { "wenn die Karte eine {C:planet}Planeten{} Karte" },
                spectral = { "wenn die Karte eine {C:spectral}Geisterkarte{} ist" },
                joker = { "wenn die Karte ein {C:attention}Joker{} ist" },
                suit = { "wenn die Karte ein {V:1}#3#{} ist" },
                rank = { "wenn die Karte ein {C:attention}#3#{} ist" },
                face = { "wenn die Karte eine {C:attention}Bildkarte{} ist" },
                boss = { "wenn {C:attention}Blind{} eine {C:attention}Boss {C:attention}Blind{} ist" },
                non_boss = { "wenn {C:attention}Blind{} eine {C:attention}Nicht-Boss {C:attention}Blind{} ist" },
                small = { "wenn {C:attention}Blind{} eine {C:attention}Small {C:attention}Blind{} ist" },
                big = { "wenn {C:attention}Blind{} eine {C:attention}Big {C:attention}Blind{} ist" },
                first = { "wenn dies die {C:attention}erste {C:attention}Hand{} ist" },
                last = { "wenn dies die {C:attention}letzte {C:attention}Hand{} ist" },
                common = { "wenn es ein {C:blue}Gewöhnicher{} {C:attention}Joker{} ist" },
                uncommon = { "wenn es ein {C:green}Ungewöhnlicher{} {C:attention}Joker{} ist" },
                rare = { "wenn es ein {C:red}Seltener{} {C:attention}Joker{} ist" },
                poker_hand = { "wenn Hand ein {C:attention}#3#{} is" },
                or_more = { "wenn Hand {C:attention}#3#{} oder mehr Karten enthält" },
                or_less = { "wenn Hand {C:attention}#3#{} oder weniger Karten enthält" },
                hands_left = { "wenn am Ende der Runde #3# {C:blue}Hände{} übrig sind" },
                discards_left = { "wenn am Ende der Runde #3# {C:red}Abwürfe{} übrig sind" },
                first_discard = { "wenn es der {C:attention}erste {C:attention}Abwurf{} ist" },
                last_discard = { "wenn es der {C:attention}letzte {C:attention}Abwurf{} ist" },
                odds = { "mit einer Chance von {C:green}#4# {C:green}zu {C:green}#3#{}" },
            },
        },
        v_dictionary = {
            a_xchips = {"X#1# Chips"},
            a_powmult = {"^#1# Mult"},
            a_powchips = {"^#1# Chips"},
            a_powmultchips = {"^#1# Mult+Chips"},
            a_round = {"+#1# Round"},
            a_xchips_minus = {"-X#1# Chips"},
            a_powmult_minus = {"-^#1# Mult"},
            a_powchips_minus = {"-^#1# Chips"},
            a_powmultchips_minus = {"-^#1# Mult+Chips"},
            a_round_minus = {"-#1# Round"},
            
            a_tag = {"#1# Tag"},
            a_tags = {"#1# Tags"},

            cry_sticker_name = {"#1# Sticker"},
            cry_sticker_desc = {
                "Nutze diesen Joker",
                "um auf #2##1#",
                "#2#Einsatz#3# Schwieringkeit tu gewinnen"
            },
        },
        v_text = {
            ch_c_cry_all_perishable = {"Alle Joker sind {C:eternal}Verderblich{}"},
            ch_c_cry_all_rental = {"Alle Joker sind {C:eternal}Gemietet{}"},
            ch_c_cry_all_pinned = {"Alle Joker sind {C:eternal}Angeheftet{}"},
            ch_c_cry_all_banana = {"Alle Joker sind {C:eternal}Banane{}"},
            ch_c_all_rnj = {"Alle Joker sind {C:attention}RNJoker{}"},
            ch_c_cry_sticker_sheet_plus = {"Alle kaufbaren Gegenstände haben alle Sticker"},
            ch_c_cry_rush_hour = {"Alle Boss Blinds sind {C:attention}Die Uhr{} oder {C:attention}Lavendelschleife"},
            ch_c_cry_rush_hour_ii = {"Alle Blinds sind {C:attention}Boss Blinds{}"},
            ch_c_cry_rush_hour_iii = {"{C:attention}Die Uhr{} und {C:attention}Lavendelschleife{} steigen {C:attention}doppelt{} so schnell"},
            ch_c_cry_no_tags = {"Überspringen ist {C:attention}deaktiviert{}"}
        },
        -- Thanks to many members of the community for contributing to all of these quips!
        -- There's too many to credit so just go here: https://discord.com/channels/1116389027176787968/1209506360987877408/1237971471146553406
        -- And here: https://discord.com/channels/1116389027176787968/1219749193204371456/1240468252325318667
        very_fair_quips = {
            { "L", "KEINE GUTSCHEINE", "FÜR DICH" },
            { "LAPPEN", "DACHTEST DU ICH WÜRDE", "DIR GUTSCHEINE GEBEN?" },
            { "NÖ!", "KEINE GUTSCHEINE HIER!", "(SLUMPAGE EDITION)" },
            { "SKILL ISSUE", "IMAGINE GUT GENUG FÜR", "EINEN GUTSCHEIN ZU SEIN" },
            { "JIMBO", "VON DER VERWALTUNG", "HAT VERGESSEN NACHZUFÜLLEN" },
            { "OOPS!", "KEINE GUTSCHEINE", "" },
            { "DU NARR,", "WARUM GUCKST ÜBERHAUPT", "HIER HER? LOL" },
            { "DER GUTSCHEIN", "IST IN EINEM", "ANDEREN SCHLOSS" },
            { "$0", "LEER", "(HASTE GECHEKT?)" },
            { "ERROR", "CANNOT DO ARITHMETIC ON A NIL VALUE", "(tier4vouchers.lua)" },
            { "ALLE GUTSCHEINE", "100% REDUZIERT", "(JEMAND HAT SIE SCHON GEKAUFT)" },
            { "VERSUCHST SPÄTER NOCHMAL", "HINWEIS: DU WIRST NICHT", "GENUG GELD HABEN" },
            { "HÄ?", '"GUTSCHEINE"?', "DAS IST NICHTMAL EIN WORT..." },
            { 'HALTE "R"', "UM ALLE GUTSCHEINE", "NACHZUFÜLLEN" },
            { "WÜSSTEST DU?", "ALT+F4 DRÜCKEN", "GIBT KOSTENLOSE GUTSCHEINE!" },
            { "TUHT MIR LEID,", "ES GIBT KEINE GUTSCHEINE", "WEGEN BUDGETVERKÜRZUNGEN" },
            { "RUFE 1-600-JIMBO AN", "UM DEINE ERFAHRUNG MIR", "GUTSCHEINEN ZU BEWERTEN" },
            { "BESIEGE", "ANTE 39 BOSS BLIND", "ZUM NACHFÜLLEN" },
            { "ZAUBERTRICK", "ICH HABE DIESEN GUTSCHEIN", "VERSCHWINDEN LASSEN" },
            { "WARUM IST EIN", "GUTSCHEIN WIE EIN", "SCHREIBTISCH?" },
            { "WIR HABEN DEINE GUTSCHEINE ZURÜCKGEZOGEN", "DEINE GUTSCHEINE WÄHREN IN", "ANDEREN DURCHLAUFEN BESSER" },
            { "WARUM NENNEN SIE ES GUTSCHEIN", "WENN ER NICHTMAL GUT GENUG IT", "ZU ERSCHEINEN" },
            { "LEIDER WURDE", "DAS GUTSCHEIN NACHFÜLL", "UPDATE ABGEBROCHEN" },
            { "BESIEGE DIE", "BOSS BLIND", "UM NICHTS ZU ÄNDERN" },
            { "DIE VÖGEL ZWITCHERN", "DIE BLUMEN BLÜHEN", "KINDER WIE DU..." },
            { "ES TUHT UNS LEID ZU SAGEN", "ALLE GUTSCHEINE WURDEN ZURÜCKGEZOGEN", "WEGEN EINEN SALMONELLENBEFALL" },
            { "GUTSCHEINE KONNTEN NICHT ANKOMMEN", "WEIL DER SHOP", "200% ÜBER DEM BUDGET IST" },
            { "DU MAGST", "GUTSCHEINE KAUFEN, NICHT WAHR?", "DU BIST EIN GUTSCHEINKÄUFER" },
            { "GUTSCHEINE", "!E", "GUTSCHEIN POOL" },
            { "ES", "GIBT KEINE", "GUTSCHEINE" },
            { "ES GIBT KEINEN", "WEINACHTSMANN", "UND AUCH KEINE GUTSCHEINE" },
            { "", "GUTNEIN", "" },
            { "DU", "HAST GERADE", "DAS SPIEL VERLOREN" },
            { "CAN ICH DIR IN DIESEN", "IN DIESEN SCHWEREN ZEITEN", "EIN SCHÖNES EI ANBIETEN?" },
            { "BERÜHRE ETWAS GRASS", "ANSTATT DIESES", "DECK ZU BENUZEN" },
            { "DU KÖNNTEST JETZT", "GERADE MIT DEM BLAUEN", "DECK SPEILEN" },
            { "KOSTENLOSE EXOTISCHE JOKER", "HOHLE SIE BEVOR", "ES ZU SPÄT IST (ausverkauft)" },
            { "DU KANNST BEWEISEN, DASS", "ICH FALSCH LIEGE INDEM", "DU DEN UNSICHBAREN GUTSCHEIN KAUFST" },
            { "", "keine gutscheine?", "" },
            { "siehst du diese werbung?", "wenn ja, dann funkioniert sie", "und du könntest sie nun für dich selbst haben" },
            { "DU VERPASST HIER", "MINDESTENS 5 GUTSCHEINE", "tonktonktonktonktonk" },
            { "10", "20 KEINE GUTSCHEINE XD", "30 GOTO 10" },
            { "GUTSCHEINE", "DIE SIND EIN PREMIUM FEATURE", "$199.99 JOLLARS ZUM FREISCHALTEN" },
            { "WAHRES GUTSCHEINLOS!?!?", "NUR AUFGESTIEGENER EINSATZ", "SEHR FAIRES DECK" },
            { "GEFÄLLT DIR DEINE", "GUTSCHEIN ERFAHRUNG? BEWERTE UNS MIT", "FÜNF STERNEN AUF JESTELP" },
            { "KOSTENLOSE GUTSCHEINE", "HEISSE GUTSCHEINE IN DEINER GEGEND!", "BEKOMME SCHNELL GUTSCHEINE MIT DIESEM LEICHTEN TRICK" },
            { "JETZT STELLE ICH DIE", "ERSTEN LEVEL 0 GUTSCHEINE VOR!", "(kommt bald in Crypid 1.0)" },
            { "EIN GUTSCHEIN!", "ES IST NUT EINE VORSTELLUNG", "WIR HABEN UNS VORGESTELLT, DASS DU IHN WILLST" },
            { "MACH DEINEN ADBLOCKER AUS!", "WIE SOLLEN WIR OHNE WERBUNG", "GUTSCHEINE VERKAUFEN" },
            { "WENN DU EIN", "PROBLEM HIERMIT HAST", "SIND WIR UNTER NORESPONSE@JMAIL.COM ERREICHBAR" },
            { "NICHT GENUG GELD", "FÜR DIESEN GUTSCHEIN", "ALSO WARUM SOLLTEN WIR IHN HIER HINTUN?" },
            { "WILLST DU EINEN GUTSCHEIN?", "HALT DIE FRESSE", "DU KRIEGST KEINE LOL" },
            { "^$%& KEINE", "GUTSCHEINE ^%&% %&$^% FOR", "$%&%%$ %&$&*%$^ YOU" },
            { "EIN GUTSCHEIN (VERTRAU MIR)", "|\\/|", "|/\\|" },
            {
                "... --- ...",
                "... .--. .. . .-.. . .-. / . -. - ... -.-. .... .-.. ..-- ... ... . .-.. - / -- --- .-. ... . / -.-. --- -.. .",
                "..-. ..-- .-. / . .. -. . -. / --. ..- - ... -.-. .... . .. -.",
            },
            { "DURCHLAUF > NEU", "STARRE INS NICHTS", "FÜR EINE ODER ZWEI STUNDEN" },
            { "TUHT UNS LEID", "DER LETZTE TYP HAT", "IN DER PANIK ALLE GUTSCHEINE GEKAUFT" },
            { "WIE FÜHLT ES SICH AN", "KEINE GUTSCHEINE", "ZU KAUFEN" },
            { "JIMBO WAR WÜTEND", "UND HAT ALLE GUTSCHEINE", "WEGGEWORFEN" },
            { "VERSUCHE INDEX IN", "FELD 'GUTSCHEIN' ZU FINDEN", "(EIN NIL WERT)" },
            {
                "HAST DU WIRKLICH ERWARTET, DASS ALL DIESE TEXT ZU LESEN DIR MÖGLICHERWEISE GUTSCHEINE BRINGEN KÖNNTE",
                "TUHT MIR LEID DIR DAS MITTEILEN ZU MÜSSEN, ABER IN DIESEM DECK EXISTIEREN GUTSCHEINE NUNMAL NICHT",
                "AUSSERDEM IST DIESER ABNORMAL LANGE TEXT NOCH EXTRA DAFÜR DA DEINE ZEIT BEIM LESEN ZU VERSCHWENDEN",
            },
            { "GEH ZU", "https://youtu.be/p7YXXieghto", "FÜR KOSTENLOSE GUTSCHEINE" },
			{ "BEDANK DICH BEI FOEGRO", "DASS ER DAS MOD AUF DEUTSCH ÜBERSETZT HAT", "STATT NUTZLOS NACH GUTSCHEINEN ZU SUCHEN" },
        }
    }
}
