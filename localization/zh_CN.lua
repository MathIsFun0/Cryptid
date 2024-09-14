return {
    descriptions = {
        ["Blind"] = {
            ["b_cry_oldarm"] = {
                ["name"] = "Nostalgic Arm",
                ["text"] = {
                    "出牌数必须少于等于四张牌"
                }
            },
            ["b_cry_oldmanacle"] = {
                ["name"] = "Nostalgic Manacle",
                ["text"] = {
                    "弃牌减少倍率"
                }
            },
            ["b_cry_hammer"] = {
                ["name"] = "The Hammer",
                ["text"] = {
                    "所有奇数牌都被削弱"
                }
            },
            ["b_cry_lavender_loop"] = {
                ["name"] = "Lavender Loop",
                ["text"] = {
                    "这回合每过1.5秒",
                    "所需要的分数X1.25"
                }
            },
            ["b_cry_vermillion_virus"] = {
                ["name"] = "Vermillion Virus",
                ["text"] = {
                    "每次出牌随机一张小丑被替换"
                }
            },
            ["b_cry_obsidian_orb"] = {
                ["name"] = "Obsidian Orb",
                ["text"] = {
                    "拥有所有被击败的BOOS的能力"
                }
            }
        },
        ["Consumable"] = {
            ["c_cry_nstar"] = {
                ["name"] = "Neutron Star",
                ["text"] = {
                    "升级一个随机的手牌类型",
                    "每使用一次此星球牌升1级",
                    "{C:inactive}(当前使用：{C:attention} #1#{C:inactive}){}"
                }
            },
            ["c_cry_gateway"] = {
                ["name"] = "Gateway",
                ["text"] = {
                    "摧毁其他所有小丑",
                    "生成一个{C:cry_exotic,E:1}Exotic{C:attention} 小丑{}"
                }
            }
        },
        ["Joker"] = {
            ["j_cry_CodeJoker"] = {
                ["name"] = "代码小丑",
                ["text"] = {
                    "当选择{C:attention}盲注{}时",
                    "创建一个{C:dark_edition}负片{}{C:cry_code}代码牌{}"
                }
            },
            ["j_cry_copypaste"] = {
                ["name"] = "复制/粘贴",
                ["text"] = {
                    "当 {C:cry_code}代码牌{} 被使用,",
                    "{C:green}#1# / #2#{}概率复制一张到你的消耗槽"
                }
            },
            ["j_cry_cut"] = {
                ["name"] = "剪切",
                ["text"] = {
                    "这张小丑摧毁一个随机的 {C:cry_code}代码牌{}",
                    "并且增加 {X:mult,C:white} X#1# {} 倍率在 {C:attention}商店购物{}之后",
                    "{C:inactive}(当前已提供{X:mult,C:white} X#2# {C:inactive} 倍率)"
                }
            },
            ["j_cry_blender"] = {
                ["name"] = "Blender",
                ["text"] = {
                    "每当一张{C:cry_code}代码牌{} 被使用",
                    "获得一张 {C:attention}随机{}消耗牌"
                }
            },
            ["j_cry_python"] = {
                ["name"] = "Python",
                ["text"] = {
                    "",
                    "每使用一张{C:cry_code}代码牌{}，这张牌增加{X:mult,C:white} X#1# {}倍率",
                    "{C:inactive}(当前已提供{X:mult,C:white} X#2# {C:inactive} 倍率)"
                }
            },
            ["j_cry_dropshot"] = {
                ["name"] = "Dropshot",
                ["text"] = {
                    "每次出牌增加 {X:mult,C:white} X#1# {} 倍率,",
                    " {C:attention}nonscoring{} {V:1}#2#{} 卡,花色每回合改变",
                    "{C:inactive}(Currently {X:mult,C:white} X#3# {C:inactive} Mult)"
                }
            },
            ["j_cry_happyhouse"] = {
                ["name"] = "Happy House",
                ["text"] = {
                    "{X:dark_edition,C:white}^#1#{} 倍率当",
                    " {C:attention}114{} 次出牌{}后",
                    "{C:inactive}(Currently #2#/114){}",
                    "{C:inactive,s:0.8}没有地方能比得上家!{}"
                }
            },
            ["j_cry_maximized"] = {
                ["name"] = "拉满！拉满！",
                ["text"] = {
                    "所有{C:attention}人头牌{}都当作是{C:attention}K{}，",
                    "所有{C:attention}数字牌{}都当作是{C:attention}10s{}，"
                }
            },
            ["j_cry_pot_of_jokes"] = {
                ["name"] = "小丑壶",
                ["text"] = {
                    "减少{C:attention}#1#{}手牌数,",
                    "每回合增加{C:blue}#2#{} "
                }
            },
            ["j_cry_lucky_joker"] = {
                ["name"] = "幸运小丑",
                ["text"] = {
                    "Earn {C:money}$#1#{} every time a",
                    "{C:attention}Lucky{} card {C:green}successfully{}",
                    "triggers"
                }
            },
            ["j_cry_cursor"] = {
                ["name"] = "光标",
                ["text"] = {
                    "This Joker gains {C:chips}+#2#{} Chips",
                    "for each card {C:attention}purchased{}",
                    "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)"
                }
            },
            ["j_cry_pickle"] = {
                ["name"] = "腌黄瓜",
                ["text"] = {
                    "当跳过 {C:attention}盲注{} 时，创建{C:attention}#1#{} 个标签",
                    "当选择 {C:attention}盲注{} 时，则减少{C:red}#2#{} "
                }
            },
            ["j_cry_cube"] = {
                ["name"] = "小方块",
                ["text"] = {
                    "{C:chips}+#1#{} 筹码"
                }
            },
            ["j_cry_big_cube"] = {
                ["name"] = "大方块",
                ["text"] = {
                    "{X:chips,C:white} X#1# {} Chips"
                }
            },
            ["j_cry_nice"] = {
                ["name"] = "歪嘴小丑",
                ["text"] = {
                    "如果出牌包含一个{C:attention}6{}和{C:attention}9{}",
                    "筹码{C:chips}+#1#{}",
                    "{C:inactive,s:0.8}Nice.{}",
                    ""
                }
            },
            ["j_cry_sus"] = {
                ["name"] = "生性多疑小丑",
                ["text"] = {
                    "At end of round, create",
                    "a {C:attention}copy{} of a random",
                    "card {C:attention}held in hand{},",
                    "destroy all others",
                    "{C:hearts,s:0.8}红桃K{s:0.8} 优先考虑"
                }
            },
            ["j_cry_fspinner"] = {
                ["name"] = "Fidget Spinner",
                ["text"] = {
                    "当打出的牌型不是最常用的牌型时",
                    "这张小丑牌增加 {C:chips}+#2#{} 筹码",
                    "{C:inactive}(当前{C:chips}+#1#{C:inactive} 筹码)"
                }
            },
            ["j_cry_luigi"] = {
                ["name"] = "Luigi",
                ["text"] = {
                    "所有小丑提供",
                    "{X:chips,C:white} X#1# {} 筹码"
                }
            },
            ["j_cry_waluigi"] = {
                ["name"] = "Waluigi",
                ["text"] = {
                    "所有小丑提供",
                    "{X:mult,C:white} X#1# {} 倍率"
                }
            },
            ["j_cry_mario"] = {
                ["name"] = "Mario",
                ["text"] = {
                    "额外触发所有小丑",
                    "{C:attention}#1#{} 次"
                }
            },
            ["j_cry_wario"] = {
                ["name"] = "Wario",
                ["text"] = {
                    "触发时所有小丑提供{C:money}$#1#{}"
                }
            },
            ["j_cry_krustytheclown"] = {
                ["name"] = "Krusty the Clown",
                ["text"] = {
                    "当出的每张牌都计分时",
                    "这张牌增加{X:mult,C:white} X#1# {}倍率",
                    "{C:inactive}(当前{X:mult,C:white} X#2# {C:inactive} 倍率)"
                }
            },
            ["j_cry_blurred"] = {
                ["name"] = "模糊小丑",
                ["text"] = {
                    "选择{C:attention}盲注{}时增加",
                    "{C:blue}+#1#{}次出牌"
                }
            },
            ["j_cry_gardenfork"] = {
                ["name"] = "《小径分岔的花园》",
                ["text"] = {
                    "每 {C:attention}出{} 一张{C:attention}Ace{}和{C:attention}7{}",
                    "赚 {C:money}$#1#{} "
                }
            },
            ["j_cry_lightupthenight"] = {
                ["name"] = "♬Light Up the Night♬",
                ["text"] = {
                    "出的每张 {C:attention}7{} 或 {C:attention}2{}在计分时",
                    "提供 {X:mult,C:white}X#1#{} 倍率"
                }
            },
            ["j_cry_nosound"] = {
                ["name"] = "无声残缺",
                ["text"] = {
                    "每张打出的 {C:attention}7{}触发{C:attention:}#1#{} 次"
                }
            },
            ["j_cry_antennastoheaven"] = {
                ["name"] = "...Like Antennas to Heaven",
                ["text"] = {
                    "每张被计入分数的 {C:attention}7{} 或 {C:attention}4{}",
                    "增加{X:chips,C:white} X#1# {} 筹码",
                    "{C:inactive}(当前已增加 {X:chips,C:white}X#2# {C:inactive} 筹码)"
                }
            },
            ["j_cry_hunger"] = {
                ["name"] = "Consume-able",
                ["text"] = {
                    "使用一张{C:attention}消耗牌{}",
                    "获得{C:money}$#1#{} "
                }
            },
            ["j_cry_weegaming"] = {
                ["name"] = "2D",
                ["text"] = {
                    "额外重新触发每张打过的牌{C:attention}2{}{C:attention:}#1#{} 次",
                    "{C:inactive,s:0.8}Wee Gaming?{}"
                }
            },
            ["j_cry_redbloon"] = {
                ["name"] = "Red Bloon",
                ["text"] = {
                    "{C:attention}#2#{} 回合#3#后{C:red,E:2}自毁{}并获得{C:money}$#1#{}"
                }
            },
            ["j_cry_apjoker"] = {
                ["name"] = "AP Joker",
                ["text"] = {
                    "{X:mult,C:white} X#1# {} Mult against {C:attention}Boss Blinds{}"
                }
            },
            ["j_cry_maze"] = {
                ["name"] = "Labyrinth",
                ["text"] = {
                    "所有出牌都看作是每回合{C:attention}第一次出牌{}",
                    "所有弃牌都看作是每回合{C:attention}第一次弃牌{}"
                }
            },
            ["j_cry_panopticon"] = {
                ["name"] = "Panopticon",
                ["text"] = {
                    "所有出牌都看作是每回合{C:attention}最后一次出牌{}"
                }
            },
            ["j_cry_magnet"] = {
                ["name"] = "Fridge Magnet",
                ["text"] = {
                    "最后一回合获得{C:money}$#1#{} ",
                    "如果有少于或等于{C:attention}#3#{} 张小丑牌，获得 {X:money,C:white} X#2# {}",
                    ""
                }
            },
            ["j_cry_unjust_dagger"] = {
                ["name"] = "Unjust Dagger",
                ["text"] = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the left",
                    "and gain {C:attention}one-fifth{} of",
                    "its sell value as {X:mult,C:white} XMult {}",
                    "{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)"
                }
            },
            ["j_cry_filler"] = {
                ["name"] = "The Filler",
                ["text"] = {
                    "",
                    "如果出的牌中包含{C:attention}#2# 提供{X:mult,C:white} X#1# {} 倍率"
                }
            },
            ["j_cry_coin"] = {
                ["name"] = "Crypto Coin",
                ["text"] = {
                    "每卖一个小丑获得{C:money}$#1#{}到 {C:money}$#2#{}"
                }
            },
            ["j_cry_wheelhope"] = {
                ["name"] = "Wheel of Hope",
                ["text"] = {
                    "当{C:attention}命运之轮{}效果失败",
                    "这张牌增加{X:mult,C:white} X#1# {} 倍率",
                    "{C:inactive}(当前{X:mult,C:white} X#2# {C:inactive} 倍率)"
                }
            },
            ["j_cry_oldblueprint"] = {
                ["name"] = "残缺蓝图",
                ["text"] = {
                    "复制右边小丑牌的能力",
                    "每回合后有{C:green}#1# / #2#{} 的几率自毁",
                    ""
                }
            },
            ["j_cry_night"] = {
                ["name"] = "夜晚",
                ["text"] = {
                    "",
                    "最后一次出牌提供{X:dark_edition,C:white}^#1#{} 倍率，但自毁"
                }
            },
            ["j_cry_busdriver"] = {
                ["name"] = "Bus Driver",
                ["text"] = {
                    "{C:green}#1# / #3#{} 概率 {C:mult}+#2#{} Mult",
                    "或{C:green}1 /4{} 概率 {C:mult}-#2#{} Mult"
                }
            },
            ["j_cry_translucent"] = {
                ["name"] = "Translucent Joker",
                ["text"] = {
                    "卖掉这张卡从现有的小丑中随机复制一张 ",
                    "带有{C:attention}易腐{}和{C:attention}香蕉{}{C:attention}小丑{}",
                    "{s:0.8,C:inactive}(不会复制易腐)"
                }
            },
            ["j_cry_morse"] = {
                ["name"] = "Morse Code",
                ["text"] = {
                    "在回合结尾获得 {C:money}$#2#{}",
                    "每卖掉一张 {C:attention}增强卡牌{}增加 {C:money}$#1#{}",
                    "{C:red}每回合生效一次{}",
                    "{C:inactive}#3#{}"
                }
            },
            ["j_cry_membershipcard"] = {
                ["name"] = "Membership Card",
                ["text"] = {
                    "Cryptid Discord{}中的每个成员提供这张牌{X:mult,C:white}X#1#{}  {C:attention}倍率",
                    "{C:inactive}(当前{X:mult,C:white}X#2#{C:inactive} 倍率)",
                    "{C:blue,s:0.7}https://discord.gg/eUf9Ur6RyB{}"
                }
            },
            ["j_cry_kscope"] = {
                ["name"] = "Kaleidoscope",
                ["text"] = {
                    "当击败{C:attention}Boss 盲注{}时",
                    "增加一张随机的{C:dark_edition}Polychrome{}  {C:attention}小丑{}"
                }
            },
            ["j_cry_cryptidmoment"] = {
                ["name"] = "M Chain",
                ["text"] = {
                    "",
                    "卖掉这张卡每张{C:attention}小丑牌{}的售价增加 {C:money}$#1#{}"
                }
            },
            ["j_cry_iterum"] = {
                ["name"] = "Iterum",
                ["text"] = {
                    "已经出过的牌重新触发{C:attention}#2#{}次",
                    "并且每张牌提供{X:mult,C:white} X#1# {} 倍率"
                }
            },
            ["j_cry_jollysus"] = {
                ["name"] = "开心小丑。。吗？",
                ["text"] = {
                    "当一个小丑被 {C:attention}出售{}时",
                    "创建一个 {C:dark_edition}开心{} 小丑",
                    "{C:red}每回合只生效一次{}",
                    "{C:inactive}#1#{}"
                }
            },
            ["j_cry_notebook"] = {
                ["name"] = "记事本",
                ["text"] = {
                    "每次 {C:attention}重掷{}商店有{C:green} #1# in #2#{} 几率增加{C:dark_edition}+1{}个小丑牌槽位",
                    "如果有{C:attention}#5#{} 或以上 {C:attention}开心小丑{}{C:green}百分百触发{}",
                    "{C:red}每回合只触发一次{}",
                    "{C:inactive}(当前{C:dark_edition}+#3#{}{C:inactive} 并且#4#){}"
                }
            },
            ["j_cry_macabre"] = {
                ["name"] = "骇人小丑",
                ["text"] = {
                    "当选择{C:attention}盲注{}时，除了{C:attention}开心小丑{}和{C:legendary}M系小丑{}",
                    "其余小丑全部摧毁，与此同时每摧毁一张就获得一张{C:attention}开心小丑{}"
                }
            }
        }
    }
}
