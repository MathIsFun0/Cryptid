--Work in progress!
--Completed: Cryptid.lua, lovely patches, Achievements-Enhanced.lua
return {
    descriptions = {
        Back = {
            b_cry_antimatter = {
                name = "反物质卡组",
                text = {
                    "应用{C:legendary,E:1}所有卡组的{}增益效果",
                },
            },
            b_cry_blank = {
                name = "空白卡组",
                text = {
                    "{C:inactive,E:1}无作用？{}",
                },
            },
            b_cry_CCD = {
                name = "CCD卡组",
                text = {
                    "每张卡也是一个{C:attention}随机{}消耗品",
                },
            },
            b_cry_conveyor = {
                name = "传送带卡组",
                text = {
                    "小丑牌{C:attention}不可{}移动",
                    "回合开始时，",
                    "{C:attention}复制{}最右边的小丑牌",
                    "并且{C:attention}销毁{}最左边的小丑牌",
                },
            },
            b_cry_critical = {
                name = "关键卡组",
                text = {
                    "每打出一手牌后，",
                    "{C:green}#1#/4{}几率获得{X:dark_edition,C:white}^2{}倍数",
                    "{C:green}#1#/8{}几率获得{X:dark_edition,C:white}^0.5{}倍数",
                },
            },
            b_cry_encoded = {
                name = "编码卡组",
                text = {
                    "以一张{C:cry_code,T:j_cry_CodeJoker}代码小丑{}和一张{C:cry_code,T:j_cry_copypaste}复制/粘贴{}开始",
                    "商店中只出现{C:cry_code}代码卡{}",
                },
            },
            b_cry_equilibrium = {
                name = "均衡卡组",
                text = {
                    "所有卡牌在",
                    "商店中出现的{C:attention}几率相同{}，",
                    "以{C:attention,T:v_overstock_plus}Overstock Plus{}开始游戏",
                },
            },
            b_cry_glowing = {
                name = "发光卡组",
                text = {
                    "在击败Boss盲注时，",
                    "所有小丑牌的数值乘以{X:dark_edition,C:white}X1.25{}",
                    "{X:cry_jolly,C:white,s:0.8} Jolly#1#Open#1#Winner#1#-#1#wawa#1#person", --peak loc_vars right here
                },
            },
            b_cry_infinite = {
                name = "无限卡组",
                text = {
                    "你可以选择{C:attention}任意数量的卡牌{}",
                    "{C:attention}+1{}手牌上限",
                },
            },
            b_cry_misprint = {
                name = "错版卡组",
                text = {
                    "卡牌价格手牌的数值",
                    "都是{C:attention}随机{}数值",
                },
            },
            b_cry_redeemed = {
                name = "赎回卡组",
                text = {
                    "购买{C:attention}代金券{}时，",
                    "获得其{C:attention}额外等级{}",
                },
            },
            b_cry_very_fair = {
                name = "非常公平的卡组",
                text = {
                    "每回合{C:blue}-2{}手牌，{C:red}-2{}弃牌",
                    "{C:attention}代金券{}不再出现在商店中",
                },
            },
            b_cry_wormhole = {
                name = "虫洞卡组",
                text = {
                    "以一张{C:cry_exotic}异域{C:attention}小丑牌{}开始",
                    "小丑牌都{C:attention}20X+{}",
                    "更可能是{C:dark_edition}负片{}",
                    "{C:attention}-2{}小丑牌槽",
                },
            },
        },
        Blind = {
            bl_cry_box = {
                name = "盒子",
                text = {
                    "所有普通小丑",
                    "都被削弱了",
                },
            },
            bl_cry_clock = {
                name = "时钟",
                text = {
                    "每经过3秒，盲注要求增加0.1倍",
                },
            },
            bl_cry_hammer = {
                name = "锤子",
                text = {
                    "所有奇数牌",
                    "都被削弱了",
                },
            },
            bl_cry_joke = {
                name = "玩笑",
                text = {
                    "如果得分超过要求的2倍，",
                    "将盲注设置为#1#倍",
                },
            },
            bl_cry_magic = {
                name = "魔术",
                text = {
                    "所有偶数牌",
                    "都被削弱了",
                },
            },
            bl_cry_lavender_loop = {
                name = "薰衣草回环",
                text = {
                    "每经过1.5秒，盲注要求增加1.25倍",
                },
            },
            bl_cry_obsidian_orb = {
                name = "黑曜石宝珠",
                text = {
                    "应用所有已击败的",
                    "Boss的能力",
                },
            },
            bl_cry_oldarm = {
                name = "怀旧手臂",
                text = {
                    "必须出4张或更少的牌",
                },
            },
            bl_cry_oldfish = {
                name = "怀旧鱼",
                text = {
                    "所有手牌开始时",
                    "都有1倍倍数",
                },
            },
            bl_cry_oldflint = {
                name = "怀旧燧石",
                text = {
                    "没有同花顺",
                },
            },
            bl_cry_oldhouse = {
                name = "怀旧房屋",
                text = {
                    "没有葫芦",
                },
            },
            bl_cry_oldmanacle = {
                name = "怀旧镣铐",
                text = {
                    "倍数除以弃牌数",
                },
            },
            bl_cry_oldmark = {
                name = "怀旧印记",
                text = {
                    "没有包含对子",
                    "的手牌",
                },
            },
            bl_cry_oldox = {
                name = "怀旧牛",
                text = {
                    "所有手牌开始时",
                    "都有0筹码",
                },
            },
            bl_cry_oldpillar = {
                name = "怀旧柱子",
                text = {
                    "没有顺子",
                },
            },
            bl_cry_oldserpent = {
                name = "怀旧蛇",
                text = {
                    "倍数除以所出牌的",
                    "扑克等级",
                },
            },
            bl_cry_pin = {
                name = "别针",
                text = {
                    "史诗及以上稀有度的",
                    "小丑被削弱",
                },
            },
            bl_cry_pinkbow = {
                name = "粉红蝴蝶结",
                text = {
                    "在出牌时随机化手牌中的牌的等级",
                },
            },
            bl_cry_sapphire_stamp = {
                name = "蓝宝石封蜡",
                text = {
                    "在得分前随机取消一张牌的得分",
                    "并选择一张额外的牌",
                },
            },
            bl_cry_shackle = {
                name = "镣铐",
                text = {
                    "所有负片小丑",
                    "都被削弱",
                },
            },
            bl_cry_striker = {
                name = "打击者",
                text = {
                    "所有稀有小丑",
                    "都被削弱",
                },
            },
            bl_cry_tax = {
                name = "税收",
                text = {
                    "每每次出牌的得分上限为",
                    "盲注要求的0.4倍",
                },
            },
            bl_cry_tornado = {
                name = "绿松石龙卷风",
                text = {
                    "#1#/#2#的概率",
                    "打出的牌不计分",
                },
            },
            bl_cry_trick = {
                name = "诡计",
                text = {
                    "每次出牌之后，翻转所有",
                    "手中的牌",
                },
            },
            bl_cry_vermillion_virus = {
                name = "朱红病毒",
                text = {
                    "每次出牌随机替换一个小丑",
                },
            },
            bl_cry_windmill = {
                name = "风车",
                text = {
                    "所有罕见小丑",
                    "都被削弱",
                },
            },
        },
        Code = {
            c_cry_class = {
                name = "://类别",
                text = {
                    "将 {C:cry_code}#1#{} 选中的牌",
                    "转换为 {C:cry_code}选择的{} 增强",
                },
            },
            c_cry_commit = {
                name = "://提交",
                text = {
                    "摧毁一张 {C:cry_code}选中的{} 小丑牌,",
                    "创建一张 {C:cry_code}新的相同 {C:cry_code}稀有度的{} 小丑牌",
                },
            },
            c_cry_crash = {
                name = "://崩溃",
                text = {
                    "{C:cry_code,E:1}别这么做。",
                },
            },
            c_cry_delete = {
                name = "://删除",
                text = {
                    "{C:cry_code}永久{} 移除一个",
                    "{C:cry_code}选中的{} 商店物品",
                    "{C:inactive,s:0.8}本次游戏中该物品不会再出现",
                },
            },
            c_cry_divide = {
                name = "://分割",
                text = {
                    "{C:cry_code}减半{} 当前商店中的",
                    "所有标价",
                },
            },
            c_cry_exploit = {
                name = "://利用",
                text = {
                    "{C:cry_code}下一{} 手牌",
                    "被计算为",
                    "{C:cry_code}选择的{} 扑克牌",
                    "{C:inactive,s:0.8}必须发现",
                    "{C:inactive,s:0.8}有效的隐藏手牌",
                },
            },
            c_cry_hook = {
                name = "HOOK://",
                text = {
                    "选择两张小丑牌",
                    "使它们 {C:cry_code}Hooked{}",
                },
            },
            c_cry_machinecode = {
                name = "://机器码",
                text = {
                    "",
                },
            },
            c_cry_malware = {
                name = "://恶意软件",
                text = {
                    "给所有牌增加 {C:dark_edition}故障{}",
                    "{C:cry_code}持有的{} 手牌",
                },
            },
            c_cry_merge = {
                name = "://合并",
                text = {
                    "将一个 {C:cry_code}消耗牌",
                    "与一个 {C:cry_code}扑克牌{} 合并",
                },
            },
            c_cry_multiply = {
                name = "://乘",
                text = {
                    " 选中的所有数值{C:cry_code}翻倍{}",
                    "直到 {C:cry_code}回合结束",
                },
            },
            c_cry_payload = {
                name = "://载荷",
                text = {
                    "下一个被击败的盲牌",
                    "给 {C:cry_code}X#1#{} 利息",
                },
            },
            c_cry_oboe = {
                name = "://偏差一",
                text = {
                    "下一包 {C:cry_code}增强包{} 有",
                    "{C:cry_code}#1#{} 张额外卡片和",
                    "{C:cry_code}#1#{} 次额外选择",
                    "{C:inactive}(当前为 {C:cry_code}+#2#{C:inactive})",
                },
            },
            c_cry_reboot = {
                name = "://重启",
                text = {
                    "补充 {C:blue}手牌{} 和 {C:red}弃牌{},",
                    "将 {C:cry_code}所有{} 牌返回牌堆",
                    "并抽取一张 {C:cry_code}新的{} 手牌",
                },
            },
            c_cry_revert = {
                name = "://还原",
                text = {
                    "将 {C:cry_code}游戏状态{} 设置为",
                    "{C:cry_code}这一轮的开始{}",
                },
            },
            c_cry_rework = {
                name = "://重制",
                text = {
                    "摧毁一张 {C:cry_code}选中的{} 小丑牌,",
                    "创建一张 {C:cry_code}重制标记{}，并",
                    "获得一个 {C:cry_code}升级的{} 版本",
                    "{C:inactive,s:0.8}通过集合中的顺序升级",
                },
            },
            c_cry_run = {
                name = "://运行",
                text = {
                    "在 {C:cry_code}盲注",
                    "期间拜访 {C:cry_code}商店",
                },
            },
            c_cry_seed = {
                name = "://种子",
                text = {
                    "选择一张小丑牌",
                    "或扑克牌",
                    "使它们成为 {C:cry_code}固定",
                },
            },
            c_cry_semicolon = {
                name = ";//",
                text = {
                    "结束当前非Boss {C:cry_code}盲注",
                    "{C:cry_code}没有{} 兑现",
                },
            },
            c_cry_spaghetti = {
                name = "://意大利面",
                text = {
                    "创建一个 {C:cry_code}故障的",
                    "食品小丑牌",
                },
            },
            c_cry_variable = {
                name = "://变量",
                text = {
                    "将 {C:cry_code}#1#{} 张选中的牌",
                    "转换为 {C:cry_code}选择的{} 等级",
                },
            },
        },
        Joker = {
            j_cry_altgoogol = {
                name = "怀旧谷歌扑克牌",
                text = {
                    "出售此卡以创建",
                    "{C:attention}2{} 张最左侧的 {C:attention}小丑{}",
                    "{C:inactive,s:0.8}不会复制怀旧谷歌扑克牌{}",
                },
            },
            j_cry_blender = {
                name = "搅拌机",
                text = {
                    "每当使用 {C:cry_code}代码{} 卡时",
                    "创建一个 {C:attention}随机{}",
                    "消耗品",
                    "{C:inactive}(必须有空间){}",
                },
            },
            j_cry_bonusjoker = {
                name = "奖励小丑",
                text = {
                    "{C:green}#1# 在 #2#{} 概率下，每张",
                    "出牌的 {C:attention}奖励{} 卡",
                    "增加 {C:attention}小丑{} 或 {C:attention}消耗品{} 插槽",
                    "{C:dark_edition}1{} 当得分时",
                    "{C:red}每回合有效两次",
                    "{C:inactive,s:0.8}(每个的机会相等){}",
                },
            },
            j_cry_boredom = {
                name = "无聊",
                text = {
                    "{C:green}#1# 在 #2#{} 概率下",
                    "{C:attention}重新触发{} 每个 {C:attention}小丑{}",
                    "或 {C:attention}出牌{}",
                    "{C:inactive,s:0.8}不影响其他无聊{}",
                },
            },
            j_cry_canvas = {
                name = "画布",
                text = {
                    "{C:attention}重新触发{} 所有 {C:attention}小丑{}",
                    "一次对于 {C:attention}每个{} 非 {C:blue}普通{C:attention} 小丑",
                    "在此小丑右侧",
                },
            },
            j_cry_caramel = {
                name = "焦糖",
                text = {
                    "每张出牌",
                    "{X:mult,C:white}X#1#{} 倍数得分",
                    "在接下来的 {C:attention}#2#{} 回合中",
                },
            },
            j_cry_circulus_pistoris = {
                name = "面粉圈",
                text = {
                    "{X:dark_edition,C:white}^#1#{} 筹码, {X:dark_edition,C:white}^#1#{} 倍数",
                    "如果 {C:attention}正好{} #2#",
                    "手牌剩余",
                },
            },
            j_cry_circus = {
                name = "马戏团",
                text = {
                    "{C:red}稀有{} 小丑每个提供 {X:mult,C:white} X#1# {} 倍数",
                    "{C:cry_epic}史诗{} 小丑每个提供 {X:mult,C:white} X#2# {} 倍数",
                    "{C:legendary}传奇{} 小丑每个提供 {X:mult,C:white} X#3# {} 倍数",
                    "{C:cry_exotic}异国{} 小丑每个提供 {X:mult,C:white} X#4# {} 倍数",
                },
            },
            j_cry_CodeJoker = {
                name = "代码小丑",
                text = {
                    "当 {C:attention}盲注{} 被选择时",
                    "创建一个 {C:dark_edition}负{}",
                    "{C:cry_code}代码卡{}",
                },
            },
            j_cry_copypaste = {
                name = "复制/粘贴",
                text = {
                    "当使用 {C:cry_code}代码{} 卡时",
                    "{C:green}#1# 在 #2#{} 概率下",
                    "在你的消耗品区添加一张复制品",
                    "{C:inactive}(必须有空间)",
                },
            },
            j_cry_crustulum = {
                name = "饼干",
                text = {
                    "此小丑每次 {C:attention}重掷{} 在商店中获得 {C:chips}+#2#{} 筹码",
                    "{C:green}所有重掷都是免费的{}",
                    "{C:inactive}(当前 {C:chips}+#1#{C:inactive} 筹码)",
                },
            },
            j_cry_curse = {
                name = "哭泣",
                text = {
                    "{C:edition,E:1}你不能{} {C:cry_ascendant,E:1}运行...{}",
                    "{C:edition,E:1}你不能{} {C:cry_ascendant,E:1}隐藏...{}",
                    "{C:dark_edition,E:1}你无法逃脱...{}",
                    "{C:inactive}(必须有空间){}",
                },
            },
            j_cry_cut = {
                name = "剪切",
                text = {
                    "这个小丑会销毁",
                    "一张随机的 {C:cry_code}Code{} 卡牌",
                    "并在 {C:attention}商店{} 结束时获得 {X:mult,C:white} X#1# {} 倍数",
                    "{C:inactive}(当前 {X:mult,C:white} X#2# {C:inactive} 倍数)",
                },
            },
            ["j_cry_Double Scale"] = {
                name = "双重刻度",
                text = {
                    "刻度 {C:attention}小丑{}",
                    "按 {C:attention}二次方{C:attention} 进行刻度",
                    "{C:inactive,s:0.8}(例如 +1, +3, +6, +10)",
                    "{C:inactive,s:0.8}(增加 +1, +2, +3)",
                },
            },
            j_cry_effarcire = {
                name = "Effarcire",
                text = {
                    "当选择 {C:attention}盲注{} 时，",
                    "将 {C:green}完整牌组{} 发到手中",
                    "{C:inactive,s:0.8}\"如果你不能接受我在 1x 时的样子，",
                    "{C:inactive,s:0.8}那你不配接受我在 2x 时的样子\"",
                },
            },
            j_cry_energia = {
                name = "能量",
                text = {
                    "当获得一个 {C:attention}标签{} 时，",
                    "创建 {C:attention}#1#{} 个副本",
                    "并 {C:attention}增加{} 副本数量",
                    "增加 {C:attention}#2#",
                },
            },
            j_cry_equilib = {
                name = "平衡之神",
                text = {
                    "小丑按 {C:attention}收藏{} 中的顺序出现",
                    "创建 {C:attention}#1#{} {C:dark_edition}负片{} 小丑",
                    "当手牌被打出时",
                    "{C:cry_exotic,s:0.8}异国 {C:inactive,s:0.8} 或更高级的小丑不能出现",
                    "{s:0.8}最后生成的小丑: {C:attention,s:0.8}#2#",
                },
            },
            j_cry_error = {
                name = "{C:red}错误{}{C:dark_edition}O{}{C:red}R{}",
                text = {
                    "",
                },
            },
            j_cry_exponentia = {
                name = "指数",
                text = {
                    "这个小丑获得 {X:dark_edition,C:white} ^#1# {} 倍数",
                    "当 {X:red,C:white} X倍数 {} 被触发时",
                    "{C:inactive}(当前 {X:dark_edition,C:white} ^#2# {C:inactive} 倍数)",
                },
            },
            j_cry_facile = {
                name = "简单",
                text = {
                    "{X:dark_edition,C:white}^#1#{} 倍数如果",
                    "{C:attention}#2#{} 或更少",
                    "卡牌被计分",
                },
            },
            j_cry_gemino = {
                name = "双子座",
                text = {
                    "{C:attention}双倍{} 所有值",
                    "最左边的 {C:attention}小丑",
                    "在回合结束时",
                },
            },
            j_cry_goldjoker = {
                name = "黄金小丑",
                text = {
                    "在回合结束时获得 {C:money}#1#%{} 的总资金",
                    "每张打出的 {C:attention}黄金{}",
                    "卡牌被计分时，支付增加 {C:money}#2#%",
                },
            },
            j_cry_googol_play = {
                name = "Googol Play Card",
                text = {
                    "{C:green}#1# 在 #2#{} 机会中",
                    "{X:red,C:white} X#3# {} 倍数",
                },
            },
            j_cry_iterum = {
                name = "Iterum",
                text = {
                    "重新触发所有打出的卡牌",
                    "{C:attention}#2#{} 次，",
                    "每张打出的卡牌在计分时给予",
                    "{X:mult,C:white} X#1# {} 倍数",
                },
            },
            j_cry_m = {
                name = "m",
                text = {
                    "这个小丑在 {X:mult,C:white} X#1# {} 倍时获得",
                    "当 {C:attention}Jolly Joker{} 被出售时",
                    "{C:inactive}(当前 {X:mult,C:white} X#2# {C:inactive} 倍)",
                },
            },
            j_cry_M = {
                name = "M",
                text = {
                    "创建一个 {C:dark_edition}负片{}",
                    "{C:attention}Jolly Joker{} 当",
                    "{C:attention}Blind{} 被选择时",
                },
            },
            j_cry_membershipcardtwo = {
                name = "旧会员卡", -- 可以考虑使用其他名称
                text = {
                    "{C:chips}每位会员获得+#1#{} 筹码",
                    "在 {C:attention}Cryptid Discord{}",
                    "{C:inactive}(当前 {C:chips}+#2#{C:inactive} 筹码)",
                    "{C:blue,s:0.7}https://discord.gg/eUf9Ur6RyB{}",
                },
            },
            j_cry_multjoker = {
                name = "多重小丑",
                text = {
                    "{C:green}每张 {C:attention}Mult{} 卡的 #1# 机会",
                    "创建一个 {C:spectral}Cryptid{} 卡当得分时",
                    "{C:inactive}(必须有空间)",
                },
            },
            j_cry_negative = {
                name = "负片小丑",
                text = {
                    "{C:dark_edition}+#1#{C:attention} 小丑{} 插槽",
                },
            },
            j_cry_number_blocks = {
                name = "数字块",
                text = {
                    "在回合结束时获得 {C:money}$#1#{}",
                    "每个 {C:attention}#3#{} 持有在手中增加 {C:money}$#2#{}",
                    "每回合排名变化",
                },
            },
            j_cry_oldcandy = {
                name = "怀旧糖果",
                text = {
                    "出售此卡以",
                    "永久获得",
                    "{C:attention}+#1#{} 手牌大小",
                },
            },
            j_cry_primus = {
                name = "Primus",
                text = {
                    "如果出牌中的所有卡都是",
                    "{C:attention}Aces{}, {C:attention}2s{}, {C:attention}3s{}, {C:attention}5s{}, 或 {C:attention}7s{}",
                    "这个小丑获得 {X:dark_edition,C:white} ^#1# {} 倍",
                    "{C:inactive}(当前 {X:dark_edition,C:white} ^#2# {C:inactive} 倍)",
                },
            },
            j_cry_python = {
                name = "Python",
                text = {
                    "当使用 {C:cry_code}Code{} 卡时",
                    "这个小丑获得 {X:mult,C:white} X#1# {} 倍",
                    "{C:inactive}(当前 {X:mult,C:white} X#2# {C:inactive} 倍)",
                },
            },
            j_cry_redeo = {
                name = "Redeo",
                text = {
                    "{C:attention}-#1#{} 底注当",
                    "{C:money}$#2#{} {C:inactive}($#3#){} 被花费",
                    "{s:0.8}需求每次增加",
                    "{C:attention,s:0.8}指数{s:0.8}增长",
                    "{C:money,s:0.8}下次增加: {s:1,c:money}$#4#",
                },
            },
            j_cry_Scalae = {
                name = "Scalae",
                text = {
                    "{C:attention}Jokers{} 的缩放",
                    "作为度数-{C:attention}#1#{} 多项式",
                    "每回合将度数提高 {C:attention}#2#{}",
                    "{C:inactive,s:0.8}({C:attention,s:0.8}Scalae{C:inactive,s:0.8} 排除)",
                },
            },
            j_cry_soccer = {
                name = "全员皆可", -- 将名称从拉丁语更改为更普通的名称
                text = {
                    "{C:attention}+#1#{} 小丑插槽",
                    "{C:attention}+#1#{} 补充包插槽",
                    "{C:attention}+#1#{} 手牌大小",
                    "{C:attention}+#1#{} 消耗品插槽",
                    "{C:attention}+#1#{} 商店中的卡牌",
                },
            },
            j_cry_speculo = {
                name = "幻像",
                text = {
                    "创建一个 {C:dark_edition}负片{} 复制品",
                    "的随机 {C:attention}小丑{}",
                    "在 {C:attention}商店{} 结束时",
                    "{C:inactive,s:0.8} 不会复制其他幻像{}",
                },
            },
            j_cry_stella_mortis = {
                name = "死亡之星",
                text = {
                    "这个小丑摧毁一个",
                    "随机 {C:planet}星球{} 卡牌",
                    "并在 {C:attention}商店{} 结束时获得 {X:dark_edition,C:white} ^#1# {} 倍数",
                    "{C:inactive}（当前 {X:dark_edition,C:white} ^#2# {C:inactive} 倍数）",
                },
            },
            j_cry_supercell = {
                name = "超级单元",
                text = {
                    "{C:chips}+#1#{} 芯片，{C:mult}+#1#{} 倍数，",
                    "{X:chips,C:white}X#2#{} 芯片，{X:mult,C:white}X#2#{} 倍数",
                    "在回合结束时获得 {C:money}$#3#{}",
                },
            },
            j_cry_sync_catalyst = {
                name = "同步催化剂",
                text = {
                    "平衡 {C:chips}芯片{} 和 {C:mult}倍数{}",
                    "{C:inactive,s:0.8} 嘿！我以前见过这个！",
                },
            },
            j_cry_tenebris = {
                name = "黑暗",
                text = {
                    "{C:dark_edition}+#1#{C:attention} 小丑{} 插槽",
                    "在回合结束时获得 {C:money}$#2#{}",
                },
            },
            j_cry_universum = {
                name = "宇宙",
                text = {
                    "{C:attention}牌型{} 获得",
                    "{X:red,C:white} X#1# {} 倍数 和 {X:blue,C:white} X#1# {} 芯片",
                    "当升级时",
                },
            },
            j_cry_verisimile = {
                name = "非真实",
                text = {
                    "当任何概率",
                    "成功触发时，",
                    "这个小丑获得 {X:red,C:white}X倍数{}",
                    "等于其列出的 {C:attention}几率",
                    "{C:inactive}（当前 {X:mult,C:white} X#1# {C:inactive} 倍数）",
                },
            },
            
        },
        Spectral = {
            c_cry_gateway = {
                name = "传送门",
                text = {
                    "创建一张随机的",
                    "{C:cry_exotic,E:1}异域{C:attention} 小丑{}",
                    "销毁所有其他小丑",
                },
            },
            c_cry_pointer = {
                name = "指针://",
                text = {
                    "创建一张",
                    "你选择的 {C:cry_code}卡片",
                    "{C:inactive,s:0.8}(异域小丑 #1# 排除)",
                },
            },
            c_cry_source = {
                name = "源",
                text = {
                    "向你手中的",
                    "{C:attention}#1#{} 选定卡片",
                    "添加一个 {C:cry_code}绿色封印{}",
                },
            },
        },
        Tag = {
            tag_cry_console = {
                name = "控制台标签",
                text = {
                    "赠送一个免费的",
                    "{C:cry_code}程序包",
                },
            },
            tag_cry_rework = {
                name = "重新工作标签",
                text = {
                    "商店有一个",
                    "{C:dark_edition}#1# {C:cry_code}#2#",
                },
            },
        },
        Tarot = {
            c_cry_automaton = {
                name = "自动机",
                text = {
                    "创建最多 {C:attention}#1#",
                    "张随机的 {C:cry_code}代码{} 卡",
                    "{C:inactive}(必须有足够的空间)",
                },
            },
        },
        Other = {
            banana = {
                name = "香蕉",
                text = {
                    "{C:green}每回合#1#/#2#{}机会被",
                    "销毁",
                },
            },
            cry_rigged = {
                name = "操控",
                text = {
                    "所有{C:cry_code}列出的{}概率",
                    "都是{C:cry_code}有保证的",
                },
            },
            cry_hooked = {
                name = "钩住",
                text = {
                    "当这个小丑被{C:cry_code}触发{}时，",
                    "触发{C:cry_code}#1#",
                },
            },
            food_jokers = {
                name = "食物小丑",
                text = {
                    "{s:0.8}Gros Michel，鸡蛋，冰淇淋，卡文迪许，",
                    "{s:0.8}乌龟豆，饮料可乐，爆米花，拉面，",
                    "{s:0.8}苏打水，泡菜，辣椒，焦糖，",
                    "{s:0.8}怀旧糖果，快餐M，",
                    "{s:0.8}切奶酪，咖啡馆美食，樱桃，",
                    "{s:0.8}全糖可乐，星果，火锅，",
                    "{s:0.8}幸运饼干，瑞士小丑，塔利亚费罗，",
                    "{s:0.8}皇家佳丽，优质葡萄酒，神秘苏打水，",
                    "{s:0.8}爆米花袋，火鸡晚餐，咖啡，",
                    "{s:0.8}蜡烛服务，燃烧的西瓜，",
                    "{s:0.8}燃烧的樱桃，软玉米饼，脆玉米饼，",
                    "{s:0.8}玉米片，幽灵可乐，汉堡，披萨",
                },
            },
            cry_https_disabled = {
                name = "M",
                text = {
                    "{C:attention,s:0.7}更新{s:0.7} 默认情况下被禁用 ({C:attention,s:0.7}HTTPS模块{s:0.7})",
                },
            },
            cry_eternal_booster = {
                name = "永恒",
                text = {
                    "包中的所有卡牌",
                    "都是{C:attention}永恒{}的",
                },
            },
            cry_perishable_booster = {
                name = "易腐",
                text = {
                    "包中的所有卡牌",
                    "都是{C:attention}易腐{}的",
                },
            },
            cry_rental_booster = {
                name = "租赁",
                text = {
                    "包中的所有卡牌",
                    "都是{C:attention}租赁{}的",
                },
            },
            cry_pinned_booster = {
                name = "固定",
                text = {
                    "包中的所有卡牌",
                    "都是{C:attention}固定{}的",
                },
            },
            cry_banana_booster = {
                name = "香蕉",
                text = {
                    "包中的所有卡牌",
                    "都是{C:attention}香蕉{}的",
                },
            },
            cry_eternal_voucher = {
                name = "永恒",
                text = {
                    "不能交易",
                },
            },
            cry_perishable_voucher = {
                name = "易腐卡",
                text = {
                    "回合后减弱",
                    "{C:attention}#1#{} 回合",
                    "{C:inactive}({C:attention}#2#{C:inactive} 剩余)",
                },
            },
            cry_rental_voucher = {
                name = "租赁卡",
                text = {
                    "回合结束时失去 {C:money}$#1#{}",
                },
            },
            cry_pinned_voucher = {
                name = "固定卡",
                text = {
                    "在商店中保留",
                    "直到被兑换",
                },
            },
            cry_banana_voucher = {
                name = "香蕉卡",
                text = {
                    "{C:green}#1# / #2#{} 概率下",
                    "每回合未被兑换",
                },
            },
            cry_perishable_consumeable = {
                name = "易腐品",
                text = {
                    "回合结束时减弱",
                },
            },
            cry_rental_consumeable = {
                name = "租赁品",
                text = {
                    "回合结束时和使用时失去 {C:money}$#1#{}",
                },
            },
            cry_pinned_consumeable = {
                name = "固定品",
                text = {
                    "不能使用其他",
                    "非-{C:attention}固定{} 消耗品",
                },
            },
            cry_banana_consumeable = {
                name = "香蕉品",
                text = {
                    "{C:green}#1# 在 #2#{} 概率下",
                    "使用时无效",
                },
            },
            p_cry_code_normal_1 = {
                name = "程序包",
                text = {
                    "选择 {C:attention}#1#{} 张最多",
                    "{C:attention}#2#{C:cry_code} 代码{} 卡片",
                },
            },
            p_cry_code_normal_2 = {
                name = "程序包",
                text = {
                    "选择 {C:attention}#1#{} 张最多",
                    "{C:attention}#2#{C:cry_code} 代码{} 卡片",
                },
            },
            p_cry_code_jumbo_1 = {
                name = "巨型程序包",
                text = {
                    "选择 {C:attention}#1#{} 张最多",
                    "{C:attention}#2#{C:cry_code} 代码{} 卡片",
                },
            },
            p_cry_code_mega_1 = {
                name = "超级程序包",
                text = {
                    "选择 {C:attention}#1#{} 张最多",
                    "{C:attention}#2#{C:cry_code} 代码{} 卡片",
                },
            },
            undiscovered_code = {
                name = "未发现",
                text = {
                    "在未设定的",
                    "游戏中购买或使用",
                    "此卡以了解其作用",
                }
            },
            cry_green_seal = {
                name = "绿色蜡封",
                text = {
                    "使用时创建一个 {C:cry_code}代码{} 卡片",
                    "当被打出且不计分时",
                    "{C:inactive}(必须有空间)",
                },
            },
        },
    },
    misc = {
        achievement_names = {
            ach_cry_ace_in_crash = "口袋ACE",
            ach_cry_blurred_blurred_joker = "法律盲点",
            ach_cry_bullet_hell = "子弹地狱",
            ach_cry_break_infinity = "突破无限",
            ach_cry_cryptid_the_cryptid = "Cryptid the Cryptid",
            ach_cry_exodia = "Exodia",
            ach_cry_freak_house = "怪物之家",
            ach_cry_googol_play_pass = "Googol Play Pass",
            ach_cry_haxxor = "黑客",
            ach_cry_home_realtor = "房产经纪人",
            ach_cry_jokes_on_you = "开玩笑的是你，朋友！",
            ach_cry_niw_uoy = "!赢",
            ach_cry_now_the_fun_begins = "乐趣开始了",
            ach_cry_patience_virtue = "耐心是美德",
            ach_cry_perfectly_balanced = "完美平衡",
            ach_cry_pull_request = "拉取请求",
            ach_cry_traffic_jam = "交通堵塞",
            ach_cry_ult_full_skip = "终极全跳过",
            ach_cry_used_crash = "我们告诉过你不要",
            ach_cry_what_have_you_done = "你到底做了什么？！",
        },
        
        achievement_descriptions = {
            ach_cry_ace_in_crash = 'check_for_unlock({type = "ace_in_crash"})',
            ach_cry_blurred_blurred_joker = "获得模糊的模糊小丑",
            ach_cry_bullet_hell = "拥有15个AP小丑",
            ach_cry_break_infinity = "在次出牌中获得1.79e308筹码",
            ach_cry_cryptid_the_cryptid = "在Cryptid上使用Cryptid",
            ach_cry_exodia = "拥有5个异域小丑",
            ach_cry_freak_house = "玩一个由6和9的红心组成的同花顺，同时拥有Nice",
            ach_cry_googol_play_pass = "伪造一个Googol Play卡",
            ach_cry_haxxor = "使用作弊代码",
            ach_cry_home_realtor = "在Ante 8之前激活Happy House（没有DoE/Antimatter）",
            ach_cry_jokes_on_you = "在Ante 1上触发The Joke的效果并赢得比赛",
            ach_cry_niw_uoy = "达到Ante -8",
            ach_cry_now_the_fun_begins = "获得画布",
            ach_cry_patience_virtue = "在玩第一手牌之前等待Lavender Loop 2分钟并击败盲注",
            ach_cry_perfectly_balanced = "在Ascendant Stake上击败Very Fair Deck",
            ach_cry_pull_request = "让://提交生成它摧毁的相同小丑",
            ach_cry_traffic_jam = "击败所有Rush Hour挑战",
            ach_cry_ult_full_skip = "在1回合内获胜",
            ach_cry_used_crash = "使用://崩溃",
            ach_cry_what_have_you_done = "删除或牺牲一个异域小丑",
        },
        challenge_names = {
            c_cry_ballin = "炫酷风采",
            c_cry_boss_rush = "进入地牢",
            c_cry_dagger_war = "匕首战争",
            c_cry_onlycard = "单卡挑战",
            c_cry_rng = "随机挑战",
            c_cry_rush_hour = "高峰时段 I",
            c_cry_rush_hour_ii = "高峰时段 II",
            c_cry_rush_hour_iii = "高峰时段 III",
            c_cry_sticker_sheet = "贴纸纸张",
            c_cry_sticker_sheet_plus = "贴纸纸张+",
        },        
        dictionary = {
            --Settings Menu
            cry_set_features = "功能",
            cry_set_music = "音乐",
            cry_set_enable_features = "选择要启用的功能（游戏重新启动后生效）：",
            cry_feat_achievements = "成就",
            ["cry_feat_antimatter deck"] = "反物质牌组",
            cry_feat_blinds = "盲注",
            cry_feat_challenges = "挑战",
            ["cry_feat_code cards"] = "代码卡",
            ["cry_feat_misc. decks"] = "杂项牌组",
            ["cry_feat_https module"] = "HTTPS 模块",
            ["cry_feat_timer mechanics"] = "计时器机制",
            ["cry_feat_enhanced decks"] = "增强牌组",
            ["cry_feat_epic jokers"] = "史诗小丑",
            ["cry_feat_exotic jokers"] = "异域小丑",
            ["cry_feat_m jokers"] = "M 小丑",
            ["cry_feat_misc."] = "杂项",
            ["cry_feat_misc. jokers"] = "杂项小丑",
            cry_feat_planets = "行星",
            cry_feat_sleeves = "卡套",
            cry_feat_spectrals = "幽灵",
            ["cry_feat_more stakes"] = "赌注",
            cry_feat_vouchers = "代金券",
            cry_mus_jimball = "吉姆球 (Funkytown by Lipps Inc. - 版权)",
            cry_mus_code = "代码卡 (://LETS_BREAK_THE_GAME by HexaCryonic)",
            cry_mus_exotic = "异域小丑 (拉丁小丑 by AlexZGreat)",
            cry_mus_high_score = "高分 (最终 Boss [For Your Computer] by AlexZGreat)",
        
            k_cry_program_pack = "程序包",
            k_cry_meme_pack = "梗包",
        
            cry_critical_hit_ex = "致命一击！",
            cry_critical_miss_ex = "致命失误！",
        
            cry_debuff_oldhouse = "没有满堂红",
            cry_debuff_oldarm = "必须打4张或更少的牌",
            cry_debuff_oldpillar = "没有顺子",
            cry_debuff_oldflint = "没有同花",
            cry_debuff_oldmark = "没有包含对子在内的牌型",
            cry_debuff_obsidian_orb = "应用所有已击败 Boss 的能力",
        
            k_code = "代码",
            b_code_cards = "代码卡",
            b_pull = "拉",
            k_hooked_ex = "钩住了！",
            k_end_blind = "结束盲注",
        
            cry_code_rank = "输入等级",
            cry_code_enh = "输入增强",
            cry_code_hand = "输入扑克手牌",
            cry_code_enter_card = "输入一张牌",
            cry_code_apply = "应用",
            cry_code_apply_previous = "应用之前的",
            cry_code_exploit = "利用",
            cry_code_exploit_previous = "利用之前的",
            cry_code_create = "创建",
            cry_code_create_previous = "创建之前的",
            cry_code_execute = "执行",
            cry_code_cancel = "取消",

            cry_curse_ex = "祸根!",
            cry_gaming_ex = "开赌!",
            cry_minus_round = "-1 回合",
            cry_plus_cryptid = "+1 Cryptid",
        },
        labels = {
            food_jokers = "食物小丑",
            banana = "香蕉",
            code = "代码",
            cry_rigged = "作弊",
            cry_hooked = "上钩",
            cry_green_seal = "绿色封蜡",
        },
        v_dictionary = {
            a_xchips = {"X#1# 洋芋片"},
        },
        v_text = {
            ch_c_cry_all_perishable = {"所有小丑都是 {C:eternal}易腐{}"},
            ch_c_cry_all_rental = {"所有小丑都是 {C:eternal}租赁{}"},
            ch_c_cry_all_pinned = {"所有小丑都是 {C:eternal}固定{}"},
            ch_c_cry_all_banana = {"所有小丑都是 {C:eternal}香蕉{}"},
            ch_c_all_rnj = {"所有小丑都是 {C:attention}RNJoker{}"},
            ch_c_cry_sticker_sheet_plus = {"所有可购买的物品都有所有贴纸"},
            ch_c_cry_rush_hour = {"所有 Boss 盲注都是 {C:attention}时钟{} 或 {C:attention}薰衣草循环"},
            ch_c_cry_rush_hour_ii = {"所有盲注都是 {C:attention}Boss 盲注{}"},
            ch_c_cry_rush_hour_iii = {"{C:attention}时钟{} 和 {C:attention}薰衣草循环{} 的规模是 {C:attention}两倍{} 快"},
            ch_c_cry_no_tags = {"跳过功能已 {C:attention}禁用{}"}
        },
        -- 感谢社区的许多成员为所有这些台词做出贡献！
        -- 有太多人需要致谢，所以请访问这里： https://discord.com/channels/1116389027176787968/1209506360987877408/1237971471146553406
        -- 和这里： https://discord.com/channels/1116389027176787968/1219749193204371456/1240468252325318667
        very_fair_quips = {
            { "L", "没有代金券", "给你" },
            { "傻瓜", "你以为我会", "给你代金券？" },
            { "不行！", "这里没有代金券！", "(崩溃版)" },
            { "技术问题", "想象一下能做到", "获得代金券的水平" },
            { "吉姆博", "管理层", "忘记补货了" },
            { "哎呀！", "没有代金券", "" },
            { "你小丑,", "你为什么在这儿", "看呢？哈哈" },
            { "代金券", "在", "另一个城堡" },
            { "$0", "空白代金券", "(明白了吗？)" },
            { "错误", "无法对 NIL 值进行算术运算", "(tier4vouchers.lua)" },
            { "100% OFF", "所有代金券", "(有人已经买了)" },
            { "稍后再试", "提示：你没有", "足够的钱" },
            { "啊？", '"代金券"?', "那甚至不是一个词..." },
            { '按住 "R"', "补货", "所有代金券" },
            { "你知道吗？", "按 ALT+F4", "会得到免费代金券！" },
            { "对不起，", "由于预算削减", "没有代金券" },
            { "拨打 1-600-JIMBO", "来评价你的", "代金券体验" },
            { "击败", "ANTE 39 BOSS 盲注", "以补货" },
            { "魔术", "我让这张代金券", "消失了" },
            { "为什么代金券像", "写字台一样？" },
            { "我们已经撤回了", "你的代金券，它们", "在其他运行中会更好用" },
            { "为什么叫代金券", "当多乘热", "在冷吃牌" },
            { "对不起", "代金券正在经历", "VOUCHIFIA ABORTUS" },
            { "不幸的是", "代金券重写更新", "已被取消" },
            { "击败", "BOSS 盲注", "以改变什么都不变" },
            { "鸟儿在歌唱", "花儿在绽放", "像你这样的孩子..." },
            { "我们很抱歉", "所有代金券都已被召回", "由于沙门氏菌暴露" },
            { "代金券未能到达", "由于商店布局超出", "200% 预算" },
            { "你喜欢", "买代金券，对吧", "你是代金券买家" },
            { "代金券", "!E", "代金券池" },
            { "没有", "代金券" },
            { "没有圣诞老人", "也没有代金券" },
            { "", "代金券't", "" },
            { "你", "刚刚输掉了", "游戏" },
            { "我可以给你", "一个漂亮的鸡蛋", "在这些困难时期？" },
            { "去摸草", "而不是使用", "这个牌组" },
            { "你现在可以", "玩蓝色牌组", "对吧" },
            { "免费异域牌", "快来拿，在它还没", "卖完之前（售罄）" },
            { "证明他们错了", "购买一个看不见的", "代金券，仅 $10" },
            { "", "没有代金券？", "" },
            { "看到这个广告了吗？", "如果你看到了，那就说明它有效", "你也可以拥有它" },
            { "你现在错过了", "至少 5 张代金券", "tonktonktonktonktonk" },
            { "10", "20 没有代金券 XD", "30 返回 10" },
            { "代金券", "是一项高级功能", "$199.99 JOLLARS 解锁" },
            { "真正的无代金券！?!?", "仅限 ASCENDANT STAKE", "非常公平的牌组" },
            { "享受你的", "代金券体验吗？给我们一个", "五星评价在 JESTELP 上" },
            { "免费代金券", "热代金券就在你附近", "使用这个技巧快速获得代金券" },
            { "介绍", "第一个 TIER 0 代金券！", "(即将来到 Cryptid 1.0)" },
            { "一张代金券！", "它只是想象中的", "我们以为你会想要它" },
            { "关闭广告拦截器", "没有广告，我们就不能", "向你出售代金券" },
            { "如果你有", "关于这个问题的", "请通过 NORESPONSE@JMAIL.COM 发送电子邮件给我们" },
            { "没有足够的钱", "来购买这张代金券", "所以我们为什么要把它放在这里？" },
            { "想要代金券吗？", "那就闭嘴", "你不能得到任何代金券 LOL" },
            { "^$%& 不", "代金券 ^%&% %&$^% 给你", "$%&%%$ %&$&*%$^" },
            { "一张代金券 (相信)", "|\\/|", "|/\\|" },
            {
                "... --- ...",
                ".--. .-.. .- -.-- . .-. -.. . -.-. --- -.. . -.. -- --- .-. ... .",
                "-.-. --- -.. . - --- ..-. .. -. -.. .- ...- --- ..- -.-. .... . .-.",
            },
            { "运行 > 新建", "盯着什么都不看", "一个小时或两个小时" },
            { "我们非常抱歉", "上一个人紧急购买了", "所有代金券" },
            { "购买没有", "代金券的感觉如何" },
            { "吉姆博掷出 NAT 1", "把所有代金券", "扔进了一个沟里" },
            { "尝试索引", "字段 '代金券'", "(一个 NIL 值)" },
            {
                "哦，你真的以为阅读所有这些行会让你的代金券回来？",
                "很抱歉告诉你，这副牌中没有你所寻求的代金券。",
                "这个异常长的文本是为了浪费你的时间和精力而设计的。",
            },
            { "访问", "https://youtu.be/p7YXXieghto", "获取免费代金券" },
        }
        
    }
}