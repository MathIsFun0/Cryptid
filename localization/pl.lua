--I couldn't get Meme Packs to work without crashing
--yes somehow that was harder than RNJoker
return {
    descriptions = {
        Back = {
            b_cry_antimatter = {
                name = "Antymateryjna Talia",
                text = {
                    "Aplikuje {C:legendary,E:1}zalety{}",
                    "{C:attention}każdej{} talii",
                },
            },
            b_cry_beta = {
                name = "Nostalgiczna Talia",
                text = {
                    "Miejsce na {C:attention}jokery{}",
                    "i i {C:attention}przedmioty zużywalne{} są połączone,",
                    "a {C:attention}Nostalgiczne{} przeszkadzajki",
                    "zastępują ich zaktualizowane wersje"
                },
            },
            b_cry_blank = {
                name = "Pusta Talia",
                text = {
                    "{C:inactive,E:1}Nie robi nic?",
                },
            },
			b_cry_bountiful = {
				name = "Obfita Talia",
				text = {
                    "Po {C:blue}zagraniu{} lub {C:red}zrzutce{},",
                    "zawsze dobierasz {C:attention}5{} kart"
				},
			},
            b_cry_CCD = {
                name = "Talia CCD",
                text = {
                    "Każda karta jest jednocześnie",
                    "{C:attention}losowym{} przedmiotem zużywalnym",
                },
            },
            b_cry_conveyor = {
                name = "Taśmociągowa Talia",
                text = {
                    "Jokery {C:attention}nie mogą{} zmieniać pozycji",
                    "Na początku rundy,",
                    "{C:attention}duplikuje{} jokera najbardziej wysuniętego na prawo",
                    "i {C:attention}niszczy{} najbardziej wysuniętego na lewo",
                },
            },
            b_cry_critical = {
                name = "Krytyczna Talia",
                text = {
                    "Po każdej zagranej ręce,",
                    "{C:green}#1# na 4{} szans na mnożnik {X:dark_edition,C:white} ^2 {}",
                    "{C:green}#1# na 8{} szans na mnożnik {X:dark_edition,C:white} ^0.5 {}",
                },
            },
            b_cry_encoded = {
                name = "Zakodowana Talia",
                text = {
                    "Rozpoczynasz podejście z",
                    "{C:cry_code,T:j_cry_CodeJoker}Kodowym Jokerem{} i {C:cry_code,T:j_cry_copypaste}Kopiuj/Wklej{}",
                    "Tylko {C:cry_code}Karty kodowe{} pojawiają się w sklepie",
                },
            },
            b_cry_equilibrium = {
                name = "Talia Równowagi",
                text = {
                    "Wszystkie karty mają",
                    "{C:attention}równą{} szansę",
                    "pojawienia się w sklepie,",
                    "rozpoczynasz podejście z kuponem",
                    "{C:attention,T:v_overstock_plus}Nadmiar Zapasów+",
                },
            },
            b_cry_glowing = {
                name = "Świecąca Talia",
                text = {
                    "Po pokonaniu przeszkadzajki bossa,",
                    "wszystkie wartości jokerów",
                    "są mnożone przez {X:dark_edition,C:white} X1.25 {}",
                    "{X:cry_jolly,C:white,s:0.8} Jolly#1#Open#1#Winner#1#-#1#wawa#1#person", --peak loc_vars right here
                },
            },
            b_cry_infinite = {
                name = "Nieskończona Talia",
                text = {
                    "Możesz wybrać {C:attention}dowolną",
                    "liczbę kart",
                    "{C:attention}+1{} do rozmiaru ręki",
                },
            },
            b_cry_misprint = {
                name = "Błędna Talia",
                text = {
                    "Wartości kart",
                    "i układów pokerowych",
                    "są {C:attention}losowe",
                },
            },
            b_cry_redeemed = {
                name = "Odkupiona Talia",
                text = {
                    "Przy zakupie {C:attention}kuponu{},",
                    "otrzymujesz jego {C:attention}dodatkowe poziomy",
                },
            },
            b_cry_spooky = {
                name = "Upiorna Talia",
                text = {
                    "Rozpoczynasz podejście z {C:eternal}Wieczną{} {C:attention,T:j_cry_chocolate_dice}Czekoladową Kostką",
                    "Po każdym {C:attention}wejściu{}, tworzy",
                    "{C:cry_candy}Cukierka{} lub {X:cry_cursed,C:white}Przeklętego{} jokera",
                }
            },
            b_cry_very_fair = {
                name = "Bardzo Uczciwa Talia",
                text = {
                    "{C:blue}-2{} od ręki, {C:red}-2{} od zrzutek",
                    "w każdej rundzie",
                    "{C:attention}Kupony{} nie pojawiają",
                    "się w sklepie",
                },
            },
            b_cry_wormhole = {
                name = "Tuneloczasowa Talia",
                text = {
                    "Rozpoczynasz podejście z {C:cry_exotic}egzotycznym{C:attention} jokerem",
                    "{C:attention}X20{} prawdopodobieństwa",
                    "na {C:dark_edition}Negatywy{} jokerów",
                    "{C:attention}-2{} sloty na jokera",
                },
            },
            b_cry_legendary = {
                name = "Legendarna Talia",
                text = {
                    "Rozpoczynasz podejście z {C:legendary}legendarnym{C:legendary} jokerem",
                    "{C:green}1 in 5{} szans na dodanie kolejnego",
					"po pokonaniu przeszkadzajki bossa",
                    "{C:inactive}(wymaga miejsca){}",
                },
            },
        },
        Blind = {
            bl_cry_box = {
                name = "Pudełko",
                text = {
                    "Wszystkie pospolite jokery",
                    "zostają osłabione",
                },
            },
            bl_cry_clock = {
                name = "Zegar",
                text = {
                    "+0.1X wymagań przeszkadzajki",
                    "co 3 sekundy tego wejścia",
                },
            },
            bl_cry_hammer = {
                name = "Młot",
                text = {
                    "AWszystkie karty z nieparzystą",
                    "rangą zostają osłabione",
                },
            },
            bl_cry_joke = {
                name = "Żart",
                text = {
                    "Jeśli końcowy wynik przekracza >2X wymagań przeszkadzajki",
                    "ustawia wejście na #1#",
                },
            },
            bl_cry_magic = {
                name = "Magia",
                text = {
                    "Wszystkie karty z parzystą",
                    "rangą zostają osłabione",
                },
            },
            bl_cry_lavender_loop = {
                name = "Lawendowa Pętla",
                text = {
                    "1,25x wymagań przeszkadzajki",
                    "co 1,5 sekundy tego wejścia",
                },
            },
            bl_cry_obsidian_orb = {
                name = "Obsidianowa Kula",
                text = {
                    "Aplikuje zdolności",
                    "wszystkich pokonanych bossów",
                },
            },
            bl_cry_oldarm = {
                name = "Nostalgiczne Ramię",
                text = {
                    "Należy zagrać 4",
                    "albo mniej kart",
                },
            },
            bl_cry_oldfish = {
                name = "Nostalgiczna Ryba",
                text = {
                    "Wszystkie ręce zaczynają",
                    "z mnożnikiem 1",
                },
            },
            bl_cry_oldflint = {
                name = "Nostalgiczny Flint",
                text = {
                    "Kolor nie może być zagrany",
                },
            },
            bl_cry_oldhouse = {
                name = "Nostalgiczny Dom",
                text = {
                    "Full House nie może być zagrany",
                },
            },
            bl_cry_oldmanacle = {
                name = "Nostalgiczne Kajdany",
                text = {
                    "Mnożnik dzieli się przez zrzutki",
                },
            },
            bl_cry_oldmark = {
                name = "Nostalgiczny Znak",
                text = {
                    "Układy z Parą",
                    "nie mogą być zagrane",
                },
            },
            bl_cry_oldox = {
                name = "Nostalgiczny Wół",
                text = {
                    "Wszystkie ręce",
                    "zaczynają bez żetonów",
                },
            },
            bl_cry_oldpillar = {
                name = "Nostalgiczny Filar",
                text = {
                    "Strit nie może być zagrany",
                },
            },
            bl_cry_oldserpent = {
                name = "Nostalgiczny Wąż",
                text = {
                    "Mnożnik dzieli się",
                    "przez poziom układu pokerowego",
                },
            },
            bl_cry_pin = {
                name = "Szpilka",
                text = {
                    "Epickie i egzotyczne jokery",
                    "zostają osłabione",
                },
            },
            bl_cry_pinkbow = {
                name = "Różowa Kokardka",
                text = {
                    "Losuje rangi kart",
                    "trzymanych w ręce podczas zagrania",
                },
            },
            bl_cry_sapphire_stamp = {
                name = "Szafirowy Znaczek",
                text = {
                    "Wybiera dodatkową kartę",
                    "usuwa losową przed punktacją",
                },
            },
            bl_cry_shackle = {
                name = "Szekla",
                text = {
                    "Wszystkie negatywy jokerów",
                    "zostają osłabione",
                },
            },
            bl_cry_striker = {
                name = "Napastnik",
                text = {
                    "Wszystkie rzadkie jokery",
                    "zostają osłabione",
                },
            },
            bl_cry_tax = {
                name = "Podatek",
                text = {
                    "Wynik ręki ograniczony",
                    "do 0,4-krotności przeszkadzajki",
                },
            },
            bl_cry_tornado = {
                name = "Turkusowe Tornado",
                text = {
                    "#1# na #2# szans, że",
                    "zagrana ręka nie zdobędzie punktów",
                },
            },
            bl_cry_trick = {
                name = "Sztuczka",
                text = {
                    "Po każdej ręce, wszystkie karty w dłoni",
                    "zostają obrócone",
                },
            },
            bl_cry_vermillion_virus = {
                name = "Cynobrowy Wirus",
                text = {
                    "Podczas każdej ręki, jeden losowy joker",
                    "zostaje permanentnie zastąpiony innym jokerem",
                },
            },
            bl_cry_windmill = {
                name = "Wiatrak",
                text = {
                    "Wszystkie niepospolite jokery",
                    "zostają osłabione",
                },
            },
        },
        Code = {
            c_cry_class = {
                name = "://CLASS",
                text = {
                    "Przekształca {C:cry_code}#1#{} wybraną kartę",
                    "na {C:cry_code}dowolne{} ulepszenie",
                },
            },
            c_cry_commit = {
                name = "://COMMIT",
                text = {
                    "Niszczy {C:cry_code}wybranego{} jokera,",
                    "tworzy {C:cry_code}nowego{} jokera",
                    "o tej samej {C:cry_code}rzadkości",
                },
            },
            c_cry_crash = {
                name = "://CRASH",
                text = {
                    "{C:cry_code,E:1}Nie.",
                },
            },
            c_cry_ctrl_v = {
                name = "://CTRL+V",
                text = {
                    "Tworzy {C:cry_code}kopię{} wybranej karty",
                    "lub przedmiotu zużywalnego"
                },
            },
            c_cry_delete = {
                name = "://DELETE",
                text = {
                    "{C:cry_code}Permanentnie{} usuwa",
                    "{C:cry_code}wybrany{} przedmiot ze sklepu",
                    "{C:inactive,s:0.8}Przedmiot nie może ponownie pojawić się w trakcie podejścia",
                },
            },
            c_cry_divide = {
                name = "://DIVIDE",
                text = {
                    "Obniża o {C:cry_code}połowę{} wszystkie ceny",
                    "w obecnym sklepie",
                },
            },
            c_cry_exploit = {
                name = "://EXPLOIT",
                text = {
                    "Następna ręka jest liczona jako",
                    "{C:cry_code}wybrany{} układ pokerowy,",
                    "resetuje się na koniec rundy",
                    "{C:inactive,s:0.8}Sekretne ręce muszą być",
                    "{C:inactive,s:0.8}odkryte aby można było z nich skorzystać",
                },
            },
            c_cry_hook = {
                name = "HOOK://",
                text = {
                    "Wybierz dwa jokery, które zostaną {C:cry_code}Zahaczone",
                    "{C:inactive,s:0.8}Działają poprawnie jeśli jokery aktywują się w tym samym kontekście,",
                    "{C:inactive,s:0.8}jak na przykład Joker i Duet (oba po zdobyciu punktów)",
                },
            },
			c_cry_inst = {
				name = "://INSTANTIATE",
				text = {
					"Dobiera kartę z {C:cry_code}rangą{}",
					"wybranej karty i jedną z jej {C:cry_code}kolorem{}",
					"{C:inactive}(jeśli to możliwe){}",
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
                text = { "{C:cry_code}Wszystkie karty w ręcę", "zostają {C:dark_edition}zglitchowane{}"},
            },
            c_cry_merge = {
                name = "://MERGE",
                text = {
                    "Scala wybrany {C:cry_code}przedmiot zużywalny",
                    "z wybraną {C:cry_code}kartą rozgrywającą",
                },
            },
            c_cry_multiply = {
                name = "://MULTIPLY",
                text = {
                    "{C:cry_code}Podwaja{} wartości",
                    "wybranego {C:cry_code}jokera{}",
                    "do końca rundy",
                },
            },
	    c_cry_patch = {
		name = "://PATCH",
		text = {
			"Usuwa wszystkie osłabienia i",
			"naklejki z obecnych kart",
	    	},
	    },
            c_cry_payload = {
                name = "://PAYLOAD",
                text = {
                    "Następna pokonana przeszkadzajka ",
                    "daje {C:cry_code}potrójne{} odsetki",
                },
            },
            c_cry_oboe = {
                name = "://OFFBYONE",
                text = {
                    "Następna {C:cry_code}paczka wzmacniająca{} ma",
                    "{C:cry_code}dodatkową{} kartę i",
                    "{C:cry_code}dodatkowy{} wybór",
                    "{C:inactive}(Obecnie {C:cry_code}+#2#{C:inactive})",
                },
            },
            c_cry_reboot = {
                name = "://REBOOT",
                text = {
                    "Uzupełnia {C:blue}ręce{} i {C:red}zrzutki{},",
                    "{C:cry_code}wszystkie{} karty wracają do talii,",
                    "runda rozpoczyna się {C:cry_code}od nowa{}",
                },
            },
            c_cry_revert = {
                name = "://REVERT",
                text = {
                    "Cofa {C:cry_code}stan gry{} do",
                    "początku {C:cry_code}tego wejścia{}",
                },
            },
            c_cry_rework = {
                name = "://REWORK",
                text = {
                    "Niszczy {C:cry_code}wybranego{} jokera,",
                    "tworzy {C:cry_code}znacznik przeróbki{} z",
                    "{C:cry_code}ulepszoną{} edycją",
                    "{C:inactive,s:0.8}Ulepsza w kolejności z Kolekcji",
                },
            },
            c_cry_run = {
                name = "://RUN",
                text = {
                    "Odwiedź {C:cry_code}sklep",
                    "w trakcie {C:cry_code}przeszkadzajki",
                },
            },
            c_cry_seed = {
                name = "://SEED",
                text = {
                    "Wybrany joker",
                    "lub karta rozgrywająca",
                    "zostaje {C:cry_code}zawsze aktywowana",
                },
            },
            c_cry_semicolon = {
                name = ";//",
                text = { "Kończy obecną przeszkadzajkę {C:cry_code}w ciemno{}", "{C:cry_code}bez{} wypłaty" },
            },
            c_cry_spaghetti = {
                name = "://SPAGHETTI",
                text = {
                    "Tworzy {C:cry_code}zglitchowanego",
                    "kulinarnego jokera",
                },
            },
            c_cry_variable = {
                name = "://VARIABLE",
                text = {
                    "Przekształca {C:cry_code}#1#{} wybrane karty",
                    "na {C:cry_code}wybraną{} rangę",
                },
            },
        },
        Edition = {
            e_cry_astral = {
                name = "Astralna",
                text = {
                    "Mnoż. {X:dark_edition,C:white}^#1#{}",
                },
            },
            e_cry_blur = {
                name = "Niewyraźna",
                text = {
                    "{C:attention}Aktywuje ponownie{} kartę",
                    "z tą {C:dark_edition}edycją{}",
                    "{C:green}#1# na #2#{} szans",
                    "na aktyowanie ponownie",
                    "po raz kolejny",
                },
            },
            e_cry_double_sided = {
                name = "Dwustronna",
                text = {
                    "Tę kartę można",
                    "{C:attention}odwrócić{}, aby",
                    "odkryć inną kartę",
                    "{C:inactive}(Pusta strona może być połączona",
					"{C:inactive}z inną kartą)",
                },
            },
            e_cry_glass = {
                name = "Krucha",
                label = "Fragile",
                text = {
                    "Mnoż. {C:white,X:mult} X#3# {}",
                    "{C:green}#1# na #2#{} szans",
                    "że ta karta {C:red}nie ulegnie zniszczeniu",
                    "kiedy zostanie aktywowana",
                },
            },
            e_cry_glitched = {
                name = "Zglitchowana",
                text = {
                    "Wszystkie wartości tej karty",
                    "są {C:dark_edition}losowe{}",
                    "pomiędzy {C:attention}X0.1{} a {C:attention}X10{}",
                    "{C:inactive}(Jeśli to możliwe){}",
                },
            },
            e_cry_gold = {
                name = "Złota",
                label = "Golden",
                text = {
                    "Zarabiasz {C:money}$#1#{} kiedy zostaje użyta",
                    "lub uruchomiona",
                },
            },
            e_cry_m = {
                name = "Wesoła",
                text = {
                    "Mnoż. {C:mult}+#1#{}",
                    "Ta karta jest",
                    "raczej {C:attention}wesoła{}",
                },
            },
            e_cry_mosaic = {
                name = "Mozaiczna",
                text = {
                    "{X:chips,C:white} X#1# {} żet.",
                },
            },
            e_cry_noisy = {
                name = "Hałaśliwa",
                text = {
                    "???",
                },
            },
            e_cry_oversat = {
                name = "Przesycona",
                text = {
                    "Wszystkie wartości",
                    "na tej karcie",
                    "są {C:attention}podwojone{}",
                    "{C:inactive}(Jeśli to możliwe)",
                },
            },
        },
        Enhanced = {
            m_cry_echo = {
                name = "Karta Echa",
                text = {
                    "{C:green}#2# na #3#{} szans",
                    "na {C:attention}ponowną aktywacje{} dodatkowe #1#",
                    "razy kiedy zdobywa punkty",
                },
            },
        },
        Joker = {
            j_cry_adroit = {
                name = "Zręczny Joker",
                text = {
                    "{C:chips}+#1#{} żet., jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_altgoogol = {
                name = "Nostalgiczna karta Googol Play",
                text = {
                    "Sprzedaj tę kartę, aby stworzyć",
                    "{C:attention}2{} kopie {C:attention}jokera najbardziej wysuniętego na lewo{}",
                    "{C:inactive,s:0.8}Nie kopiuje Nostalgicznej Karty Googol Play{}",
                },
            },
            j_cry_antennastoheaven = {
                name = "...Niczym anteny do nieba",
                text = {
                    "Ten joker zdobywa",
                    "{X:chips,C:white} X#1# {} żet., kiedy każda",
                    "zagrana {C:attention}7{} lub {C:attention}4{} zdobywa punkty",
                    "{C:inactive}(obecny mnoż. żetonów: {X:chips,C:white}X#2# {C:inactive})",
                },
            },
            j_cry_apjoker = {
                name = "AP Joker",
                text = { "Mnoż. {X:mult,C:white} X#1# {} przeciwko {C:attention}Przeszkadzajkom Bossa{}" },
            },
            j_cry_astral_bottle = {
                name = "Astral w butelce",
                text = {
                    "Kiedy ten joker jest sprzedany, {C:attention}losowy joker{}",
                    "staje się {C:dark_edition}astralny{} i",
                    "{C:attention}nietrwały{}",
                }
            },
            j_cry_big_cube = {
                name = "Duża kostka",
                text = {
                    "{X:chips,C:white} X#1# {} żet.",
                },
            },
            j_cry_biggestm = {
                name = "ogroMny",
                text = {
                    "Mnoż. {X:mult,C:white} X#1# {} do końca rundy",
                    "jeśli {C:attention}zagrana ręka{}",
                    "to {C:attention}#2#{}",
                    "{C:inactive}(obecnie: {C:attention}#3#{}{C:inactive}){}",
                    "{C:inactive,s:0.8}nie jestem gruby, jestem grubokościsty!",
                },
            },
            j_cry_blacklist = {
                name = "Czarna lista",
                text = {
                    "Jeśli karta o randze {C:attention}#1#{} jest w dłoni lub zdobywa punkty,",
                    "ustawia {C:chips}żetony{} i {C:mult}mnożnik{} na 0",
                    "{C:red,E:2}Ulega samozniszczeniu{} jeśli kart o randze {C:attention}#1#{} nie będzie w talii ",
                    "{C:inactive,s:0.8}Ranga się nie zmienia"
                }
            },
            j_cry_blender = {
                name = "Blender",
                text = {
                    "Tworzy {C:attention}losowy{}",
                    "przedmiot zużywalny, kiedy",
                    "{C:cry_code}Karta Kodowa{} jest użyta",
                    "{C:inactive}(wymaga miejsca){}",
                },
            },
            j_cry_blurred = {
                name = "Niewyraźny Joker",
                text = {
                    "Zyskujesz {C:blue}+#1#{} do ręki,",
                    "kiedy {C:attention}przeszkadzajka{} jest wybrana",
                },
            },
            j_cry_bonk = {
                name = "Bęc!",
                text = {
                    "Każdy {C:attention}joker{} daje {C:chips}+#1#{} żet.",
                    "Zwiększa ilość o {C:chips}+#2#{}, jeśli",
                    "zagrana {C:attention}ręka{} to {C:attention}#3#{}",
                    "{C:inactive,s:0.8}Wesołe Jokery{} dostają {C:chips,s:0.8}+#4#{} {C:inactive,s:0.8}żet.{}",
                },
            },
            j_cry_bonkers = {
                name = "Porąbany Joker",
                text = {
                    "Mnoż. {C:red}+#1#{} jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_bonusjoker = {
                name = "Bonusowy Joker",
                text = {
                    "{C:green}#1# na #2#{} szans dla każdej",
                    "zagranej {C:attention}Karty Bonusowej{} na zwiększenie",
                    "slotów na {C:attention}jokera{} lub {C:attention}przedmioty zużywalne",
                    "o {C:dark_edition}1{} po zdobyciu punktów",
                    "{C:red}Działa dwa razy na rundę",
                    "{C:inactive,s:0.8}(Równa szansa dla każdej){}",
                },
            },
            j_cry_booster = {
                name = "Wzmacniający Joker",
                text = {
                    "{C:attention}+#1#{} slot na paczkę wzmacniającą",
                    "w sklepie",
                },
            },
            j_cry_boredom = {
                name = "Znudzenie",
                text = {
                    "{C:green}#1# na #2#{} szans na",
                    "{C:attention}ponowną aktywację{} każdego {C:attention}jokera{}",
                    "lub {C:attention}karty rozgrywającej{}",
                    "{C:inactive,s:0.8}nie dotyczy Znudzenia{}",
                },
            },
            j_cry_brittle = {
                name = "Krokantowy cukierek",
                text = {
                    "Przez następne {C:attention}#1#{} rąk,",
                    "aplikuje Kartę {C:attention}Kamienną{}, {C:attention}Złotą{} lub {C:attention}Stalową{} do",
                    "najbardziej wysuniętej na prawo karty, która zdobyła punkty"
                }
            },
            j_cry_bubblem = {
                name = "Bubble M",
                text = {
                    "Tworzy {C:attention}Wesołego Jokera{} {C:dark_edition}w folii,",
                    "jeśli zagrana",
                    "ręka zawiera {C:attention}#1#{}",
                    "{C:red,E:2}Ulega samozniszczeniu{}",
                },
            },
            j_cry_busdriver = {
                name = "Kierowca busa",
                text = {
                    "{C:green}#1# na #3#{} szans",
                    "na mnoż. {C:mult}+#2#{}",
                    "{C:green}1 na 4{} szans",
                    "na mnoż. {C:mult}-#2#{}",
                },
            },
            j_cry_candy_basket = {
                name = "Kosz słodyczy",
                text = {
                    "Sprzedaj tę kartę, aby stworzyć {C:attention}#1#{} {C:cry_candy}Cukierków",
                    "{C:attention}+#2#{} {C:cry_candy}Cukierek{} co {C:attention}2{} pokonane przeszkadzajki",
                    "{C:attention}+#3#{} {C:cry_candy}Cukierki{}, kiedy {C:attention}Przeszkadzajka Bossa{} jest pokonana"
                }
            },
            j_cry_candy_buttons = {
                name = "Guziki cukierkowe",
                text = {
                    "Następne {C:attention}#1#{} ponownych rzutów",
                    "kosztuje {C:money}$1{}",
                }
            },
            j_cry_candy_cane = {
                name = "Laska cukrowa",
                text = {
                    "Przez następne {C:attention}#1#{} rund,",
                    "zagrane karty dają {C:money}$#2#,",
                    "kiedy są {C:attention}aktywowane ponownie"
                }
            },
            j_cry_candy_dagger = {
                name = "Cukierkowy sztylet",
                text = {
                    "Kiedy {C:attention}Przeszkadzajka{} jest wybrana,",
                    "niszczy jokera po prawej",
                    "i tworzy {C:cry_candy}Cukierka{}",
                }
            },
	    j_cry_candy_sticks = {
		name = "Cukrowe Pałeczki",
		text = {
			"Efekt przeszkadzajki następnego bossa nie jest aktywny,",
			"dopóki nie zagrasz {C:attention}#1#{} ręki",
	   	}
	    },
            j_cry_canvas = {
                name = "Płótno",
                text = {
                    "{C:attention}Aktywuj ponownie{} wszystkie {C:attention}jokery{} z lewej strony",
                    "za {C:attention}każdego{} {C:blue}niepospolitego{C:attention} jokera{}",
                    "po prawej stronie",
                },
            },
            j_cry_caramel = {
                name = "Karmel",
                text = {
                    "Każda zagrana karta",
                    "daje mnoż. {X:mult,C:white}X#1#{} przy zdobyciu punktów",
                    "przez następne {C:attention}#2#{} rund",
                },
            },
            j_cry_chad = {
                name = "Chad",
                text = {
                    "Aktywuje {C:attention}jokera najbardziej wysuniętego na lewo{}",
                    "jeszcze {C:attention}#1#{} razy",
                },
            },
            j_cry_chili_pepper = {
                name = "Papryczka chilli",
                text = {
                    "Ten joker zdobywa {X:mult,C:white} X#2# {} do mnożnika",
                    "na końcu rundy,",
                    "{C:red,E:2}Ulega samozniszczeniu{} po {C:attention}#3#{} rundach",
                    "{C:inactive}(obecny mnoż.:{} {X:mult,C:white} X#1# {}",
                },
            },
            j_cry_chocolate_dice = {
                name = "Czekoladowa kostka",
                text = {
                    "Rzuca {C:green}kostką d10{}, kiedy",
                    "{C:attention}Przeszkadzajka Bossa{} jest pokonana,",
                    "aby zacząć {C:cry_ascendant,E:1}zdarzenie",
                    "{C:inactive}(obecne zdarzenie: #1#)"
                },
            },
            j_cry_circulus_pistoris = {
                name = "Circulus Pistoris",
                text = {
                    "{X:dark_edition,C:white}^#1#{} żet. i mnoż. {X:dark_edition,C:white}^#1#{}, jeśli",
                    "zostały {C:attention}dokładnie{} #2#",
                    "ręce",
                },
            },
            j_cry_circus = {
                name = "Cyrk",
                text = {
                    "{C:red}Rzadkie{} jokery dają mnoż. {X:mult,C:white} X#1# {}",
                    "{C:cry_epic}Epickie{} jokery dają mnoż. {X:mult,C:white} X#2# {}",
                    "{C:legendary}Legendarne{} jokery dają mnoż. {X:mult,C:white} X#3# {}",
                    "{C:cry_exotic}Egzotyczne{} jokery dają mnoż. {X:mult,C:white} X#4# {}",
                },
            },
            j_cry_clash = {
                name = "Starcie",
                text = {
                    "Mnoż. {X:mult,C:white} X#1# {}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#",
                },
            },
            j_cry_CodeJoker = {
                name = "Kodowy Joker",
                text = {
                    "Tworzy {C:dark_edition}Negatyw{}",
                    "{C:cry_code}Karty Kodowej{}, kiedy",
                    "{C:attention}przeszkadzajka{} jest wybrana",
                },
            },
            j_cry_coin = {
                name = "Kryptomoneta",
                text = {
                    "Zyskujesz pomiędzy",
                    "{C:money}$#1#{} a {C:money}$#2#{} za",
                    "każdego {C:attention}sprzedanego{} jokera",
                },
            },
            j_cry_compound_interest = {
                name = "Odsetkowy szał",
                text = {
                    "Zdobywasz {C:money}#1#%{} całkowitej ilości pieniędzy",
                    "na koniec rundy,",
                    "zwiększa się o {C:money}#2#%{} przy",
                    "każdej następnej wypłacie",
                },
            },
            j_cry_copypaste = {
                name = "Kopiuj/Wklej",
                text = {
                    "Kiedy {C:cry_code}Karta Kodowa{} jest użyta,",
                    "{C:green}#1# na #2#{} szans na dodanie jej kopii",
                    "do twojego obszaru przedmiotów zużywalnych",
                    "{C:inactive}(wymaga miejsce)",
                },
            },
            j_cry_cotton_candy = {
                name = "Wata cukrowa",
                text = {
                    "Kiedy ta karta zostaje sprzedana, sąsiadujące",
                    "{C:attention}jokery{} dostają {C:dark_edition}Negatywy{}"
                },
            },
            j_cry_crustulum = {
                name = "Crustulum",
                text = {
                    "Ten joker zdobywa {C:chips}+#2#{} do żet.",
                    "za {C:attention}ponowny rzut{} w sklepie",
                    "{C:green}Wszystkie ponowne rzuty są darmowe{}",
                    "{C:inactive}(obecnie: {C:chips}+#1#{C:inactive} żet.)",
                },
            },
            j_cry_cryptidmoment = {
                name = "M Łańcuch",
                text = {
                    "Sprzedaj tę kartę,",
                    "aby dodać {C:money}$#1#{} {C:attention}wartości sprzedaży{}",
                    "do każdego {C:attention}jokera{}",
                },
            },
            j_cry_cube = {
                name = "Sześcian",
                text = {
                    "{C:chips}+#1#{} żet.",
                },
            },
            j_cry_curse_sob = {
                name = "Szloch",
                text = {
                    "{C:edition,E:1}nie możesz{} {C:cry_ascendant,E:1}biec...{}",
                    "{C:edition,E:1}nie możesz{} {C:cry_ascendant,E:1}się ukryć...{}",
                    "{C:dark_edition,E:1}nie możesz uciec...{}",
                    "{C:inactive}(wymaga miejsca){}",
                },
            },
            j_cry_cursor = {
                name = "Kursor",
                text = {
                    "Ten joker zdobywa {C:chips}+#2#{} żet.",
                    "za każdą {C:attention}kupioną{} kartę",
                    "{C:inactive}(obecnie {C:chips}+#1#{C:inactive} żet.)",
                },
            },
            j_cry_cut = {
                name = "Cięcie",
                text = {
                    "Ten joker niszczy",
                    "losową {C:cry_code}Kartę Kodową{}",
                    "i zyskuje {X:mult,C:white} X#1# {} do mnożnika",
                    "na koniec {C:attention}sklepu{}",
                    "{C:inactive}(obecny mnoż.: {X:mult,C:white} X#2# {C:inactive})",
                },
            },
            j_cry_delirious = {
                name = "Majaczący Joker",
                text = {
                    "Mnoż. {C:red}+#1#{}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_discreet = {
                name = "Dyskretny Joker",
                text = {
                    "{C:chips}+#1#{} żet., jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_doodlem = {
                name = "gryzMoły",
                text = {
                    "Tworzy 2 {C:dark_edition}Negatywy{} {C:attention}przedmiotów zużywalnych,{}",
                    "kiedy {C:attention}Przeszkadzajka{} jest wybrana",
                    "Tworzy 1 więcej {C:attention}przedmiot zużywalny",
                    "za każdego {C:attention}Wesołego Jokera{}",
                },
            },
            ["j_cry_Double Scale"] = {
                name = "Podwójna skala",
                text = {
                    "Skalujące {C:attention}jokery{}",
                    "skalują się {C:attention}kwadratowo",
                    "{C:inactive,s:0.8}(np. +1, +3, +6, +10)",
                    "{C:inactive,s:0.8}(rośną o  +1, +2, +3)",
                },
            },
            j_cry_dropshot = {
                name = "Zrzut z góry",
                text = {
                    "Ten joker zdobywa {X:mult,C:white} X#1# {} do mnożnika",
                    "za każdą kartę o kolorze {V:1}#2#{}, która {C:attention}nie zdobyła{} punktów",
                    "Kolor zmienia się co rundę",
                    "{C:inactive}(obecny mnoż.: {X:mult,C:white} X#3# {C:inactive})",
                },
            },
            j_cry_dubious = {
                name = "Wątpliwy Joker",
                text = {
                    "{C:chips}+#1#{} żet., jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_duos = {
                name = "Duety",
                text = {
                    "Mnoż. {X:mult,C:white} X#1# {}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#",
                },
            },
            j_cry_duplicare = {
                name = 'Duplicare',
                text = {
                    "Ten joker zdobywa {X:mult,C:white} X#2# {} do mnożnika,",
                    "kiedy {C:attention}joker{} lub",
                    "karta rozgrwająca zdobywa punkty",
                    "{C:inactive}(obecny mnoż.: {X:mult,C:white} X#1# {C:inactive})",
                }
            },
            j_cry_effarcire = {
                name = "Effarcire",
                text = {
                    "Dobiera {C:green}pełną talię{} do ręki,",
                    "kiedy {C:attention}Przeszkadzajka{} jest wybrana",
                    "{C:inactive,s:0.8}\"Jeśli nie potrafisz mnie znieść przy 1x,",
                    "{C:inactive,s:0.8}to nie zasługujesz na mnie przy 2x\"",
                },
            },
            j_cry_energia = {
                name = "Energia",
                text = {
                    "Kiedy {C:attention}znacznik{} jest pozyskany,",
                    "tworzy jego {C:attention}#1#{} kopie",
                    "i {C:attention}zwiększa{} ilość",
                    "kopii o {C:attention}#2#",
                },
            },
            j_cry_equilib = {
                name = "As równowagi",
                text = {
                    "Jokery pojawiają się",
                    "według kolejności z {C:attention}kolekcji{}",
                    "Tworzy {C:attention}#1#{} {C:dark_edition}Negatywy{} jokerów,",
                    "kiedy ręka jest zagrana",
                    "{C:cry_exotic,s:0.8}Egzotyczne {C:inactive,s:0.8}lub lepsze jokery nie mogą się pojawić",
                    "{s:0.8}Ostatni utworzony joker: {C:attention,s:0.8}#2#",
                },
            },
            j_cry_error = {
                name = "{C:red}ERR{}{C:dark_edition}O{}{C:red}R{}",
                text = {
                    "",
                },
            },
            j_cry_eternalflame = {
                name = "Wieczny płomień",
                text = {
                    "Ten joker zdobywa {X:mult,C:white} X#1# {} do mnożnika",
                    "za każdą {C:attention}sprzedaną{} kartę",
                    "{C:inactive}(obecny mnoż.: {X:mult,C:white} X#2# {C:inactive}",
                },
            },
            j_cry_exoplanet = {
                name = "Egzoplaneta",
                text = {
                    "Wszystkie karty {C:dark_edition}holograficzne{}",
                    "dają mnoż. {C:mult}+#1#{}",
                },
            },
            j_cry_exponentia = {
                name = "Exponentia",
                text = {
                    "Ten joker zdobywa {X:dark_edition,C:white} ^#1# {} do mnożnika,",
                    "kiedy {X:red,C:white} XMnożnik {} jest aktywowany",
                    "{C:inactive}(obecny mnoż.: {X:dark_edition,C:white} ^#2# {C:inactive})",
                },
            },
	    j_cry_exposed = {
                name = "Zdemaskowany",
                text = {
                    "Aktywuj ponownie wszystkie {C:attention}karty numerowane{}",
		    "jeszcze {C:attention}#1#{} razy",
                    "Wszystkie {C:attention}figury karciane{} zostają osłabione",
                },
            },
            j_cry_facile = {
                name = "Łatwizna",
                text = {
                    "Mnoż. {X:dark_edition,C:white}^#1#{}, jeśli",
                    "zagrane karty zdobyły punkty",
                    "{C:attention}#2#{} lub więcej razy",
                },
            },
            j_cry_filler = {
                name = "Wypełniacz",
                text = {
                    "Mnoż. {X:mult,C:white} X#1# {}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#",
                },
            },
            j_cry_fractal = {
                name = "Fraktalne palce",
                text = {
                    "{C:attention}+#1#{} do limitu wyboru kart",
                },
            },
            j_cry_flip_side = {
                name = "Z drugiej strony",
                text = {
                    "{C:dark_edition}Dwustronne{} jokery używają",
                    "swojej tylnej strony do efektów",
                    "zamiast przedniej strony",
                    "{C:attention}Atywuj ponownie{} wszystkie {C:dark_edition}dwustronne{} jokery"
                },
            },
            j_cry_foodm = {
                name = "Fast Foodowe M",
                text = {
                    "Mnoż. {C:mult}+#1#{}",
                    "{C:red,E:2}Ulega samozniszczeniu{} po {C:attention}#2#{} rundach",
                    "Wzrasta o {C:attention}#3#{} rund, jeśli",
                    "{C:attention}Wesoły Joker{} jest {C:attention}sprzedany{}",
                    "{C:inactive,s:0.8}2 McDouble, 2 McChickeny{}",
                    "{C:inactive,s:0.8}Duże Frytki, 20 Nuggetsów & Duża Cola{}",
                },
            },
            j_cry_foolhardy = {
                name = "Lekkomyślny Joker",
                text = {
                    "Mnoż. {C:red}+#1#{}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
	    j_cry_formidiulosus = {
		    name = "Formidiulosus",
		    text = {
		    	"Kiedy {X:cry_cursed,C:white}przeklęty{} joker jest pozyskany, niszczy go",
			"i tworzy {C:attention}#1#{} {C:dark_edition}Negatywy {C:cry_candy}Cukierków{} na koniec sklepu",
			"Każdy posiadany {C:cry_candy}Cukierek{} daje {X:dark_edition,C:white}^#2#{} do mnożnika",
			"{C:inactive}(obecny mnoż.: {X:dark_edition,C:white}^#3#{C:inactive})",
		    },
	    },
            j_cry_foxy = {
                name = "Sprytny Joker",
                text = {
                    "{C:chips}+#1#{} żet., jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_fspinner = {
                name = "Fidget spinner",
                text = {
                    "Ten joker zdobywa {C:chips}+#2#{} do żetonów,",
                    "jeśli zagrana ręka {C:attention}nie jest{}",
                    "najczęściej granym {C:attention}układem pokerowym{}",
                    "{C:inactive}(obecnie: {C:chips}+#1#{C:inactive} żet.)",
                },
            },
            j_cry_fuckedup = {
                name = "Pierdolnięty Joker",
                text = {
                    "Mnoż. {C:red}+#1#{}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_gardenfork = {
                name = "Ogród rozgałęziających się ścieżek",
                text = {
                    "Zyskujesz {C:money}$#1#{}, jeśli {C:attention}zagrana ręka{}",
                    "zawiera {C:attention}Asa{} i {C:attention}7{}",
                },
            },
            j_cry_gemino = {
                name = "Bliźnięta",
                text = {
                    "{C:attention}Podwaja{} wszystkie wartości",
                    "{C:attention}jokera najbardziej wysuniętego na lewo{}",
                    "na koniec rundy",
                },
            },
            j_cry_ghost = {
                name = "Duch",
                text = {
                    "Na koniec rundy:",
                    "{C:green}#1# na #2#{} szans",
                    "na {C:attention}opętanie{} losowego {C:attention}jokera",
                    "{C:green}#1# na #3#{} szans na",
                    "{E:2,C:red}samozniszczenie"
                }
            },
            j_cry_giggly = {
                name = "Absurdalny Joker",
                text = {
                    "Mnoż. {C:red}+#1#{}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_goldjoker = {
                name = "Złoty Joker",
                text = {
                    "Zyskujesz {C:money}#1#%{} całkowitej",
                    "ilości pieniędzy na koniec rundy",
                    "Wypłata rośnie o {C:money}#2#%{} za każdym razem,",
                    "kiedy Karta {C:attention}Złota{}",
                    "zdobywa punkty",
                },
            },
            j_cry_googol_play = {
                name = "Karta Googol Play",
                text = {
                    "{C:green}#1# na #2#{} szans",
                    "na mnoż. {X:red,C:white} X#3# {}",
                },
            },
            j_cry_happy = {
                name = ":D",
                text = {
                    "Tworzy losowego {C:attention}jokera{}",
                    "na końcu rundy",
                    "Sprzedaj tę kartę,",
                    "aby stworzyć losowego {C:attention}jokera{}",
                    "{C:inactive}(wymaga miejsca){}",
                },
            },
            j_cry_happyhouse = {
                name = "Szczęśliwy dom",
                text = {
                    "Mnożnik {X:dark_edition,C:white}^#1#{} po zagraniu",
                    "{C:attention}114{} rąk{}",
                    "{C:inactive}(Obecnie #2#/114){}",
                    "{C:inactive,s:0.8}Nie ma jak w domu!{}",
                },
            },
            j_cry_home = {
                name = "Dom",
                text = {
                    "Mnoż. {X:mult,C:white} X#1# {}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#",
                },
            },
            j_cry_hunger = {
                name = "Do schrupania",
                text = {
                    "Zyskujesz {C:money}$#1#{}, kiedy",
                    "używasz {C:attention}przedmiotu zużywalnego{}",
                },
            },
            j_cry_iterum = {
                name = "Iterum",
                text = {
                    "Aktywuj ponownie wszystkie zagrane karty",
                    "{C:attention}#2#{} razy,",
                    "Każda zagrana karta zdobywa",
                    "mnoż. {X:mult,C:white} X#1# {} kiedy zdobywa punkty",
                },
            },
            j_cry_jawbreaker = {
                name = "Łamiszczęka",
                text = {
                    "Kiedy {C:attention}Przeszkadzajka{} jest pokonana,",
                    "{C:attention}podwaja{} wartości sąsiadujących jokerów",
                    "{E:2,C:red}Ulega samozniszczeniu{}",
                }
            },
            j_cry_jimball = {
                name = "Jimball",
                text = {
                    "Ten joker zdobywa {X:mult,C:white} X#1# {} do mnożnika",
                    "za {C:kattention}kolejne{} zagrywane ręce",
                    "z twoim",
                    "najczęściej zagrywanym {C:attention}układem pokerowym",
                    "{C:inactive}(obecny mnoż. {X:mult,C:white} X#2# {C:inactive}",
                },
            },
            j_cry_jollysus = {
                name = "Wesoły Joker?",
                text = {
                    "Tworzy {C:dark_edition}Wesołego{} Jokera,",
                    "kiedy joker jest {C:attention}sprzedany{}",
                    "{C:red}Działa raz na rundę{}",
                    "{C:inactive}#1#{}",
                    "{C:inactive,s:0.8}Wygląda legitnie...{}",
                },
            },
            j_cry_kidnap = {
                name = "Porwanie",
                text = {
                    "Zyskujesz {C:money}$#2#{} na końcu rundy",
                    "Wypłata rośnie o {C:money}$#1#{}",
                    "kiedy Joker {C:attention}mnożnikowy{} lub",
                    "{C:attention}żetonowy{} zostaje sprzedany",
                },
            },
            j_cry_kooky = {
                name = "Szurnięty Joker",
                text = {
                    "Mnożnik {C:red}+#1#{}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_krustytheclown = {
                name = "Klaun Krusty",
                text = {
                    "Ten joker zdobywa",
                    "{X:mult,C:white} X#1# {} do mnożnika,",
                    "kiedy każda zagrana {C:attention}karta{} zdobywa punkty",
                    "{C:inactive}(obecny mnoż.: {X:mult,C:white} X#2# {C:inactive}",
                },
            },
            j_cry_kscope = {
                name = "Kalejdoskop",
                text = {
                    "Dodaje {C:dark_edition}polichromowanie{} do",
                    "losowego {C:attention}jokera{}, kiedy",
                    "pokonana zostanie {C:attention}Przeszkadzajka Bossa{}",
                },
            },
            j_cry_lightupthenight = {
                name = "Rozświetlenie nocy",
                text = {
                    "Każda zagrana {C:attention}7{} lub {C:attention}2{}",
                    "daje mnoż. {X:mult,C:white}X#1#{}, kiedy zdobywa punkty",
                },
            },
            j_cry_longboi = {
                name = "Potwór",
                text = {
                    "Daje przyszłym kopiom",
                    "tego jokera mnoż. {X:mult,C:white}X#1#{}",
                    "na koniec rundy",
                    "{C:inactive}(obecny mnoż.: {X:mult,C:white}X#2#{C:inactive}){}",
                },
            },
            j_cry_loopy = {
                name = "Zawijas",
                text = {
                    "{C:attention}Aktywuje ponownie{} wszystkie jokery",
                    "za każdego {C:attention}Wesołego{}",
                    "{C:attention}Jokera{} sprzedanego w tym podejściu",
                    "{C:inactive}(obecnie:{}{C:attention:} #1#{}{C:inactive} ponownych aktywacji){}",
                    "{C:inactive,s:0.8}nie było wystarczająco miejsca...{}",
                },
            },
            j_cry_lucky_joker = {
                name = "Szczęśliwy Joker",
                text = {
                    "Zyskujesz {C:money}$#1#{} za każdym razem,",
                    "kiedy {C:attention}Karta Szczęścia{} zostaje",
                    "{C:green}skutecznie aktywowana{}",
                },
            },
            j_cry_luigi = {
                name = "Luigi",
                text = {
                    "Wszystkie jokery dają",
                    "{X:chips,C:white} X#1# {} żet.",
                },
            },
            j_cry_m = {
                name = "m",
                text = {
                    "Ten joker zdobywa {X:mult,C:white} X#1# {} do mnożnika,",
                    "kiedy {C:attention}Wesoły Joker{} zostaje sprzedany",
                    "{C:inactive}(obecny mnoż.: {X:mult,C:white} X#2# {C:inactive})",
                },
            },
            j_cry_M = {
                name = "M",
                text = {
                    "Tworzy {C:dark_edition}Negatyw{}",
                    "{C:attention}Wesołego Jokera{}, kiedy",
                    "{C:attention}przeszkadzajka{} jest wybrana",
                },
            },
            j_cry_macabre = {
                name = "Makabryczny Joker",
                text = {
                    "Kiedy {C:attention}przeszkadzajka{} jest wybrana,",
                    "niszczy każdego {C:attention}jokera{} oprócz",
                    "{C:legendary}M Jokerów{} i {C:attention}Wesołych Jokerów{}",
                    "i tworzy 1 {C:attention}Wesołego Jokera{}",
                    "za każdego zniszczonego jokera",
                },
            },
            j_cry_magnet = {
                name = "Magnes na lodówkę",
                text = {
                    "Zyskujesz {C:money}$#1#{} na końcu rundy",
                    "Zyskujesz {X:money,C:white} X#2# {} więcej, jeśli posiadasz",
                    "{C:attention}#3#{} lub mniej {C:attention}jokerów{}",
                },
            },
            j_cry_manic = {
                name = "Maniakalny Joker",
                text = {
                    "Mnoż. {C:red}+#1#{}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_mario = {
                name = "Mario",
                text = {
                    "Aktywuje ponownie wszystkie jokery",
                    "jeszcze {C:attention}#1#{} razy",
                },
            },
            j_cry_mask = {
                name = "Maska",
                text = {
                    "Uruchom ponownie wszystkie {C:attention}figury karciane{}",
                    "jeszcze {C:attention}#1#{} razy",
		    "Wszystkie {C:attention}numerowane karty{} zostają osłabione",
                },
            },
            j_cry_maximized = {
                name = "Na maksa",
                text = {
                    "Wszystkie {C:attention}figury karciane{}",
                    "są traktowane jako {C:attention}Królowie{},",
                    "wszystkie {C:attention}numerowane karty{}",
                    "są traktowane jako {C:attention}10-tki{}",
                },
            },
            j_cry_maze = {
                name = "Labirynt",
                text = {
                    "Wszystkie ręce są traktowane jako",
                    "{C:attention}pierwsza ręka{} rundy,",
                    "wszystkie zrzutki są traktowane jako",
                    "{C:attention}pierwsza zrzutka{} rundy",
                },
            },
            j_cry_Megg = {
                name = "M-Jajko",
                text = {
                    "Sprzedaj tę kartę, aby stworzyć",
                    "{C:attention}#2#{} {C:attention}Wesołych Jokerów{}, liczba rośnie",
                    "o {C:attention}#1#{} na koniec rundy",
                },
            },
            j_cry_mellowcreme = {
                name = "Cukierkowa dynia",
                text = {
                    "Sprzedaj tę kartę, aby {C:attention}pomnożyć",
                    "wartość sprzedaży wszystkich",
                    "{C:attention}przedmiotów zużywalnych{} o {C:attention}X#1#"
                }
            },
            j_cry_membershipcard = {
                name = "Karta członkowska",
                text = {
                    "Mnoż. {X:mult,C:white}X#1#{} za każdego członka",
                    "discordowego serwera {C:attention}Cryptid{}",
                    "{C:inactive}(obecny mnoż.: {X:mult,C:white}X#2#{C:inactive}",
                    "{C:blue,s:0.7}https://discord.gg/eUf9Ur6RyB{}",
                },
            },
            j_cry_membershipcardtwo = {
                name = "Dawna karta członkowska", --Could probably have a diff Name imo
                text = {
                    "{C:chips}+#1#{} za każdego członka",
                    "discordowego serwera {C:attention}Cryptid{}",
                    "{C:inactive}(obecnie: {C:chips}+#2#{C:inactive} żet.)",
                    "{C:blue,s:0.7}https://discord.gg/eUf9Ur6RyB{}",
                },
            },
            j_cry_meteor = {
                name = "Rój meteorów",
                text = {
                    "Wszystkie karty {C:dark_edition}w folii{}",
                    "dają {C:chips}+#1#{} żet.",
                },
            },
            j_cry_mneon = {
                name = "Neonowe M",
                text = {
                    "Na koniec rundy zyskujesz {C:money}$#2#{}",
                    "Wypłata zwiększa się",
                    "o {C:money}$#1#{} za każdego {C:attention}Wesołego Jokera{}",
                    "lub {C:legendary}M Jokera{} na",
                    "koniec rundy",
                },
            },
            j_cry_mondrian = {
                name = "Mondrian",
                text = {
                    "Ten joker zdobywa {X:mult,C:white} X#1# {} do mnożnika,",
                    "jeśli nie skorzystano ze {C:attention}zrzutek{}",
                    "do końca tej rundy",
                    "{C:inactive}(obecny mnoż.: {X:mult,C:white} X#2# {C:inactive}",
                },
            },
            j_cry_monkey_dagger = {
                name = "Małpi sztylet",
                text = {
                    "Po wybraniu {C:attention}przeszkadzajki{},",
                    "niszczy jokera po lewej",
                    "i na stałe dodaje {C:attention}10-krototność{}",
                    "jego wartości sprzedaży do {C:chips}żetonów{}",
                    "{C:inactive}(obecnie: {C:chips}+#1#{C:inactive} żet.)",
                },
            },
            j_cry_monopoly_money = {
                name = "Monopolowe pieniądze",
                text = {
                    "{C:green}#1# na #2#{} szans na",
                    "{C:attention}zniszczenie{} zakupionych przedmiotów",
                    "Obniża pieniądze o połowę po {C:attention}sprzedaży{} tej karty",
                }
            },
            j_cry_morse = {
                name = "Kod Morse’a",
                text = {
                    "Zyskujesz {C:money}$#2#{} na końcu rundy",
                    "Wypłata rośnie o {C:money}$#1#{}, kiedy",
                    "karta z {C:attention}edycją{} zostaje sprzedana",
                },
            },
            j_cry_mprime = {
                name = "Tredecim",
                text = {
                    "Tworzy {C:legendary}M Jokera{} na koniec rundy",
                    "Każdy {C:attention}Wesoły Joker{} lub {C:legendary}M Joker",
                    "daje {X:dark_edition,C:white}^#1#{} do mnożnika",
                    "Zwiększa ilość o {X:dark_edition,C:white}^#2#{},",
                    "kiedy {C:attention}Wesoły Joker{} jest {C:attention}sprzedany",
                    "{C:inactive,s:0.8}(Tredecim nie może być stworzony)",
                },
            },
            j_cry_mstack = {
                name = "Stos M",
                text = {
                    "Aktywuj ponownie wszystkie zagrane karty",
                    "za każde",
                    "{C:attention}#2#{} {C:inactive}[#3#]{} sprzedane {C:attention}Wesołe Jokery{}",
                    "{C:inactive}(obecnie{}{C:attention:} #1#{}{C:inactive} ponownych aktywacji){}",
                },
            },
            j_cry_multjoker = {
                name = "Mnożnikowy Joker",
                text = {
                    "{C:green}#1# na #2#{} szans dla każdej",
                    "zagranej karty {C:attention}Karty Mnożnikowej{} na stworzenie",
                    "{C:spectral}Kryptydy{} po zdobyciu punktów",
                    "{C:inactive}(wymaga miejsca)",
                },
            },
	    j_cry_necromancer = {
	    	name = "Nekromanta",
		text = {
		    "Kiedy joker jest {C:attention}sprzedany{} za więcej niż {C:attention}$0{},",
		    "otrzymujesz {C:attention}losowego{} jokera {C:attention}sprzedanego{} w tym podejściu",
		    "o wartości {C:money}$0{}",
		},
	    },
            j_cry_negative = {
                name = "Negatywny Joker",
                text = {
                    "{C:dark_edition}+#1# sloty na{C:attention} jokery{}",
                },
            },
            j_cry_nice = {
                name = "Najs",
                text = {
                    "{C:chips}+#1#{} żet., jeśli zagrana ręka",
                    "zawiera {C:attention}6{} i {C:attention}9",
                    "{C:inactive,s:0.8}Nice.{}",
                },
            },
            j_cry_night = {
                name = "Noc",
                text = {
                    "Mnoż. {X:dark_edition,C:white}^#1#{}",
                    "w ostatniej ręce rundy",
                    "{E:2,C:red}Ulega samozniszczeniu{}",
                    "w ostatniej ręce rundy",
                },
            },
            j_cry_nosound = {
                name = "Bez dźwięku, bez wspomnienia",
                text = {
                    "Aktywuj ponownie każdą zagraną {C:attention}7{}",
                    "jeszcze {C:attention:}#1#{} razy",
                },
            },
            j_cry_notebook = {
                name = "Zeszyt",
                text = {
                    "{C:green} #1# na #2#{} szans na {C:dark_edition}+1{} slot na jokera",
                    "za {C:attention}ponowny rzut{} w sklepie",
                    "{C:green}Zawsze aktywuje się,{} jeśli",
                    "posiadasz {C:attention}#5#{} lub więcej {C:attention}Wesołych Jokerów{}",
                    "{C:red}Działa raz na rundę{}",
                    "{C:inactive}(obecnie: {C:dark_edition}+#3#{}{C:inactive} and #4#){}",
                },
            },
            j_cry_number_blocks = {
                name = "Klocki liczbowe",
                text = {
                    "Zdobywasz {C:money}$#1#{} na koniec rundy",
                    "Wypłata zwiększa się o {C:money}$#2#{}",
                    "za każdą kartę {C:attention}#3#{} trzymaną w ręcę,",
                    "ranga zmienia się co rundę",
                },
            },
            j_cry_nuts = {
                name = "Orzeszki",
                text = {
                    "Mnoż. {X:mult,C:white} X#1# {}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#",
                },
            },
            j_cry_nutty = {
                name = "Bzikowaty Joker",
                text = {
                    "Mnoż. {C:red}+#1#{}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
	    j_cry_oil_lamp = {
		name = "Lampa naftowa",
		text = {
			"Zwiększa wartości {C:attention}jokera{} po prawej stronie",
			"o {C:attention}X#1#{} na koniec rundy",
		},
	    },
            j_cry_oldblueprint = {
                name = "Dawna światłokopia",
                text = {
                    "Powiela zdolność",
                    "{C:attention}jokera{} na prawo",
                    "{C:green}#1# na #2#{} szans, że ta",
                    "karta zostanie zniszczona",
                    "na końcu rundy",
                },
            },
            j_cry_oldcandy = {
                name = "Nostalgiczny cukierek",
                text = {
                    "Sprzedaj tę kartę,",
                    "aby na stałe zyskać",
                    "{C:attention}+#1#{} do rozmiaru ręki",
                },
            },
            j_cry_oldinvisible = {
                name = "Nostalgiczny Niewidzialny Joker",
                text = {
                    "{C:attention}Kopiuje{} losowego",
                    "{C:attention}joker{} co {C:attention}4",
                    "sprzedane jokery",
                    "{s:0.8}oprócz Nostalgicznego Niewidzialnego Jokera{}",
                    "{C:inactive}(obecnie: #1#/4){}",
                },
            },
            j_cry_panopticon = {
                name = "Panoptykon",
                text = {
                    "Wszystkie ręce są traktowane",
                    "jako {C:attention}ostatnia ręka{}", -- +$4
                },
            },
            j_cry_penetrating = {
                name = "Penetrujący Joker",
                text = {
                    "{C:chips}+#1#{} żet., jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_pickle = {
                name = "Ogór",
                text = {
                    "Kiedy {C:attention}przeszkadzajka{} jest pominięta, tworzy",
                    "{C:attention}#1#{} znaczniki, zmniejsza się",
                    "o {C:red}#2#{} kiedy {C:attention}przeszkadzajka{} zostaje wybrana",
                },
            },
            j_cry_pirate_dagger = {
                name = "Piracki sztylet",
                text = {
                    "Po wybraniu {C:attention}przeszkadzajki{},",
                    "niszczy jokera po prawej",
                    "oraz na stałe dodaje {C:attention}0,25{} jego",
                    "wartości sprzedaży do {X:chips,C:white} mnoż. żetonów {}",
                    "{C:inactive}(obecny mnoż. żetonów: {X:chips,C:white} X#1# {C:inactive})",
                },
            },
			j_cry_pity_prize = {
				name = "Nagroda pocieszenia",
				text = {
					"Kiedy pomijasz {C:attention}paczkę wzmacniającą{}, zyskujesz losowy {C:attention}znacznik{}"
				},
			},
            j_cry_pot_of_jokes = {
                name = "Garnek żartów",
                text = {
                    "{C:attention}#1#{} do rozmiaru ręki,",
                    "rośnie o ",
                    "{C:blue}#2#{} w każdej rundzie",
                },
            },
            j_cry_primus = {
                name = "Primus",
                text = {
                    "Ten joker zdobywa {X:dark_edition,C:white} ^#1# {} do mnożnika,",
                    "jeśli wszystkie punktujące karty w zagranej ręce to",
                    "{C:attention}As{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, lub {C:attention}7{}",
                    "{C:inactive}(obecny mnoż.: {X:dark_edition,C:white} ^#2# {C:inactive})",
                },
            },
            j_cry_python = {
                name = "Python",
                text = {
                    "Ten joker zdobywa",
                    "{X:mult,C:white} X#1# {} do mnożnika, kiedy",
                    "{C:cry_code}Karta Kodowa{} jest użyta",
                    "{C:inactive}(obecny mnoż.: {X:mult,C:white} X#2# {C:inactive})",
                },
            },
            j_cry_queens_gambit = {
                name = "Gambit królowej",
                text = {
                    "Jeśli {C:attention}zagrana ręka{} to",
                    "{C:attention}Poker Królewski{}, niszczy",
                    "{C:attention}Królową{} i tworzy",
                    "{C:dark_edition}Negatyw {}{C:red}rzadkiego{}{C:attention} jokera{}",
                },
            },
            j_cry_quintet = {
                name = "Kwintet",
                text = {
                    "Mnoż. {X:mult,C:white} X#1# {}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#",
                },
            },
            j_cry_redbloon = {
                name = "Czerwony balonik",
                text = {
                    "Przez {C:attention}#2#{} rundy zyskujesz {C:money}$#1#{}",
                    "{C:red,E:2}Ulega samozniszczeniu{}",
                },
            },
            j_cry_redeo = {
                name = "Redeo",
                text = {
                    "{C:attention}-#1#{} do wejścia, po",
                    "wydanych {C:money}$#2#{} {C:inactive}($#3#){}",
                    "{s:0.8}Wymagania rosną",
                    "{C:attention,s:0.8}wykładniczo{s:0.8} co użycie",
                    "{C:money,s:0.8}Następna podwyżka: {s:1,c:money}$#4#",
                },
            },
            j_cry_rescribere = {
                name = 'Rescribere',
                text = {
                    "Kiedy {C:attention}Joker{} jest sprzedany,",
                    "aplikuje jego efekty",
                    "do pozostałych jokerów",
                    "{C:inactive,s:0.8}nie dotyczy pozostałych Rescribere{}"
                }
            },
            j_cry_reverse = {
                name = "Odwrócona karta",
                text = {
                    "Wypełnia wszystkie puste sloty na jokery {C:inactive}(maks. 100){}",
                    "{C:dark_edition}holograficznymi{} {C:attention}Wesołymi Jokerami{}, jeśli",
                    "{C:attention}odrzucony układ pokerowy{} to {C:attention}#1#{}",
                    "{C:red,E:2}Ulega samozniszczeniu{}",
                    "{C:inactive,s:0.8}OSTATECZNY powrót{}",
                },
            },
            j_cry_rnjoker = {
                name = "RN Joker",
                text = {
                    "Losuje umiejętności podczas każdego {C:attention}wejścia{}",
                },
            },
            j_cry_sacrifice = {
                name = "Poświęcenie",
                text = {
                    "Tworzy {C:green}niepospolitego{} jokera",
                    "i 3 {C:attention}Wesołe Jokery{}, kiedy",
                    "karta {C:spectral}Ducha{} jest użyta",
                    "{C:red}Działa raz na rundę{}",
                    "{C:inactive}#1#{}",
                },
            },
            j_cry_sapling = {
                name = "Sadzonka",
                text = {
                    "Po zagraniu {C:attention}#2#{} {C:inactive}[#1#]{} ulepszonych",
                    "kart, sprzedaj tę kartę",
                    "aby stworzyć {C:cry_epic}epickiego{} {C:attention}jokera{}",
                    "{C:inactive,s:0.8}stworzy {C:red,s:0.8}rzadkiego{} {C:attention,s:0.8}jokera{}",
                    "{C:inactive,s:0.8}jeśli {C:cry_epic,s:0.8}epickie{} {C:inactive,s:0.8}jokery są wyłączone{}",
                },
            },
            j_cry_savvy = {
                name = "Kumaty Joker",
                text = {
                    "{C:chips}+#1#{} żet., jeśli zagrana",
                    "ręka zawiera",
                    "a {C:attention}#2#"
                }
            },
            j_cry_Scalae = {
                name = "Scalae",
                text = {
                    "Skalujące {C:attention}jokery{} skalują się",
                    "jako wielomian stopnia {C:attention}#1#{}",
                    "Podnosi stopień o {C:attention}#2#{}",
                    "na koniec rundy",
                    "{C:inactive,s:0.8}({C:attention,s:0.8}Z wyjątkiem Scalae{C:inactive,s:0.8})",
                },
            },
            j_cry_scrabble = {
                name = "Płytka Scrabble",
                text = {
                    "{C:green}#1# na #2#{} szans na stworzenie",
                    "{C:dark_edition}wesołego {C:green}niepospolitego{} jokera,",
                    "kiedy ręka jest zagrana",
                },
            },
            j_cry_seal_the_deal = {
                name = "Zapieczętowana sprawa",
                text = {
                    "Dodaje {C:attention}losową pieczęć{} do wszystkich kart,",
                    "które zdobyły punkty w {C:attention}ostatniej ręce{} rundy",
                },
            },
            j_cry_shrewd = {
                name = "Przenikliwy Joker",
                text = {
                    "{C:chips}+#1#{} żet., jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_silly = {
                name = "Głupiutki Joker",
                text = {
                    "Mnoż. {C:red}+#1#{}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_smallestm = {
                name = "Malutki",
                text = {
                    "Tworzy {C:cry_jolly}znacznik podwójnego M,",
                    "jeśli {C:attention}zagrana ręka{},",
                    "to {C:attention}#1#{}",
                    "{C:inactive,s:0.8}ok zasadniczo to jestem bardzo mały",
                },
            },
            j_cry_soccer = {
                name = "Jeden dla wszystkich", --changed the name from latin because this isn't exotic
                text = {
                    "{C:attention}+#1#{} slot na jokera",
                    "{C:attention}+#1#{} paczka wzmacniająca",
                    "{C:attention}+#1#{} do rozmiaru ręki",
                    "{C:attention}+#1#{} slot na przedmioty zużywalne",
                    "{C:attention}+#1#{} karta w sklepie",
                },
            },
            j_cry_fleshpanopticon = {
                name = "Cielesny Panoptykon",
                text = {
                    "{C:red}X#1#{} do rozmiaru {C:attention}Przeszkadzajki Bossa{}",
                    "Kiedy {C:attention}Przeszkadzajka Bossa{} jest pokonana,",
                    "{C:red}karta ulega samozniszczeniu{} i tworzy",
                    " {C:dark_edition}Negatyw{} karty {C:spectral}Wrota{}",
                    "{C:inactive,s:0.8}\"To więzienie... ma mnie powstrzymać?\""
                },
            },
            j_cry_spaceglobe = {
                name = "Niebiański glob",
                text = {
                    "Ten joker zdobywa {X:chips,C:white}X#2#{} żet.,",
                    "jeśli zagrany {C:attention}układ pokerowy{} to {C:attention}#3#{},",
                    "Układ zmienia się po wzroście wartości{}",
                    "{C:inactive}(obecnie:{} {X:chips,C:white}X#1#{} {C:inactive}żet.){}",
                },
            },
            j_cry_speculo = {
                name = "Speculo",
                text = {
                    "Tworzy {C:dark_edition}Negatyw{} kopii",
                    "losowego {C:attention}jokera{}",
                    "na koniec {C:attention}sklepu",
                    "{C:inactive,s:0.8}Nie kopiuje Speculo{}",
                },
            },
            j_cry_spy = {
                name = "Szpieg",
                text = {
                    "Mnoż. {X:mult,C:white} X#2# {}, {C:dark_edition}+1{} slot na {C:attention}jokera{}",
                    "{C:inactive}#1# jest szpiegiem!",
                },
            },
            j_cry_stardust = {
                name = "Gwiezdny pył",
                text = {
                    "Wszystkie karty {C:dark_edition}polichromowane{}",
                    "dają mnoż. {X:mult,C:white}X#1#{}",
                },
            },
            j_cry_stella_mortis = {
                name = "Stella Mortis",
                text = {
                    "Ten joker niszczy",
                    "losową Kartę {C:planet}Planety{}",
                    "i zdobywa {X:dark_edition,C:white} ^#1# {} do mnożnika",
                    "na koniec {C:attention}sklepu{}",
                    "{C:inactive}(obecny mnoż.: {X:dark_edition,C:white} ^#2# {C:inactive})",
                },
            },
            j_cry_stronghold = {
                name = "Twierdza",
                text = {
                    "Mnoż. {X:mult,C:white} X#1# {}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#",
                },
            },
            j_cry_subtle = {
                name = "Subtelny Joker",
                text = {
                    "{C:chips}+#1#{} żet., jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_supercell = {
                name = "Superkomórka",
                text = {
                    "{C:chips}+#1#{} żet., mnoż. {C:mult}+#1#{},",
                    "{X:chips,C:white}X#2#{} żet., mnoż. {X:mult,C:white}X#2#{}",
                    "Zyskujesz {C:money}$#3#{}",
                    "na koniec rundy",
                },
            },
            j_cry_sus = {
                name = "SUS",
                text = {
                    "Na końcu rundy, tworzy",
                    "{C:attention}kopię{} losowej",
                    "karty {C:attention}trzymanej w ręce{} i",
                    "niszczy pozostałe",
                    "{C:attention,s:0.8}Królowie{s:0.8} {C:hearts,s:0.8}Kier{s:0.8} mają priorytet",
                },
            },
            j_cry_swarm = {
                name = "Rój",
                text = {
                    "Mnoż. {X:mult,C:white} X#1# {}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#",
                },
            },
            j_cry_sync_catalyst = {
                name = "Katalizator synchronizacji",
                text = {
                    "Równoważy {C:chips}żetony{} i {C:mult}mnożnik{}",
                    "{C:inactive,s:0.8}Ej! Gdzieś to widziałem!",
                },
            },
			j_cry_tax_fraud = {
				name = "Oszust podatkowy",
				text = {
					"Zyskujesz {C:attention}$#1#{} za każdego {C:attention}wypożyczonego",
					"jokera na koniec rundy",
				},
			},
            j_cry_tenebris = {
                name = "Tenebris",
                text = {
                    "{C:dark_edition}+#1# slotów na {C:attention}Jokery{}",
                    "Zyskujesz {C:money}$#2#{} na koniec rundy",
                },
            },
            j_cry_translucent = {
                name = "Przezroczysty Joker",
                text = {
                    "Sprzedaj tę kartę, aby",
                    "stworzyć {C:attention}bananową, nietrwałą{} kopię",
                    "losowego {C:attention}jokera{}",
                    "{s:0.8,C:inactive}(kopia pomija niekompatybilność)",
                },
            },
            j_cry_treacherous = {
                name = "Podstępny Joker",
                text = {
                    "{C:chips}+#1#{} żet., jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_trick_or_treat = {
                name = "Cukierek albo psikus",
                text = {
                    "Kiedy ta karta jest {C:attention}sprzedana{}:",
                    "{C:green}#1# na #2#{} szans na stworzenie {C:attention}2{} {C:cry_candy}Cukierków",
                    "W innym razie, tworzy {X:cry_cursed,C:white}przeklętego{} jokera",
                    "{C:inactive}(może zignorować miejsce na jokery)"
                }
            },
            j_cry_tricksy = {
                name = "Figlarny Joker",
                text = {
                    "{C:chips}+#1#{} żet., jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_triplet_rhythm = {
                name = "Potrójny rytm",
                text = {
                    "Mnoż. {X:mult,C:white} X#1# {},",
                    "jeśli zagrana ręka zawiera {C:attention}dokładnie{} trzy {C:attention}3",
                },
            },
            j_cry_tropical_smoothie = {
                name = "Tropikalne smoothie",
                text = {
                    "Sprzedaj tę kartę, aby",
		    "{C:attention}zwiększyć{} wartości",
                    "posiadanych jokerów o {C:attention}X1.5{}",
                },
            },
            j_cry_unity = {
                name = "Jedność",
                text = {
                    "Mnoż. {X:mult,C:white} X#1# {}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#",
                },
            },
            j_cry_universe = {
                name = "Wszechświat",
                text = {
                    "Wszystkie karty {C:dark_edition}astralne{}",
                    "dają mnoż. {X:dark_edition,C:white}^#1#{}",
                },
            },
            j_cry_universum = {
                name = "Uniwersum",
                text = {
                    "{C:attention}Układy pokerowe{} zdobywają",
                    "mnoż. {X:red,C:white} X#1# {} i mnoż. żet. {X:blue,C:white} X#1# {},",
                    "kiedy są ulepszane",
                },
            },
            j_cry_unjust_dagger = {
                name = "Niesprawiedliwy sztylet",
                text = {
                    "Po wybraniu {C:attention}przeszkadzajki{},",
                    "niszczy jokera po lewej",
                    "i zdobywa {C:attention}0,2{} jego",
                    "sprzedaży do {X:mult,C:white} mnożnika {}",
                    "{C:inactive}(obecny mnoż.: {X:mult,C:white} X#1# {C:inactive})",
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
                name = "Panna",
                text = {
                    "Ten joker zyskuje {C:money}$#1#{} do {C:attention}wartości sprzedaży{},",
                    "jeśli {C:attention}zagrana ręka{} zawiera {C:attention}#2#{}",
                    "Sprzedaj tę kartę, aby stworzyć",
                    "{C:dark_edition}polichromowanego{} {C:attention}Wesołego Jokera{} za",
                    "każde {C:money}$4{} z jego {C:attention}wartości sprzedaży{} {C:inactive}(Min 1){}",
                },
            },
            j_cry_wacky = {
                name = "Ekscentryczny Joker",
                text = {
                    "Mnoż. {C:red}+#1#{}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#"
                }
            },
            j_cry_waluigi = {
                name = "Waluigi",
                text = {
                    "Wszytkie jokery dają",
                    "mnoż. {X:mult,C:white} X#1#{}",
                },
            },
            j_cry_wario = {
                name = "Wario",
                text = {
                    "Wszystkie jokery dają",
                    "{C:money}$#1#{} kiedy są aktywowane",
                },
            },
            j_cry_wee_fib = {
                name = "Weebonacci",
                text = {
                    "Ten joker zdobywa",
                    "{C:mult}+#2#{} do mnożnika kiedy każdy",
                    "{C:attention}As{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}8{}",
                    "zdobywa punkty",
                    "{C:inactive}(obecny mnoż.: {C:mult}+#1#{C:inactive})",
                },
            },
            j_cry_weegaming = {
                name = "2D",
                text = {
                    "Aktywuj ponownie wszystkie zagrane {C:attention}2{}", --wee gaming
                    "jeszcze {C:attention:}#2#{} razy", --wee gaming?
                    "{C:inactive,s:0.8}Wee Gaming?{}",
                },
            },
            j_cry_wheelhope = {
                name = "Koło nadziei",
                text = {
                    "Ten joker zdobywa",
                    "{X:mult,C:white} X#1# {} do mnożnika po nieudanej",
                    "aktywacji {C:attention}Koła Fortuny{}",
                    "{C:inactive}(obecny mnoż.: {X:mult,C:white} X#2# {C:inactive})",
                },
            },
            j_cry_whip = {
                name = "Bicz",
                text = {
                    "Ten joker zdobywa {X:mult,C:white} X#1# {} do mnożnika,",
                    "jeśli {C:attention}zagrana ręka{} zawiera",
                    "{C:attention}2{} i {C:attention}7{} w różnych kolorach",
                    "{C:inactive}(obecny mnoż.: {X:mult,C:white} X#2# {C:inactive}",
                },
            },
            j_cry_wrapped = {
                name = "Zawinięty cukierek",
                text = {
                    "Tworzy losowego {C:attention}kulinarnego jokera{}",
                    "po {C:attention}#1#{} rundach",
                    "{C:red,E:2}Ulega samozniszczeniu{}",
                },
            },
            j_cry_wtf = {
                name = "Co kurwa!?",
                text = {
                    "Mnoż. {X:mult,C:white} X#1# {}, jeśli zagrana",
                    "ręka zawiera",
                    "{C:attention}#2#",
                },
            },
        },
        Planet = {
            c_cry_Klubi = {
                name = "Klubi",
                text = {
                    "({V:1}poz.#4#{})({V:2}poz.#5#{})({V:3}poz.#6#{})",
                    "Zwiększ poziom układów:",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "i {C:attention}#3#{}",
                },
            },
            c_cry_Lapio = {
                name = "Lapio",
                text = {
                    "({V:1}poz.#4#{})({V:2}poz.#5#{})({V:3}poz.#6#{})",
                    "Zwiększ poziom układów:",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "i {C:attention}#3#{}",
                },
            },
            c_cry_Kaikki = {
                name = "Kaikki",
                text = {
                    "({V:1}poz.#4#{})({V:2}poz.#5#{})({V:3}poz.#6#{})",
                    "Zwiększ poziom układów:",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "i {C:attention}#3#{}",
                },
            },
            c_cry_nstar = {
                name = "Gwiazda Neutronowa",
                text = {
                    "Ulepsza losowy",
                    "układ pokerowy o",
                    "{C:attention}1{} poziom po każdym",
                    "użyciu {C:attention}Gwiazdy Neutronowej{}",
                    "w tym podejściu",
                    "{C:inactive}(Obecnie{C:attention} #1#{C:inactive}){}",
                },
            },
            c_cry_planetlua = {
                name = "Planet.lua",
                text = {
                    "{C:green}#1# na #2#{} szans na",
                    "ulepszenie każdego",
                    "{C:legendary,E:1}układu pokerowego{}",
                    "o {C:attention}1{} poziom",
                },
            },
            c_cry_Sydan = {
                name = "Sydan",
                text = {
                    "({V:1}poz.#4#{})({V:2}poz.#5#{})({V:3}poz.#6#{})",
                    "Zwiększ poziom układów:",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "i {C:attention}#3#{}",
                },
            },
            c_cry_Timantti = {
                name = "Timantti",
                text = {
                    "({V:1}poz.#4#{})({V:2}poz.#5#{})({V:3}poz.#6#{})",
                    "Zwiększ poziom układów:",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "i {C:attention}#3#{}",
                },
            },
            c_cry_marsmoons = {
                name = 'Fobos & Deimos',
                text = {
                    "{S:0.8}({S:0.8,V:1}poz.#1#{S:0.8}){} Zwiększ poziom układu:",
                    "{C:attention}#2#",
                    "mnoż. {C:mult}+#3#{} oraz",
                    "{C:chips}+#4#{} żet."
                }
            },
            c_cry_void = {
                name = 'Otchłań',
                text = {
                    "{S:0.8}({S:0.8,V:1}poz.#1#{S:0.8}){} Zwiększ poziom układu:",
                    "{C:attention}#2#",
                    "mnoż. {C:mult}+#3#{} oraz",
                    "{C:chips}+#4#{} żet."
                }
            },
            c_cry_asteroidbelt = {
                name = 'Pas Asteroid',
                text = {
                    "{S:0.8}({S:0.8,V:1}poz.#1#{S:0.8}){} Zwiększ poziom układu:",
                    "{C:attention}#2#",
                    "mnoż. {C:mult}+#3#{} oraz",
                    "{C:chips}+#4#{} żet."
                }
            },
            c_cry_universe = {
                name = 'Wszechświat W Swojej Całej Pierdolonej Okazałości',
                text = {
                    "{S:0.8}({S:0.8,V:1}poz.#1#{S:0.8}){} Zwiększ poziom układu:",
                    "{C:attention}#2#",
                    "mnoż. {C:mult}+#3#{} oraz",
                    "{C:chips}+#4#{} żet."
                }
            },
        },
        Sleeve = {
			sleeve_cry_bountiful_sleeve = {
				name = "Obfity Rękaw",
				text = {
                    "Po {C:blue}zagraniu{} lub {C:red}zrzutce{},",
                    "zawsze dobierasz {C:attention}5{} kart"
				},
			},
            sleeve_cry_ccd_sleeve = {
                name = "Rękaw CCD",
                text = {
                    "Każda karta jest również",
                    "{C:attention}losowym{} przedmiotem zużywalnym",
                },
            },
            sleeve_cry_conveyor_sleeve = {
                name = "Taśmociągowy Rękaw",
                text = {
                    "Jokery {C:attention}nie mogą{} zmieniać pozycji",
                    "Na początku rundy,",
                    "{C:attention}duplikuje{} jokera najbardziej wysuniętego na prawo",
                    "i {C:attention}niszczy{} najbardziej wysuniętego na lewo",
                },
            },
            sleeve_cry_critical_sleeve = {
                name = "Krytyczny Rękaw",
                text = {
                    "Po każdej zagranej ręce,",
                    "{C:green}#1# na 4{} szans na mnożnik {X:dark_edition,C:white} ^2 {}",
                    "{C:green}#1# na 8{} szans na mnożnik {X:dark_edition,C:white} ^0.5 {}",
                },
            },
            sleeve_cry_encoded_sleeve = {
                name = "Zakodowany Rękaw",
                text = {
                    "Rozpoczynasz podejście z",
                    "{C:cry_code,T:j_cry_CodeJoker}Kodowym Jokerem{} i {C:cry_code,T:j_cry_copypaste}Kopiuj/Wklej{}",
                    "Tylko {C:cry_code}Karty kodowe{} pojawiają się w sklepie",
                },
            },
            sleeve_cry_equilibrium_sleeve = {
                name = "Zbalansowany Rękaw",
                text = {
                    "Wszystkie karty mają",
                    "{C:attention}równą{} szansę",
                    "pojawienia się w sklepie,",
                    "rozpoczynasz podejście z",
                    "dodatkowymi {C:attention,T:v_overstock_plus}+2 slotami{} w sklepie",
                },
            },
            sleeve_cry_infinite_sleeve = {
                name = "Nieskończony Rękaw",
                text = {
                    "Możesz wybrać {C:attention}dowolną",
                    "liczbę kart",
                    --someone do the hand size thing for me
                },
            },
            sleeve_cry_misprint_sleeve = {
                name = "Błędny Rękaw",
                text = {
                    "Wartości kart",
                    "są {C:attention}losowe",
                },
            },
            sleeve_cry_redeemed_sleeve = {
                name = "Odkupiony Rękaw",
                text = {
                    "Przy zakupie {C:attention}kuponu{} ,",
                    "otrzymujesz jego {C:attention}dodatkowe poziomy",
                },
            },
			sleeve_cry_spooky_sleeve = {
                name = "Upiorny Rękaw",
                text = {
                    "Rozpoczynasz podejście z {C:eternal}Wieczną{} {C:attention,T:j_cry_chocolate_dice}Czekoladową kostką",
                    "Po każdym {C:attention}wejściu{}, tworzy",
                    "{C:cry_candy}Cukierka{} lub {X:cry_cursed,C:white}Przeklętego{} jokera",
                }
            },
            sleeve_cry_wormhole_sleeve = {
                name = "Tuneloczasowy Rękaw",
                text = {
                    "Rozpoczynasz podejście z {C:cry_exotic}egzotycznym{C:attention} jokerem",
                    "{C:attention}X20{} prawdopodobieństwa",
                    "na {C:dark_edition}Negatywy{} jokerów",
                    "{C:attention}-2{} sloty na jokera",
                },
            },
			sleeve_cry_legendary_sleeve = {
                name = "Legendarny Rękaw",
                text = {
                    "Rozpoczynasz podejście z {C:legendary}legendarnym{C:legendary} jokerem",
                    "{C:green}1 in 5{} szans na dodanie kolejnego",
					"po pokonaniu przeszkadzajki bossa {C:inactive}(wymaga miejsca){}",
                },
            },
        },
        Spectral = {
            c_cry_adversary = {
                name = "Adwersarz",
                text = {
                    "{C:red}Wszystkie{} twoje {C:attention}jokery{} dostają {C:dark_edition}Negatyw{},",
                    "{C:red}wszystkie{} {C:attention}jokery{} w sklepie są",
                    "{C:red}dwa razy{} droższe do końca podejścia",
                },
            },
            c_cry_analog = {
                name = "Analog",
                text = {
                    "Tworzy {C:attention}#1#{} kopie",
                    "losowego {C:attention}jokera{}, niszczy",
                    "wszystkie inne jokery, {C:attention}+#2#{} do wejścia",
                },
            },
            c_cry_chambered = {
                name = "Komora",
                text = {
                    "Tworzy {C:attention}#1#{} {C:dark_edition}negatywne{}",
                    "kopie",
                    "{C:attention}dowolnego{} przedmiotu zużywalnego",
                    "{C:inactive,s:0.8}Nie kopiuje Komory{}"
                },
            },
            c_cry_conduit = {
                name = "Przewód",
                text = {
                    "Zamienia {C:attention}edycje{}",
                    "{C:attention}2{} wybranych kart lub {C:attention}jokerów{}",
                },
            },
            c_cry_gateway = {
                name = "Brama",
                text = {
                    "Tworzy losowego",
                    "{C:cry_exotic,E:1}egzotycznego{C:attention} jokera{}, niszczy",
                    "wszystkie inne jokery",
                },
            },
            c_cry_hammerspace = {
                name = "Hammerspace",
                text = {
                    "Dodaje losowe {C:attention}przedmioty zużywalne{}",
                    "jako {C:dark_edition}ulepszenia{}",
                    "do kart trzymanych w ręce",
                },
            },
            c_cry_lock = {
                name = "Blokada",
                text = {
                    "Usuwa {C:red}wszystkie{} naklejki",
                    "ze {C:red}wszystkich{} jokerów,",
                    "a następnie dodaje {C:purple,E:1}Wieczną{}",
                    "naklejkę na losowego {C:attention}jokera{}",
                },
            },
            c_cry_pointer = {
                name = "POINTER://",
                text = {
                    "Tworzy {C:cry_code}wybranego",
                    "jokera lub kartę",
                    "{C:inactive,s:0.8}(Z wyjątkiem egzotycznych jokerów)",
                },
            },
            c_cry_replica = {
                name = "Replika",
                text = {
                    "Zamienia wszystkie",
                    "karty w ręcę",
                    "na {C:attention}losową{}",
                    "kartę trzymaną w ręcę",
                },
            },
            c_cry_ritual = {
                name = "Rytuał",
                text = {
                    "Dodaje {C:dark_edition}Negatyw{}, {C:dark_edition}mozaiczną{},",
                    "lub {C:dark_edition}astralną{} edycję do {C:attention}#1#{}",
                    "wybranej karty w ręcę",
                },
            },
            c_cry_source = {
                name = "Źródło",
                text = {
                    "Dodaj {C:cry_code}Zieloną Pieczęć{}",
                    "do {C:attention}#1#{} wybranej",
                    "karty w ręcę",
                },
            },
            c_cry_summoning = {
                name = "Przywołanie",
                text = {
                    "Tworzy losowego",
                    "{C:cry_epic}epickiego{} {C:joker}jokera{}, niszczy",
                    "jednego losowego {C:joker}jokera{}",
                },
            },
            c_cry_trade = {
                name = "Handel",
                text = {
                    "{C:attention}Tracisz{} losowy kupon,",
                    "zyskujesz {C:attention}2{} losowe kupony",
                },
            },
            c_cry_typhoon = {
                name = "Tajfun",
                text = {
                    "Dodaj {C:cry_azure}Azurową Pieczęć{}",
                    "do {C:attention}#1#{} wybranej",
                    "karty w ręcę",
                },
            },
            c_cry_vacuum = {
                name = "Próżnia",
                text = {
                    "Usuwa {C:red}wszystkie {C:green}modyfikacje{}",
                    "ze {C:red}wszystkich{} kart trzymanych w ręcę,",
                    "Zarabiasz {C:money}$#1#{} za każdą usuniętą {C:green}modyfikację{}",
                    "{C:inactive,s:0.7}(na przykład ulepszenia, pieczęcie, edycje)",
                },
            },
            c_cry_white_hole = {
                name = "Biała Dziura",
                text = {
                    "{C:attention}Usuwa{} wszystkie poziomy układów pokerowych,",
                    "ulepsza {C:legendary,E:1}najczęściej grany{} układ pokerowy",
                    "o {C:attention}3{} za każdy usunięty poziom",
                },
            },
        },
        Stake = {
            stake_cry_pink = {
                name = "Różowa Stawka",
                colour = "Pink", --this is used for auto-generated sticker localization
                text = {
                    "Wymagany wynik skaluje się",
                    "szybciej dla każdego {C:attention}wejścia",
                },
            },
            stake_cry_brown = {
                name = "Brązowa Stawka",
                colour = "Brown",
                text = {
                    "Wszystkie {C:attention}naklejki{} są",
                    "ze sobą kompatybilne",
                },
            },
            stake_cry_yellow = {
                name = "Żółta Stawka",
                colour = "Yellow",
                text = {
                    "{C:attention}Naklejki{} mogą pojawić się",
                    "na wszystkich przedmiotach do kupienia",
                },
            },
            stake_cry_jade = {
                name = "Nefrytowa Stawka",
                colour = "Jade",
                text = {
                    "Karty mogą być {C:attention}dobierane w dół{}",
                },
            },
            stake_cry_cyan = {
                name = "Cyjanowa Stawka",
                colour = "Cyan",
                text = {
                    "{C:green}Niepospolite{} i {C:red}rzadkie{} jokery mają",
                    "mniejsze prawdopodobieństwo występowania",
                },
            },
            stake_cry_gray = {
                name = "Szara Stawka",
                colour = "Gray",
                text = {
                    "Koszt ponownych rzutów wzrasta o {C:attention}$2{} przy każdym użyciu",
                },
            },
            stake_cry_crimson = {
                name = "Karmazynowa Stawka",
                colour = "Crimson",
                text = {
                    "Kupony są odnawiane przy {C:attention}parzystych{} wejściach",
                },
            },
            stake_cry_diamond = {
                name = "Diamentowa Stawka",
                colour = "Diamond",
                text = {
                    "{C:attention}+2{} do wejścia",
                },
            },
            stake_cry_amber = {
                name = "Bursztynowa Stawka",
                colour = "Amber",
                text = {
                    "{C:attention}-1{} slot na paczki wzmacniające",
                },
            },
            stake_cry_bronze = {
                name = "Miedziowa Stawka",
                colour = "Bronze",
                text = {
                    "Kupony są {C:attention}50%{} droższe",
                },
            },
            stake_cry_quartz = {
                name = "Kwarcowa Stawka",
                colour = "Quartz",
                text = {
                    "Jokery mogą być {C:attention}przyszpilone{}",
                    "{s:0.8,C:inactive}(pozostają na pozycji najbardziej wysuniętej na lewo){}",
                },
            },
            stake_cry_ruby = {
                name = "Rubinowa Stawka",
                colour = "Ruby",
                text = {
                    "{C:attention}Duże w ciemno{} Blinds mogą stać się",
                    "{C:attention}Przeszkadzajkami Bossa{}",
                },
            },
            stake_cry_glass = {
                name = "Szklana Stawka",
                colour = "Glass",
                text = {
                    "Karty mogą się {C:attention}roztrzaskać{} przy punktacji",
                },
            },
            stake_cry_sapphire = {
                name = "Szafirowa Stawka",
                colour = "Sapphire",
                text = {
                    "Tracisz {C:attention}25%{} obecnych pieniędzy",
                    "na koniec rundy",
                    "{s:0.8,C:inactive}(maksymalnie $10){}",
                },
            },
            stake_cry_emerald = {
                name = "Szmaragdowa Stawka",
                colour = "Emerald",
                text = {
                    "Karty, paczki i kupony",
                    "mogą być {C:attention}dobierane w dół{}",
                    "{s:0.8,C:inactive}(Nie można ich sprawdzić przed zakupem){}",
                },
            },
            stake_cry_platinum = {
                name = "Platynowa Stawka",
                colour = "Platinum",
                text = {
                    "Małe w ciemno zostają {C:attention}usunięte{}",
                },
            },
            stake_cry_twilight = {
                name = "Zmierzchowa Stawka",
                colour = "Twilight",
                text = {
                    "Karty mogą być {C:attention}bananowe{}",
                    "{s:0.8,C:inactive}(1 na 10 szans, że zostaną zniszczone w każdej rundzie){}",
                },
            },
            stake_cry_verdant = {
                name = "Zarośnięta Stawka",
                colour = "Verdant",
                text = {
                    "Wymagany wynik skaluje się",
                    "szybciej dla każdego {C:attention}wejścia",
                },
            },
            stake_cry_ember = {
                name = "Rozżarzona Stawka",
                colour = "Ember",
                text = {
                    "Wszystkie przedmioty mają zerową wartość sprzedaży",
                },
            },
            stake_cry_dawn = {
                name = "Świtowa Stawka",
                colour = "Dawn",
                text = {
                    "Efekty kart Tarota i Ducha są",
                    "zredukowane do {C:attention}1{} karty",
                    "{s:0.8,C:inactive}(minimum 1){}",
                },
            },
            stake_cry_horizon = {
                name = "Nieboskłonna Stawka",
                colour = "Horizon",
                text = {
                    "Po wybraniu przeszkadzajki, dodaje",
                    "{C:attention}losową kartę{} do talii",
                },
            },
            stake_cry_blossom = {
                name = "Kwitnąca Stawka",
                colour = "Blossom",
                text = {
                    "{C:attention}Finałowe{} Przeszkadzajki Bossa mogą",
                    "pojawić się w {C:attention}dowolnym{} wejściu",
                },
            },
            stake_cry_azure = {
                name = "Azurowa Stawka",
                colour = "Azure",
                text = {
                    "Wartości Jokerów są",
                    "zmniejszone o {C:attention}20%{}",
                },
            },
            stake_cry_ascendant = {
                name = "Wschodząca Stawka",
                colour = "Ascendant",
                text = {
                    "{C:attention}-1{} slot w sklepie",
                },
            },
        },
        Tag = {
            tag_cry_astral = {
                name = "Znacznik astralny",
                text = {
                    "Następny joker podstawowy",
                    "sklepu jest darmowy",
                    "i staje się {C:dark_edition}astralny{}",
                },
            },
            tag_cry_banana = {
                name = "Znacznik bananowy",
                text = {
                    "Tworzy {C:attention}#1#",
                    "{C:inactive}(wymaga miejsca){}",
                },
            },
            tag_cry_bettertop_up = {
                name = "Znacznik superulepszenia",
                text = {
                    "Otrzymujesz maks. {C:attention}#1#",
                    "{C:green}Niepospolitych{} Jokerów",
                    "{C:inactive}(wymaga miejsca){}",
                },
            },
            tag_cry_better_voucher = {
                name = "Złoty znacznik kuponu",
                text = {
                    "Podczas następnej wizyty w sklepie",
                    "pojawia się kupon {C:attention}#1#{} poziomu",
                },
            },
            tag_cry_blur = {
                name = "Znacznik niewyraźny",
                text = {
                    "Następny joker podstawowy",
                    "sklepu jest darmowy",
                    "i staje się {C:dark_edition}niewyraźny{}",
                },
            },
            tag_cry_booster = {
                name = "Znacznik wzmacniający",
                text = {
                    "Następna {C:cry_code}paczka wzmacniająca{} ma",
                    "{C:attention}podwójną{} ilość kart i",
                    "{C:attention}podwójny{} wybór",
                },
            },
            tag_cry_bundle = {
                name = "Znacznik pakietowy",
                text = {
                    "Daje {C:attention}znacznik standardowy{}, {C:tarot}znacznik czaru{},",
                    "{C:attention}znacznik pajaca{} i {C:planet}znacznik meteorytu",
                },
            },
            tag_cry_cat = {
                name = "Znacznik koci",
                text = { "Miau.", "{C:inactive}Poziom {C:dark_edition}#1#" },
            },
            tag_cry_console = {
                name = "Znacznik konsoli",
                text = {
                    "Daje darmową",
                    "{C:cry_code}paczkę programową",
                },
            },
            tag_cry_double_m = {
                name = "Znacznik podwójnego M",
                text = {
                    "W sklepie jest",
                    "{C:dark_edition}wesoły {C:legendary}M Joker{}",
                },
            },
            tag_cry_empowered = {
                name = "Znacznik władny",
                text = {
                    "Daje darmową {C:spectral}paczkę Ducha",
                    "z {C:legendary,E:1}Duszą{} i {C:cry_exotic,E:1}Wrotami{}",
                },
            },
            tag_cry_epic = {
                name = "Znacznik epicki",
                text = {
                    "W sklepie jest {C:cry_epic}epicki joker",
                    "za pół ceny",
                },
            },
            tag_cry_gambler = {
                name = "Znacznik hazardzisty",
                text = {
                    "{C:green}#1# na #2#{} szans na",
                    "utworzenie {C:cry_exotic,E:1}znacznika władczego",
                },
            },
            tag_cry_glass = {
                name = "Znacznik kruchy",
                text = {
                    "Następny joker podstawowy",
                    "sklepu jest darmowy",
                    "i staje się {C:dark_edition}kruchy{}",
                },
            },
            tag_cry_glitched = {
                name = "Znacznik zglitchowany",
                text = {
                    "Następny joker podstawowy",
                    "sklepu jest darmowy",
                    "i staje się {C:dark_edition}zglitchowany{}",
                },
            },
            tag_cry_gold = {
                name = "Znacznik złoty",
                text = {
                    "Następny joker podstawowy",
                    "sklepu jest darmowy",
                    "i staje się {C:dark_edition}złoty{}",
                },
            },
            tag_cry_gourmand = {
                name = "Znacznik smakosza",
                text = {
                    "W sklepie jest darmowy",
                    "{C:attention}kulinarny joker",
                },
            },
            tag_cry_loss = {
                name = "Strata",
                text = {
                    "Daje darmową",
                    "{C:cry_ascendant}paczkę memiczną",
                },
            },
            tag_cry_m = {
                name = "Znacznik wesoły",
                text = {
                    "Następny joker podstawowy",
                    "sklepu jest darmowy",
                    "i staje się {C:dark_edition}wesoły{}",
                },
            },
            tag_cry_memory = {
                name = "Znacznik pamięciowy",
                text = {
                    "Daje {C:attention}#1#{} kopie",
                    "poprzedniego użytego {C:attention}znacznika{}",
                    "w tym podejściu",
                    "{s:0.8,C:inactive}Z wyjątkiem znaczników kopiujących",
                    "{s:0.8,C:inactive}Obecnie: {s:0.8,C:attention}#2#",
                },
            },
            tag_cry_mosaic = {
                name = "Znacznik mozaiczny",
                text = {
                    "Następny joker podstawowy",
                    "sklepu jest darmowy",
                    "i staje się {C:dark_edition}mozaiczny{}",
                },
            },
            tag_cry_oversat = {
                name = "Znacznik przesycony",
                text = {
                    "Następny joker podstawowy",
                    "sklepu jest darmowy",
                    "i staje się {C:dark_edition}przesycony{}",
                },
            },
            tag_cry_quadruple = {
                name = "Znacznik poczwórny",
                text = {
                    "Daje {C:attention}#1#{} kopie",
                    "następnego wybranego {C:attention}znacznika",
                    "{s:0.8,C:inactive}Z wyjątkiem znaczników kopiujących",
                },
            },
            tag_cry_quintuple = {
                name = "Znacznik popiątny",
                text = {
                    "Daje {C:attention}#1#{} kopie",
                    "następnego wybranego {C:attention}znacznika",
                    "{s:0.8,C:inactive}Z wyjątkiem znaczników kopiujących",
                },
            },
            tag_cry_rework = {
                name = "Znacznik przeróbki",
                text = {
                    "W sklepie jest",
                    "{C:cry_code}przerobiony joker",
                },
            },
            tag_cry_schematic = {
                name = "Znacznik schematyczny",
                text = {
                    "W sklepie jest",
                    "{C:attention}Burza Mózgów",
                },
            },
            tag_cry_scope = {
                name = "Znacznik zakresowy",
                text = {
                    "{C:attention}+#1# {C:blue}do ręki{} i",
                    "{C:red}zrzutek{} w następnej rundzie",
                },
            },
            tag_cry_triple = {
                name = "Znacznik potrójny",
                text = {
                    "Daje {C:attention}#1#{} kopie",
                    "następnego wybranego {C:attention}znacznika",
                    "{s:0.8,C:inactive}Z wyjątkiem znaczników kopiujących",
                },
            },
        },
        Tarot = {
            c_cry_automaton = {
                name = "Automatyzacja",
                text = {
                    "Otrzymujesz {C:attention}#1#",
                    "losową kartę {C:cry_code}Kodową{}",
                    "{C:inactive}(wymaga miejsca)",
                },
            },
            c_cry_eclipse = {
                name = "Zaćmienie",
                text = {
                    "Ulepsza {C:attention}#1#{} wybraną kartę",
                    "do: {C:attention}Karta Echa",
                },
            },
            c_cry_meld = {
                name = "Wtopienie",
                text = {
                    "Wybierz {C:attention}jokera{} lub",
                    "{C:attention}kartę rozgrywającą{}, aby",
                    "stała się {C:dark_edition}Dwustronna",
                },
            },
            c_cry_theblessing = {
                name = "Błogosławieństwo",
                text = {
                    "Otrzymujesz {C:attention}1{}",
                    "losowy {C:attention}przedmiot zużywalny{}",
                    "{C:inactive}(wymaga miejsca){}",
                },
            },
        },
        Voucher = {
            v_cry_asteroglyph = {
                name = "Asteroglif",
                text = {
                    "Ustawia wejście na {C:attention}#1#{}",
                },
            },
            v_cry_blankcanvas = {
                name = "Puste płótno",
                text = {
                    "{C:attention}+#1#{} do rozmiaru ręki",
                },
            },
            v_cry_clone_machine = {
                name = "Maszyna klonująca",
                text = {
                    "Znaczniki podwójne stają się",
                    "{C:attention}Znacznikami popiątnymi{} i",
                    "pojawiają się {C:attention}4X{} częściej",
                },
            },
            v_cry_command_prompt = {
                name = "Wiersz poleceń",
                text = {
                    "{C:cry_code}Karty Kodowe{}",
                    "można kupić",
                    "w {C:attention}sklepie{}",
                },
            },
            v_cry_copies = {
                name = "Kopie",
                text = {
                    "Znaczniki podwójne stają się",
                    "{C:attention}Znacznikami potrójnymi{} i",
                    "pojawiają się {C:attention}2X{} częściej",
                },
            },
            v_cry_curate = {
                name = "Kunszt",
                text = {
                    "Wszystkie karty",
                    "pojawiają się z",
                    "{C:dark_edition}edycją{}",
                },
            },
            v_cry_dexterity = {
                name = "Zręczność",
                text = {
                    "Zyskujesz na stałe",
                    "{C:blue}+#1#{} do ręki",
                    "na rundę",
                },
            },
            v_cry_double_down = {
                name = "Podwojenie stawki",
                text = {
                    "Po każdej rundzie,",
                    "{X:dark_edition,C:white} X1.5 {} do wszystkich wartości",
                    "tylnej części",
                    "{C:dark_edition}Kart Dwustronnych{}"
                },
            },
            v_cry_double_slit = {
                name = "Podwójna szczelina",
                text = {
                    "{C:attention}Wtopienie{} mogą",
                    "pojawić się w sklepie i",
                    "{C:tarot}paczkach wiedzy tajemnej{}",
                },
            },
            v_cry_double_vision = {
                name = "Podwójne widzenie",
                text = {
                    "{C:dark_edition}Karty Dwustronne{} pojawiają się",
                    "{C:attention}4X{} razy częściej",
                },
            },
            v_cry_fabric = {
                name = "Uniwersalna tkanina",
                text = {
                    "{C:dark_edition}+#1#{} sloty na jokera",
                },
            },
            v_cry_massproduct = {
                name = "Masowa produkcja",
                text = {
                    "Wszystkie karty i paczki",
                    "w sklepie kosztują {C:attention}$1{}",
                },
            },
            v_cry_moneybean = {
                name = "Pieniężna Fasola",
                text = {
                    "Zwiększa limit",
                    "zdobywanych odstetek",
                    "w każdej rundzie do {C:money}$#1#{}",
                },
            },
            v_cry_overstock_multi = {
                name = "Nadmiar zapasów++",
                text = {
                    "{C:attention}+#1#{} slot na kartę",
                    "{C:attention}+#1#{} slot na paczkę wzmacniającą",
                    "w sklepie",
                },
            },
            v_cry_pacclimator = {
                name = "Planetarny aklimator",
                text = {
                    "Karty {C:planet}Planet{} pojawiają się",
                    "{C:attention}X#1#{} częściej",
                    "w sklepie",
                    "Wszystkie następne Karty {C:planet}Planet{}",
                    "stają się {C:green}darmowe{}",
                },
            },
            v_cry_pairamount_plus = {
                name = "Paramount Plus",
                text = {
                    "{C:attention}Aktywuje ponownie{} wszystkie M Jokery",
                    "za każdą Parę",
                    "{C:attention}zawartą{} w zagranej ręce",
                },
            },
            v_cry_pairing = {
                name = "Parowanie",
                text = {
                    "{C:attention}Aktywuj ponownie{} wszystkie M Jokery",
                    "jeśli zagrana ręka ma {C:attention}Parę",
                },
            },
            v_cry_quantum_computing = {
                name = "Obliczenia kwantowe",
                text = {
                    "{C:cry_code}Karty Kodowe{} mogą pojawić się w sklepie",
                    "z {C:dark_edition}negatywną{} edycją",
                },
            },
            v_cry_repair_man = {
                name = "Pan od par",
                text = {
                    "{C:attention}Aktywuj ponownie{} wszystkie M Jokery",
                    "jeśli zagrana ręka zawiera {C:attention}Parę",
                },
            },
            v_cry_rerollexchange = {
                name = "Zmiana losu",
                text = {
                    "Ponowne rzuty",
                    "kosztują {C:attention}$2{}",
                },
            },
            v_cry_satellite_uplink = {
                name = "Satelitarny łącznik",
                text = {
                    "{C:cry_code}Karty Kodowe{} mogą",
                    "pojawić się w każdej",
                    "{C:attention}paczce niebiańskiej{}",
                },
            },
            v_cry_scope = {
                name = "Zakres galaktyczny",
                text = {
                    "Tworzy kartę {C:planet}Planety",
                    "za zagrany",
                    "{C:attention}układ pokerowy{}",
                    "{C:inactive}(wymaga miejsca){}",
                },
            },
            v_cry_tacclimator = {
                name = "Tarotowy aklimator",
                text = {
                    "Karty {C:tarot}Tarota{} pojawiają się",
                    "{C:attention}X#1#{} razy częściej",
                    "w sklepie",
                    "Wszystkie następne Karty {C:tarot}Tarota{}",
                    "stają się {C:green}darmowe{}",
                },
            },
            v_cry_tag_printer = {
                name = "Drukarka znaczników",
                text = {
                    "Znaczniki podwójne stają się",
                    "{C:attention}Znacznikami poczwórnymi{} i",
                    "pojawiają się {C:attention}3X{} częściej",
                },
            },
            v_cry_threers = {
                name = "3 x R",
                text = {
                    "Na stałe",
                    "zyskujesz {C:red}+#1#{} do zrzutek",
                    "w każdej rundzie",
                },
            },
            v_cry_stickyhand = {
                name = "Lepka dłoń",
                text = {
                    "{C:attention}+#1#{} do limitu wyboru kart",
                },
            },
            v_cry_grapplinghook = {
                name = "Hak chwytający",
                text = {
                    "{C:attention}+#1#{} do limitu wyboru kart",
                    "{C:inactive,s:0.7}Możesz zrobić o wiele więcej, niż myślisz.{}",
                },
            },
            v_cry_hyperspacetether = {
                name = "Hiperprzestrzenny łańcuch",
                text = {
                    "{C:attention}+#1#{} do limitu wyboru kart",
                    "{C:inactive,s:0.7}UWAGA: W przyszłości będzie mieć dodatkowe funkcje{}",
                },
            },
        },
        Other = {
            banana = {
                name = "Bananowy",
                text = {
                    "{C:green}#1# na #2#{} szans, że ta karta",
                    "zostanie zniszczona  na końcu rundy",
                },
            },
            cry_rigged = {
                name = "Gwarantowany",
                text = {
                    "Wszystkie {C:cry_code}wymienione{} prawdopodobieństwa",
                    "są {C:cry_code}zagwarantowane",
                },
            },
            cry_hooked = {
                name = "Zahaczony",
                text = {
                    "Kiedy ten joker jest {C:cry_code}aktywowany{},",
                    "aktywuje {C:cry_code}#1#",
                },
            },
            cry_flickering = {
                name = "Migoczący",
                text = {
                    "Ulega samozniszczeniu",
                    "po {C:attention}#1#{} aktywacjach",
                    "{C:inactive}({C:attention}#2#{C:inactive} pozostało)"
                },
            },
            cry_flickering_desc = { --used by choco dice
                name = "Migoczący",
                text = {
                    "Ulega samozniszczeniu po",
                    "{C:attention}#1#{} aktywacjach",
                },
            },
            cry_possessed = {
                name = "Opętany",
                text = {
                    "{C:attention}Wyłącza{} i {C:attention}odwraca{}",
                    "efekty, jeśli to możliwe",
                    "Ulega zniszczeniu razem z {C:attention}Duchem"
                },
            },
            --todo? add candy jokers to list
            food_jokers = {
                name = "Kulinarne jokery",
                text = {
                    "{s:0.8}Gros Michel, Jajo, Lody, Cavendish,",
                    "{s:0.8}Czarna Fasola, Dietetyczna Cola, Popcorn, Ramen,",
                    "{s:0.8}Seltzer, Ogór, Papryczka Chilli, Karmel,",
                    "{s:0.8}Nostalgiczny Cukierek, Fast Foodowe M, itd.",
                },
            },
            ev_cry_choco0 = {
                name = "",
                text = {
                    "Szczegóły aktywnego",
                    "{C:cry_ascendant,E:1}wydarzenia{} pojawią się tutaj"
                }
            },
            ev_cry_choco1 = {
                name = "1: Opętanie",
                text = {
                    "{C:attention}Jokery{} i karty rozgrywające mają",
                    "{C:green}1 na 3{} szans na Migotanie",
                    "Tworzy {C:attention}Ducha",
                    "{C:inactive,s:0.7}Zostałeś opętany przez Ducha, a twoja",
                    "{C:inactive,s:0.7}świadomość migocze w tę i z powrotem."
                }
            },
            ev_cry_choco2 = {
                name = "2: Nawiedzony Dom",
                text = {
                    "Uniemożliwia pomijanie {C:attention}Przeszkadzajki{}",
                    "Jeden {C:attention}ponowny rzut{} na sklep",
                    "Ceny {C:attention}kuponów{} są podwojone",
                    "{C:inactive,s:0.7}Upiorne duchy przejęły kontrolę! Niczego nie dotykaj",
                    "{C:inactive,s:0.7}i uciekaj stąd jak najszybciej!",
                }
            },
            ev_cry_choco3 = {
                name = "3: Napary Czarownnic",
                text = {
                    "Tworzy 3 {C:attention}mikstury",
                    "Wypij jedną z nich podczas {C:attention}małej w ciemno{},",
                    "albo {C:attention}wszystkie{} negatywne efekty zostaną zastosowane w tym {C:attention}wejściu",
                    "{C:inactive,s:0.7}Zostałeś porwany przez wiedźmę!",
                    "{C:inactive,s:0.7}Oferuje ci trzy mikstury, obserwując cię bardzo uważnie.",
                    "{C:inactive,s:0.7}Wybierz jedną, zanim ona podejmie decyzję za ciebie",
                }
            },
            ev_cry_choco4 = {
                name = "4: Księżycowa Otchłań",
                text = {
                    "Zagrane karty mają  {C:green}1 na 4{} szans",
                    "na zmianę w losową figurę karcianą o randze {C:club}Trefl{}",
                    "{C:attention}Mnożnik{} dzieli się przez ilość zagranych figur karcianych",
                    "{C:inactive,s:0.7}Nawet człowiek o czystym sercu,",
                    "{C:inactive,s:0.7}modlący się co noc..."
                }
            },
            ev_cry_choco5 = {
                name = "5: Krwiopijca",
                text = {
                    "Usuwa {C:attention}ulepszenia{} ze wszystkich zagranych kart",
                    "{C:green}1 na 3{} szans na zniszczenie",
                    "{C:heart}Kierów{} i {C:diamond}Pików{}",
                    "{C:inactive,s:0.7}Bądź czujny w środku nocy wobec",
                    "{C:inactive,s:0.7,E:1}tych w cieniu{C:inactive,s:0.7}, czekających na zaspokojenie ich pragnień..."
                }
            },
            ev_cry_choco6 = {
                name = "6: Proszę, weź jednego",
                text = {
                    "{C:attention}Na koniec rundy{}, otwierasz",
                    "losową {C:attention}paczkę wzmacniającą{}",
                    "{C:inactive,s:0.7}Spacerując po ulicach, twoim oczom rzuca się",
                    "{C:inactive,s:0.7}skrzynia pełna paczek wzmacniających. Masz, poczęstuj się!"
                }
            },
            ev_cry_choco7 = {
                name = "7: Świąteczna Atmosfera",
                text = {
                    "Tworzy 3 kopie karty {C:attention}Cukierek albo Psikus{} 1 {C:attention}Kosz Słodyczy",
                    "W sklepie co rundę pojawia się {C:attention}Cukierek albo Psikus{}",
                    "{C:cry_candy}Słodycze{} dają {C:money}$3{} po nabyciu",
                    "{C:inactive,s:0.7}Okolica jest przystrojona wszelkimi upiornościami,",
                    "{C:inactive,s:0.7}przyjdź i poczuj świąteczną atmosferę!"
                }
            },
            ev_cry_choco8 = {
                name = "8: Cukierkowy Deszcz",
                text = {
                    "Kiedy {C:attention}Przeszkadzajka{} jest pokonana, zyskujesz 1 {C:cry_candy}Cukierek{}",
                    "za każdą pozostałą rękę. Dostajesz {C:attention}kulinarnego jokera,{}",
                    "kiedy {C:cry_candy}Cukierek{} zostaje wytworzony",
                    "{C:inactive,s:0.7}Z nieba spada deszcz cukierków!",
                    "{C:inactive,s:0.7,E:1}Szybko, weź ile potrafisz!"
                }
            },
            ev_cry_choco9 = {
                name = "9: Upiorne Bogactwa",
                text = {
                    "Zyskujesz {C:money}$20",
                    "Wszystkie zdobyte {C:money}pieniądze{} są {C:attention}podwojone",
                    "{C:inactive,s:0.7}Widmo dawno zmarłego krewnego",
                    "{C:inactive,s:0.7}odwiedza cię w środku nocy!",
                    "{C:inactive,s:0.7}Bez słowa, kładzie worek pieniędzy w twe dłonie,",
                    "{C:inactive,s:0.7}uśmiecha się ciepło i rozpływa się w powietrzu.",
                }
            },
            ev_cry_choco10 = {
                name = "10: Szanowany Antyk",
                text = {
                    "{C:legendary}Legendary{} {C:attention}joker{} pojawia się",
                    "w slocie na {C:attention}Kupony{} za {C:money}$50",
                    "Da się go kupić tylko jako {C:attention}ostatni{} przedmiot sklepu",
                    "{C:inactive,s:0.7}Przyciągnąłeś uwagę ducha relikwii,",
                    "{C:inactive,s:0.7}lecz stłumienie go nie będzie łatwe.",
                }
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
                name = "Wieczny",
                text = {
                    "Wszystkie karty w paczce",
                    "są {C:attention}Wieczne{}",
                },
            },
            cry_perishable_booster = {
                name = "Nietrwały",
                text = {
                    "Wszystkie karty w paczce",
                    "są {C:attention}Nietrwałe{}",
                },
            },
            cry_rental_booster = {
                name = "Rental",
                text = {
                    "Wszystkie karty w paczce",
                    "są {C:attention}Wypożyczone{}",
                },
            },
            cry_pinned_booster = {
                name = "Przyszpilony",
                text = {
                    "Wszystkie karty w paczce",
                    "są {C:attention}Przyszpilone{}",
                },
            },
            cry_banana_booster = {
                name = "Banana",
                text = {
                    "Wszystkie karty w paczce",
                    "są {C:attention}Bananowe{}",
                },
            },
            cry_eternal_voucher = {
                name = "Wieczny",
                text = {
                    "Nie może być wymieniony",
                },
            },
            cry_perishable_voucher = {
                name = "Nietrwały",
                text = {
                    "Osłabienie po",
                    "{C:attention}#1#{} rund",
                    "{C:inactive}(pozostało: {C:attention}#2#{C:inactive})",
                },
            },
            cry_rental_voucher = {
                name = "Wypożyczony",
                text = {
                    "Tracisz {C:money}#1#${} na",
                    "końcu rundy",
                },
            },
            cry_pinned_voucher = {
                name = "Przyszpilony",
                text = {
                    "Zostaje w sklepie",
                    "do momentu wykupienia",
                },
            },
            cry_banana_voucher = {
                name = "Bananowy",
                text = {
                    "{C:green}#1# na #2#{} szans",
                    "na zniknięcie pod koniec rundy",
                },
            },
            cry_perishable_consumeable = {
                name = "Nietrwały",
                text = {
                    "Osłabiony na",
                    "końcu rundy",
                },
            },
            cry_rental_consumeable = {
                name = "Wypożyczony",
                text = {
                    "Tracisz {C:money}$#1#{} na koniec",
                    "rundy i po użyciu",
                },
            },
            cry_pinned_consumeable = {
                name = "Przyszpilony",
                text = {
                    "Nie można użyć innych",
                    "nie-{C:attention}Przyszpilonych{} przedmiotów zużywalnych",
                },
            },
            cry_banana_consumeable = {
                name = "Bananowy",
                text = {
                    "{C:green}#1# na #2#{} na zrobienie",
                    "niczego",
                },
            },
            p_cry_code_normal_1 = {
                name = "Paczka programowa",
                text = {
                    "Wybierz {C:attention}#1#{} z",
                    "{C:attention}#2#{} kart {C:cry_code}Kodowych{}",
                },
            },
            p_cry_code_normal_2 = {
                name = "Paczka programowa",
                text = {
                    "Wybierz {C:attention}#1#{} z",
                    "{C:attention}#2#{} kart {C:cry_code}Kodowych{}",
                },
            },
            p_cry_code_jumbo_1 = {
                name = "Olbrzymia paczka programowa",
                text = {
                    "Wybierz {C:attention}#1#{} z",
                    "{C:attention}#2#{} kart {C:cry_code}Kodowych{}",
                },
            },
            p_cry_code_mega_1 = {
                name = "Megapaczka programowa",
                text = {
                    "Wybierz {C:attention}#1#{} z",
                    "{C:attention}#2#{} kart {C:cry_code}Kodowych{}",
                },
            },
            p_cry_empowered = {
                name = "Paczka kart Ducha [Znacznik władny]",
                text = {
                    "Wybierz {C:attention}#1#{} z",
                    "{C:attention}#2#{} kart {C:spectral}Ducha{} ",
                    "{s:0.8,C:inactive}(stworzona przez znacznik władczy)",
                },
            },
            p_cry_meme_1 = {
                name = "Paczka memiczna",
                text = {
                    "Wybierz {C:attention}#1#{} z",
                    "{C:attention}#2# memicznych jokerów{}",
                },
            },
            p_cry_meme_two = {
                name = "Paczka memiczna",
                text = {
                    "Wybierz {C:attention}#1#{} z",
                    "{C:attention}#2# memicznych jokerów{}",
                },
            },
            p_cry_meme_three = {
                name = "Paczka memiczna",
                text = {
                    "Wybierz {C:attention}#1#{} z",
                    "{C:attention}#2# memicznych jokerów{}",
                },
            },
            undiscovered_code = {
                name = "Nie odkryto",
                text = {
                    "Kup albo użyj",
                    "tej karty w",
                    "nierozstawionym podejściu,",
                    "by dowiedzieć się, jaki jest jej efekt"
                }
            },
            undiscovered_unique = {
                name = "Nie odkryto",
                text = {
                    "Kup albo użyj",
                    "tej karty w",
                    "nierozstawionym podejściu,",
                    "by dowiedzieć się, jaki jest jej efekt"
                }
            },
            cry_green_seal = {
                name = "Zielona Pieczęć",
                text = {
                    "Tworzy {C:cry_code}Kartę Kodową{}",
                    "kiedy zagrana karta nie zdobywa punktów",
                    "{C:inactive}(wymaga miejsca)",
                },
            },
            cry_azure_seal = {
                name = "Azurowa Pieczęć",
                text = {
                    "Tworzy {C:attention}#1#{} {C:dark_edition}Negatywy{}",
                    "{C:planet}Kart Planet{} za zagrany",
                    "{C:attention}układ pokerowy{}, a następnie",
                    "{C:red}niszczy{} kartę",
                },
            },
            blurred_sdm0 = {
                name = "a",
                text = {
                    "{C:inactive,s:0.8}\"Nienawidzę tej karty\" - SDM0, 2024{}",
                },
            },
        },
        Unique = {
            c_cry_potion = {
                name = "Mikstura",
                text = {
                    "Aplikuje nieznany",
                    "{C:attention}negatywny efekt{} kiedy spożyta",
                    "{C:inactive,s:0.7}Zdobyta poprzez Czekoladową Kostkę"
                }
            }
        }
    },
    misc = {
        poker_hands = {
            ['cry_Bulwark'] = "Bastion",
            ['cry_Clusterfuck'] = "Totalny Rozpierdol",
            ['cry_UltPair'] = "Para Ostateczna",
            ['cry_WholeDeck'] = "Cała Pierdolona Talia",
        },
        poker_hand_descriptions = {
            ['cry_Bulwark'] = {
                '5 kart bez rangi i koloru',
            },
            ['cry_Clusterfuck'] = {
                'Co najmniej 8 kart, które',
                'nie zawierają Pary, Koloru, lub Strita',
            },
            ['cry_UltPair'] = {
                'Two Two Pairs, where each',
                'Two Pair is a single suit, for a',
				'total of two suits between them',
            },
            ['cry_WholeDeck'] = {
                'Ręka, która zawiera każdą',
                'kartę w 52-kartowej talii.',
                'Zwariowałeś?',
            },
        },
        achievement_names = {
            ach_cry_ace_in_crash = "Kieszonkowy As",
            ach_cry_blurred_blurred_joker = "Prawie Niewidomy",
            ach_cry_bullet_hell = "Bullet Hell",
            ach_cry_break_infinity = "Przełam Nieskończoność",
            ach_cry_cryptid_the_cryptid = "Cryptid the Cryptid",
            ach_cry_exodia = "Exodia",
            ach_cry_freak_house = "Dom Wariatów",
            ach_cry_googol_play_pass = "Googol Play Pass",
            ach_cry_haxxor = "H4xx0r",
            ach_cry_home_realtor = "Agent Nieruchomości",
            ach_cry_jokes_on_you = "Wystrychnięty na Dudka",
            ach_cry_niw_uoy = "!owtsęicywZ",
            ach_cry_now_the_fun_begins = "Czas na Prawdziwą Zabawę",
            ach_cry_patience_virtue = "Cierpliwość Jest Cnotą",
            ach_cry_perfectly_balanced = "Idealnie Zbalansowane",
            ach_cry_pull_request = "Prośba o Połączenie",
            ach_cry_traffic_jam = "Korek Uliczny",
            ach_cry_ult_full_skip = "Absolutny Przeskok",
            ach_cry_used_crash = "Ostrzegaliśmy Cię",
            ach_cry_what_have_you_done = "CO NAROBIŁEŚ!?",
        },
        achievement_descriptions = {
            ach_cry_ace_in_crash = 'check_for_unlock({type = "ace_in_crash"})',
            ach_cry_blurred_blurred_joker = "Zdobądź niewyraźnego Niewyraźnego Jokera",
            ach_cry_bullet_hell = "Posiadaj 15 AP Jokerów",
            ach_cry_break_infinity = "Zdobądź 1.79e308 żetonów z pojedyńczej ręki",
            ach_cry_cryptid_the_cryptid = "Użyj Kryptydy na Kryptydzie",
            ach_cry_exodia = "Posiadaj  5 egzotycznych jokerów",
            ach_cry_freak_house = "Zagraj Garnitur Koloru z 6 i 9 karo posiadając Najs",
            ach_cry_googol_play_pass = "Zhakuj Kartę Googol Play",
            ach_cry_haxxor = "Wpisz kod do gry",
            ach_cry_home_realtor = "Aktywuj Szczęśliwy Dom przed 8 wejściem (bez Talii Równowagi/Antymateryjnej)",
            ach_cry_jokes_on_you = "Aktywuj efekt Dowcipu w pierwszym wejściu i wygraj podejście",
            ach_cry_niw_uoy = "Osiągnij stawkę -8",
            ach_cry_now_the_fun_begins = "Zdobądź Płótno",
            ach_cry_patience_virtue = "Podczas Lawendowej Pętli, przeczekaj 2 minuty zanim zagrasz pierwszą rękę i pokonaj przeszkadzajkę",
            ach_cry_perfectly_balanced = "Pokonaj Bardzo Uczciwą Talię na poziomie trudności Dominująca stawka",
            ach_cry_pull_request = "Spraw, aby ://COMMIT stworzył tego samego jokera, którego zniszczył",
            ach_cry_traffic_jam = "Pokonaj wszystkie wyzwania Godzin Szczytu",
            ach_cry_ult_full_skip = "Wygraj w 1 rundzie",
            ach_cry_used_crash = "Użyj ://CRASH",
            ach_cry_what_have_you_done = "Sprzedaj lub poświęć egzotycznego jokera",
        },
        challenge_names = {
            c_cry_ballin = "Ballin'",
            c_cry_boss_rush = "Enter the Gungeon",
            c_cry_dagger_war = "Wojna na Sztylety",
            c_cry_joker_poker = "Joker Poker",
            c_cry_onlycard = "Pojedyńcza Karta",
            c_cry_rng = "RNG",
            c_cry_rush_hour = "Godzina Szczytu I",
            c_cry_rush_hour_ii = "Godzina Szczytu II",
            c_cry_rush_hour_iii = "Godzina Szczytu III",
            c_cry_sticker_sheet = "Arkusz z Naklejkami",
            c_cry_sticker_sheet_plus = "Arkusz z Naklejkami+",
        },
        dictionary = {
            --Settings Menu
            cry_set_features = "Funkcje",
            cry_set_music = "Muzyka",
            cry_set_enable_features = "Wybierz funkcje do włączenia (zastosują się po ponownym uruchomieniu gry):",
            cry_feat_achievements = "Wyzwania",
            ["cry_feat_antimatter deck"] = "Talia Antymateryjna",
            cry_feat_blinds = "Przeszkadzajki",
            cry_feat_challenges = "Wyzwania",
            ["cry_feat_code cards"] = "Karty Kodowe",
            ["cry_feat_misc. decks"] = "Różnorodne Talie",
            ["cry_feat_https module"] = "Moduł HTTPS",
            ["cry_feat_timer mechanics"] = "Mechanizm czasomierza",
            ["cry_feat_enhanced decks"] = "Ulepszone Talie",
            ["cry_feat_epic jokers"] = "Epickie Jokery",
            ["cry_feat_exotic jokers"] = "Egzotyczne Jokery",
            ["cry_feat_m jokers"] = "M Jokery",
            cry_feat_menu = "Niestandardowe Menu Główne",
            ["cry_feat_misc."] = "Różnorodne Jokery",
            ["cry_feat_misc. jokers"] = "Inne Jokery",
            cry_feat_planets = "Karty Planet",
            cry_feat_jokerdisplay = "JokerDisplay (Nie robi nic)",
            cry_feat_tags = "Znaczniki",
            cry_feat_sleeves = "Pokrowce",
            cry_feat_spectrals = "Karty Ducha",
            cry_feat_spooky = "Upiorna Aktualizacja",
            ["cry_feat_more stakes"] = "Stawki",
            cry_feat_vouchers = "Kupony",
            cry_mus_jimball = "Jimball (Funkytown by Lipps Inc. - Chroniony prawem autorskim)",
            cry_mus_code = "Karty Kodowe (://LETS_BREAK_THE_GAME by HexaCryonic)",
            cry_mus_exotic = "Egzotyczne Jokery (Joker in Latin by AlexZGreat)",
            cry_mus_high_score = "Wysoki Wynik (Finałowy Boss [Dla Twojego Komputera] by AlexZGreat)",

            k_cry_program_pack = "Paczka Programowa",
            k_cry_meme_pack = "Paczka Memiczna",

            cry_critical_hit_ex = "Trafienie Krytyczne!",
            cry_critical_miss_ex = "Krytyczne chybienie!",

            cry_potion1 = "-1 do wszystkich układów pokerowych",
            cry_potion2 = "X1.15 rozmiaru Przeszkadzajki",
            cry_potion3 = "-1 Ręka i zrzutka",

            cry_debuff_oldhouse = "Full House nie może być zagrany",
            cry_debuff_oldarm = "Należy zagrać 4 albo mniej kart",
            cry_debuff_oldpillar = " Strit nie może być zagrany",
            cry_debuff_oldflint = "Kolor nie może być zagrany",
            cry_debuff_oldmark = "Zagranie nie może posiadać Pary",
            cry_debuff_obsidian_orb = "Aplikuje zdolności wszystkich pokonanych bossów",

            k_code = "Kod",
            k_unique = "Unikalny",
            b_code_cards = "Karty Kodowe",
            b_unique_cards = "Unikalne Karty",
            b_pull = "PULL",
            cry_hooked_ex = "Zahaczone!",
            k_end_blind = "Koniec przeszkadzajki",

            cry_code_rank = "WPROWADŹ RANGĘ",
            cry_code_enh = "WPROWADŹ ULEPSZENIE",
            cry_code_hand = "WPROWADŹ UKŁAD POKEROWY",
            cry_code_enter_card = "WPROWADŹ KARTĘ",
            cry_code_apply = "ZASTOSUJ",
            cry_code_apply_previous = "ZASTOSUJ POPRZEDNI",
            cry_code_exploit = "WYKORZYSTAJ",
            cry_code_exploit_previous = "WYKORZYSTAJ POPRZEDNI",
            cry_code_create = "STWÓRZ",
            cry_code_create_previous = "STWÓRZ POPRZEDNI",
            cry_code_execute = "WYKONAJ",
            cry_code_cancel = "ANULUJ",

            b_flip = "ODWRÓĆ",
            b_merge = "SCAL",

            cry_hand_bulwark = "Bastion",
            cry_hand_clusterfuck = "Totalny Rozpierdol",
            cry_hand_ultpair = "Para Ostateczna",

            cry_again_q = "Znowu?",
            cry_curse = "Klątwa",
            cry_curse_ex = "Klątwa!",
            cry_sobbing = "Pomóż mi...",
            cry_gaming = "Granie",
            cry_gaming_ex = "Granie!",
            cry_sus_ex = "Impostor!",
            cry_jolly_ex = "Uśmiechnij się!",
            cry_m_minus = "m",
            cry_m = "M",
            cry_m_ex = "M!",
            cry_minus_round = "-1 runda",
            cry_plus_cryptid = "+1 Kryptyda",
            cry_no_triggers = "Koniec aktywacji!",
            cry_unredeemed = "Nieodkupiony...",
            cry_active = "Aktywny",
            cry_inactive = "Nieaktywny",

            k_disable_music = "Wyłącz muzykę",

            k_cry_epic = "Epicki",
            k_cry_exotic = "Egzotyczny",
            k_cry_candy = "Cukierek",
            k_cry_cursed  = "Przeklęty",
            k_planet_disc = "Dysk Protoplanetarny",
            k_planet_satellite = "Naturalne Satelity",
            k_planet_universe = "Cały Pierdolony Wszechświat",

            cry_notif_jimball_1 = "Jimball",
            cry_notif_jimball_2 = "Informacja o prawach autorskich",
            cry_notif_jimball_d1 = "Jimball gra utwór \"Funkytown\",",
            cry_notif_jimball_d2 = "który jest objęty prawami autorskimi i nie może być",
            cry_notif_jimball_d3 = "używany do streamów i filmów.",
        },
        labels = {
            food_jokers = "Kulinarne jokery",
            banana = "Bananowy",
            code = "Kodowy",
            unique = "Unikalny",
            cry_rigged = "Gwarantowany",
            cry_hooked = "Zahaczony",
            cry_flickering = "Migoczący",
            cry_possessed = "Opętany",

            cry_green_seal = "Zielona Pieczęć",
            cry_azure_seal = "Azurowa Pieczęć",

            cry_astral = "Astralna",
            cry_blur = "Niewyraźna",
            cry_double_sided = "Dwustronna",
            cry_glass = "Krucha",
            cry_glitched = "Zgliczowana",
            cry_gold = "Złota",
            cry_m = "Wesoła",
            cry_mosaic = "Mozaiczna",
            cry_noisy = "Hałaśliwa",
            cry_oversat = "Przesycona",

            k_cry_epic = "Epicki",
            k_cry_exotic = "Egzotyczny",
            k_cry_candy = "Cukierek",
            k_cry_cursed  = "Przeklęty",
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
            a_xchips = {"X#1# Chips"},
            a_powmult = {"^#1# Mult"},
            a_powchips = {"^#1# Chips"},
            a_powmultchips = {"^#1# Mult+Chips"},
            a_round = {"+#1# Round"},
            a_candy = {"+#1# Candy"},
            a_xchips_minus = {"-X#1# Chips"},
            a_powmult_minus = {"-^#1# Mult"},
            a_powchips_minus = {"-^#1# Chips"},
            a_powmultchips_minus = {"-^#1# Mult+Chips"},
            a_round_minus = {"-#1# Round"},

            a_tag = {"#1# Tag"},
            a_tags = {"#1# Tags"},

            cry_sticker_name = {"#1# Sticker"},
            cry_sticker_desc = {
                "Used this Joker",
                "to win on #2##1#",
                "#2#Stake#3# difficulty"
            },

            cry_art = {"Art: #1#"},
            cry_code = {"Code: #1#"},
            cry_idea = {"Idea: #1#"}
        },
        v_text = {
            ch_c_cry_all_perishable = {"Wszystkie jokery są {C:eternal}nietrwałe{}"},
            ch_c_cry_all_rental = {"Wszystkie jokery są {C:eternal}wypożyczone{}"},
            ch_c_cry_all_pinned = {"Wszystkie jokery są {C:eternal}przyszpilone{}"},
            ch_c_cry_all_banana = {"Wszystkie jokery są {C:eternal}bananowe{}"},
            ch_c_all_rnj = {"Wszystkie jokery to {C:attention}RNJoker{}"},
            ch_c_cry_sticker_sheet_plus = {"Wszystkie karty dostępne w sklepie mają wszystkie naklejki"},
            ch_c_cry_rush_hour = {"Wszystkie bossy to {C:attention}Zegar{} lub {C:attention}Lawendowa Pętla"},
            ch_c_cry_rush_hour_ii = {"Wszystkie przeszkadzajki są {C:attention}przeszkadzajkami bossa{}"},
            ch_c_cry_rush_hour_iii = {"{C:attention}Zegar{} i {C:attention}Lawendowa Pętla{} skalują się {C:attention}dwa{} razy szybciej"},
            ch_c_cry_no_tags = {"Pomijanie jest {C:attention}zablokowane{}"},
            ch_c_cry_no_vouchers = {"{C:attention}Kupony{} nie pojawiają się w sklepie"},
            ch_c_cry_no_boosters = {"{C:attention}Paczki wzmacniające{} nie pojawiają się w sklepie"},
            ch_c_cry_no_rerolls = {"Ponowne rzuty są {C:attention}zablokowane{}"},
            ch_c_cry_no_consumables = {"{C:attention}Przedmioty zużywalne{} nie pojawiają się"}
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
            { "see this ad?", "if you are, then it's working", "and you could have it for your own" },
            { "YOU'RE MISSING OUT ON", "AT LEAST 5 VOUCHERS RIGHT NOW", "tonktonktonktonktonk" },
            { "10", "20 NO VOUCHER XD", "30 GOTO 10" },
            { "VOUCHERS", "ARE A PREMIUM FEATURE", "$199.99 JOLLARS TO UNLOCK" },
            { "TRUE VOUCHERLESS!?!?", "ASCENDANT STAKE ONLY", "VERY FAIR DECK" },
            { "ENJOYING YOUR", "VOUCHER EXPERIENCE? GIVE US A", "FIVE STAR RATING ON JESTELP" },
            { "FREE VOUCHERS", "HOT VOUCHERS NEAR YOU", "GET VOUCHERS QUICK WITH THIS ONE TRICK" },
            { "INTRODUCING", "THE VERY FIRST TIER 0 VOUCHER!", "(coming to Cryptid 1.0 soon)" },
            { "A VOUCHER!", "IT'S JUST IMAGINARY", "WE IMAGINED YOU WOULD WANT IT, THAT IS" },
            { "TURN OFF ADBLOCKER", "WITHOUT ADS, WE WOULDN'T", "BE ABLE TO SELL YOU VOUCHERS" },
            { "IF YOU HAVE", "A PROBLEM WITH THIS", "EMAIL IT TO US AT NORESPONSE@JMAIL.COM" },
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
        }
    }
}
