-- temporary replacement for mexican spanish
-- until someone does it, the other version should do
return {
    descriptions = {
        Back = {
            b_cry_antimatter = {
                name = "Baraja de antimateria",
                text = {
                    "Aplica las {C:legendary,E:1}ventajas{}",
                    "de {C:attention}todas{} las barajas",
                },
            },
            b_cry_beta = {
                name = "Baraja nostálgica",
                text = {
                    "Las ranuras de {C:attention}comodín{} y",
                    "{C:attention}consumibles{} se {C:attention}combinan",
                    "Las ciegas {C:attention}nostálgicas{} reemplazan",
                    "sus ciegas actualizadas"
                },
            },
            b_cry_blank = {
                name = "Baraja en blanco",
                text = {
                    "{C:inactive}¿No hace nada?",
                },
            },
			b_cry_bountiful = {
				name = "Baraja abundante",
				text = {
					"Siempre saca 5 cartas después",
					"de cada {C:attention}mano jugada{} o {C:attention}descarte{}",
				},
			},
            b_cry_CCD = {
                name = "Baraja CCD",
                text = {
                    "Todas las cartas también son",
                    "un consumible {C:attention}aleatorio{}",
                },
            },
            b_cry_conveyor = {
                name = "Baraja transportadora",
                text = {
                    "Los comodines {C:attention}no{} se pueden mover",
                    "Al principio de la runda,",
                    "{C:attention}duplica{} el comodín del extremo derecho",
                    "y {C:attention}destruye{} el comodín del extremo izquierdo",
                },
            },
            b_cry_critical = {
                name = "Baraja crítica",
                text = {
                    "Después de cada mano jugada,",
                    "{C:green}#1# en 4{} probabilidades para {X:dark_edition,C:white} ^2 {} multi",
                    "{C:green}#1# en 8{} probabilidades para {X:dark_edition,C:white} ^0.5 {} multi",
                },
            },
            b_cry_encoded = {
                name = "Baraja codificada",
                text = {
                    "Comienza con un {C:cry_code,T:j_cry_CodeJoker}Comodín de código{}",
                    "y {C:cry_code,T:j_cry_copypaste}Copiar y pegar{}",
                    "Sólo aparecen {C:cry_code}cartas de código{} en la tienda",
                },
            },
            b_cry_equilibrium = {
                name = "Baraja de equilibrio",
                text = {
                    "Todas las cartas tienen la ",
                    "{C:attention}misma probabilidad{} de",
                    "aparecer en las tiendas,",
                    "comienza la partida con",
                    "{C:attention,T:v_overstock_plus}Excedente plus",
                },
            },
            b_cry_glowing = {
                name = "Baraja brillante",
                text = {
                    "Multiplica los valores de",
                    "todos los comodines por {X:dark_edition,C:white} X1.25 {}",
                    "cuando se derrota a la {C:attention}ciega jefe{}",
                    "{X:cry_jolly,C:white,s:0.8} Jolly#1#Open#1#Winner#1#-#1#wawa#1#person", --peak loc_vars right here
                },
            },
            b_cry_infinite = {
                name = "Baraja infinita",
                text = {
                    "Puedes seleccionar {C:attention}cualquier",
                    "cantidad de cartas",
                    "{C:attention}+1{} tamaño de mano",
                },
            },
            b_cry_misprint = {
                name = "Baraja de errata",
                text = {
                    "Los valures de cartas",
                    "y manos de póker",
                    "se {C:attention}aleatorizan",
                },
            },
            b_cry_redeemed = {
                name = "Baraja redimida",
                text = {
                    "Cuando se compra un {C:attention}vale{},",
                    "obtén sus {C:attention}niveles extras",
                },
            },
            b_cry_spooky = {
                name = "Baraja espeluznante",
                text = {
                    "Comienza con un {C:attention,T:j_cry_chocolate_dice}Dado de chocolate {C:eternal}eterno{}",
                    "Después de cada {C:attention}apuesta{}, crea un comodín",
                    "de {C:cry_candy}dulce{} o {X:cry_cursed,C:white}maldito{}",
                }
            },
            b_cry_very_fair = {
                name = "Baraja Muy Justa",
                text = {
                    "{C:blue}-2{} manos, {C:red}-2{} descartes",
                    "en cada ronda",
                    "Los {C:attention}vales{} ya no",
                    "aparecen en la tienda",
                },
            },
            b_cry_wormhole = {
                name = "Baraja de agujero de gusano",
                text = {
                    "Comienza con un comodín {C:cry_exotic}exótico{C:attention}",
                    "Los comodines son {C:attention}20X{} más",
                    "probables de ser {C:dark_edition}Negativos",
                    "{C:attention}-2{} ranuras de comodín",
                },
            },
            b_cry_legendary = {
                name = "Baraja legendaria",
                text = {
                    "Comienza con un comodín {C:legendary}legendario{C:legendary}",
                    "{C:green}1 en 5{} probabilidades para crear otro",
					"cuando se derrota a la ciega jefe",
                    "{C:inactive}(debe haber espacio){}",
                },
            },
        },
        Blind = {
            bl_cry_box = {
                name = "La caja",
                text = {
                    "Todos los comodines comunes",
                    "se debilitan",
                },
            },
            bl_cry_clock = {
                name = "El reloj",
                text = {
                    "+0.1X requisitos de ciega por cada",
                    "3 segundos pasados en esta apuesta",
                },
            },
            bl_cry_hammer = {
                name = "El martillo",
                text = {
                    "Todas las cartas con rango",
                    "impar se debilitan",
                },
            },
            bl_cry_joke = {
                name = "La broma",
                text = {
                    "Si la puntuación excede 2X de los requisitos,",
                    "establece la apuesta a un múltiplo de #1#",
                },
            },
            bl_cry_magic = {
                name = "La magia",
                text = {
                    "Todas las cartas con rango",
                    "par se debilitan",
                },
            },
            bl_cry_lavender_loop = {
                name = "Ciclo lavanda",
                text = {
                    "1.25X requisitos de ciega por cada",
                    "1.5 segundos pasados en esta ronda",
                },
            },
            bl_cry_obsidian_orb = {
                name = "Orbe obsidiana",
                text = {
                    "Aplica las habilidades de",
                    "todos los jefes derrotados",
                },
            },
            bl_cry_oldarm = {
                name = "El brazo nostálgico",
                text = {
                    "Debes jugar 4",
                    "o menos cartas",
                },
            },
            bl_cry_oldfish = {
                name = "El pez nostálgico",
                text = {
                    "Todas las manos empiezan",
                    "con 1 multi",
                },
            },
            bl_cry_oldflint = {
                name = "El pedernal nostálgico",
                text = {
                    "Sin colores",
                },
            },
            bl_cry_oldhouse = {
                name = "La casa nostálgica",
                text = {
                    "Sin fulls",
                },
            },
            bl_cry_oldmanacle = {
                name = "El grillete nostálgico",
                text = {
                    "Divide multi por descartes",
                },
            },
            bl_cry_oldmark = {
                name = "La marca nostálgica",
                text = {
                    "Sin manos que",
                    "contengan una Pareja",
                },
            },
            bl_cry_oldox = {
                name = "El buey nostálgico",
                text = {
                    "Todas las manos empiezan",
                    "con 0 fichas",
                },
            },
            bl_cry_oldpillar = {
                name = "El pilar nostálgico",
                text = {
                    "Sin escaleras",
                },
            },
            bl_cry_oldserpent = {
                name = "La serpiente nostálgica",
                text = {
                    "Divide multi por el nivel",
                    "de la mano de póker jugada",
                },
            },
            bl_cry_pin = {
                name = "El alfiler",
                text = {
                    "Los comodines épicos o de mayor",
                    "rareza se debilitan",
                },
            },
            bl_cry_pinkbow = {
                name = "Moño rosado",
                text = {
                    "Aleatoriza la categoría de las cartas",
                    "en tu mano al jugar",
                },
            },
            bl_cry_sapphire_stamp = {
                name = "Estampilla safiro",
                text = {
                    "Selecciona una carta extra, deselecciona",
                    "una carta aleatoria antes de puntuar",
                },
            },
            bl_cry_shackle = {
                name = "El eslabón",
                text = {
                    "Todos los comodines negativos",
                    "se debilitan",
                },
            },
            bl_cry_striker = {
                name = "El ariete",
                text = {
                    "Todos los comodines raros",
                    "se debilitan",
                },
            },
            bl_cry_tax = {
                name = "El impuesto",
                text = {
                    "Puntuación por mano limitado a",
                    "0.4X requisitos de ciega",
                },
            },
            bl_cry_tornado = {
                name = "Tornado turquesa",
                text = {
                    "#1# en #2# probabilidades para",
                    "que la mano jugada no puntúe",
                },
            },
            bl_cry_trick = {
                name = "El truco",
                text = {
                    "Después de cada mano, voltea todas",
                    "las cartas boca-arriba en tu mano",
                },
            },
            bl_cry_vermillion_virus = {
                name = "Virus bermellón",
                text = {
                    "Se reemplaza un comodín",
                    "al azar en cada mano",
                },
            },
            bl_cry_windmill = {
                name = "El molino",
                text = {
                    "Todos los comodines inusuales",
                    "se debilitan",
                },
            },
        },
        Code = {
            c_cry_class = {
                name = "://CLASE",
                text = {
                    "Convierte {C:cry_code}#1#{} carta seleccionada",
                    "a una mejora {C:cry_code}a elección{}",
                },
            },
            c_cry_commit = {
                name = "://COMMIT",
                text = {
                    "Destruye un comodín {C:cry_code}seleccionado{},",
                    "crea un comodín {C:cry_code}nuevo{}",
                    "de la {C:cry_code}misma rareza",
                },
            },
            c_cry_crash = {
                name = "://CHOQUE",
                text = {
                    "{C:cry_code,E:1}No.",
                },
            },
            c_cry_ctrl_v = {
                name = "://CTRL+V",
                text = {
                    "Crea una {C:cry_code}copia{} de un {C:cry_code}comodín{},",
                    "carta de juego, o consumible"
                },
            },
            c_cry_delete = {
                name = "://ELIMINAR",
                text = {
                    "Remueve {C:cry_code}permanentemente{} un",
                    "objeto {C:cry_code}seleccionado{} de la tienda",
                    "{C:inactive,s:0.8}El objeto no puede aparecer otra vez en esta partida",
                },
            },
            c_cry_divide = {
                name = "://DIVIDIR",
                text = {
                    "{C:cry_code}Divide en 2{} todos los precios",
                    "listados en la tienda actual",
                },
            },
            c_cry_exploit = {
                name = "://EXPLOTAR",
                text = {
                    "Cualquier mano jugada se considera que",
                    "{C:cry_code}contiene{} una mano de póker {C:cry_code}a elección{},",
                    "se reinicia al final de la ronda",
                    "{C:inactive,s:0.8}Las manos secretas deben ser",
                    "{C:inactive,s:0.8}descubiertas para ser válidas",
                },
            },
            c_cry_hook = {
                name = "ENGANCHAR://",
                text = {
                    "Selecciona dos comodines para {C:cry_code}engancharlos",
                    "{C:inactive,s:0.8}Sólo funciona correctamente si los comodines se activan en el mismo contexto,",
                    "{C:inactive,s:0.8}(ej. Comodín y El dúo (ambos después de puntuar))",
                },
            },
            c_cry_machinecode = {
                name = "://CÓDIGOMÁQUINA",
                text = {
                    "",
                },
            },
            c_cry_malware = {
                name = "://MALWARE",
                text = {
                    "Añade {C:dark_edition}Erróneo{} a todas",
                    "las cartas {C:cry_code}en tu mano" },
            },
            c_cry_merge = {
                name = "://FUNDIR",
                text = {
                    "Combina un {C:cry_code}consumible{} seleccionado",
                    "con una {C:cry_code}carta de juego{} seleccionada",
                },
            },
            c_cry_multiply = {
                name = "://MULTIPLICAR",
                text = {
                    "{C:cry_code}Duplica{} todos los valores de",
                    "un {C:cry_code}comodín{} seleccionado hasta",
                    "el final de la ronda",
                },
            },
            c_cry_patch = {
                name = "://PATCH",
                text = {
                    "Rehabilita y remueve todas las pegatinas",
                    "de todos los objetos visibles",
                },
            },
            c_cry_payload = {
                name = "://PAYLOAD",
                text = {
                    "La siguiente ciega derrotada",
                    "entrega {C:cry_code}X#1#{} interés",
                },
            },
            c_cry_oboe = {
                name = "://PORUNPASO",
                text = {
                    "El siguiente {C:cry_code}paquete potenciador{} contiene",
                    "{C:cry_code}#1#{} carta adicional y",
                    "{C:cry_code}#1#{} opción adicional",
                    "{C:inactive}(Actual: {C:cry_code}+#2#{C:inactive})",
                },
            },
            c_cry_reboot = {
                name = "://REINICIAR",
                text = {
                    "Reobtiene tus {C:blue}manos{} y {C:red}descartes{},",
                    "devuelve {C:cry_code}todas{} las cartas a la baraja",
                    "y saca una {C:cry_code}nueva{} mano",
                },
            },
            c_cry_revert = {
                name = "://REVERTIR",
                text = {
                    "Establese el {C:cry_code}estado de juego{} al",
                    "inicio de {C:cry_code}esta apuesta{}",
                },
            },
            c_cry_rework = {
                name = "://REHACER",
                text = {
                    "Destruye un comodín {C:cry_code}seleccionado{},",
                    "crea una {C:cry_code}Etiqueta de retrabajo{} con",
                    "una edición {C:cry_code}mejorada{}",
                    "{C:inactive,s:0.8}Se mejora usando el orden en la colección",
                },
            },
            c_cry_run = {
                name = "://CORRER",
                text = {
                    "Visita una {C:cry_code}tienda",
                    "durante una {C:cry_code}ciega",
                },
            },
            c_cry_seed = {
                name = "://SEMILLA",
                text = {
                    "Selecciona un comodín",
                    "o carta de juego",
                    "para volverla {C:cry_code}amañada",
                },
            },
            c_cry_semicolon = {
                name = ";//",
                text = {
                    "Termina la {C:cry_code}ciega{} no-jefe actual",
                    "{C:cry_code}sin{} obtener dinero"
                },
            },
            c_cry_spaghetti = {
                name = "://ESPAGUETI",
                text = {
                    "Crea un comodín de comida",
                    "{C:cry_code}erróneo",
                },
            },
            c_cry_variable = {
                name = "://VARIABLE",
                text = {
                    "Convierte {C:cry_code}#1#{} cartas seleccionadas",
                    "a una categoría {C:cry_code}a elección{}",
                },
            },
        },
        Edition = {
            e_cry_astral = {
                name = "Astral",
                text = {
                    "{X:dark_edition,C:white}^#1#{} multi",
                },
            },
            e_cry_blur = {
                name = "Borrosa",
                text = {
                    "{C:attention}Reactiva{} esta",
                    "carta {C:attention}1{} vez",
                    "{C:green}#1# en #2#{} probabilidades",
                    "para reactivar {C:attention}#3#{}",
                    "vez más",
                },
            },
            e_cry_double_sided = {
                name = "Doble cara",
                text = {
                    "Esta carta puede ser",
                    "{C:attention}volteada{} para revelar",
                    "una carta diferente",
                    "{C:inactive}(El lado en blanco puede",
					"{C:inactive}combinarse con otra carta)",
                },
            },
            e_cry_glass = {
                name = "Frágil",
                label = "Frágil",
                text = {
                    "{C:white,X:mult} X#3# {} multi",
                    "{C:green}#1# en #2#{} probabilidades que",
                    "esta carta no sea {C:red}destruida",
                    "al activarse",
                },
            },
            e_cry_glitched = {
                name = "Errónea",
                text = {
                    "Todos los valores en esta carta",
                    "son {C:dark_edition}aleatorizados{}",
                    "entre {C:attention}X0.1{} y {C:attention}X10{}",
                    "{C:inactive}(si es posible){}",
                },
            },
            e_cry_gold = {
                name = "Dorada",
                label = "Dorada",
                text = {
                    "Gana {C:money}$#1#{} cuando se usa",
                    "o activa",
                },
            },
            e_cry_m = {
                name = "Contenta",
                text = {
                    "{C:mult}+#1#{} multi",
                    "Esta carta se siente",
                    "bastante {C:attention}contenta{}",
                },
            },
            e_cry_mosaic = {
                name = "Mosaico",
                text = {
                    "{X:chips,C:white} X#1# {} fichas",
                },
            },
            e_cry_noisy = {
                name = "Ruidosa",
                text = {
                    "???",
                },
            },
            e_cry_oversat = {
                name = "Sobresaturada",
                text = {
                    "Todos los valores",
                    "en esta carta",
                    "son {C:attention}duplicados{}",
                    "{C:inactive}(si es posible)",
                },
            },
        },
        Enhanced = {
            m_cry_echo = {
                name = "Carta de eco",
                text = {
                    "{C:green}#2# en #3#{} probabilidades de",
                    "{C:attention}reactivar{} #1# veces",
                    "adicionales al puntuar",
                },
            },
        },
        Joker = {
            j_cry_adroit = {
                name = "Comodín hábil",
                text = {
                    "{C:chips}+#1#{} fichas",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
            j_cry_altgoogol = {
                name = "Carta de Googol Play nostálgica",
                text = {
                    "Vende esta carta para crear",
                    "{C:attention}2{} copias del {C:attention}Joker{} del extremo izquierdo",
                    "{C:inactive,s:0.8}No copia otras Cartas de Googol Play nostálgicas{}",
                },
            },
            j_cry_antennastoheaven = {
                name = "...como antenas al cielo",
                text = {
                    "Este comodín consigue",
                    "{X:chips,C:white} X#1# {} fichas cuando cada",
                    "{C:attention}7{} o {C:attention}4{} jugado puntúa",
                    "{C:inactive}(Actual: {X:chips,C:white}X#2# {C:inactive} fichas)",
                },
            },
            j_cry_apjoker = {
                name = "Comodín AP",
                text = { "{X:mult,C:white} X#1# {} multi contra las {C:attention}ciegas jefe{}" },
            },
            j_cry_astral_bottle = {
                name = "Astral en una botella",
                text = {
                    "Al venderse, aplica {C:dark_edition}Astral{}",
                    "y {C:attention}Perecedero{} a",
                    "un {C:attention}comodín{} aleatorio",
                }
            },

            j_cry_big_cube = {
                name = "Cubo grande",
                text = {
                    "{X:chips,C:white} X#1# {} fichas",
                },
            },
            j_cry_biggestm = {
                name = "Gigante",
                text = {
                    "{X:mult,C:white} X#1# {} multi hasta el final",
                    "de la ronda si la {C:attention}mano de póker{}",
                    "es una {C:attention}#2#{}",
                    "{C:inactive}(Actual: {C:attention}#3#{}{C:inactive}){}",
                    "{C:inactive,s:0.8}no es obeso, sólo de huesos grandes.",
                },
            },
            j_cry_blacklist = {
                name = "Lista negra",
                text = {
                    "Si un {C:attention}#1#{} se juega o está en tu mano,",
                    "establece {C:chips}fichas{} y {C:mult}multi{} a 0",
                    "{C:red,E:2}se autodestruye{} si no hay un {C:attention}#1#{} en la baraja",
                    "{C:inactive,s:0.8}La categoría no cambia"
                }
            },
            j_cry_blender = {
                name = "Blender",
                text = {
                    "Crea un consumible",
                    "{C:attention}aleatorio{} cuando una",
                    "carta de {C:cry_code}código{} es usada",
                    "{C:inactive}(debe haber espacio){}",
                },
            },
            j_cry_blurred = {
                name = "Comodín borroso",
                text = {
                    "Obtén {C:blue}+#1#{} mano(s) al",
                    "seleccionar una {C:attention}ciega{}",
                },
            },
            j_cry_bonk = {
                name = "Bonk",
                text = {
                    "Cada {C:attention}comodín{} da {C:chips}+#1#{} fichas",
                    "aumenta la cantidad por {C:chips}+#2#{} si la ",
                    "{C:attention}mano de póker{} es una {C:attention}#3#{}",
                    "{C:inactive,s:0.8}Los comodines contentos dan{} {C:chips,s:0.8}+#4#{} {C:inactive,s:0.8}fichas{}",
                },
            },
            j_cry_bonkers = {
                name = "Comodín trastornado",
                text = {
                    "{C:red}+#1#{} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
            j_cry_bonusjoker = {
                name = "Comodín adicional",
                text = {
                    "{C:green}#1# en #2#{} probabilidades por cada",
                    "carta {C:attention}adicional{} jugada para aumentar",
                    "ranuras de {C:attention}comodín{} o {C:attention}consumible",
                    "por {C:dark_edition}1{} al puntuar",
                    "{C:red}Funciona 2 veces por runda",
                    "{C:inactive,s:0.8}(probabilidad igual por cada uno){}",
                },
            },
            j_cry_booster = {
                name = "Comodín potenciador",
                text = {
                    "{C:attention}+#1#{} ranura de paquete potenciador",
                    "disponible en la tienda",
                },
            },
            j_cry_boredom = {
                name = "Aburrimiento",
                text = {
                    "{C:green}#1# en #2#{} probabilidades para",
                    "{C:attention}reactivar{} cada {C:attention}comodín{}",
                    "o {C:attention}carta jugada{}",
                    "{C:inactive,s:0.8}No afecta otros Aburrimientos{}",
                },
            },
            j_cry_brittle = {
                name = "Dulce frágil",
                text = {
                    "Por las siguientes {C:attention}#1#{} manos,",
                    "añade {C:attention}Piedra{}, {C:attention}Oro{}, o {C:attention}Acero{} a",
                    "la carta del extremo derecho que puntúa"
                }
            },
            j_cry_bubblem = {
                name = "Burbuja M",
                text = {
                    "Crea un {C:attention}Comodín contento{} {C:dark_edition}laminado",
                    "si la mano jugada contiene",
                    "un {C:attention}#1#{}",
                    "{C:red,E:2}se autodestruye{}",
                },
            },
            j_cry_busdriver = {
                name = "Conductor de bus",
                text = {
                    "{C:green}#1# en #3#{} probabilidades",
                    "para {C:mult}+#2#{} multi",
                    "{C:green}1 en 4{} probabilidades",
                    "para {C:mult}-#2#{} multi",
                },
            },
            j_cry_candy_basket = {
                name = "Cesta de dulces",
                text = {
                    "Vende esta carta para crear {C:attention}#1#{} {C:cry_candy}dulces",
                    "{C:attention}+#2#{} {C:cry_candy}dulce{} cada {C:attention}2{} ciegas derrotadas",
                    "{C:attention}+#3#{} {C:cry_candy}dulces{} al derrotar la {C:attention}ciega jefe{}"
                }
            },
            j_cry_candy_buttons = {
                name = "Botones de dulce",
                text = {
                    "Las siguientes {C:attention}#1#{} renovaciones",
                    "cuestan {C:money}$1{}",
                }
            },
            j_cry_candy_cane = {
                name = "Bastón de dulce",
                text = {
                    "Por las siguientes {C:attention}#1#{} rondas,",
                    "las cartas de juego otorgan {C:money}$#2#",
                    "cuando se {C:attention}reactivan"
                }
            },
            j_cry_candy_dagger = {
                name = "Daga de dulce",
                text = {
                    "Cuando se selecciona la {C:attention}ciega{},",
                    "destruye al comodín de la derecha",
                    "para crear un {C:cry_candy}dulce{}",
                }
            },
            j_cry_candy_sticks = {
                name = "Palos de dulce",
                text = {
                    "El efecto de la siguiente ciega jefe se desactiva",
                    "hasta que hayas jugado {C:attention}#1#{} msnos",
                }
            },
            j_cry_canvas = {
                name = "Lienzo",
                text = {
                    "{C:attention}Reactiva{} todos los {C:attention}comodines{} a la izquierda",
                    "una vez por {C:attention}todos{} los {C:attention}comodines{} no-{C:blue}comunes",
                    "a la derecha de este comodín",
                },
            },
            j_cry_caramel = {
                name = "Caramelo",
                text = {
                    "Cada carta jugada otorga",
                    "{X:mult,C:white}X#1#{} multi cuando puntúa",
                    "por las siguientes {C:attention}#2#{} rondas",
                },
            },
            j_cry_chad = {
                name = "Chad",
                text = {
                    "Reactiva el comodín del {C:attention}extremo izquierdo{}",
                    "{C:attention}#1#{} veces adicionales",
                },
            },
            j_cry_chili_pepper = {
                name = "Ají picante",
                text = {
                    "Este comodín consigue {X:mult,C:white} X#2# {} multi",
                    "al final de la ronda,",
                    "{C:red,E:2}se autodestruye{} después de {C:attention}#3#{} rondas",
                    "{C:inactive}(Actual:{} {X:mult,C:white} X#1# {} {C:inactive}multi){}",
                },
            },
            j_cry_chocolate_dice = {
                name = "Dado de chocolate",
                text = {
                    "Gira un {C:green}d10{} al derrotar",
                    "la {C:attention}ciega jefe{} para",
                    "empezar un {C:cry_ascendant,E:1}evento",
                    "{C:inactive}(Actual: #1#)"
                },
            },
            j_cry_circulus_pistoris = {
                name = "Circulus Pistoris",
                text = {
                    "{X:dark_edition,C:white}^#1#{} fichas y {X:dark_edition,C:white}^#1#{} multi",
                    "si tienes {C:attention}exactamente{} #2#",
                    "manos restantes",
                },
            },
            j_cry_circus = {
                name = "Circo",
                text = {
                    "Comodines {C:red}raros{} otorgan {X:mult,C:white} X#1# {} multi",
                    "Comodines {C:cry_epic}épicos{} otorgan {X:mult,C:white} X#2# {} multi",
                    "Comodines {C:legendary}legendarios{} otorgan {X:mult,C:white} X#3# {} multi",
                    "Comodines {C:cry_exotic}exóticos{} otorgan {X:mult,C:white} X#4# {} multi",
                },
            },
            j_cry_clash = {
                name = "El conflicto",
                text = {
                    "{X:mult,C:white} X#1# {} multi",
                    "si la mano contiene",
                    "una {C:attention}#2#",
                },
            },

            j_cry_CodeJoker = {
                name = "Comodín de código",
                text = {
                    "Crea una {C:cry_code}carta de código{}",
                    "{C:dark_edition}negativa{} cuando se",
                    "selecciona una {C:attention}ciega{}",
                },
            },
            j_cry_coin = {
                name = "Moneda crypto",
                text = {
                    "Gana entre",
                    "{C:money}$#1#{} y {C:money}$#2#{} por",
                    "cada comodín {C:attention}vendido{}",
                },
            },
            j_cry_compound_interest = {
                name = "Interés compuesto",
                text = {
                    "Gana {C:money}#1#%{} de tu dinero total",
                    "al final de la ronda,",
                    "aumenta por {C:money}#2#%{} por cada",
                    "pago consecutivo",
                },
            },
            j_cry_copypaste = {
                name = "Copiar y pegar",
                text = {
                    "Cuando una carta {C:cry_code}código{} se usa,",
                    "{C:green}#1# en #2#{} probabilidades para añadir",
                    "una copia a tus consumibles",
                    "{C:inactive}(debe haber espacio)",
                },
            },
            j_cry_cotton_candy = {
                name = "Algodón de azúcar",
                text = {
                    "Al venderse, los {C:attention}comodines{}",
                    "adyacentes se vuelven {C:dark_edition}negativos{}"
                },
            },
            j_cry_crustulum = {
                name = "Crustulum",
                text = {
                    "Este comodín gana {C:chips}+#2#{} fichas",
                    "por cada {C:attention}renovación{} en la tienda",
                    "{C:green}Todas las renovaciones son gratis{}",
                    "{C:inactive}(Actual: {C:chips}+#1#{C:inactive} fichas)",
                },
            },
            j_cry_cryptidmoment = {
                name = "Cadena M",
                text = {
                    "Vende esta carta para",
                    "añadir {C:money}$#1#{} de {C:attention}valor de venta{}",
                    "a cada {C:attention}comodín{}",
                },
            },
            j_cry_cube = {
                name = "Cubo",
                text = {
                    "{C:chips}+#1#{} fichas",
                },
            },
            j_cry_curse_sob = {
                name = "Sollozo",
                text = {
                    "{C:edition,E:1}no puedes{} {C:cry_ascendant,E:1}correr...{}",
                    "{C:edition,E:1}no puedes{} {C:cry_ascendant,E:1}esconderte...{}",
                    "{C:dark_edition,E:1}no puedes escapar...{}",
                    "{C:inactive}(debe haber espacio){}",
                },
            },
            j_cry_cursor = {
                name = "Cursor",
                text = {
                    "Este comodín gana {C:chips}+#2#{} fichas",
                    "por cada carta {C:attention}comprada{}",
                    "{C:inactive}(Actual: {C:chips}+#1#{C:inactive} fichas)",
                },
            },
            j_cry_cut = {
                name = "Cortar",
                text = {
                    "Este comodín destruye una",
                    "carta de {C:cry_code}código{} al azar,",
                    "y gana {X:mult,C:white} X#1# {} multi",
                    "al final de la {C:attention}tienda{}",
                    "{C:inactive}(Actual: {X:mult,C:white} X#2# {C:inactive} multi)",
                },
            },
            j_cry_delirious = {
                name = "Comodín delirante",
                text = {
                    "{C:red}+#1#{} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
            j_cry_discreet = {
                name = "Comodín discreto",
                text = {
                    "{C:chips}+#1#{} fichas",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
            j_cry_doodlem = {
                name = "Garabato M",
                text = {
                    "Crea 2 {C:attention}consumibles{} {C:dark_edition}negativos{}",
                    "cuando se selecciona una {C:attention}ciega{}",
                    "Crea 1 {C:attention}consumibles{} adicional",
                    "por cada {C:attention}comodín contento{}",
                },
            },
            ["j_cry_Double Scale"] = {
                name = "Escala doble",
                text = {
                    "Los {C:attention}comodines{} escaladores",
                    "aumentan {C:attention}cuadráticamente",
                    "{C:inactive,s:0.8}(ej. +1, +3, +6, +10)",
                    "{C:inactive,s:0.8}(crece por by +1, +2, +3)",
                },
            },
            j_cry_dropshot = {
                name = "Tiro al blanco",
                text = {
                    "Este comodín consigue {X:mult,C:white} X#1# {} multi por",
                    "cada carta de {V:1}#2#{} jugada que no puntúa,",
                    "el palo cambia en cada ronda",
                    "{C:inactive}(Actual: {X:mult,C:white} X#3# {C:inactive} multi)",
                },
            },
            j_cry_dubious = {
                name = "Comodín dudoso",
                text = {
                    "{C:chips}+#1#{} fichas",
                    "si la mano contiene",
                    "una {C:attention}#2#",
                }
            },
            j_cry_duos = {
                name = "Los dúos",
                text = {
                    "{X:mult,C:white} X#1# {} multi",
                    "si la mano contiene",
                    "una {C:attention}#2#",
                },
            },
            j_cry_duplicare = {
                name = 'Duplicare',
                text = {
                    "Este comodín gana {X:mult,C:white} X#2# {} multi",
                    "cuando un {C:attention}comodín{} o",
                    "carta de juego puntúa",
                    "{C:inactive}(Actual: {X:mult,C:white} X#1# {C:inactive} multi)",
                }
            },
            j_cry_effarcire = {
                name = "Effarcire",
                text = {
                    "Saca tu {C:green}baraja completa{} a tu mano",
                    "al seleccionar una {C:attention}ciega{}",
                    "{C:inactive,s:0.8}\"Si no puedes manejarme a mi 1x,",
                    "{C:inactive,s:0.8}no me mereces a mi 2x\"",
                },
            },
            j_cry_energia = {
                name = "Energia",
                text = {
                    "Cuando obtienes una {C:attention}etiqueta{},",
                    "crea {C:attention}#1#{} copias de ésta,",
                    "y {C:attention}aumenta{} la cantidad de",
                    "copias por {C:attention}#2#",
                },
            },
            j_cry_equilib = {
                name = "Ace Aequilibrium",
                text = {
                    "Comodines aparecen usando el",
                    "orden de la {C:attention}colección{}",
                    "Crea {C:attention}#1#{} comodín(es) {C:dark_edition}negativos{}",
                    "al jugar una mano",
                    "{C:inactive,s:0.8}Comodines {C:cry_exotic,s:0.8}exóticos {C:inactive,s:0.8}o mejores no pueden aparecer",
                    "{s:0.8}Último comodín generado: {C:attention,s:0.8}#2#",
                },
            },
            j_cry_error = {
                name = "{C:red}ERR{}{C:dark_edition}O{}{C:red}R{}",
                text = {
                    "",
                },
            },
            j_cry_eternalflame = {
                name = "Llama eterna",
                text = {
                    "Este comodín gana {X:mult,C:white} X#1# {} multi",
                    "por cada carta {C:attention}vendida{}",
                    "{C:inactive}(Actual: {X:mult,C:white} X#2# {C:inactive} multi)",
                },
            },
            j_cry_exoplanet = {
                name = "Exoplaneta",
                text = {
                    "Las cartas {C:dark_edition}holográficas{}",
                    "otorgan {C:mult}+#1#{} multi",
                },
            },
            j_cry_exponentia = {
                name = "Exponentia",
                text = {
                    "Este comodín gana {X:dark_edition,C:white} ^#1# {} multi",
                    "cuando se activa {X:red,C:white}Xmulti{}",
                    "{C:inactive}(Actual: {X:dark_edition,C:white} ^#2# {C:inactive} multi)",
                },
            },
            j_cry_exposed = {
                name = "Expuesto",
                text = {
                    "Reactiva todas las cartas {C:attention}numéricas{}",
		            "{C:attention}#1#{} veces adicionales",
                    "Todas las cartas de {C:attention}figura{} se debilitan",
                },
            },
            j_cry_facile = {
                name = "Facile",
                text = {
                    "{X:dark_edition,C:white}^#1#{} multi si",
                    "las cartas jugadas puntúan",
                    "{C:attention}#2#{} o menos veces",
                },
            },
            j_cry_filler = {
                name = "El relleno",
                text={
                    "{X:mult,C:white} X#1#{} multi",
                    "si la mano contiene",
                    "una {C:attention}#2#",
                },
            },
            j_cry_fractal = {
                name = "Dedos fractales",
                text = {
                    "{C:attention}+#1#{} límite de selección de cartas",
                },
            },
            j_cry_flip_side = {
                name = "Por el otro lado",
                text = {
                    "Los comodines {C:dark_edition}doble cara{} usan",
                    "su lado trasero para sus efectos",
                    "en vez de su lado delantero",
                    "{C:attention}Reactiva{} todos los comodines {C:dark_edition}doble cara{}"
                },
            },
            j_cry_foodm = {
                name = "M de comida rápida",
                text = {
                    "{C:mult}+#1#{} multi",
                    "{C:red,E:2}se autodestruye{} en {C:attention}#2#{} ronda(s)",
                    "Aumenta por {C:attention}#3#{} ronda cuando un",
                    "{C:attention}comodín contento{} es {C:attention}vendido{}",
                    "{C:inactive,s:0.8}2 McDoubles, 2 McChickens{}",
                    "{C:inactive,s:0.8}Large Fries, 20 Piece & Large Cake{}",
                },
            },
            j_cry_foolhardy = {
                name = "Comodín temerario",
                text = {
                    "{C:red}+#1#{} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
	        j_cry_formidiulosus = {
		        name = "Formidiulosus",
		        text = {
		        	"Cuando un comodín {X:cry_cursed,C:white}maldito{} es obtenido, destrúyelo",
		       	    "Crea {C:attention}#1#{} {C:cry_candy}dulces {C:dark_edition}negativos{} al final de la tienda",
		      	    "Gana {X:dark_edition,C:white}^#2#{} multi por cada {C:cry_candy}dulce{} en tu posesión",
		    	    "{C:inactive}(Actual: {X:dark_edition,C:white}^#3#{C:inactive} multi)",
                },
            },
            j_cry_foxy = {
                name = "Comodín astuto",
                text = {
                    "{C:chips}+#1#{} fichas",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
            j_cry_fspinner = {
                name = "Fidget Spinner",
                text = {
                    "Este comodín gana {C:chips}+#2#{} fichas",
                    "si la mano jugada {C:attention}no es{}",
                    "la {C:attention}mano de póker{} más jugada",
                    "{C:inactive}(Actual: {C:chips}+#1#{C:inactive} fichas)",
                },
            },
            j_cry_fuckedup = {
                name = "Comodín jodido",
                text = {
                    "{C:red}+#1#{} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
            j_cry_gardenfork = {
                name = "El jardín de las bifurcaciones",
                text = {
                    "Gana {C:money}$#1#{} si la {C:attention}mano jugada{}",
                    "contiene un {C:attention}As{} y un {C:attention}7{}",
                },
            },
            j_cry_gemino = {
                name = "Gemini",
                text = {
                    "{C:attention}Duplica{} todos los valores",
                    "del {C:attention}Joker{} del extremo izquierdo",
                    "al final de la ronda",
                },
            },
            j_cry_ghost = {
                name = "Fantasma",
                text = {
                    "Al final de la ronda:",
                    "{C:green}#1# en #2#{} probabilidades para",
                    "{C:attention}poseer{} un {C:attention}comodín{} aleatorio",
                    "{C:green}#1# en #3#{} probabilidades para",
                    "{E:2,C:red}autodestruirse"
                }
            },
            j_cry_giggly = {
                name = "Comodín absurdo",
                text = {
                    "{C:red}+#1#{} multi",
                    "si la mano contiene",
                    "una {C:attention}#2#",
                }
            },
            j_cry_goldjoker = {
                name = "Comodín de oro",
                text = {
                    "Gana {C:money}#1#%{} de tu dinero",
                    "total al final de la ronda",
                    "El pago aumenta por {C:money}#2#%{}",
                    "cuando cada carta de {C:attention}oro{}",
                    "jugada puntúa",
                },
            },
            j_cry_googol_play = {
                name = "Carta de Googol Play",
                text = {
                    "{C:green}#1# en #2#{} probabilidades de",
                    "{X:red,C:white} X#3# {} multi",
                },
            },
            j_cry_happy = {
                name = ":D",
                text = {
                    "Crea un {C:attention}comodín{} aleatorio",
                    "al final de la ronda",
                    "Vende esta carta para",
                    "crear un {C:attention}comodín{} aleatorio",
                    "{C:inactive}(debe haber espacio){}",
                },
            },
            j_cry_happyhouse = {
                name = "Casa feliz",
                text = {
                    "{X:dark_edition,C:white}^#1#{} multi sólo después de",
                    "jugar {C:attention}114{} manos{}",
                    "{C:inactive}(Actual: #2#/114){}",
                    "{C:inactive,s:0.8}¡No hay un lugar como el hugar!{}",
                },
            },
            j_cry_home = {
                name = "El hogar",
                text={
                    "{X:mult,C:white} X#1#{} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                },
            },
            j_cry_hunger = {
                name = "Consum-ible",
                text = {
                    "Gana {C:money}$#1#{} cuando",
                    "usas un {C:attention}consumible{}",
                },
            },
            j_cry_iterum = {
                name = "Iterum",
                text = {
                    "Reactiva todas las cartas jugadas",
                    "{C:attention}#2#{} vez,",
                    "cada carta jugada otorga",
                    "{X:mult,C:white} X#1# {} multi cuando puntúa",
                },
            },
            j_cry_jawbreaker = {
                name = "Jawbreaker",
                text = {
                    "Al derrotar la {C:attention}ciega jefe,",
                    "{C:attention}duplica{} los valores de los comodines adyacentes",
                    "{E:2,C:red}se autodestruye{}",
                }
            },
            j_cry_jimball = {
                name = "Jimball",
                text = {
                    "Este comodín gana {X:mult,C:white} X#1# {} multi",
                    "por cada mano jugada {C:attention}consecutiva{}",
                    "mientras juegas tu",
                    "{C:attention}mano de póker{} más jugada",
                    "{C:inactive}(Actual: {X:mult,C:white} X#2# {C:inactive} multi)",
                },
            },
            j_cry_jollysus = {
                name = "¿Comodín contento?",
                text = {
                    "Crea un comodín {C:dark_edition}contento{}",
                    "cuando un comodín es {C:attention}vendido{}",
                    "{C:red}Funciona una vez por ronda{}",
                    "{C:inactive}#1#{}",
                    "{C:inactive,s:0.8}Parece legítimo...{}",
                },
            },
            j_cry_kidnap = {
                name = "Secuestro",
                text = {
                    "Gana {C:money}$#2#{} al final de la ronda",
                    "Aumenta el pago por {C:money}$#1#{}",
                    "cuando un comodín de {C:attention}tipo multi{}",
                    "o {C:attention}tipo fichas{} es vendido",
                },
            },
            j_cry_kooky = {
                name = "Comodín raro",
                text = {
                    "{C:red}+#1#{} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
            j_cry_krustytheclown = {
                name = "Krusty el Payaso",
                text = {
                    "Este comodín gana",
                    "{X:mult,C:white} X#1# {} multi cuando",
                    "cada {C:attention}carta{} jugada puntúa",
                    "{C:inactive}(Actual: {X:mult,C:white} X#2# {C:inactive} multi)",
                },
            },
            j_cry_kscope = {
                name = "Caleidoscopio",
                text = {
                    "Agrega {C:dark_edition}policromía{} a",
                    "un {C:attention}comodín{} aleatorio al",
                    "derrotar la {C:attention}ciega jefe{}",
                },
            },
            j_cry_lightupthenight = {
                name = "Ilumina la noche",
                text = {
                    "Cada {C:attention}7{} o {C:attention}2{} jugado",
                    "otorga {X:mult,C:white}X#1#{} multi cuando puntúa",
                },
            },
            j_cry_longboi = {
                name = "Monstruo",
                text = {
                    "Otorga futuras copias de",
                    "este comodín {X:mult,C:white}X#1#{} multi",
                    "al final de la ronda",
                    "{C:inactive}(Actual: {X:mult,C:white}X#2#{C:inactive} multi){}",
                },
            },
            j_cry_loopy = {
                name = "Loopy",
                text = {
                    "{C:attention}Reactiva{} todos los comodines",
                    "una vez por cada {C:attention}comodín{}",
                    "{C:attention}contento{} vendido esta ronda",
                    "{C:inactive}(Actual:{}{C:attention:} #1#{}{C:inactive} reactivaciones){}",
                    "{C:inactive,s:0.8}No había suficiente espacio...{}",
                },
            },
            j_cry_lucky_joker = {
                name = "Comodín de la suerte",
                text = {
                    "Gana {C:money}$#1#{} cada vez que",
                    "una carta {C:attention}de la suerte{} se active",
                    "{C:green}con éxito{}",
                },
            },
            j_cry_luigi = {
                name = "Luigi",
                text = {
                    "Todos los comodines otorgan",
                    "{X:chips,C:white} X#1# {} fichas",
                },
            },
            j_cry_m = {
                name = "m",
                text = {
                    "Este comodín gana {X:mult,C:white} X#1# {} multi",
                    "cuando un {C:attention}Comodín contento{} es vendido",
                    "{C:inactive}(Actual: {X:mult,C:white} X#2# {C:inactive} multi)",
                },
            },
            j_cry_M = {
                name = "M",
                text = {
                    "Crea un {C:attention}Comodín contento{} ",
                    "{C:dark_edition}negativo{} cuando se",
                    "selecciona una {C:attention}ciega{}",
                },
            },
            j_cry_macabre = {
                name = "Comodín macabro",
                text = {
                    "Al seleccionar una {C:attention}ciega{},",
                    "destruye todos los {C:attention}comodines{} excepto",
                    "{C:legendary}comodines M{} y {C:attention}comodines contentos{}",
                    "y crea 1 {C:attention}comodín contento{}",
                    "por cada carta destruida",
                },
            },
            j_cry_magnet = {
                name = "Imán de refrigerador",
                text = {
                    "Gana {C:money}$#1#{} al final de la ronda",
                    "Obtienes {X:money,C:white} X#2# {} si hay",
                    "{C:attention}#3#{} o menos {C:attention}comodines{}",
                },
            },
            j_cry_manic = {
                name = "Comodín maníaco",
                text = {
                    "{C:red}+#1#{} multi",
                    "si la mano contiene",
                    "una {C:attention}#2#",
                }
            },
            j_cry_mario = {
                name = "Mario",
                text = {
                    "Reactiva todos los comodines",
                    "{C:attention}#1#{} veces adicionales",
                },
            },
            j_cry_mask = {
                name = "Máscara",
                text = {
                    "Reactiva todas las cartas de {C:attention}figura{}",
                    "{C:attention}#1#{} veces adicionales",
		            "Todas las cartas {C:attention}numéricas{} se debilitan",
                },
            },

            j_cry_maximized = {
                name = "Maximizado",
                text = {
                    "Todas las cartas de {C:attention}figura{}",
                    "son consideradas {C:attention}Reyes{},",
                    "todas las cartas de {C:attention}número{}",
                    "son consideradas {C:attention}10s{}",
                },
            },
            j_cry_maze = {
                name = "Laberinto",
                text = {
                    "Todas las manos son consideradas la",
                    "{C:attention}primera mano{} de cada ronda,",
                    "todos los descartes son considerados el",
                    "{C:attention}primer descarte{} de cada ronda",
                },
            },
            j_cry_Megg = {
                name = "Muevo",
                text = {
                    "Vende esta carta para crear",
                    "{C:attention}#2#{} Comodines contentos, aumenta",
                    "por {C:attention}#1#{} al final de la ronda",
                },
            },
            j_cry_mellowcreme = {
                name = "Mellowcreme",
                text = {
                    "Vende esta carta para {C:attention}multiplicar",
                    "el valor de venta de todos los",
                    "{C:attention}consumibles{} por {C:attention}X#1#"
                }
            },
            j_cry_membershipcard = {
                name = "Carta de afiliación",
                text = {
                    "{X:mult,C:white}X#1#{} multi por cada miembro",
                    "en el {C:attention}Discord de Cryptid{}",
                    "{C:inactive}(Actual: {X:mult,C:white}X#2#{C:inactive} multi)",
                    "{C:blue,s:0.7}https://discord.gg/eUf9Ur6RyB{}",
                },
            },
            j_cry_membershipcardtwo = {
                name = "Carta de miembro antigua", --renamed it for making it distinct
                text = {
                    "{C:chips}+#1#{} fichas por cada miembro",
                    "en el {C:attention}Discord de Cryptid{}",
                    "{C:inactive}(Actual: {C:chips}+#2#{C:inactive} fichas)",
                    "{C:blue,s:0.7}https://discord.gg/eUf9Ur6RyB{}",
                },
            },
            j_cry_meteor = {
                name = "Lluvia de meteoros",
                text = {
                    "Las cartas {C:dark_edition}laminadas{}",
                    "otorgan {C:chips}+#1#{} fichas",
                },
            },
            j_cry_mneon = {
                name = "M neón",
                text = {
                    "Gana {C:money}$#2#{} al final de la ronda",
                    "Aumenta el pago por",
                    "{C:money}$#1#{} por cada {C:attention}Comodín contento{}",
                    "o {C:legendary}comodín M{} al",
                    "final de la ronda",
                },
            },
            j_cry_mondrian = {
                name = "Mondrian",
                text = {
                    "Este comodín consigue {X:mult,C:white}X#1#{} multi",
                    "si no se usaron {C:attention}descartes{}",
                    "en esta ronda",
                    "{C:inactive}(Actual: {X:mult,C:white} X#2# {C:inactive} multi)",
                },
            },
            j_cry_monkey_dagger = {
                name = "Daga de mono",
                text = {
                    "Cuando se selecciona la {C:attention}ciega{},",
                    "destruye al comodín de la izquierda",
                    "y agrega para siempre {C:attention}10 veces",
                    "de valor de venta a estas {C:chips}fichas{}",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
                },
            },
            j_cry_monopoly_money = {
                name = "Dinero de monopolio",
                text = {
                    "{C:green}#1# en #2#{} probabilidades para",
                    "{C:attention}destruir{} objetos comprados",
                    "Divide tu dinero en 2 cuando se {C:attention}vende",
                }
            },
            j_cry_morse = {
                name = "Código morse",
                text = {
                    "Gana {C:money}$#2#{} al final de la ronda",
                    "Aumenta el pago por {C:money}$#1#{} al",
                    "vender una carta con una {C:attention}edición{}",
                },
            },
            j_cry_mprime = {
                name = "Tredecim",
                text = {
                    "Crea un {C:legendary}comodín M{} al final de la ronda",
                    "Cada {C:attention}Comodín contento{} o {C:legendary}comodín M",
                    "otorga {X:dark_edition,C:white}^#1#{} multi",
                    "Aumenta el valor por {X:dark_edition,C:white}^#2#{}",
                    "cuando un {C:attention}Comodín contento{} es {C:attention}vendido",
                    "{C:inactive,s:0.8}(Tredecim excluido)",
                },
            },
            j_cry_mstack = {
                name = "Pila de Ms",
                text = {
                    "Reactiva todas las cartas jugadas",
                    "una vez por cada",
                    "{C:attention}#2#{} {C:inactive}[#3#]{} {C:attention}comodines contentos{} vendidos",
                    "{C:inactive}(Actual:{}{C:attention:} #1#{}{C:inactive} reactivaciones){}",
                },
            },
            j_cry_multjoker = {
                name = "Comodín multi",
                text = {
                    "{C:green}#1# en #2#{} probabilidades por cada",
                    "carta {C:attention}multi{} jugada para que cree",
                    "una carta {C:spectral}Críptido{} al anotar",
                    "{C:inactive}(Debe haber espacio)",
                },
            },
            j_cry_necromancer = {
                name = "Nigromante",
                text = {
                    "Cuando un comodín es {C:attention}vendido{} por un precio mayor que {C:attention}$0{},",
                    "gana un comodín {C:attention}aleatorio{} {C:attention}vendido{} en esta partida",
                    "y establece su {C:attention}valor de venta{} a {C:attention}$0{}",
                },
            },
            j_cry_negative = {
                name = "Comodín negativo",
                text = {
                    "{C:dark_edition}+#1#{} ranuras de {C:attention}comodín",
                },
            },
            j_cry_nice = {
                name = "Nice",
                text = {
                    "{C:chips}+#1#{} fichas si la mano jugada",
                    "contiene un {C:attention}6{} y un {C:attention}9",
                    "{C:inactive,s:0.8}Nice.{}",
                },
            },
            j_cry_night = {
                name = "Noche",
                text = {
                    "{X:dark_edition,C:white}^#1#{} multi en la",
                    "última mano de la ronda",
                    "{E:2,C:red}se autodestruye{} en",
                    "la última mano de la ronda",
                },
            },
            j_cry_nosound = {
                name = "Sin sonido, sin memoria",
                text = {
                    "Reactiva cada {C:attention}7{} jugado",
                    "{C:attention:}#1#{} veces adicionales",
                },
            },
            j_cry_notebook = {
                name = "Cuaderno",
                text = {
                    "{C:green} #1# en #2#{} probabilidades para conseguir {C:dark_edition}+1{} ranura",
                    "de comodín por cada {C:attention}renovación{} en la tienda",
                    "{C:green}Siempre se activa{} si hay",
                    "{C:attention}#5#{} o más {C:attention}Comodines contentos{}",
                    "{C:red}Funciona una vez por ronda{}",
                    "{C:inactive}(Actual: {C:dark_edition}+#3#{}{C:inactive} y #4#){}",
                },
            },
            j_cry_number_blocks = {
                name = "Bloques numerados",
                text = {
                    "Gana {C:money}$#1#{} al final de la ronda",
                    "Aumenta el pago por {C:money}$#2#{}",
                    "por cada {C:attention}#3#{} en tu mano,",
                    "la categoría cambia cada ronda",
                },
            },
            j_cry_nuts = {
                name = "El loco",
                text = {
                    "{X:mult,C:white} X#1# {} multi",
                    "si la mano contiene",
                    "una {C:attention}#2#",
                },
            },
            j_cry_nutty = {
                name = "Comodín loco",
                text = {
                    "{C:red}+#1#{} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
            j_cry_oil_lamp = {
                name = "Lámpara de aceite",
                text = {
                    "Al final de la ronda, aumenta los valores",
                    "del comodín del {C:attention}extremo derecho{} por {C:attention}x#1#{}"
                },
            },
    
            j_cry_oldblueprint = {
                name = "Plano viejo",
                text = {
                    "Copia la habilidad del",
                    "{C:attention}comodín{} de la derecha",
                    "{C:green}#1# en #2#{} probabilidades",
                    "de que la carta se destruya",
                    "al final de la ronda",
                },
            },
            j_cry_oldcandy = {
                name = "Dulce nostálgico",
                text = {
                    "Vende esta carta para ganar",
                    "{C:attention}+#1#{} tamaño de mano",
                    "de forma permanente",
                },
            },
            j_cry_oldinvisible = {
                name = "Comodín invisible nostálgico",
                text = {
                    "{C:attention}Duplioca{} un {C:attention}comodín{}",
                    "aleatorio cada {C:attention}4",
                    "cartas de comodín vendidas",
                    "{s:0.8}Comodín invisible nostálgico excluido{}",
                    "{C:inactive}(Actual: #1#/4){}",
                },
            },
            j_cry_panopticon = {
                name = "Panóptico",
                text = {
                    "Todas las manos son consideradas la",
                    "{C:attention}última mano{} de cada ronda", -- +4 dabloons
                },
            },
            j_cry_penetrating = {
                name = "Comodín penetrante",
                text = {
                    "{C:chips}+#1#{} fichas",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
            j_cry_pickle = { --holy shit dethklok reference
                name = "Pepinillo",
                text = {
                    "Al saltar una {C:attention}ciega{}, crea",
                    "{C:attention}#1#{} etiquetas, disminuye por",
                    "{C:red}#2#{} cuando se selecciona una {C:attention}ciega{}",
                },
            },
            j_cry_pirate_dagger = {
                name = "Daga de pirata",
                text = {
                    "Cuando se selecciona la {C:attention}ciega{},",
                    "destruye al comodín de la derecha",
                    "y agraga {C:attention}un cuarto{} del",
                    "valor de venta a {X:chips,C:white} Xfichas {}",
                    "{C:inactive}(Actual: {X:chips,C:white} X#1# {C:inactive} fichas)",
                },
            },
            j_cry_pot_of_jokes = {
                name = "Olla de las bromas",
                text = {
                    "{C:attention}#1#{} tamaño de mano,",
                    "aumenta por",
                    "{C:blue}#2#{} cada runda",
                },
            },
            j_cry_primus = {
                name = "Primus",
                text = {
                    "Este comodín gana {X:dark_edition,C:white} ^#1# {} multi",
                    "si todas las cartas en la mano jugada son",
                    "{C:attention}Ases{}, {C:attention}2s{}, {C:attention}3s{}, {C:attention}5s{}, o {C:attention}7s{}",
                    "{C:inactive}(Actual: {X:dark_edition,C:white} ^#2# {C:inactive} multi)",
                },
            },
            j_cry_python = {
                name = "Python",
                text = {
                    "Este comodín gana",
                    "{X:mult,C:white} X#1# {} multi cuando una",
                    "carta de {C:cry_code}código{} se usa",
                    "{C:inactive}(Actual: {X:mult,C:white} X#2# {C:inactive} multi)",
                },
            },
            j_cry_queens_gambit = {
                name = "Gambito de dama",
                text = {
                    "Si {C:attention}la mano de póker{} es una",
                    "{C:attention}Escalera real{}, destruye la",
                    "{C:attention}reina{} puntuada y crea un",
                    "{C:attention}comodín{} {C:red}raro{} {C:dark_edition}negativo{}",
                },
            },
            j_cry_quintet = {
                name = "El quinteto",
                text = {
                    "{X:mult,C:white} X#1# {} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                },
            },
            j_cry_redbloon = {
                name = "Bloon rojo",
                text = {
                    "Gana {C:money}$#1#{} en {C:attention}#2#{} ronda(s)",
                    "{C:red,E:2}se autodestruye{}",
                },
            },
            j_cry_redeo = {
                name = "Redeo",
                text = {
                    "{C:attention}-#1#{} apuesta al gastar",
                    "{C:money}$#2#{} {C:inactive}($#3#){}",
                    "{s:0.8}Requisitos aumentan",
                    "{C:attention,s:0.8}exponencialmente{s:0.8} por cada uso",
                    "{C:money,s:0.8}Siguiente aumento: {s:1,c:money}$#4#",
                },
            },
            j_cry_rescribere = {
                name = 'Rescribere',
                text = {
                    "Cuando un {C:attention}comodín{} es vendido,",
                    "añade sus efectos a",
                    "todos los otros comodines",
                    "{C:inactive,s:0.8}No afecta a otros Rescribere{}"
                }
            },
            j_cry_reverse = {
                name = "Carta de reversa",
                text = {
                    "Rellena todos las ranuras de comodín vacías {C:inactive}(Max 100){}",
                    "con {C:attention}Comodines contentos{} {C:dark_edition}holográficos{} si",
                    "la {C:attention}mano de póker descartada{} es una {C:attention}#1#{}",
                    "{C:red,E:2}se autodestruye{}",
                    "{C:inactive,s:0.8}¡El regreso SUPREMO!{}",
                },
            },
            j_cry_rnjoker = {
                name = "RNJoker",
                text = {
                    "Aleatoriza abilidades por cada {C:attention}apuesta{}",
                },
            },
            j_cry_sacrifice = {
                name = "Sacrificio",
                text = {
                    "Crea un comodín {C:green}inusual{}",
                    "y 3 {C:attention}Comodines contentos{} al",
                    "usar una carta {C:spectral}espectral{}",
                    "{C:red}Funciona una vez por ronda{}",
                    "{C:inactive}#1#{}",
                },
            },
            j_cry_sapling = {
                name = "Brote",
                text = {
                    "Después de puntuar {C:attention}#2#{} {C:inactive}[#1#]{} cartas",
                    "mejoradas, vende esta carta para",
                    "crear un {C:attention}comodín{} {C:cry_epic}épico{} ",
                    "{C:inactive,s:0.8}Creará un {C:attention,s:0.8}comodín{} {C:red,s:0.8}raro{} si los",
                    "{C:inactive,s:0.8}comodines {C:cry_epic,s:0.8}épicos{} {C:inactive,s:0.8}están desactivados{}",
                },
            },
            j_cry_savvy = {
                name = "Comodín inteligente",
                text = {
                    "{C:chips}+#1#{} fichas",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
            j_cry_Scalae = {
                name = "Scalae",
                text = {
                    "Los {C:attention}comodines{} escalan",
                    "como un polinomio grado-{C:attention}#1#{},",
                    "aumenta el grado por {C:attention}#2#{}",
                    "al final de la ronda",
                    "{C:inactive,s:0.8}({C:attention,s:0.8}Scalae{C:inactive,s:0.8} excluido)",
                },
            },
            j_cry_scrabble = {
                name = "Teja de Scrabble",
                text = {
                    "{C:green}#1# en #2#{} probabilidades de crear",
                    "un comodín {C:green}inusual{} {C:dark_edition}contento",
                    "al jugar una mano",
                },
            },
            j_cry_seal_the_deal = {
                name = "Sellar el acuerdo",
                text = {
                    "Añade un {C:attention}sello al azar{} a cada carta",
                    "puntuada en la {C:attention}última mano{} de la ronda",
                },
            },
            j_cry_shrewd = {
                name = "Comodín perspicaz",
                text = {
                    "{C:chips}+#1#{} fichas",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
            j_cry_silly = {
                name = "Comodín bobo",
                text = {
                    "{C:red}+#1#{} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
            j_cry_smallestm = {
                name = "Diminuto",
                text = {
                    "Crea una {C:cry_jolly}Etiqueta MM",
                    "si la {C:attention}mano de póker{} jugada",
                    "es una {C:attention}#1#{}",
                    "{C:inactive,s:0.8}ok so básicamente soy muy peque",
                },
            },
            j_cry_soccer = {
                name = "Uno para todos", --changed the name from latin because this isn't exotic
                text = {
                    "{C:attention}+#1#{} ranura de comodín",
                    "{C:attention}+#1#{} ranura de paquete potenciador",
                    "{C:attention}+#1#{} tamaño de mano",
                    "{C:attention}+#1#{} ranura de consumible",
                    "{C:attention}+#1#{} ranura de carta en la tienda",
                },
            },
            j_cry_spaceglobe = {
                name = "Esfera celestial",
                text = {
                    "Este comodín gana {X:chips,C:white}X#2#{} fichas",
                    "si la {C:attention}mano de póker{} es un(a) {C:attention}#3#{},",
                    "mano cambia después de aumentar{}",
                    "{C:inactive}(Actual:{} {X:chips,C:white}X#1#{} {C:inactive}fichas){}",
                },
            },
            j_cry_speculo = {
                name = "Speculo",
                text = {
                    "Crea una copia {C:dark_edition}negativa{}",
                    "de un {C:attention}comodín{} aleatorio",
                    "al final de la {C:attention}tienda",
                    "{C:inactive,s:0.8}No copia otros Speculo{}",
                },
            },
            j_cry_spy = {
                name = "Espía",
                text = {
                    "{X:mult,C:white} X#2# {} multi, {C:dark_edition}+1{} ranura de {C:attention}comodín{}",
                    "{C:inactive}¡Ese #1# es un espía!",
                },
            },
            j_cry_stardust = {
                name = "Polvo de estrellas",
                text = {
                    "Las cartas {C:dark_edition}policromas{}",
                    "otorgan {X:mult,C:white}X#1#{} multi",
                },
            },
            j_cry_stella_mortis = {
                name = "Stella Mortis",
                text = {
                    "Este comodín destruye una",
                    "carta de {C:planet}planeta{} al azar",
                    "y gana {X:dark_edition,C:white} ^#1# {} multi",
                    "al final de la {C:attention}tienda{}",
                    "{C:inactive}(Actual: {X:dark_edition,C:white} ^#2# {C:inactive} multi)",
                },
            },
            j_cry_stronghold = {
                name = "La fortaleza",
                text = {
                    "{X:mult,C:white} X#1# {} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                },
            },

            j_cry_subtle = {
                name = "Comodín sutil",
                text = {
                    "{C:chips}+#1#{} fichas",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
            j_cry_supercell = {
                name = "Supercell",
                text = {
                    "{C:chips}+#1#{} fichas, {C:mult}+#1#{} multi,",
                    "{X:chips,C:white}X#2#{} fichas, {X:mult,C:white}X#2#{} multi",
                    "Gana {C:money}$#3#{} al",
                    "final de la ronda",
                },
            },
            j_cry_sus = {
                name = "SUS",
                text = {
                    "Al final de la ronda, crea",
                    "una {C:attention}copia{} de una carta",
                    "aleatoria {C:attention}en tu mano{},",
                    "destruye las demás",
                    "{C:attention,s:0.8}Reyes{s:0.8} de {C:hearts,s:0.8}corazones{s:0.8} son priorizados",
                },
            },
            j_cry_swarm = {
                name = "El enjambre",
                text = {
                    "{X:mult,C:white} X#1# {} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                },
            },
            j_cry_sync_catalyst = {
                name = "Catalizador de sincronización",
                text = {
                    "Equilibra las {C:blue}fichas{} y el {C:red}multi{}",
                    "{C:inactive,s:0.8}¡Hey! ¡Yo he visto esto antes!",
                },
            },
			j_cry_tax_fraud = {
				name = "Evasión fiscal",
				text = {
					"Al final de la ronda, gana",
					"{C:attention}$#1#{} por cada comodín {C:attention}de alquiler",
				},
			},
            j_cry_tenebris = {
                name = "Tenebris",
                text = {
                    "{C:dark_edition}+#1#{} ranuras de {C:attention}comodín{}",
                    "Gana {C:money}$#2#{} al final de la ronda",
                },
            },
            j_cry_translucent = {
                name = "Comodín translúcido",
                text = {
                    "Vende esta carta para crear",
                    "una copia {C:attention}Banana Perecedera{}",
                    "de un {C:attention}comodín{} aleatorio",
                    "{s:0.8,C:inactive}(La copia evita compat. de perecedero)",
                },
            },
            j_cry_treacherous = {
                name = "Comodín traicionero",
                text = {
                    "{C:chips}+#1#{} fichas",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
            j_cry_trick_or_treat = {
                name = "Dulce o truco",
                text = {
                    "Al {C:attention}venderse{}:",
                    "{C:green}#1# en #2#{} probabilidades de crear {C:attention}2{} {C:cry_candy}dulces",
                    "Si no, crea un comodín {X:cry_cursed,C:white}maldito{}",
                    "{C:inactive}(puede desbordarse)"
                }
            },
            j_cry_tricksy = {
                name = "Comodín tramposo",
                text = {
                    "{C:chips}+#1#{} fichas",
                    "si la mano contiene",
                    "una {C:attention}#2#",
                }
            },
            j_cry_triplet_rhythm = {
                name = "Ritmo triple",
                text = {
                    "{X:mult,C:white} X#1# {} multi si la mano",
                    "contiene {C:attention}exactamente{} tres {C:attention}3s",
                },
            },
            j_cry_tropical_smoothie = {
                name = "Zalamero tropical",
                text = {
                    "Vende esta carta para",
		            "{C:attention}multiplicar{} los valores de los",
                    "comodines conseguidos por {C:attention}X1.5{}",
                },
            },

            j_cry_unity = {
                name = "La unidad",
                text = {
                    "{X:mult,C:white} X#1# {} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                },
            },
            j_cry_universe = {
                name = "Universo",
                text = {
                    "Las cartas {C:dark_edition}astrales{}",
                    "otorgan {X:dark_edition,C:white}^#1#{} multi",
                },
            },
            j_cry_universum = {
                name = "Universum",
                text = {
                    "Las {C:attention}manos de póker{} ganan",
                    "{X:red,C:white} X#1# {} multi y {X:blue,C:white} X#1# {} fichas",
                    "al subir de nivel",
                },
            },
            j_cry_unjust_dagger = {
                name = "Daga injusta",
                text = {
                    "Cuando se selecciona la {C:attention}ciega{},",
                    "destruye al comodín de la izquierda",
                    "y agraga {C:attention}un quinto{} del",
                    "valor de venta a {X:mult,C:white} Xmulti {}",
                    "{C:inactive}(Actual: {X:mult,C:white} X#1# {C:inactive} multi)",
                },
            },
            j_cry_verisimile = {
                name = "Non Verisimile",
                text = {
                    "Cuando cualquier probabilidad",
                    "es activada {C:green}con éxito{},",
                    "este comodín gana {X:red,C:white}Xmulti{}",
                    "igual a sus {C:attention}probabilidades{} listadas",
                    "{C:inactive}(Actual: {X:mult,C:white} X#1# {C:inactive} multi)",
                },
            },
            j_cry_virgo = {
                name = "Virgo",
                text = {
                    "Este comodín gana {C:money}$#1#{} de {C:attention}valor de venta{}",
                    "si la {C:attention}mano de póker{} contiene una {C:attention}#2#{}",
                    "Vende esta carta para crear un",
                    "{C:attention}comodín contento{} {C:dark_edition}policroma{} por",
                    "cada {C:money}$4{} de {C:attention}valor de venta{} {C:inactive}(min. 1){}",
                },
            },
            j_cry_wacky = {
                name = "Comodín chalado", --too many freaking name collisions
                text = {
                    "{C:red}+#1#{} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                }
            },
            j_cry_waluigi = {
                name = "Waluigi",
                text = {
                    "Todos los comodines otorgan",
                    "{X:mult,C:white} X#1# {} multi",
                },
            },
            j_cry_wario = {
                name = "Wario",
                text = {
                    "Todos los comodines otorgan",
                    "{C:money}$#1#{} al activarse",
                },
            },
            j_cry_wee_fib = {
                name = "Weebonacci",
                text = {
                    "Este comodín gana",
                    "{C:mult}+#2#{} multi cuando cada",
                    "{C:attention}As{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, o {C:attention}8{}",
                    "jugado puntúa",
                    "{C:inactive}(Actual: {C:mult}+#1#{C:inactive} multi)",
                },
            },
            j_cry_weegaming = {
                name = "2D",
                text = {
                    "Reactica cada {C:attention}2{} jugado", --wee gaming
                    "{C:attention:}#1#{} veces adicionales", --wee gaming?
                    "{C:inactive,s:0.8}Wee Gaming?{}",       --wee gaming :)
                },
            },
            j_cry_wheelhope = {
                name = "La rueda de la esperanza",
                text = {
                    "Este comodín gana",
                    "{X:mult,C:white} X#1# {} multi al fallar",
                    "una {C:attention}Rueda de la fortuna{}",
                    "{C:inactive}(Actual: {X:mult,C:white} X#2# {C:inactive} multi)",
                },
            },
            j_cry_whip = {
                name = "El LÁTIGO",
                text = {
                    "Este comodín gana {X:mult,C:white}X#1#{} multi",
                    "si la {C:attention}mano jugada{} contiene un",
                    "{C:attention}2{} y {C:attention}7{} de diferentes palos",
                    "{C:inactive}(Actual: {X:mult,C:white} X#2# {C:inactive} multi)",
                },
            },
            j_cry_wrapped = {
                name = "Dulce envuelto",
                text = {
                    "Crea un {C:attention}comodín de comida{}",
                    "en {C:attention}#1#{} ronda(s)",
                    "{C:red,E:2}se autodestruye{}",
                },
            },
            j_cry_wtf = {
                name = "¿¡Qué rayos?!",
                text = {
                    "{X:mult,C:white} X#1# {} multi",
                    "si la mano contiene",
                    "un {C:attention}#2#",
                },
            },
        },
        Planet = {
            c_cry_Klubi = {
                name = "Klubi",
                text = {
                    "({V:1}nvl.#4#{})({V:2}nvl.#5#{})({V:3}nvl.#6#{})",
                    "Aumento de nivel",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "y {C:attention}#3#{}",
                },
            },
            c_cry_Lapio = {
                name = "Lapio",
                text = {
                    "({V:1}nvl.#4#{})({V:2}nvl.#5#{})({V:3}nvl.#6#{})",
                    "Aumento de nivel",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "y {C:attention}#3#{}",
                },
            },
            c_cry_Kaikki = {
                name = "Kaikki",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Aumento de nivel",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "y {C:attention}#3#{}",
                },
            },
            c_cry_nstar = {
                name = "Estrella de neutrones",
                text = {
                    "Mejora una mano de póker",
                    "al azar por",
                    "{C:attention}1{} nivel por cada",
                    "{C:attention}estrella de neutrones{} usada",
                    "en esta partida",
                    "{C:inactive}(Actual:{C:attention} #1#{C:inactive}){}",
                },
            },
            c_cry_planetlua = {
                name = "Planeta.lua",
                text = {
                    "{C:green}#1# en #2#{} probabilidades para",
                    "aumentar todas las",
                    "{C:legendary,E:1}manos de póker{}",
                    "por {C:attention}1{} nivel",
                },
            },
            c_cry_Sydan = {
                name = "Sydan",
                text = {
                    "({V:1}nvl.#4#{})({V:2}nvl.#5#{})({V:3}nvl.#6#{})",
                    "Aumento de nivel",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "y {C:attention}#3#{}",
                },
            },
            c_cry_Timantti = {
                name = "Timantti",
                text = {
                    "({V:1}nvl.#4#{})({V:2}nvl.#5#{})({V:3}nvl.#6#{})",
                    "Aumento de nivel",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "y {C:attention}#3#{}",
                },
            },
        },
        Sleeve = {
            sleeve_cry_ccd_sleeve = {
                name = "Manga CCD",
                text = {
                    "Todas las cartas también son",
                    "un consumible {C:attention}aleatorio{}",
                },
            },
            sleeve_cry_conveyor_sleeve = {
                name = "Manga transportadora",
                text = {
                    "Los comodines {C:attention}no{} se pueden mover",
                    "Al principio de la runda,",
                    "{C:attention}duplica{} el comodín del extremo derecho",
                    "y {C:attention}destruye{} el comodín del extremo izquierdo",
                },
            },
            sleeve_cry_critical_sleeve = {
                name = "Manga crítica",
                text = {
                    "Después de cada mano jugada,",
                    "{C:green}#1# en 4{} probabilidades para {X:dark_edition,C:white} ^2 {} multi",
                    "{C:green}#1# en 8{} probabilidades para {X:dark_edition,C:white} ^0.5 {} multi",
                },
            },
            sleeve_cry_encoded_sleeve = {
                name = "Manga codificada",
                text = {
                    "Comienza con un {C:cry_code,T:j_cry_CodeJoker}Comodín de código{}",
                    "y {C:cry_code,T:j_cry_copypaste}Copiar y pegar{}",
                    "Sólo aparecen {C:cry_code}cartas de código{} en la tienda",
                },
            },
            sleeve_cry_equilibrium_sleeve = {
                name = "Manga balanceada",
                text = {
                    "Todas las cartas tienen la ",
                    "{C:attention}misma probabilidad{} de",
                    "aparecer en las tiendas,",
                    "comienza la partida con",
                    "{C:attention,T:v_overstock_plus}+2 ranuras de carta",
                },
            },
            sleeve_cry_infinite_sleeve = {
                name = "Baraja infinita",
                text = {
                    "Puedes seleccionar {C:attention}cualquier",
                    "cantidad de cartas",
                    --someone do the hand size thing for me
                },
            },
            sleeve_cry_misprint_sleeve = {
                name = "Manga de errata",
                text = {
                    "Los valures de cartas",
                    "se {C:attention}aleatorizan",
                },
            },
            sleeve_cry_redeemed_sleeve = {
                name = "Manga redimida",
                text = {
                    "Cuando se compra un {C:attention}vale{},",
                    "obtén sus {C:attention}niveles extras",
                },
            },
            sleeve_cry_wormhole_sleeve = {
                name = "Manga de agujero de gusano",
                text = {
                    "Comienza con un comodín {C:cry_exotic}exótico{C:attention}",
                    "Los comodines son {C:attention}20X{} más",
                    "probables de ser {C:dark_edition}Negativos",
                    "{C:attention}-2{} ranuras de comodín",
                },
            },
			sleeve_cry_legendary_sleeve = {
                name = "Manga legendaria<",
                text = {
                    "Comienza con un comodín {C:legendary}legendario{C:legendary}",
                    "{C:green}1 en 5{} probabilidades para crear otro",
					"cuando se derrota a la ciega jefe",
                    "{C:inactive}(debe haber espacio){}",
                },
            },
        },
        Spectral = {
            c_cry_adversary = {
                name = "Adversario",
                text = {
                    "{C:red}Todos{} tus {C:attention}comodines{} se vuelven {C:dark_edition}negativos{},",
                    "{C:red}todos{} los {C:attention}comodines{} en la tienda cuestan",
                    "el {C:red}doble{} por el resto de la partida",
                },
            },
            c_cry_analog = {
                name = "Análogo",
                text = {
                    "Crea {C:attention}#1#{} copias de un",
                    "{C:attention}comodín{} aleatorio, destruye",
                    "los demás, {C:attention}+#2#{} apuesta",
                },
            },
            c_cry_chambered = {
                name = "Recámara",
                text = {
                    "Crea {C:attention}#1#{} copias",
                    "{C:dark_edition}negativas{} de un",
                    "consumible {C:attention}al azar{}",
                    "{C:inactive,s:0.8}No copia otros __{}"
                },
            },
            c_cry_conduit = {
                name = "Conducto",
                text = {
                    "Intercambia las {C:attention}ediciones{} de",
                    "{C:attention}2{} cartas o {C:attention}comodines{} seleccionados",
                },
            },

            c_cry_gateway = {
                name = "Portal",
                text = {
                    "Crea un {C:attention}comodín",
                    "{C:cry_exotic,E:1}exótico{}, destruye",
                    "los demás",
                },
            },
            c_cry_hammerspace = {
                name = "Hammerspace",
                text = {
                    "Aplica {C:attention}consumibles{} aleatorios",
                    "como si fueran {C:dark_edition}mejoras{}",
                    "a las cartas en la mano",
                },
            },
            c_cry_lock = {
                name = "Cerradura",
                text = {
                    "Remueve {C:red}todas{} las pegatinas",
                    "de {C:red}todos{} los comodines,",
                    "y aplica {C:purple,E:1}Eterno{}",
                    "a un {C:attention}comodín{} aleatorio",
                },
            },
            c_cry_pointer = {
                name = "PUNTERO://",
                text = {
                    "Crea una carta",
                    "de {C:cry_code}tu elección",
                    "{C:inactive,s:0.8}(Comodines exóticos #1#excluidos)",
                },
            },
            c_cry_replica = {
                name = "Réplica",
                text = {
                    "Convierte todas las cartas",
                    "en tu mano",
                    "a una carta {C:attention}aleatoria{}",
                    "en tu mano",
                },
            },
            c_cry_ritual = {
                name = "Ritual",
                text = {
                    "Aplica {C:dark_edition}Negativo{}, {C:dark_edition}Mosaico{},",
                    "o {C:dark_edition}Astral{} a {C:attention}#1#{}",
                    "carta de tu mano seleccionada",
                },
            },
            c_cry_source = {
                name = "Origen",
                text = {
                    "Agrega un {C:cry_code}sello verde{}",
                    "a {C:attention}1{} carta seleccionada",
                    "de tu mano al azar",
                },
            },
            c_cry_summoning = {
                name = "Evocación",
                text = {
                    "Crea un {C:joker}comodín{}",
                    "{C:cry_epic}épico{} aleatorio, destruye",
                    "un {C:joker}comodín{} al azar",
                },
            },
            c_cry_trade = {
                name = "Intercambio",
                text = {
                    "{C:attention}Pierde{} un vale aleatorio,",
                    "gana {C:attention}2{} vales aleatorios",
                },
            },
            c_cry_typhoon = {
                name = "Tifón",
                text = {
                    "Agrega un {C:cry_azure}sello azur{}",
                    "a {C:attention}1{} carta seleccionada",
                    "de tu mano al azar",
                },
            },
            c_cry_vacuum = {
                name = "Vacío",
                text = {
                    "Remueve {C:red}todas{} las {C:green}modificaciones{}",
                    "de {C:red}todas{} las cartas en tu mano,",
                    "gana {C:money}$#1#{} por cada {C:green}modificación{} removida",
                    "{C:inactive,s:0.7}(ej. mejoras, sellos, ediciones)",
                },
            },
            c_cry_white_hole = {
                name = "Agujero blanco",
                text = {
                    "{C:attention}Remueve{} todos los niveles de mano,",
                    "mejora la mano de póker {C:legendary,E:1}más jugada{}",
                    "por {C:attention}3{} por cada nivel removido",
                },
            },
        },
        Stake = {
            stake_cry_pink = {
                name = "Pozo rosa",
                colour = "Rosa", --this is used for auto-generated sticker localization
                text = {
                    "Escalas de puntos requeridas más rápidas",
                    "para cada {C:attention}apuesta inicial",
                },
            },
            stake_cry_brown = {
                name = "Pozo marrón",
                colour = "Marrón",
                text = {
                    "Todas las {C:attention}pegatinas{} son",
                    "compatibles entre sí",
                },
            },
            stake_cry_yellow = {
                name = "Pozo amarillo",
                colour = "Amarillo",
                text = {
                    "{C:attention}Stickers{} can appear on",
                    "all purchasable items",
                },
            },
            stake_cry_jade = {
                name = "Pozo jade",
                colour = "Jade",
                text = {
                    "Las cartas pueden sacarse {C:attention}boca abajo{}",
                },
            },
            stake_cry_cyan = {
                name = "Pozo celeste",
                colour = "Celeste",
                text = {
                    "Comodines {C:green}inusuales{} y {C:red}raros{} son",
                    "menos probables de aparecer",
                },
            },
            stake_cry_gray = {
                name = "Pozo gris",
                colour = "Gris",
                text = {
                    "Las renovaciones aumentan por {C:attention}$2{} cada una",
                },
            },
            stake_cry_crimson = {
                name = "Pozo carmesí",
                colour = "Carmesí",
                text = {
                    "Los vales reaparecen en apuestas {C:attention}pares{}",
                },
            },
            stake_cry_diamond = {
                name = "Pozo diamante",
                colour = "Diamante",
                text = {
                    "Debes vencer la apuesta {C:attention}10{} para ganar",
                },
            },
            stake_cry_amber = {
                name = "Pozo ámbar",
                colour = "Ámbar",
                text = {
                    "{C:attention}-1{} ranuras de paquete potenciador",
                },
            },
            stake_cry_bronze = {
                name = "Pozo bronce",
                colour = "Bronce",
                text = {
                    "Los vales son {C:attention}50%{} más caros",
                },
            },
            stake_cry_quartz = {
                name = "Pozo cuarzo",
                colour = "Cuarzo",
                text = {
                    "Los comodines pueden ser {C:attention}Fijados{}",
                    "{s:0.8,C:inactive}(Se queda fijado al extremo izquierdo){}",
                },
            },
            stake_cry_ruby = {
                name = "Pozo rubí",
                colour = "Rubí",
                text = {
                    "Ciegas {C:attention}grandes{} pueden ser",
                    "ciegas {C:attention}jefes{}",
                },
            },
            stake_cry_glass = {
                name = "Pozo de vidrio",
                colour = "Vidrio",
                text = {
                    "Las cartas pueden {C:attention}destruirse{} al puntuar",
                },
            },
            stake_cry_sapphire = {
                name = "Pozo safiro",
                colour = "Safiro",
                text = {
                    "Pierde {C:attention}25%{} del dinero actual",
                    "al final de la apuesta",
                    "{s:0.8,C:inactive}(máx. $10){}",
                },
            },
            stake_cry_emerald = {
                name = "Pozo esmeralda",
                colour = "Esmeralda",
                text = {
                    "Cartas, paquetes y vales",
                    "pueden estar {C:attention}boca abajo{}",
                    "{s:0.8,C:inactive}(No se pueden ver hasta ser comprados){}",
                },
            },
            stake_cry_platinum = {
                name = "Pozo platino",
                colour = "Platino",
                text = {
                    "Las ciegas pequeñas son {C:attention}removidas{}",
                },
            },
            stake_cry_twilight = {
                name = "Pozo crepúsculo",
                colour = "Crepúsculo",
                text = {
                    "Las cartas pueden ser {C:attention}Banana{}",
                    "{s:0.8,C:inactive}(1 en 10 probabilidades de ser destruidas cada ronda){}",
                },
            },
            stake_cry_verdant = {
                name = "Pozo verdoso",
                colour = "Verdoso",
                text = {
                    "Escalas de puntos requeridas más rápidas",
                    "para cada {C:attention}apuesta inicial",
                },
            },
            stake_cry_ember = {
                name = "Pozo ascua",
                colour = "Ascua",
                text = {
                    "Todos los objetos no entregan dinero al venderse",
                },
            },
            stake_cry_dawn = {
                name = "Pozo alba",
                colour = "Alba",
                text = {
                    "Cartas tarot y espectrales seleccionan {C:attention}1",
                    "carta menos",
                    "{s:0.8,C:inactive}(mín. 1){}",
                },
            },
            stake_cry_horizon = {
                name = "Pozo del horizonte",
                colour = "Horizonte",
                text = {
                    "Agrega una {C:attention}carta al azar{}",
                    "a tu baraja al",
                    "seleccionar una {C:attention}ciega{}",
                },
            },
            stake_cry_blossom = {
                name = "Pozo florido",
                colour = "Florido",
                text = {
                    "Las ciegas {C:attention}finales{} pueden aparecer",
                    "en {C:attention}cualquier{} apuesta",
                },
            },
            stake_cry_azure = {
                name = "Pozo azur",
                colour = "Azur",
                text = {
                    "Los valores en comodines se reducen",
                    "por {C:attention}20%{}",
                },
            },
            stake_cry_ascendant = {
                name = "Pozo ascendente",
                colour = "Ascendente",
                text = {
                    "{C:attention}-1{} ranura de carta en la tienda",
                },
            },
        },
        Tag = {
            tag_cry_astral = {
                name = "Etiqueta astral",
                text = {
                    "El siguiente comodín de la tienda",
                    "de la edición base es gratuito",
                    "y se convierte en {C:dark_edition}Astral{}",
                },
            },
            tag_cry_banana = {
                name = "Etiqueta banana",
                text = {
                    "Crea {C:attention}#1#",
                    "{C:inactive}(Debe haber espacio){}",
                },
            },
            tag_cry_bettertop_up = {
                name = "Mejor etiqueta de recarga",
                text = {
                    "Genera hasta {C:attention}#1#",
                    "comodines {C:green}inusuales{}",
                    "{C:inactive}(Debe haber espacio)",
                },
            },
            tag_cry_better_voucher = {
                name = "Etiqueta de vale dorado",
                text = {
                    "Agrega un {C:voucher}vale{} de nivel {C:attention}#1#{}",
                    "en la siguiente tienda",
                },
            },
            tag_cry_blur = {
                name = "Etiqueta borrosa",
                text = {
                    "El siguiente comodín de la tienda",
                    "de la edición base es gratuito",
                    "y se convierte en {C:dark_edition}Borroso{}",
                },
            },
            tag_cry_booster = {
                name = "Etiqueta potenciadora",
                text = {
                    "El siguiente {C:cry_code}paquete potenciador{} contiene",
                    "el {C:attention}doble{} de cartas y",
                    "el {C:attention}doble{} de opciones",
                },
            },
            tag_cry_bundle = {
                name = "Etiqueta de manojo",
                text = {
                    "Crea una {C:attention}Etiqueta estándar{}, {C:tarot}Etiqueta encantada{},",
                    "{C:attention}Etiqueta de bufón{}, y {C:planet}Etiqueta de meteoro",
                },
            },
            tag_cry_cat = {
                name = "Etiqueta de gato",
                text = { "miau :3", "{C:inactive}Nivel {C:dark_edition}#1#" },
            },
            tag_cry_console = {
                name = "Etiqueta de consola",
                text = {
                    "Otorga gratis un",
                    "{C:cry_code}paquete de programa",
                },
            },
            tag_cry_double_m = {
                name = "Etiqueta MM",
                text = {
                    "En la tienda hay",
                    "un {C:legendary}comodín M{} {C:dark_edition}contento",
                },
            },
            tag_cry_empowered = {
                name = "Etiqueta empoderada",
                text = {
                    "Otorga un {C:spectral}paquete espectral gratis",
                    "con {C:legendary,E:1}El alma{} y {C:cry_exotic,E:1}Portal{}",
                },
            },
            tag_cry_epic = {
                name = "Etiqueta épica",
                text = {
                    "En la tienda hay un {C:cry_epic}comodín épico{}",
                    "a mitad de precio",
                },
            },
            tag_cry_gambler = {
                name = "Etiqueta del jugador",
                text = {
                    "{C:green}#1# en #2#{} probabilidades de crear",
                    "una {C:cry_exotic,E:1}Etiqueta empoderada",
                },
            },
            tag_cry_glass = {
                name = "Etiqueta frágil",
                text = {
                    "El siguiente comodín de la tienda",
                    "de la edición base es gratuito",
                    "y se convierte en {C:dark_edition}Frágil{}",
                },
            },
            tag_cry_glitched = {
                name = "Etiqueta errónea",
                text = {
                    "El siguiente comodín de la tienda",
                    "de la edición base es gratuito",
                    "y se convierte en {C:dark_edition}Erróneo{}",
                },
            },
            tag_cry_gold = {
                name = "Etiqueta dorada",
                text = {
                    "El siguiente comodín de la tienda",
                    "de la edición base es gratuito",
                    "y se convierte en {C:dark_edition}Dorado{}",
                },
            },
            tag_cry_gourmand = {
                name = "Etiqueta gourmand",
                text = {
                    "En la tienda hay un",
                    "{C:attention}comodín de comida{} gratis",
                },
            },
            tag_cry_loss = {
                name = "Loss",
                text = {
                    "Otorga gratis",
                    "un {C:cry_ascendant}Paquete meme",
                },
            },
            tag_cry_m = {
                name = "Etiqueta contenta",
                text = {
                    "El siguiente comodín de la tienda",
                    "de la edición base es gratuito",
                    "y se convierte en {C:dark_edition}Contento{}",
                },
            },
            tag_cry_memory = {
                name = "Etiqueta de memoria",
                text = {
                    "Crea {C:attention}#1#{} copias de",
                    "la última {C:attention}etiqueta{} usada",
                    "durante esta partida",
                    "{s:0.8,C:inactive}Etiquetas de copia excluidas",
                    "{s:0.8,C:inactive}Actual: {s:0.8,C:attention}#2#",
                },
            },
            tag_cry_mosaic = {
                name = "Etiqueta mosaico",
                text = {
                    "El siguiente comodín de la tienda",
                    "de la edición base es gratuito",
                    "y se convierte en {C:dark_edition}Mosaico{}",
                },
            },
            tag_cry_oversat = {
                name = "Etiqueta sobresaturada",
                text = {
                    "El siguiente comodín de la tienda",
                    "de la edición base es gratuito",
                    "y se convierte en {C:dark_edition}Sobresaturado{}",
                },
            },
            tag_cry_quadruple = {
                name = "Etiqueta cuádruple",
                text = {
                    "Otorga {C:attention}#1#{} copias de la",
                    "siguiente {C:attention}Tag{} seleccionada",
                    "{s:0.8,C:inactive}Etiquetas de copia excluidas",
                },
            },
            tag_cry_quintuple = {
                name = "Etiqueta quíntuple",
                text = {
                    "Otorga {C:attention}#1#{} copias de la",
                    "siguiente {C:attention}Tag{} seleccionada",
                    "{s:0.8,C:inactive}Etiquetas de copia excluidas",
                },
            },
            tag_cry_rework = {
                name = "Etiqueta de retrabajo",
                text = {
                    "La tienda tiene un",
                    "{C:cry_code}#2#{} {C:dark_edition}#1#",
                },
            },
            tag_cry_schematic = {
                name = "Etiqueta de esquemáticas",
                text = {
                    "La tienda tiene una",
                    "{C:attention}Lluvia de ideas",
                },
            },
            tag_cry_scope = {
                name = "Etiqueta de alcance",
                text = {
                    "{C:attention}+#1# {C:blue}manos{} y {C:red}descartes{}",
                    "en la siguiente ronda",
                },
            },
            tag_cry_triple = {
                name = "Etiqueta triple",
                text = {
                    "Otorga {C:attention}#1#{} copias de la",
                    "siguiente {C:attention}Tag{} seleccionada",
                    "{s:0.8,C:inactive}Etiquetas de copia excluidas",
                },
            },
        },
        Tarot = {
            c_cry_automaton = {
                name = "El autómata",
                text = {
                    "Genera hasta {C:attention}#1#",
                    "cartas de {C:cry_code}código{} al azar",
                    "{C:inactive}(Debe haber espacio)",
                },
            },
            c_cry_eclipse = {
                name = "El eclipse",
                text = {
                    "Mejora {C:attention}#1#{} carta",
                    "seleccionada a",
                    "una {C:attention}Carta de eco",
                },
            },
            c_cry_meld = {
                name = "Fusionar",
                text = {
                    "Selecciona un {C:attention}comodín{} o",
                    "{C:attention}carta de juego{} para",
                    "hacerla {C:dark_edition}Doble cara",
                },
            },
            c_cry_theblessing = {
                name = "La bendición",
                text = {
                    "Crea {C:attention}1{}",
                    "{C:attention}consumible{} aleatorio",
                    "{C:inactive}(Debe haber espacio){}",
                },
            },
        },
        Voucher = {
            v_cry_asteroglyph = {
                name = "Asteroglífico",
                text = {
                    "Establece la apuesta a {C:attention}#1#{}",
                },
            },
            v_cry_blankcanvas = {
                name = "Lienzo en blanco",
                text = {
                    "{C:attention}+#1#{} tamaño de mano",
                },
            },
            v_cry_clone_machine = {
                name = "Máquina de clonar",
                text = {
                    "Las etiqueta dobles se vuelven",
                    "{C:attention}Etiquetas quíntuples{} y",
                    "son {C:attention}4X{} más comunes",
                },
            },
            v_cry_command_prompt = {
                name = "Símbolo del sistema",
                text = {
                    "Las cartas de {C:cry_code}código{}",
                    "pueden aparecer",
                    "en la {C:attention}tienda{}",
                },
            },
            v_cry_copies = {
                name = "Copias",
                text = {
                    "Las etiqueta dobles se vuelven",
                    "{C:attention}Etiquetas triples{} y son",
                    "son {C:attention}2X{} más comunes",
                },
            },
            v_cry_curate = {
                name = "Cura",
                text = {
                    "Todas las cartas",
                    "aparecen con",
                    "una {C:dark_edition}edición{}",
                },
            },
            v_cry_dexterity = {
                name = "Destreza",
                text = {
                    "Gana para siempre",
                    "{C:blue}+#1#{} mano(s)",
                    "por ronda",
                },
            },
            v_cry_double_down = {
                name = "Doble de apuesta",
                text = {
                    "Después de cada ronda,",
                    "{X:dark_edition,C:white} X1.5 {} a todos los valores",
                    "en la parte trasera de las",
                    "cartas {C:dark_edition}doble cara{}"
                },
            },
            v_cry_double_slit = {
                name = "Abertura doble",
                text = {
                    "{C:attention}Fusionar{} puede aparecer",
                    "en la tienda y",
                    "paquetes arcanos",
                },
            },
            v_cry_double_vision = {
                name = "Doble visión",
                text = {
                    "Cartas {C:dark_edition}doble cara{} aparecen",
                    "{C:attention}4X{} más frecuentemente",
                },
            },
            v_cry_fabric = {
                name = "Fábrica universal",
                text = {
                    "{C:dark_edition}+#1#{} ranura(s) de comodín",
                },
            },
            v_cry_massproduct = {
                name = "Producción en masa",
                text = {
                    "Todas las cartas y paquetes",
                    "en la tienca cuestan {C:attention}$1{}",
                },
            },
            v_cry_moneybean = {
                name = "Money Beanstalk",
                text = {
                    "Aumenta el límite",
                    "del interés obtenido en cada ronda",
                    "hasta {C:money}#1#${}",
                },
            },
            v_cry_overstock_multi = {
                name = "Multicapital",
                text = {
                    "{C:attention}+#1#{} ranura(s) de carta y",
                    "{C:attention}+#1#{} ranura(s) de paquetes potenciadores",
                    "disponibles en la tienda",
                },
            },
            v_cry_pacclimator = {
                name = "Aclamador de planetas",
                text = {
                    "Las cartas de {C:planet}planeta{} aparecen",
                    "{C:attention}#1# X{} veces más seguido",
                    "en la tienda",
                    "Todas las cartas de {C:planet}planeta{}",
                    "futuras son {C:green}gratis{}",
                },
            },
            v_cry_pairamount_plus = {
                name = "Parejamiento plus", --this is the best translation you get
                text = {
                    "{C:attention}Reactiva{} todos los comodines M",
                    "ona vez por cada Pareja",
                    "{C:attention}contenida{} en la mano jugada",
                },
            },
            v_cry_pairing = {
                name = "Parejamiento",
                text = {
                    "{C:attention}Reactiva{} todos los comodines M",
                    "si la mano jugada es una {C:attention}Pareja",
                },
            },
            v_cry_quantum_computing = {
                name = "Computación cuántica",
                text = {
                    "Las cartas de {C:cry_code}código{} pueden aparecer",
                    "con edición {C:dark_edition}negativa{}",
                },
            },
            v_cry_repair_man = {
                name = "Reparejador", --ditto
                text = {
                    "{C:attention}Reactiva{} todos los comodines M",
                    "si la mano jugada contiene una {C:attention}Pareja",
                },
            },
            v_cry_rerollexchange = {
                name = "Intercambio de renovaciones",
                text = {
                    "Todas las renovaciones",
                    "cuestan {C:attention}$2{}",
                },
            },
            v_cry_satellite_uplink = {
                name = "Enlace satelital",
                text = {
                    "Las cartas de {C:cry_code}código{} pueden",
                    "aparecer en cualquier",
                    "{C:attention}paquete celestial",
                },
            },
            v_cry_scope = {
                name = "Alcance galáctico",
                text = {
                    "Crea la carta de {C:planet}planeta",
                    "por la {C:attention}mano de póker{} jugada",
                    "{C:inactive}(Must have room){}",
                },
            },
            v_cry_tacclimator = {
                name = "Aclamador de tarot",
                text = {
                    "Las cartas de {C:tarot}tarot{} aparecen",
                    "{C:attention}#1# X{} veces más seguido",
                    "en la tienda",
                    "Todas las cartas de {C:tarot}tarot{}",
                    "futuras son {C:green}gratis{}",
                },
            },
            v_cry_tag_printer = {
                name = "Impresor de etiquetas",
                text = {
                    "Las etiqueta dobles se vuelven",
                    "{C:attention}Etiquetas cuadrúples{} y son",
                    "son {C:attention}3X{} más comunes",
                },
            },
            v_cry_threers = {
                name = "Las 3 Rs",
                text={
                    "Consigue {C:red}+#1#{}",
                    "descartes en cada ronda",
                    "de forma permanente",
                },
            },
            v_cry_stickyhand = {
                name = "Mano pegajosa",
                text = {
                    "{C:attention}+#1#{} límite de",
                    "selección de cartas",
                },
            },
            v_cry_grapplinghook = {
                name = "Gancho de agarre",
                text = {
                    "{C:attention}+#1#{} límite de",
                    "selección de cartas",
                    "{C:inactive,s:0.7}Puedes hacer mucho más con esto de lo que tú crees.{}",

                },
            },
            v_cry_hyperspacetether = {
                name = "Cuerda hiperespacial",
                text = {
                    "{C:attention}+#1#{} límite de ",
                    "selección de cartas",
                    "{C:inactive,s:0.7}NOTA: Tendrá más funcionalidades después{}",
                },
            },
        },
        Other = {
            banana = {
                name = "Banana",
                text = {
                    "{C:green}#1# en #2#{} probabilidades de ser",
                    "destruida en cada ronda",
                },
            },
            cry_rigged = {
                name = "Amañada",
                text = {
                    "Todas las probabilidades {C:cry_code}enumeradas{}",
                    "son {C:cry_code}garantizadas",
                },
            },
            cry_hooked = {
                name = "Enganchada",
                text = {
                    "Cuando este comodín se {C:cry_code}activa{},",
                    "activa {C:cry_code}#1#",
                },
            },
            cry_flickering = {
                name = "Parpadeante",
                text = {
                    "Destruido después de",
                    "{C:attention}#1#{} activaciones",
                    "{C:inactive}({C:attention}#2#{C:inactive} restantes)"
                },
            },
            cry_flickering_desc = { --used by choco dice
                name = "Parpadeante",
                text = {
                    "Destruido después de",
                    "{C:attention}#1#{} activaciones",
                },
            },
            cry_possessed = {
                name = "Poseída",
                text = {
                    "{C:attention}Deshabilita{} e {C:attention}invierte{}",
                    "los efectos, si es posible",
                    "Se destruye junto con {C:attention}Fantasma"
                },
            },
            food_jokers = {
                name = "Comodines de comida",
                text = {
                    "{s:0.8}Banano, Huevo, Helado, Cavendish, Habichuela negra,",
                    "{s:0.8}Cola sin azúcar, Palomitas de maíz, Ramen,",
                    "{s:0.8}Agua con gas, Pickle, Ají picante, Caramelo,",
                    "{s:0.8}Dulce nostálgico, M de comida rápida, etc.",
                },
            },
            ev_cry_choco0 = {
                name = "",
                text = {
                    "Detalles de un {C:cry_ascendant,E:1}evento{}",
                    "activo aparecerán aquí"
                }
            },
            ev_cry_choco1 = {
                name = "1: Posesión",
                text = {
                    "{C:attention}Comodines{} y cartas de juego tienen",
                    "{C:green}1 en 3{} probabilidades of ser Parpadeantes",
                    "Crea un {C:attention}Fantasma",
                    "{C:inactive,s:0.7}Has sido poseído por un fantasma, y tu",
                    "{C:inactive,s:0.7}consciencia está parpadeando."
                }
            },
            ev_cry_choco2 = {
                name = "2: Casa embrujada",
                text = {
                    "No puedes saltar {C:attention}ciegas{}",
                    "Sólo una {C:attention}renovación{} permitida por tienda",
                    "Los precios de {C:attention}vales{} se duplican",
                    "{C:inactive,s:0.7}¡Los espíritus espeluznantes han tomado el control!",
                    "{C:inactive,s:0.7}¡No toques nada y sale lo más rápido que puedas!",
                }
            },
            ev_cry_choco3 = {
                name = "3: Brebajes de bruja",
                text = {
                    "Crea 3 {C:attention}Pociones",
                    "Usa una antes del final de la {C:attention}ciega pequeña{},",
                    "o {C:attention}todos{} los efectos malos se aplicarán en esta {C:attention}apuesta",
                    "{C:inactive,s:0.7}¡Has sido secuestrado por una bruja!",
                    "{C:inactive,s:0.7}Ella te ofrece 3 pociones, mirándote de cerca.",
                    "{C:inactive,s:0.7}Escoje una, para que ella no escoja por tí.",
                }
            },
            ev_cry_choco4 = {
                name = "4: Abismo lunar",
                text = {
                    "Las cartas jugadas tienen una {C:green}1 en 4{} probabilidades",
                    "de convertirse en una figura de {C:club}tréboles{} al azar",
                    "Divide {C:attention}multi{} por la cantidad de cartas de figura jugadas",
                    "{C:inactive,s:0.7}Hasta un hombre que es puro al corazón",
                    "{C:inactive,s:0.7}y dice sus oraciones a la noche..."
                }
            },
            ev_cry_choco5 = {
                name = "5: Chupasangre",
                text = {
                    "Remueve {C:attention}mejoras{} de todas las cartas jugadas",
                    "{C:green}1 en 3{} chance de destruir",
                    "cartas de {C:heart}corazones{} y {C:diamond}diamantes{}",
                    "{C:inactive,s:0.7}Ten cuidado en la oscuridad de la noche, por",
                    "{C:inactive,s:0.7,E:1}ellos en las sombras{C:inactive,s:0.7} buscan saciar su sed..."
                }
            },
            ev_cry_choco6 = {
                name = "6: Por favor toma uno",
                text = {
                    "Al {C:attention}terminar una ronda{}, abre un",
                    "paquete {C:attention}potenciador{} al azar",
                    "{C:inactive,s:0.7}Mientras paseas por las calles, ves una",
                    "{C:inactive,s:0.7}caja de varios paquetes potenciadores. ¡Mejor agarrar uno!"
                }
            },
            ev_cry_choco7 = {
                name = "7: Ambiente festivo",
                text = {
                    "Crea 3 {C:attention}Dulce o truco{} y 1 {C:attention}Cesto de dulce",
                    "Las tiendas tienen un {C:attention}Dulce o truco{} cada ronda",
                    "Los {C:cry_candy}dulces{} otorgan {C:money}$3{} al obtenerse",
                    "{C:inactive,s:0.7}Toda la vecindad está decorada por el empeño espeluznante,",
                    "{C:inactive,s:0.7}¡ven a disfrutar del ambiente festivo!"
                }
            },
            ev_cry_choco8 = {
                name = "8: Lluvia de dulces",
                text = {
                    "Al derrotar una {C:attention}ciega{}, consigue 1 {C:cry_candy}dulce{}",
                    "por cada mano restante; obtén un {C:attention}comodín de comida{}",
                    "cuando un {C:cry_candy}dulce{} es generado",
                    "{C:inactive,s:0.7}¡Los dulces llueven del cielo! Rápido,",
                    "{C:inactive,s:0.7,E:1}¡agarra lo más que puedas!"
                }
            },
            ev_cry_choco9 = {
                name = "9: Riquezas fantasmales",
                text = {
                    "Gana {C:money}$20",
                    "Todo el {C:money}dinero{} conseguido {C:attention}duplicado",
                    "{C:inactive,s:0.7}¡El espectro de un pariente desaparecido tuyo",
                    "{C:inactive,s:0.7}te visita en el medio de la noche!",
                    "{C:inactive,s:0.7}Sin una palabra, colocan una bolsa de dinero en tus manos,",
                    "{C:inactive,s:0.7}sonríen cálidamente, y se despiden mientras se desvanecen en el aire.",
                }
            },
            ev_cry_choco10 = {
                name = "10: Antigüedad venerada",
                text = {
                    "Un {C:attention}comodín{} {C:legendary}legendario{} aparece",
                    "en la ranura de {C:attention}vales{} por {C:money}$50",
                    "Sólo comprable como el {C:attention}último{} objeto en la tienda",
                    "{C:inactive,s:0.7}Has atraído la atención del espíritu de una rélica,",
                    "{C:inactive,s:0.7}pero no va a ser fácil de calmar.",
                }
            },
            cry_https_disabled = {
                name = "M",
                text = {
                    "{C:attention,s:0.7}Actualizaciones{s:0.7} están deshabilitadas por defecto ({C:attention,s:0.7}HTTPS Module{s:0.7})",
                },
            },
            --i am so sorry for this
            --actually some of this needs to be refactored at some point
            cry_eternal_booster = {
                name = "Eterno",
                text = {
                    "Todas las cartas en el paquete",
                    "son {C:attention}Eternos{}",
                },
            },
            cry_perishable_booster = {
                name = "Perecedero",
                text = {
                    "Todas las cartas en el paquete",
                    "son {C:attention}Perecederos{}",
                },
            },
            cry_rental_booster = {
                name = "De alquiler",
                text = {
                    "Todas las cartas en el paquete",
                    "son {C:attention}Rental{}",
                },
            },
            cry_pinned_booster = {
                name = "Fijado",
                text = {
                    "Todas las cartas en el paquete",
                    "son {C:attention}Fijados{}",
                },
            },
            cry_banana_booster = {
                name = "Banana",
                text = {
                    "Todas las cartas en el paquete",
                    "son {C:attention}Banana{}",
                },
            },
            cry_eternal_voucher = {
                name = "Eterno",
                text = {
                    "No puede ser intercambiado",
                },
            },
            cry_perishable_voucher = {
                name = "Perecedero",
                text = {
                    "Se agota al cabo de ",
                    "{C:attention}#1#{} rondas",
                    "{C:inactive}({C:attention}#2#{C:inactive} restantes)",
                },
            },
            cry_rental_voucher = {
                name = "De alquiler",
                text = {
                    "Pierdes {C:money}#1#${}",
                    "al final de la ronda",
                },
            },
            cry_pinned_voucher = {
                name = "Fijado",
                text = {
                    "Se mantiene en la tienda",
                    "hasta que sea redimido",
                },
            },
            cry_banana_voucher = {
                name = "Banana",
                text = {
                    "{C:green}#1# en #2#{} probabilidades de ser",
                    "perdido en cada ronda",
                },
            },
            cry_perishable_consumeable = {
                name = "Perecedero",
                text = {
                    "Se agota al",
                    "final de la ronda",
                },
            },
            cry_rental_consumeable = {
                name = "De alquiler",
                text = {
                    "Pierdes {C:money}#1#${}",
                    "al final de la ronda, y en uso",
                },
            },
            cry_pinned_consumeable = {
                name = "Fijado",
                text = {
                    "No puedes usar consumibles",
                    "no-{C:attention}fijados{}",
                },
            },
            cry_banana_consumeable = {
                name = "Banana",
                text = {
                    "{C:green}#1# en #2#{} probabilidades de",
                    "no hacer nada en uso",
                },
            },
            p_cry_code_normal_1 = {
                name = "Paquete de programa",
                text = {
                    "Elige {C:attention}#1#{} de hasta",
                    "{C:attention}#2# cartas{} de {C:cry_code}código{}",
                },
            },
            p_cry_code_normal_2 = {
                name = "Paquete de programa",
                text = {
                    "Elige {C:attention}#1#{} de hasta",
                    "{C:attention}#2# cartas{} de {C:cry_code}código{}",
                },
            },
            p_cry_code_jumbo_1 = {
                name = "Paquete de programa jumbo",
                text = {
                    "Elige {C:attention}#1#{} de hasta",
                    "{C:attention}#2# cartas{} de {C:cry_code}código{}",
                },
            },
            p_cry_code_mega_1 = {
                name = "Paquete de programa mega",
                text = {
                    "Elige {C:attention}#1#{} de hasta",
                    "{C:attention}#2# cartas{} de {C:cry_code}código{}",
                },
            },
            p_cry_empowered = {
                name = "Paquete espectral [Etiqueta empoderada]",
                text = {
                    "Elige {C:attention}#1#{} de hasta",
                    "{C:attention}#2# cartas {C:spectral}espectrales{}",
                    "{s:0.8,C:inactive}(Generado por Etiqueta empoderada)",
                },
            },
            p_cry_meme_1 = {
                name = "Paquete meme",
                text = {
                    "Elige {C:attention}#1#{} de hasta",
                    "{C:attention}#2# cartas de {C:joker}comodín meme{}",
                },
            },
            p_cry_meme_two = {
                name = "Paquete meme",
                text = {
                    "Elige {C:attention}#1#{} de hasta",
                    "{C:attention}#2# cartas de {C:joker}comodín meme{}",
                },
            },
            p_cry_meme_three = {
                name = "Paquete meme",
                text = {
                    "Elige {C:attention}#1#{} de hasta",
                    "{C:attention}#2# cartas de {C:joker}comodín meme{}",
                },
            },
            undiscovered_code = {
                name = "Por descubrir",
                text = {
                    "Compra o usa",
                    "esta carta",
                    "en una partida sin códigos",
                    "para saber lo que hace",
                },
            },
            undiscovered_unique = {
                name = "Por descubrir",
                text = {
                    "Compra o usa",
                    "esta carta",
                    "en una partida sin códigos",
                    "para saber lo que hace",
                }
            },
            cry_green_seal = {
                name = "Sello verde",
                text = {
                    "Crea una carta de {C:cry_code}código{}",
                    "cuando se juega y no puntúa",
                    "{C:inactive}(Debe haver espacio)",
                },
            },
            cry_azure_seal = {
                name = "Sello azur",
                text = {
                    "Crea {C:attention}#1#{} {C:planet}planetas{}",
                    "{C:dark_edition}negativas{} por la {C:attention}mano de póker{}",
                    "jugada, y {C:red}destruye{} esta carta",
                },
            },
        },
        Unique = {
            c_cry_potion = {
                name = "Poción",
                text = {
                    "Aplica un {C:attention}efecto malo{}",
                    "desconocido al usarse",
                    "{C:inactive,s:0.7}Obtenido por Dado de chocolate"
                }
            }
        }
    },
    misc = {
        achievement_names = {
            ach_cry_ace_in_crash = "Un ACE En Mi Bolsillo",
            ach_cry_blurred_blurred_joker = "Legalmente Ciego",
            ach_cry_bullet_hell = "Shooter Maníaco",
            ach_cry_break_infinity = "Rompe El Infinito",
            ach_cry_cryptid_the_cryptid = "Criptida El Críptido",
            ach_cry_exodia = "Exodia",
            ach_cry_freak_house = "Freak House",
            ach_cry_googol_play_pass = "Pase De Googol Play",
            ach_cry_haxxor = "H4xx0r",
            ach_cry_home_realtor = "Corredor De Bienes Raíces",
            ach_cry_jokes_on_you = "La Broma Es Para Tí, Amigo!",
            ach_cry_niw_uoy = "!ETSANAG¡",
            ach_cry_now_the_fun_begins = "Ahora Se Pone Lo Bueno",
            ach_cry_patience_virtue = "La Paciencia Es Una Virtud",
            ach_cry_perfectly_balanced = "Perfectamente Balanceado",
            ach_cry_pull_request = "Pull Request",
            ach_cry_traffic_jam = "Atasco De Tráfico",
            ach_cry_ult_full_skip = "Ultimate Full Skip",
            ach_cry_used_crash = "Te Dijimos Que No Lo Hagas",
            ach_cry_what_have_you_done = "¡¿QUÉ ACABAS DE HACER?!",
        },
        achievement_descriptions = {
            ach_cry_ace_in_crash = 'check_for_unlock({type = "ace_in_crash"})',
            ach_cry_blurred_blurred_joker = "Consigue Comodín Borroso borroso",
            ach_cry_bullet_hell = "Consigue 15 comodines AP",
            ach_cry_break_infinity = "Puntúa 1.79e308 fichas en una sola mano",
            ach_cry_cryptid_the_cryptid = "Usa Críptido en Críptido",
            ach_cry_exodia = "Consigue 5 comodines exóticos",
            ach_cry_freak_house = "Juega un Full de color consistiendo de 6s y 9s de corazones mientras tienes a Nice",
            ach_cry_googol_play_pass = "Amaña una Carta de Googol Play",
            ach_cry_haxxor = "Usa un código de trampas",
            ach_cry_home_realtor = "Activa Casa Feliz antes de la apuesta 8 (sin BdE/Antimateria)",
            ach_cry_jokes_on_you = "Activa el efecto de La Broma en la apuesta 1 y gana la partida",
            ach_cry_niw_uoy = "Llega a la apuesta -8",
            ach_cry_now_the_fun_begins = "Consigue a Lienzo",
            ach_cry_patience_virtue = "Espera a Ciclo Lavanda por 2 minutos antes de jugar la primera mano y vence la ciega",
            ach_cry_perfectly_balanced = "Completa la Baraja Muy Justa en Ascendant Stake",
            ach_cry_pull_request = "Haz que ://COMMIT haga aparecer el mismo comodín que destruyó",
            ach_cry_traffic_jam = "Beat all Rush Hour challenges",
            ach_cry_ult_full_skip = "Gana en 1 ronda",
            ach_cry_used_crash = "Usa ://CHOQUE",
            ach_cry_what_have_you_done = "Delete or Sacrifice an Exotic Joker",
        },
        challenge_names = {
            c_cry_ballin = "Ballin'",
            c_cry_boss_rush = "Enter the Gungeon",
            c_cry_dagger_war = "Dagger War",
            c_cry_joker_poker = "Joker Poker",
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
            cry_set_features = "Características",
            cry_set_music = "Música",
            cry_set_enable_features = "Selecciona las características para activar (se aplica al reiniciar):",
            cry_feat_achievements = "Logros",
            ["cry_feat_antimatter deck"] = "Baraja de antimateria",
            cry_feat_blinds = "Ciegas",
            cry_feat_challenges = "Desafíos",
            ["cry_feat_code cards"] = "Cartas de código",
            ["cry_feat_misc. decks"] = "Barajas misceláneas",
            ["cry_feat_https module"] = "Módulo HTTPS",
            ["cry_feat_timer mechanics"] = "Mecánicas de temporizador",
            ["cry_feat_enhanced decks"] = "Barajas mejoradas",
            ["cry_feat_epic jokers"] = "Comodines épicos",
            ["cry_feat_exotic jokers"] = "Comodines exóticos",
            ["cry_feat_m jokers"] = "Comodines M",
            cry_feat_menu = "Menú principal personalizado",
            ["cry_feat_misc."] = "Misc.",
            ["cry_feat_misc. jokers"] = "Comodines misceláneos",
            cry_feat_planets = "Planetas",
            cry_feat_jokerdisplay = "JokerDisplay (no hace nada)",
            cry_feat_tags = "Etiquetas",
            cry_feat_sleeves = "Mangas",
            cry_feat_spectrals = "Espectrales",
            cry_feat_spooky = "Actualización espeluznante",
            ["cry_feat_more stakes"] = "Pozos",
            cry_feat_vouchers = "Vales",
            cry_mus_jimball = "Jimball (Funkytown por Lipps Inc. - Copyrighted)",
            cry_mus_code = "Cartas de código (://LETS_BREAK_THE_GAME por HexaCryonic)",
            cry_mus_exotic = "Comodines exóticos (Joker in Latin por AlexZGreat)",
            cry_mus_high_score = "Alto puntaje (Final Boss [For Your Computer] por AlexZGreat)",

            k_cry_program_pack = "Paquete de programa",
            k_cry_meme_pack = "Paquete meme",

            cry_critical_hit_ex = "¡Golpe crítico!",
            cry_critical_miss_ex = "Fallo crítico...",

            cry_potion1 = "-1 a todos los niveles de mano",
            cry_potion2 = "X1.15 tamaño de ciega",
            cry_potion3 = "-1 mano y descarte",

            cry_debuff_oldhouse = "Sin fulls",
            cry_debuff_oldarm = "Debes jugar 4 o menos cartas",
            cry_debuff_oldpillar = "Sin escaleras",
            cry_debuff_oldflint = "Sin colores",
            cry_debuff_oldmark = "Sin manos que contengan una Pareja",
            cry_debuff_obsidian_orb = "Aplica las habilidades de todos los jefes derrotados",

            k_code = "Código",
            k_unique = "Único",
            b_code_cards = "Cartas de código",
            b_unique_cards = "Cartas únicas",
            b_pull = "TIRAR",
            cry_hooked_ex = "Enganchada!",
            k_end_blind = "terminar_ciega",

            cry_code_rank = "INGRESAR CATEGORÍA",
            cry_code_enh = "INGRESAR MEJORA",
            cry_code_hand = "INGRESAR MANO DE PÓKER",
            cry_code_enter_card = "INGRESAR CARTA",
            cry_code_apply = "APLICAR",
            cry_code_apply_previous = "APLICAR ANTERIOR",
            cry_code_exploit = "EXPLOTAR",
            cry_code_exploit_previous = "EXPLOTAR ANTERIOR",
            cry_code_create = "CREAR",
            cry_code_create_previous = "CREAR ANTERIOR",
            cry_code_execute = "EJECUTAR",
            cry_code_cancel = "CANCELAR",

            b_flip = "VOLTEAR",
            b_merge = "COMBINAR",

            cry_hand_bulwark = "Baluarte",
            cry_hand_clusterfuck = "Lío de mierda",
            cry_hand_ultpair = "Pareja suprema",

            cry_again_q = "¿Otra vez?",
            cry_curse = "Maldición",
            cry_curse_ex = "¡Maldición!",
            cry_sobbing = "Ayúdame...",
            cry_gaming = "Gaming",
            cry_gaming_ex = "Gaming!",
            cry_sus_ex = "Impostor!",
            cry_jolly_ex = "Jolly Up!",
            cry_m_minus = "m",
            cry_m = "M",
            cry_m_ex = "M!",
            cry_minus_round = "-1 ronda",
            cry_plus_cryptid = "+1 críptido",
            cry_no_triggers = "Sin activaciones restantes!",
            cry_unredeemed = "Desredimido...",
            cry_active = "Activo",
            cry_inactive = "Inactivo",

            k_disable_music = "Desactivar música",

            k_cry_epic = "Épico",
            k_cry_exotic = "Exótico",
            k_cry_candy = "Dulce",
            k_cry_cursed = "Maldito",

            cry_notif_jimball_1 = "Jimball",
            cry_notif_jimball_2 = "Nota de copyright",
            cry_notif_jimball_d1 = "Jimball reproduce la canción \"Funkytown\",",
            cry_notif_jimball_d2 = "la cual tiene copyright y no puede ser",
            cry_notif_jimball_d3 = "usada por streams y videos.",
        },
        labels = {
            food_jokers = "Comodines de comida",
            banana = "Banana",
            code = "Código",
            unique = "Único",
            cry_rigged = "Amañada",
            cry_hooked = "Enganchada",
            cry_flickering = "Parpadeante",
            cry_possessed = "Poseída",

            cry_green_seal = "Sello verde",
            cry_azure_seal = "Sello azur",

            cry_astral = "Astral",
            cry_blur = "Borroso",
            cry_double_sided = "Doble cara",
            cry_glass = "Frágil",
            cry_glitched = "Errónea",
            cry_gold = "Dorada",
            cry_m = "Contenta",
            cry_mosaic = "Mosaico",
            cry_noisy = "Ruidosa",
            cry_oversat = "Sobresaturada",

            k_cry_epic = "Épico",
            k_cry_exotic = "Exótico",
            k_cry_candy = "Dulce",
            k_cry_cursed = "Maldito",
        },
        rnj_loc_txts = {
            stats = {
                plus_mult = { "{C:red}+#2#{} multi" },
                plus_chips = { "{C:blue}+#2#{} fichas" },
                x_mult = { "{X:red,C:white} X#2#{} multi" },
                x_chips = { "{X:blue,C:white} X#2#{} fichas" },
                h_size = { "{C:attention}+#2#{} tamaño de mano" },
                money = { "{C:money}+$#2#{} al pago" },
            },
            stats_inactive = {
                plus_mult = { "{C:inactive}(Actual: {C:red}+#1#{C:inactive} multi)" },
                plus_chips = { "{C:inactive}(Actual: {C:blue}+#1#{C:inactive} fichas)" },
                x_mult = { "{C:inactive}(Actual: {X:red,C:white} X#1# {C:inactive} multi)" },
                x_chips = { "{C:inactive}(Actual: {X:blue,C:white} X#1# {C:inactive} fichas)" },
                h_size = { "{C:inactive}(Actual: {C:attention}+#1#{C:inactive} tamaño de mano)" },
                money = { "{C:inactive}(Actual: {C:money}+$#1#{C:inactive})" },
            },
            actions = {
                make_joker = { "Crea {C:attention}#2# comodín(es{}" },
                make_tarot = { "Crea {C:attention}#2#{} carta(s) de {C:tarot}tarot{}" },
                make_planet = { "Crea {C:attention}#2#{} carta(s) de {C:planet}planeta{}" },
                make_spectral = { "Crea {C:attention}#2#{} carta(s) {C:spectral}espectrales{}" },
                add_dollars = { "Gana {C:money}$#2#{}" },
            },
            contexts = {
                open_booster = { "al abrir un {C:attention}Paquete potenciador{}" },
                buying_card = { "al comprar una carta" },
                selling_self = { "al vender esta carta" },
                selling_card = { "al vender una carta" },
                reroll_shop = { "al renovar" },
                ending_shop = { "al final de la {C:attention}tienda{}" },
                skip_blind = { "al saltar una {C:attention}ciega{}" },
                skipping_booster = { "al saltar un {C:attention}Paquete potenciador{}" },
                playing_card_added = { "al añadir una {C:attention}carta{} a tu baraja" },
                first_hand_drawn = { "al empezar la ronda" },
                setting_blind = { "al seleccionar una {C:attention}ciega{}" },
                remove_playing_cards = { "al destruir una carta" },
                using_consumeable = { "al usar un {C:attention}consumible{}" },
                debuffed_hand = { "si la {C:attention}mano{} no está permitida" },
                pre_discard = { "antes de descartar" },
                discard = { "por cada carta descartada" },
                end_of_round = { "al final de la {C:attention}ronda{}" },
                individual_play = { "por cada carta puntuada" },
                individual_hand_score = { "por cada carta en tu mano al puntuar" },
                individual_hand_end = { "por cada carta en tu mano al terminar la {C:attention}ronda{}" },
                repetition_play = { "Reactiva las cartas puntuadas" },
                repetition_hand = { "Reactiva las cartas en tu mano" },
                other_joker = { "por cada {C:attention}comodín{}" },
                before = { "antes de cada {C:attention}mano{}" },
                after = { "después de cada {C:attention}mano{}" },
                joker_main = {},
            },
            conds = {
                buy_common = { "si es un {C:attention}comodín{} {C:blue}común{}" },
                buy_uncommon = { "si es un {C:attention}comodín{} {C:green}inusual{}" },
                tarot = { "si la carta es una carta de {C:tarot}tarot{}" },
                planet = { "si la carta es una carta de {C:planet}planeta{}" },
                spectral = { "si la carta es una carta {C:spectral}espectral{}" },
                joker = { "si la carta es un {C:attention}comodín{}" },
                suit = { "si la carta es de {V:1}#3#{}" },
                rank = { "si la carta es un {C:attention}#3#{}" },
                face = { "si la carta es una carta de {C:attention}figura{}" },
                boss = { "si la {C:attention}ciega{} es una {C:attention}ciega jefe{}" },
                non_boss = { "si la {C:attention}ciega{} es una {C:attention}ciega no-jefe{}" },
                small = { "si la {C:attention}ciega{} es una {C:attention}ciega pequeña{}" },
                big = { "si la {C:attention}ciega{} es una {C:attention}ciega grande{}" },
                first = { "si es la {C:attention}primera mano{}" },
                last = { "si es la {C:attention}última mano{}" },
                common = { "si es un {C:attention}comodín{} {C:blue}común{}" },
                uncommon = { "si es un {C:attention}comodín{} {C:green}inusual{}" },
                rare = { "si es un {C:attention}comodín{} {C:red}raro{}" },
                poker_hand = { "si la mano es un(a) {C:attention}#3#{}" },
                or_more = { "si la mano contiene {C:attention}#3#{} o más cartas" },
                or_less = { "si la mano contiene {C:attention}#3#{} o menos cartas" },
                hands_left = { "si tienes #3# {C:blue}manos{} restantes al final de la ronda" },
                discards_left = { "si tienes #3# {C:red}descartes{} restantes al final de la ronda" },
                first_discard = { "si es el {C:attention}primer descarte{}" },
                last_discard = { "si es el {C:attention}último descarte{}" },
                odds = { "con {C:green}#4# {C:green}en {C:green}#3#{} probabilidades" },
            },
        },
        v_dictionary = {
            a_xchips = {"X#1# fichas"},
            a_powmult = {"^#1# multi"},
            a_powchips = {"^#1# fichas"},
            a_powmultchips = {"^#1# multi+fichas"},
            a_round = {"+#1# ronda"},
            a_candy = {"+#1# Candy"},
            a_xchips_minus = {"-X#1# fichas"},
            a_powmult_minus = {"-^#1# multi"},
            a_powchips_minus = {"-^#1# fichas"},
            a_powmultchips_minus = {"-^#1# multi+fichas"},
            a_round_minus = {"-#1# ronda"},

            a_tag = {"#1# etiqueta"},
            a_tags = {"#1# etiquetas"},

            cry_sticker_name = {"Pegatina #1#"},
            cry_sticker_desc = {
                "Usaste este comodín",
                "para ganaer en la dificultad #2##1#",
                "#2#Pozo#3#"
            },

            cry_art = {"Arte: #1#"},
            cry_code = {"Código: #1#"},
            cry_idea = {"Idea: #1#"}

        },
        v_text = {
            ch_c_cry_all_perishable = {"Todos los comodines son {C:eternal}Perecederos{}"},
            ch_c_cry_all_rental = {"Todos los comodines son {C:eternal}de Alquiler{}"},
            ch_c_cry_all_pinned = {"Todos los comodines son {C:eternal}Fijados{}"},
            ch_c_cry_all_banana = {"Todos los comodines son {C:eternal}Banana{}"},
            ch_c_all_rnj = {"Todos los comodines son {C:attention}RNJoker{}"},
            ch_c_cry_sticker_sheet_plus = {"Todos los objetos comprables tienen todas las pegatinas"},
            ch_c_cry_rush_hour = {"Todas las ciegas jefe son {C:attention}El reloj{} or {C:attention}Ciclo lavanda"},
            ch_c_cry_rush_hour_ii = {"Todas las ciegas son {C:attention}ciegas jefe{}"},
            ch_c_cry_rush_hour_iii = {"{C:attention}El reloj{} y {C:attention}Ciclo lavanda{} aumentan el {C:attention}doble{} de rápido"},
            ch_c_cry_no_tags = {"Saltar ciegas no está {C:attention}permitido{}"},
            ch_c_cry_no_vouchers = {"Los {C:attention}vales{} ya no aparecen en la tienda"},
            ch_c_cry_no_boosters = {"Los {C:attention}paquetes potenciadores{} ya no aparecen en la tienda"},
            ch_c_cry_no_rerolls = {"Las renovaciones no están {C:attention}permitidas{}"},
            ch_c_cry_no_consumables = {"Los {C:attention}consumibles{} ya no aparecen"}
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
