--I couldn't get Meme Packs to work without crashing
--yes somehow that was harder than RNJoker
return {
    descriptions = {
        Back = {
            b_cry_antimatter = {
                name = "Bộ bài Phản vật chất",
                text = {
                    "Sở hữu {C:legendary,E:1}ưu điểm{}",
                    "của {C:attention}mọi{} bộ bài",
                },
            },
	    b_cry_beige = {
                name = "Bộ bài màu Be",
                text = {
                    "Các Joker {C:attention}Thường{} có",
                    "giá trị {C:attention}tăng gấp bốn lần{}",
                },
            },
            b_cry_beta = {
                name = "Bộ bài Cổ đại",
                text = {
                    "Các ô chứa của",
                    "Lá {C:attention}Joker{} và {C:attention}Vật phẩm{} được {C:attention}Gộp lại",
                    "Những khoản tiền cược mang hiệu ứng {C:attention}cổ đại{} sẽ thay đổi",
                    "những khoản tiền cược đã được cập nhật trước đó"
                },
            },
            b_cry_blank = {
                name = "Bộ bài Trắng",
                text = {
                    "{C:inactive,E:1}Làm cái vẹo gì nhỉ?",
                },
            },
			b_cry_bountiful = {
				name = "Bộ bài Phong phú",
				text = {
                    "Sau khi {C:blue}Chơi{} hoặc {C:red}Bỏ{},",
                    "luôn rút {C:attention}5{} lá bài"
				},
			},
            b_cry_CCD = {
                name = "Bộ bài CCD",
                text = {
                    "Mỗi lá bài đều là",
                    "một vật phẩm tiêu thụ {C:attention}ngẫu nhiên{}",
                },
            },
            b_cry_conveyor = {
                name = "Bộ bài Băng chuyền",
                text = {
                    "Các lá Joker {C:attention}không thể{} di chuyển",
                    "Tại đầu mỗi vòng đấu,",
                    "{C:attention}nhân đôi{} lá Joker phía bên phải xa nhất",
                    "và {C:attention}phá hủy{} Lá Joker phía bên trái xa nhất",
                },
            },
            b_cry_critical = {
                name = "Bộ bài Chí mạng",
                text = {
                    "Sau mọi tay bài đã chơi,",
                    "{C:green}#1# trên 4{} khả năng cho {X:dark_edition,C:white} ^2 {} Điểm nhân",
                    "{C:green}#1# trên 8{} khả năng cho {X:dark_edition,C:white} ^0.5 {} điểm nhân",
                },
            },
            b_cry_encoded = {
                name = "Bộ bài Mã hóa",
                text = {
                    "Bắt đầu với một lá {C:cry_code,T:j_cry_CodeJoker}Code Joker{}",
                    "và một {C:cry_code,T:j_cry_copypaste}Copy/Paste{}",
                    "Chỉ có các {C:cry_code}bài Code{} xuất hiện trong shop",
                },
            },
            b_cry_equilibrium = {
                name = "Bộ bài Bình đẳng",
                text = {
                    "Mọi lá bài đều có",
                    "{C:attention}cùng tỉ lệ{}",
                    "xuất hiện trong shop,",
                    "bắt đầu với",
                    "{C:attention,T:v_overstock_plus}Hàng tồn kho bổ sung <Overstock Plus>",
                },
            },
            b_cry_glowing = {
                name = "Bộ bài Dạ quang",
                text = {
                    "Nhân các giá trị của",
                    "mọi lá Joker lên {X:dark_edition,C:white} X1.25 {}",
                    "khi)Trùm cược tiền tiền cược bị đánh bại",
                    "{X:cry_jolly,C:white,s:0.8} Jolly#1#Open#1#Winner#1#-#1#wawa#1#person", --peak loc_vars right here
                },
            },
            b_cry_infinite = {
                name = "Bộ bài Vô cực",
                text = {
                    "Bạn có thể chọn {C:attention}bất kỳ",
                    "số lượng bài có trên tay",
                    "{C:attention}+1{} kích thước tay bài",
                },
            },
            b_cry_misprint = {
                name = "Bộ bài Lỗi in ấn",
                text = {
                    "Tất cả giá trị lá bài",
                    "đồng thời cả các lá Joker",
                    "đều {C:attention}ngẫu nhiên",
                },
            },
            b_cry_redeemed = {
                name = "Bộ bài thưởng",
                text = {
                    "Khi một {C:attention}Voucher{} được mua,",
                    "sẽ nhận được {C:attention}các cấp độ bổ sung{} của nó",
                },
            },
            b_cry_spooky = {
                name = "Bộ bài Ma quái",
                text = {
                    "Bắt đầu với một {C:attention,T:j_cry_chocolate_dice}Xúc sắc socola {C:eternal}Vĩnh cửu",
                    "Sau mỗi {C:attention}Ante{}, tạo một",
                    "{C:cry_candy}Kẹo{} hoặc Joker {X:cry_cursed,C:white}Nguyền rủa",
                }
            },
            b_cry_very_fair = {
                name = "Bộ bài rất công tâm",
                text = {
                    "{C:blue}-2{} tay bài, {C:red}-2{} bỏ bài",
                    "mỗi vòng",
                    "Các {C:attention}Voucher{} không còn",
                    "xuất hiện trong shop",
                },
            },
            b_cry_wormhole = {
                name = "Bộ bài Lỗ giun",
                text = {
                    "Bắt đầu với một Joker {C:cry_exotic}Kì lạ{C:attention}",
                    "Các lá Joker sẽ thêm {C:attention}20X",
                    "khả năng trở thành {C:dark_edition}Âm bản",
                    "{C:attention}-2{} ô Joker",
                },
            },
            b_cry_legendary = {
                name = "Bộ bài Huyền thoại",
                text = {
                    "Bắt đầu với lá bài Joker {C:legendary}Huyền thoại{C:legendary}",
                    "{C:green}1 trên 5{} khả năng tạo một lá khác",
					"khi)Trùm cược tiền cược bị hạ gục {C:inactive}(phải có chỗ trống){}",
                },
            },
        },
        Blind = {
            bl_cry_box = {
                name = "Hình Hộp",
                text = {
                    "Mọi lá Joker thường",
                    "đều bị debuff",
                },
            },
            bl_cry_clock = {
                name = "Đồng hồ",
                text = {
                    "+0.1X tiền tiền cược yêu cầu mỗi",
                    "3 giây trong ante này",
                },
            },
            bl_cry_hammer = {
                name = "Cái búa",
                text = {
                    "Mọi lá bài hạng kì quặc",
                    "đều sẽ bị debuff",
                },
            },
            bl_cry_joke = {
                name = "Trò đùa",
                text = {
                    "Nếu điểm >2X yêu cầu,",
                    "thiết lập ante về #2#",
                },
            },
            bl_cry_magic = {
                name = "Phép thuật",
                text = {
                    "Mọi lá bài các hạng",
                    "đều bị debuff",
                },
            },
            bl_cry_lavender_loop = {
                name = "Vòng oải hương",
                text = {
                    "1.25X tiền tiền cược yêu cầu mỗi",
                    "1.5 giây trôi qua trong vòng này",
                },
            },
            bl_cry_obsidian_orb = {
                name = "Hòn hắc ám",
                text = {
                    "Áp dụng mọi cơ chế",
                    "của mọi con trùm bị đánh bại",
                },
            },
            bl_cry_oldarm = {
                name = "Tay cổ đại",
                text = {
                    "Phải chơi 4",
                    "hoặc ít hơn lá bài",
                },
            },
            bl_cry_oldfish = {
                name = "Cá cổ đại",
                text = {
                    "Tất cả tay bài bắt đầu",
                    "với một điểm nhân",
                },
            },
            bl_cry_oldflint = {
                name = "Đá lửa cổ đại",
                text = {
                    "Không dùng Thùng",
                },
            },
            bl_cry_oldhouse = {
                name = "Nhà cổ đại",
                text = {
                    "Không dùng Cù lũ",
                },
            },
            bl_cry_oldmanacle = {
                name = "Còng tay cổ đại",
                text = {
                    "Điểm nhân sẽ bị chia bởi số lần bỏ bài",
                },
            },
            bl_cry_oldmark = {
                name = "Dấu cổ đại",
                text = {
                    "Không tay bài nào được",
                    "chứa một cặp",
                },
            },
            bl_cry_oldox = {
                name = "Trâu cổ đại",
                text = {
                    "Mọi tay bài bắt đầu",
                    "với 0 chip",
                },
            },
            bl_cry_oldpillar = {
                name = "Trụ cột cổ đại",
                text = {
                    "Không chứa sảnh",
                },
            },
            bl_cry_oldserpent = {
                name = "Rắn cổ đại",
                text = {
                    "Chia điểm nhân cho mỗi",
                    "tay Poker đã chơi",
                },
            },
            bl_cry_pin = {
                name = "Cái Ghim",
                text = {
                    "Các lá Joker có độ hiếm từ Epic trở lên",
                    "đều sẽ bị debuff",
                },
            },
            bl_cry_pinkbow = {
                name = "Cung Hồng",
                text = {
                    "Làm ngẫu nhiên các hạng trong các lá bài",
                    "đang cầm khi chơi",
                },
            },
            bl_cry_sapphire_stamp = {
                name = "Ấn Ngọc bích",
                text = {
                    "Chọn thêm một lá bài, bỏ chọn",
                    "lá bài ngẫu nhiên trước khi tính điểm",
                },
            },
            bl_cry_shackle = {
                name = "Xích tay",
                text = {
                    "Mọi lá bài Joker âm bản",
                    "đều bị debuff",
                },
            },
            bl_cry_striker = {
                name = "Tướng Quân",
                text = {
                    "Mọi lá Joker Quý",
                    "đều bị debuff",
                },
            },
            bl_cry_tax = {
                name = "Đánh Thuế",
                text = {
                    "Điểm số mỗi tay bài",
                    "bị giới hạn ở mức #1#",
                },
            },
            bl_cry_tornado = {
                name = "Lốc Ngọc lam",
                text = {
                    "#1# trên #2# khả năng cho",
                    "các tay bài đã chơi sẽ không tính điểm",
                },
            },
            bl_cry_trick = {
                name = "Mẹo vặt",
                text = {
                    "Mọi lá đều lật xuống",
                    "Chỉ lật lên khi cầm trên tay",
                },
            },
            bl_cry_vermillion_virus = {
                name = "Vi rút Châu sa",
                text = {
                    "Một lá Joker ngẫu nhiên",
                    "bị thay thế sau mỗi tay bài",
                },
            },
            bl_cry_windmill = {
                name = "Cối xoay gió",
                text = {
                    "Mọi lá joker hiếm",
                    "sẽ bị debuff",
                },
            },
        },
        Code = {
            c_cry_alttab = {
                name = "://ALTTAB",
                text = {
                    "Tạo một thẻ bỏ qua",
                    "cho tiền cược {C:cry_code}hiện tại",
                    "{C:inactive}(Hiện tại: {C:cry_code}#1#{C:inactive})",
                },
            },
            c_cry_class = {
                name = "://CLASS",
                text = {
                    "Chuyển đổi {C:cry_code}#1#{} lá bài được chọn",
                    "một {C:cry_code}lựa chọn{} cường hóa",
                },
            },
            c_cry_commit = {
                name = "://COMMIT",
                text = {
                    "Phá hủy một lá Joker {C:cry_code}được chọn{},",
                    "để tạo thành một lá Joker {C:cry_code}mới{}",
                    "với {C:cry_code}độ hiếm như nhau",
                },
            },
            c_cry_crash = {
                name = "://CRASH",
                text = {
                    "{C:cry_code,E:1}Đừng có đú.",
                },
            },
            c_cry_ctrl_v = {
                name = "://CTRL+V",
                text = {
                    "Tạo một {C:cry_code}bản sao{} cho lá bài được chọn",
                    "tay bài chơi hoặc vật phẩm"
                },
            },
            c_cry_delete = {
                name = "://DELETE",
                text = {
                    "{C:cry_code}Vĩnh viễn{} loại bỏ một",
                    "vật phẩm trong shop {C:cry_code}được lựa chọn",
                    "{C:inactive,s:0.8}Các con hàng sẽ không còn xuất hiện trong trận này",
                },
            },
            c_cry_divide = {
                name = "://DIVIDE",
                text = {
                    "{C:cry_code}Chia nửa{} mọi giá trị",
                    "trong cửa hàng hiện tại",
                },
            },
            c_cry_exploit = {
                name = "://EXPLOIT",
                text = {
                    "Mọi tay bài đã chơi đều được coi là",
                    "{C:cry_code}chứa{} một tay bài {C:cry_code}được chọn{},",
                    "sẽ đặt lại sau khi hết một hàng",
                    "{C:inactive,s:0.8}Các tay bài bí mật cần phải",
                    "{C:inactive,s:0.8}khám phá để trở nên có giá trị",
                },
            },
            c_cry_hook = {
                name = "HOOK://",
                text = {
                    "Chọn hai lá Joker để {C:cry_code}Kết nối",
                    "{C:inactive,s:0.8}Chỉ hoạt động khi các lá bài kết nối giống nhau về bối cảnh,",
                    "{C:inactive,s:0.8}ví như là Joker và The Duo <bộ đôi> (cả hai sau khi ghi bàn)",
                },
            },
            c_cry_inst = {
                name = "://INSTANTIATE",
                text = {
                    "Đánh một lá bài với {C:cry_code}hạng{} lá bài được chọn",
                    "và một lá bài với {C:cry_code}chất{} lá bài được chọn",
                    "{C:inactive}(nếu có thể){}",
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
                text = { "Thêm gây {C:dark_edition}Nhiễu loạn{} cho tất cả", "các lá bài {C:cry_code}cầm trên tay" },
            },
            c_cry_merge = {
                name = "://MERGE",
                text = {
                    "Hợp nhất {C:cry_code}vật phẩm{} đã chọn",
                    "với một {C:cry_code}lá bài chơi{} đã chọn",
                },
            },
            c_cry_multiply = {
                name = "://MULTIPLY",
                text = {
                    "{C:cry_code}Nhân đôi{} mọi giá trị của",
                    "một lá {C:cry_code}Joker{} đã chọn cho tới khi",
                    "hết một vòng đấu",
                },
            },
	    c_cry_patch = {
		name = "://PATCH",
		text = {
			"Loại bỏ mọi debuff và sticker",
			"cho mọi lá bài đã được nhìn thấy",
	    	},
	    },
            c_cry_payload = {
                name = "://PAYLOAD",
                text = {
                    "Cho tới tiền cược kế tiếp",
                    "Mang lại {C:cry_code}X#1#{} lợi tức",
                },
            },
            c_cry_oboe = {
                name = "://OFFBYONE",
                text = {
                    "{C:cry_code}Gói tăng cường{} kế nghiệm có",
                    "{C:cry_code}#1#{} thêm lá bài và",
                    "{C:cry_code}#1#{} lựa chọn",
                    "{C:inactive}(Hiện tại {C:cry_code}+#2#{C:inactive})",
                },
            },
            c_cry_reboot = {
                name = "://REBOOT",
                text = {
                    "Bổ sung {C:blue}Tay bài{} và {C:red}Lượt bỏ{},",
                    "{C:cry_code}mọi{} lá bài được quay lại bộ bài",
                    "và đánh một tay bài {C:cry_code}mới{}",
                },
            },
            c_cry_revert = {
                name = "://REVERT",
                text = {
                    "Thiết lập {C:cry_code}trạng thái game{} thành",
                    "bắt đầu từ {C:cry_code}Ante này{}",
                },
            },
            c_cry_rework = {
                name = "://REWORK",
                text = {
                    "Phá hủy một lá Joker {C:cry_code}được chọn,",
                    "tạo ra một {C:cry_code}Nhãn tái làm việc{} với",
                    "một phiên bản đã được {C:cry_code}nâng cấp{}",
                    "{C:inactive,s:0.8}Nâng cấp bằng cách sử dụng thứ tự trong bộ sưu tập.",
                },
            },
            c_cry_run = {
                name = "://RUN",
                text = {
                    "Ghé thăm một {C:cry_code}cửa hàng",
                    "xuyên suốt {C:cry_code}tiền cược",
                },
            },
            c_cry_seed = {
                name = "://SEED",
                text = {
                    "Chọn một lá Joker",
                    "hoặc một lá đang chơi",
                    "để trở thành {C:cry_code}Gian lận",
                },
            },
            c_cry_semicolon = {
                name = ";//",
                text = { "Kết thúc lượt {C:cry_code}tiền cược{} no)Trùm cược hiện tại", "{C:cry_code}không cần{} tốn phí qua" },
            },
            c_cry_spaghetti = {
                name = "://SPAGHETTI",
                text = {
                    "Tạo một lá Joker đồ ăn",
                    "{C:cry_code}Nhiễu loạn",
                },
            },
            c_cry_variable = {
                name = "://VARIABLE",
                text = {
                    "Chuyển đổi {C:cry_code}#1#{} lá bài được chọn",
                    "thành một hạng {C:cry_code}mong muốn",
                },
            },
        },
        Edition = {
            e_cry_astral = {
                name = "tinh tú",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Điểm nhân",
                },
            },
            e_cry_blur = {
                name = "Mờ ảo",
                text = {
                    "{C:attention}Tái kích hoạt",
                    "lá bài này thêm {C:attention}1{} lần",
                    "{C:green}#1# trên #2#{} khả năng",
                    "tái kích hoạt tiếp tới lần",
                    "thứ {C:attention}#3#{}",
                },
            },
            e_cry_double_sided = {
                name = "Hai mặt",
                text = {
                    "Lá bài này có thể",
                    "{C:attention}lật ngược{} để trở thành",
                    "một lá bài khác",
                    "{C:inactive}(Bên trống có thể kết hợp",
					"{C:inactive}với lá bài khác)",
                },
            },
            e_cry_glass = {
                name = "Dễ vỡ",
                label = "Dễ vỡ",
                text = {
                    "{C:white,X:mult} X#3# {} Điểm nhân",
                    "{C:green}#1# trên #2#{} thay đổi nó",
                    "lá bài không thể bị {C:red}phá hủy",
                    "khi tái kích hoạt",
                },
            },
            e_cry_glitched = {
                name = "Nhiễu loạn",
                text = {
                    "Mọi giá trị của lá bài này",
                    "đều {C:dark_edition}ngẫu nhiên{}",
                    "trong khoảng {C:attention}X0.1{} và {C:attention}X10{}",
                    "{C:inactive}(Nếu có thể){}",
                },
            },
            e_cry_gold = {
                name = "Mạ vàng",
                label = "Mạ vàng",
                text = {
                    "Nhận {C:money}$#1#{} khi sử dụng",
                    "hoặc được kích hoạt",
                },
            },
            e_cry_m = {
                name = "Vui vẻ",
                text = {
                    "{C:mult}+#1#{} Điểm nhân",
                    "Lá bài này trông có vẻ",
                    "khá là {C:attention}Vui vẻ{}",
                },
            },
            e_cry_mosaic = {
                name = "Khảm mảnh",
                text = {
                    "{X:chips,C:white} X#1# {} Chip",
                },
            },
            e_cry_noisy = {
                name = "Ồn ào",
                text = {
                    "???",
                },
            },
            e_cry_oversat = {
                name = "Quá bão hòa",
                text = {
                    "Mọi giá trị",
                    "của lá bài này",
                    "đều được {C:attention}nhân đôi{}",
                    "{C:inactive}(Nếu có thể)",
                },
            },
        },
        Enhanced = {
            m_cry_echo = {
                name = "Vang vọng",
                text = {
                    "{C:green}#2# trên #3#{} khả năng để",
                    "{C:attention}tái kích hoạt{} #1# lần nữa",
                    "khi tính điểm",
                },
            },
	        m_cry_light = {
                name = "Dạ quang",
                text = {
                    "Khi chơi với {C:attention}#4#{} {C:inactive}(#3#){}",
                    "lá bài khác được tính điểm, nhận {X:mult,C:white}X#1#{} Điểm nhân và",
                    "tăng cường yêu cầu lên {C:attention}5{}",
                    "{C:inactive}(Hiện tại {X:mult,C:white}X#2#{C:inactive} Điểm nhân)"
                },
            },
        },
        Joker = {
            j_cry_adroit = {
                name = "Joker khéo léo",
                text = {
                    "{C:chips}+#1#{} Chip nếu được chơi",
                    "khi tay chứa",
                    "{C:attention}#2# lá bài"
                }
            },
            j_cry_altgoogol = {
                name = "Thẻ bài Googol Play cổ đại",
                text = {
                    "Bán lá bài này đi để tạo",
                    "{C:attention}#1#{} bản sao cho lá {C:attention}Joker{} trái xa nhất",
                    "{C:inactive,s:0.8}Không thể tạo bản sao cho Thẻ bài Googol Play cổ đại{}",
                },
            },
            j_cry_antennastoheaven = {
                name = "...Like Antennas to Heaven",
                text = {
                    "Lá Joker này sẽ tạo",
                    "{X:chips,C:white} X#1# {} Chip cho mỗi",
                    "lần {C:attention}7{} hoặc {C:attention}4{} được chơi và ghi điểm",
                    "{C:inactive}(Hiện tại {X:chips,C:white}X#2# {C:inactive}Chip)",
                },
            },
            j_cry_apjoker = {
                name = "AP Joker",
                text = { "{X:mult,C:white} X#1# {} Điểm nhân khi đối mặt {C:attention)Trùm cược{}" },
            },
	    j_cry_arsonist = {
                name = "Kẻ đốt phá",
                text = {
                    "Nếu chơi bài mà",
                    "có {C:attention}Cù lũ{},",
                    "{C:red}phá hủy{} toàn bộ các lá bài",
                    "sau khi tính điểm",
                }
            },
            j_cry_astral_bottle = {
                name = "tinh tú đóng chai",
                text = {
                    "Khi bán, nhận {C:dark_edition}tinh tú{}",
                    "và {C:attention}Dễ hỏng{} cho",
                    "một lá {C:attention}Joker{} bất kì",
                }
            },
            j_cry_big_cube = {
                name = "Khối vuông lớn",
                text = {
                    "{X:chips,C:white} X#1# {} Chip",
                },
            },
            j_cry_biggestm = {
                name = "Khổng lồ",
                text = {
                    "{X:mult,C:white} X#1# {} Điểm nhân cho tới khi kết thúc",
                    "vòng đấu nếu như {C:attention}tay bài Poker{}",
                    "là {C:attention}#2#{}",
                    "{C:inactive}(Hiện tại {C:attention}#3#{}{C:inactive}){}",
                    "{C:inactive,s:0.8}không hề béo, chỉ là xương to thôi",
                },
            },
            j_cry_blacklist = {
                name = "Sổ đen",
                text = {
                    "Nếu một {C:attention}#1#{} được giữ trong tay hoặc chơi,",
                    "thiết lập số {C:chips}Chip{} và {C:mult}Điểm nhân{} về 0",
                    "{C:red,E:2}Tự hủy{} nếu không có {C:attention}#1#{} trong bộ bài",
                    "{C:inactive,s:0.8}Hạng bậc không thay đổi"
                }
            },
            j_cry_blender = {
                name = "Sinh tố",
                text = {
                    "Tạo một vật phẩm {C:attention}ngẫu nhiên{}",
                    "khi mà một lá bài",
                    "{C:cry_code}Code{} được sử dụng",
                    "{C:inactive}(Phải có ô trống){}",
                },
            },
            j_cry_blurred = {
                name = "Joker mờ ảo",
                text = {
                    "Thêm {C:blue}+#1#{} tay bài khi",
                    "{C:attention}tiền cược{} được lựa chọn",
                },
            },
            j_cry_bonk = {
                name = "Bonk",
                text = {
                    "Mỗi lá {C:attention}Joker{} cho {C:chips}+#1#{} Chip",
                    "Tăng số lượng chip lên {C:chips}+#2#{} nếu",
                    "{C:attention} tay bài Poker{} là {C:attention}#3#{}",
                    "{C:inactive,s:0.8}Các Joker Vui vẻ{} {C:chips,s:0.8}+#4#{} {C:inactive,s:0.8}Chip{}",
                },
            },
            j_cry_bonkers = {
                name = "Bonkers Joker",
                text = {
                    "{C:red}+#1#{} Điểm nhân nếu như",
                    "tay bài đã chơi có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_bonusjoker = {
                name = "Bonus Joker",
                text = {
                    "{C:green}#1# trên #2#{} khả năng cho mỗi ",
                    "Lá bài{C:attention}Bonus{} được chơi để cải thiện",
                    "ô chứa lá {C:attention}Joker{} hoặc {C:attention}vật phẩm",
                    "lên {C:dark_edition}#3#{} khi tính điểm",
                    "{C:red}Dùng được hai lần cho mỗi vòng chơi",
                    "{C:inactive,s:0.8}(Cơ hội bình đẳng cho mỗi lượt){}",
                },
            },
            j_cry_booster = {
                name = "Joker Tăng cường",
                text = {
                    "{C:attention}+#1#{} thêm một gói tăng cường",
                    "có trong shop",
                },
            },
            j_cry_boredom = {
                name = "Buồn bực",
                text = {
                    "{C:green}#1# trong #2#{} khả năng để",
                    "{C:attention}tái kích hoạt{} cho mỗi lá {C:attention}Joker{}",
                    "hoặc {C:attention}lá bài đã chơi{}",
                    "{C:inactive,s:0.8}Không có hiệu quả với các lá bài Buồn bực khác{}",
                },
		unlock = {
                    "AFK ở đầu menu",
                    'khoảng',
                    '{C:attention}10 phút'
                },
            },
            j_cry_brittle = {
                name = "Kẹo giòn",
                text = {
                    "Cho tới {C:attention}#1#{} tay bài tiếp theo,",
                    "thêm {C:attention}Đá{}, {C:attention}Vàng{}, hoặc {C:attention}Thép{} cho",
                    "thẻ bài có ghi điểm bên phải xa nhất"
                }
            },
            j_cry_bubblem = {
                name = "Bong bóng M",
                text = {
                    "Tạo một {C:attention}Joker Vui vẻ {C:dark_edition}Tráng bạc{}",
                    "Nếu tay bài đã chơi chứa",
                    "một {C:attention}#1#{}",
                    "sẽ {C:red,E:2}tự hủy{}",
                },
            },
            j_cry_busdriver = {
                name = "Tài xế xe bus",
                text = {
                    "{C:green}#1# trên #3#{} khả năng",
                    "cho {C:mult}+#2#{} Điểm nhân",
                    "{C:green}#4# trên #3#{} Khả năng",
                    "cho {C:mult}-#2#{} Điểm nhân",
                },
            },
            j_cry_candy_basket = {
                name = "Giỏ kẹo",
                text = {
                    "Bán lá bài này để được nhận {C:attention}#1#{} {C:cry_candy}Kẹo",
                    "{C:attention}+#2#{} {C:cry_candy}Kẹo{} mỗi {C:attention}2{} tiền cược được đánh bại",
                    "{C:attention}+#3#{} {C:cry_candy}Kẹo{} khi {C:attention)Trùm cược{} được đánh bại"
                }
            },
            j_cry_candy_buttons = {
                name = "Kẹo nút",
                text = {
                    "{C:attention}#1#{} tiếp theo được reroll",
                    "tốn {C:money}$1{}",
                }
            },
            j_cry_candy_cane = {
                name = "Kẹo ngô",
                text = {
                    "Cho tới vòng {C:attention}#1#{} tiếp theo,",
                    "các lá bài chơi sẽ cho {C:money}$#2#",
                    "khi được {C:attention}tái kích hoạt"
                }
            },
            j_cry_candy_dagger = {
                name = "Kẹo dao găm",
                text = {
                    "Khi {C:attention}tiền cược{} được lựa chọn,",
                    "Tiêu diệt Joker bên phải",
                    "để tạo một {C:cry_candy}Kẹo{}",
                }
            },
	    j_cry_candy_sticks = {
		name = "Kẹo que",
		text = {
			"Trùm cược kế tiếp sẽ không áp dụng hiệu ứng bất lợi",
			"cho đến khi bạn đánh {C:attention}#1#{} tay bài",
	   	}
	    },
            j_cry_canvas = {
                name = "Vải thuồng",
                text = {
                    "{C:attention}Tái kích hoạt{} mọi lá {C:attention}Joker{} về bên trái",
                    "một lần cho {C:attention}tất cả{} các lá {C:attention}Joker{} khác độ hiếm {C:blue}Thường{}",
                    "cho tới lá Joker phía bên phải",
                },
		unlock = {
                    "Tải kích hoạt một lá {C:attention}Joker",
                    '{C:attention}114{} lần',
                    'trong một tay bài'
                },
            },
            j_cry_caramel = {
                name = "Caramel",
                text = {
                    "Mọi lá bài đã chơi cho",
                    "{X:mult,C:white}X#1#{} Điểm nhân khi tính",
                    "cho vòng {C:attention}#2#{} kế nghiệm",
                },
            },
            j_cry_chad = {
                name = "Chad",
                text = {
                    "Tái kích hoạt lá Joker {C:attention}trái ngoài cùng{}",
                    "thêm {C:attention}#1#{} lần",
                },
            },
            j_cry_chili_pepper = {
                name = "Ớt cay",
                text = {
                    "Lá Joker này cho {X:mult,C:white} X#2# {} Điểm nhân",
                    "vào kết thúc vòng đấu,",
                    "{C:red,E:2}tự hủy{} sau {C:attention}#3#{} vòng đấu",
                    "{C:inactive}(Hiện tại{} {X:mult,C:white} X#1# {} {C:inactive}Điểm nhân){}",
                },
            },
            j_cry_chocolate_dice = {
                name = "Xúc sắc sô cô la",
                text = {
                    "Reo một {C:green}d10{} khi",
                    "{C:attention)Trùm cược{} bị đánh bại",
                    "để bắt đầu {C:cry_ascendant,E:1}event",
                    "{C:inactive}(Hiện tại: #1#)"
                },
            },
            j_cry_circulus_pistoris = {
                name = "Vòng tròn của thợ làm bánh",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Chip và {X:dark_edition,C:white}^#1#{} Điểm nhân",
                    "nếu {C:attention}chỉ có{} #2#",
                    "tay bài còn lại",
                },
            },
            j_cry_circus = {
                name = "Rạp xiếc",
                text = {
                    "Các lá Joker {C:red}Quý{} sẽ cho {X:mult,C:white} X#1# {} Điểm nhân",
                    "Các lá Joker {C:cry_epic}Sử thi{} sẽ cho {X:mult,C:white} X#2# {} Điểm nhân",
                    "Các lá Joker {C:legendary}Huyền thoại{} sẽ cho {X:mult,C:white} X#3# {} Điểm nhân",
                    "Các lá Joker {C:cry_exotic}Kì lạ{} sẽ cho {X:mult,C:white} X#4# {} Điểm nhân",
                },
		unlock = {
                    'Có được một Joker {C:red}Quý{},',
                    '{C:cry_epic}Sử thi{} và {C:legendary}Huyền thoại{}',
                    'trước khi đến {C:attention}Ante 9'
                }
            },
            j_cry_clash = {
                name = "Cuộc xung đột",
                text = {
                    "{X:mult,C:white} X#1# {} Điểm nhân nếu chơi",
                    "một tay bài có chứa",
                    "một {C:attention}#2#",
                },
		unlock = {
                    "Chiến thắng một trận với",
                    "tay bài cuối cùng trong tay có",
                    "một {E:1,C:attention}Đôi tối thượng"
                },
            },
	    j_cry_clicked_cookie = {
                name = "Bánh quy nhấp chuột",
                text = {
                    "{C:chips}+#1#{} Chip",
                    "{C:chips}-#2#{} Chip nếu như",
                    "bạn {C:attention}nhấp chuột vào",
                },
            },
            j_cry_CodeJoker = {
                name = "Code Joker",
                text = {
                    "Tạo một lá bài {C:cry_code}Lá bài Code{}",
                    "{C:dark_edition}Âm bản{} khi",
                    "{C:attention}tiền cược{} được chọn",
                },
		unlock = {
                    "Khám phá {C:attention}mọi",
                    '{C:cry_code}lá bài code'
                },
            },
            j_cry_coin = {
                name = "Đồng Crypto",
                text = {
                    "Nhận đâu đó khoảng từ",
                    "{C:money}$#1#{} và {C:money}$#2#{} cho",
                    "mỗi lá Joker {C:attention}đã bán{}",
                },
            },
            j_cry_compound_interest = {
                name = "Lãi Kép",
                text = {
                    "Thu về {C:money}#1#%{} tổng só tiền",
                    "ở cuối mỗi vòng đấu,",
                    "tăng lên {C:money}#2#%{} mỗi",
                    "thanh toán kế tiếp",
                },
            },
            j_cry_copypaste = {
                name = "Copy/Paste",
                text = {
                    "Khi một lá bài {C:cry_code}Code{} được sử dụng,",
                    "{C:green}#1# trên #2#{} khả năng sẽ tạo ra một bản sao",
                    "vào hàng vật phẩm",
                    "{C:inactive}(Phải có ô trống)",
                },
            },
            j_cry_cotton_candy = {
                name = "Kẹo bông gòn",
                text = {
                    "Khi bán,",
                    "lá {C:attention}Jokers{} liền kề trở thành {C:dark_edition}Âm bản{}"
                },
            },
            j_cry_crustulum = {
                name = "Vỏ bọc",
                text = {
                    "Lá Joker này sẽ tạo {C:chips}+#2#{} Chip",
                    "mỗi lần {C:attention}reroll{} trong cửa hàng",
                    "{C:green}Mọi Reroll đều miễn phí{}",
                    "{C:inactive}(Hiện tại {C:chips}+#1#{C:inactive} chip)",
                },
            },
            j_cry_cryptidmoment = {
                name = "Chuỗi M",
                text = {
                    "Bán lá bài này để",
                    "nhận thêm {C:money}$#1# {C:attention}giá trị bán ra{}",
                    "cho mọi lá {C:attention}Joker{}",
                },
            },
            j_cry_cube = {
                name = "Hình khối",
                text = {
                    "{C:chips}+#1#{} Chip",
                },
            },
            j_cry_curse_sob = {
                name = "Khóc",
                text = {
                    "{C:edition,E:1}mày không thể{} {C:cry_ascendant,E:1}chạy...{}",
                    "{C:edition,E:1}mày không thể{} {C:cry_ascendant,E:1}chốn...{}",
                    "{C:dark_edition,E:1}mày không thể thoát...{}",
                    "{C:inactive}(Phải có ô trống){}",
                },
		unlock = {
                    "Có được một {C:attention}Đài tưởng niệm", 
                    "{C:purple}Vĩnh Cửu"
                },
            },
            j_cry_cursor = {
                name = "Con trỏ",
                text = {
                    "Lá Joker này sẽ {C:chips}+#2#{} Chip",
                    "cho mỗi lá được {C:attention}bán{}",
                    "{C:inactive}(Hiện tại {C:chips}+#1#{C:inactive} Chip)",
                },
            },
            j_cry_cut = {
                name = "Cắt",
                text = {
                    "Lá Joker này phá hủy",
                    "một lá bài {C:cry_code}Code{} ngẫu nhiên",
                    "và nhận lại {X:mult,C:white} X#1# {} Điểm nhân",
                    "vào cuối {C:attention}cửa hàng{}",
                    "{C:inactive}(Hiện tại {X:mult,C:white} X#2# {C:inactive} Điểm nhân)",
                },
            },
            j_cry_delirious = {
                name = "Joker mê sảng",
                text = {
                    "{C:red}+#1#{} Điểm nhân khi đã chơi",
                    "tay bày có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_digitalhallucinations = {
                name = "Ảo giác kỹ thuật số",
                text = {
                    "Khi một {C:attention}Gói tăng cường{} được mở,",
                    "{C:green}#1# trên #2#{} khả năng sẽ tạo ra",
                    "ngẫu nhiên một lá bài {C:dark_edition}Âm Bản{}",
                    "tương ứng với {C:attention}loại{} của nó",
                },
            },
            j_cry_discreet = {
                name = "Joker khép kín",
                text = {
                    "{C:chips}+#1#{} Chip khi chơi",
                    "lá bài có chuắ",
                    "một {C:attention}#2#"
                }
            },
            j_cry_doodlem = {
                name = "M nguệch ngoạc",
                text = {
                    "Tạo ra #2# lá bài {C:attention}Vật phẩm tiêu thụ{} dạng {C:dark_edition}Âm bản{}",
                    "Khi mà {C:attention}tiền cược{} được chọn",
                    "Tạo ra #1# lá {C:attention}tiêu thụ{} nữa",
                    "cho mỗi lá {C:attention}Joker Vui vẻ{}",
                },
            },
            ["j_cry_Double Scale"] = {	-- ?????????????
                name = "Tăng trưởng gấp đôi",
                text = {
                    "Các lá bài {C:attention}Joker{}",
                    "có sự tăng trưởng theo cấp số cộng {C:attention}bậc hai",
                    "{C:inactive,s:0.8}(ví dụ. +1, +3, +6, +10)",
                    "{C:inactive,s:0.8}(phát triển bởi. +1, +2, +3)",
                },
            },
            j_cry_dropshot = {
                name = "Cú bỏ nhỏ",
                text = {
                    "Lá bài Joker này sẽ tạo {X:mult,C:white} X#1# {} Điểm nhân cho",
                    "mỗi lá bài được đánh,lá bài {V:1}#2#{} sẽ {C:attention}không tính điểm{},",
                    "chất sẽ thay đổi theo mỗi màn chơi",
                    "{C:inactive}(Hiện tại {X:mult,C:white} X#3# {C:inactive} Điểm nhân)",
                },
		unlock = {
                    "Chơi một {C:attention}Mẫu thầu{}",
                    'với {C:attention}4{} lá bài',
                    '{C:attention}cùng chất'
                },
            },
            j_cry_dubious = {
                name = "Joker đáng nghi",
                text = {
                    "{C:chips}+#1#{} Chip khi chơi",
                    "tay bài có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_duos = {
                name = "Các Bộ đôi",
                text = {
                    "{X:mult,C:white} X#1# {} Điểm nhân khi chơi",
                    "tay bài có chứa",
                    "một {C:attention}#2#",
                },
		unlock = {
                    "Thắng một trận đấu",
                    "mà không phải chơi",
                    "{E:1,C:attention}Hai đôi"
                },
            },
            j_cry_duplicare = {
                name = 'Nhân bản',
                text = {
                    "Lá Joker này sẽ {X:mult,C:white} X#2# {} Điểm nhân",
                    "Khi một lá {C:attention}Joker{} hoặc",
                    "chơi các lá bài có tính điểm",
                    "{C:inactive}(Hiện tại {X:mult,C:white} X#1# {C:inactive} Điểm nhân)",
                }
            },
            j_cry_effarcire = {
                name = "Lấp đầy",
                text = {
                    "Rút {C:green}toàn bộ bộ bài{} lên tay",
                    "khi mà {C:attention}tiền cược{} được lựa chọn",
                    "{C:inactive,s:0.8}\"Nếu bạn không tận dụng tôi ở mức 1x,",
                    "{C:inactive,s:0.8}bạn không xứng đáng có được tôi ở mức 2x\"",
                },
            },
            j_cry_energia = {
                name = "Năng lượng",
                text = {
                    "Khi có được một {C:attention}Nhãn{},",
                    "tạo ra {C:attention}#1#{} bản sao của nó",
                    "và {C:attention}tăng trưởng{} số lượng của",
                    "các bản sao lên {C:attention}#2#",
                },
            },
            j_cry_equilib = {
                name = "Át bình đẳng",
                text = {
                    "Các lá Joker sẽ xuất hiện them",
                    "thứ tự trong {C:attention}Bộ sưu tập{}",
                    "Tạo {C:attention}#1#{} Joker {C:dark_edition}Âm bản{}",
                    "khi một tay bài được đánh",
                    "Các lá Joker {C:cry_exotic,s:0.8}Kì lạ {C:inactive,s:0.8}hoặc tốt hơn sẽ không thể xuất hiện",
                    "{s:0.8}Lá Joker cuối được tạo: {C:attention,s:0.8}#2#",
                },
            },
            j_cry_error = {
                name = "{C:red}LL{}{C:dark_edition}OỖ{}{C:red}IIII{}",
                text = {
                    "",
                },
            },
            j_cry_eternalflame = {
                name = "Ngọn lửa Vĩnh hằng",
                text = {
                    "Lá Joker này tạo ra {X:mult,C:white} X#1# {} Điểm nhân",
                    "cho mỗi lá được {C:attention}bán{}",
                    "{C:inactive}(Hiện tại {X:mult,C:white} X#2# {C:inactive} Điểm nhân)",
                },
            },
            j_cry_exoplanet = {
                name = "Ngoại tinh hệ",
                text = {
                    "Mỗi lá bài {C:dark_edition}Óng Ánh{}",
                    "sẽ cho {C:mult}+#1#{} Điểm nhân",
                },
            },
            j_cry_exponentia = {
                name = "Lũy thừa",
                text = {
                    "Lá Joker này tạo {X:dark_edition,C:white} ^#1# {} Điểm nhân",
                    "Khi {X:red,C:white} X Điểm nhân {} được kích hoạt",
                    "{C:inactive}(Hiện tại {X:dark_edition,C:white} ^#2# {C:inactive} Điểm nhân)",
                },
            },
	    j_cry_exposed = {
                name = "Phát giác",
                text = {
                    "Tái kích hoạt lại mọi lá bài không {C:attention}mặt{}",
		            "{C:attention}#1#{} lần bổ sung",
                    "Mọi lá bài chứa {C:attention}mặt{} sẽ bị debuff",
                },
            },
            j_cry_facile = {
                name = "Dễ dàng",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Điểm nhân nếu",
                    "các lá bài chơi đã tính điểm",
                    "{C:attention}#2#{} or ít hơn",
                },
            },
            j_cry_filler = {
                name = "Chất làm đầy",
                text = {
                    "{X:mult,C:white} X#1# {} Điểm nhân nếu như",
                    "tay bài chơi có chứa",
                    "một {C:attention}#2#",
                },
		unlock = {
                    "Thắng một trận đấu",
                    "mà không phải chơi",
                    "{E:1,C:attention}Mẫu thầu"
                },
            },
            j_cry_fractal = {
                name = "Ngón tay Fractal",
                text = {
                    "Được đánh thêm {C:attention}+#1#{} lá",
                },
		unlock = {
                    "Chơi một {C:attention}Thùng phá Sảnh{}",
                    'Mà {C:attention}Sảnh',
                    'không cần tới {C:attention}Thùng{}:>'
                },
            },
            j_cry_flip_side = {
                name = "Mặt Khác",
                text = {
                    "Những lá Joker {C:dark_edition}Hai mặt{} sử dụng",
                    "những mặt đằng sau để lấy hiệu ứng",
                    "thay vì mặt trước",
                    "{C:attention}Tái kích hoạt{} mọi lá Joker {C:dark_edition}Hai mặt"
                },
            },
            j_cry_foodm = {
                name = "M Thức ăn nhanh",
                text = {
                    "{C:mult}+#1#{} Điểm nhân",
                    "{C:red,E:2}tự hủy{} trong {C:attention}#2#{} vòng đấu",
                    "Cải thiện tại vòng đấu thứ {C:attention}#3#{} khi lá",
                    "{C:attention}Joker Vui vẻ{} được {C:attention}bán{}",
                    "{C:inactive,s:0.8}2 McDoubles, 2 McChickens{}",
                    "{C:inactive,s:0.8}Large Fries, 20 Piece & Large Cake{}",
                },
            },
            j_cry_foolhardy = {
                name = "Joker liều lĩnh",
                text = {
                    "{C:red}+#1#{} Điểm nhân khi chơi",
                    "tay bài có chứa",
                    "một {C:attention}#2#"
                }
            },
	    j_cry_formidiulosus = {
		    name = "Formidiulosus",
		    text = {
		    	"Khi một lá Joker {X:cry_cursed,C:white}Nguyền rủa{} được thu, phá hủy nó",
			"Tạo {C:attention}#1#{} {C:cry_candy}Những cái kẹo {C:dark_edition}Âm bản{} vào cuối Shop",
			"Nhận được {X:dark_edition,C:white}^#2#{} Điểm nhân cho mỗi {C:cry_candy}Cái kẹo{} trong quá trình",
			"{C:inactive}(Hiện tại {X:dark_edition,C:white}^#3#{C:inactive} Điểm nhân)",
		    },
	    },
            j_cry_foxy = {
                name = "Joker cáo",
                text = {
                    "{C:chips}+#1#{} Chip khi chơi",
                    "tay bài có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_fspinner = {
                name = "Con quay Fidget",
                text = {
                    "Mỗi lá Joker nhận {C:chips}+#2#{} Chip",
                    "nếu tay bài đã chơi {C:attention}không phải{}",
                    "là {C:attention}tay poker{} chơi nhiều nhất",
                    "{C:inactive}(Hiện tại {C:chips}+#1#{C:inactive} Chip)",
                },
            },
            j_cry_fuckedup = {
                name = "Fucked-Up Joker",
                text = {
                    "{C:red}+#1#{} Điểm nhân nếu",
                    "tay bài có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_gardenfork = {
                name = "Khu vườn của những con đường rẽ nhánh",
                text = {
                    "Nhận {C:money}$#1#{} nếu {C:attention}tay bài đã chơi{}",
                    "có chứa một {C:attention}Át{} và một {C:attention}7{}",
                },
            },
            j_cry_gemino = {
                name = "Song tử",
                text = {
                    "{C:attention}Nhân đôi{} mọi giá trị",
                    "của lá bài {C:attention}Joker{} bên trái xa nhất",
                    "vào cuối mỗi vòng chơi",
                },
            },
            j_cry_ghost = {
                name = "Ma",
                text = {
                    "Vào cuối mỗi vòng:",
                    "{C:green}#1# trên #2#{} khả năng để",
                    "{C:attention}sở hữu{} một lá {C:attention}Joker{} ngẫu nhiên",
                    "{C:green}#1# trên #3#{} khả năng để",
                    "{E:2,C:red}tự hủy"
                }
            },
            j_cry_giggly = {
                name = "Joker ngớ ngẩn",
                text = {
                    "{C:red}+#1#{} Điểm nhân khi chơi",
                    "tay bài có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_goldjoker = {
                name = "Joker hoàng kim",
                text = {
                    "Nhận {C:money}#1#%{} của tổng",
                    "số tiền vào cuối mỗi vòng chơi",
                    "Giá bán sẽ tăng lên {C:money}#2#%{}",
                    "khi mỗi lá bài {C:attention}Gold{} đã chơi ",
                    "được tính điểm",
                },
            },
            j_cry_googol_play = {
                name = "Bài Googol Play",
                text = {
                    "{C:green}#1# trên #2#{} khả năng cho",
                    "{X:red,C:white} X#3# {} Điểm nhân",
                },
		unlock = {
                    "Có số Chip bằng {C:attention}1.0e100{}", 
                    "trong một lượt đánh"
                },
            },
            j_cry_happy = {
                name = ":D",
                text = {
                    "Tạo ngẫu nhiên một lá {C:attention}Joker{}",
                    "vào cuối mỗi vòng đấu",
                    "Bán lá này đi để",
                    "tạo ngẫu nhiên một lá {C:attention}Joker{}",
                    "{C:inactive}(Cần ô trống){}",
                },
            },
            j_cry_happyhouse = {
                name = "Ngôi nhà vui vẻ",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Điểm nhân chỉ khi",
                    "chơi {C:attention}114{} tay bài{}",
                    "{C:inactive}(Hiện tại #2#/114){}",
                    "{C:inactive,s:0.8}Không nơi đâu bằng nhà!{}",
                },
            },
            j_cry_home = {
                name = "Ngôi nhà",
                text = {
                    "{X:mult,C:white} X#1# {} Điểm nhân khi chơi",
                    "tay bài có chứa",
                    "một {C:attention}#2#",
                },
		unlock = {
                    "Chiến thắng một trận",
                    "mà không phải chơi",
                    "{E:1,C:attention}Cù lũ"
                },
            },
            j_cry_hunger = {
                name = "Vật P-hẩm",
                text = {
                    "Nhận {C:money}$#1#{} khi",
                    "sử dụng một {C:attention}vật phẩm{}",
                },
            },
            j_cry_iterum = {
                name = "Lại tiếp tục",
                text = {
                    "Tái kích hoạt mọi lá bài đã chơi",
                    "{C:attention}#2#{} lần,",
                    "mỗi lá bài nhận lại",
                    "{X:mult,C:white} X#1# {} Điểm nhân khi tính điểm",
                },
            },
            j_cry_jawbreaker = {
                name = "Máy bẻ hàm",
                text = {
                    "Khi {C:attention)Trùm cược{} bị đánh bại,",
                    "{C:attention}nhân đôi{} giá trị của những Joker lân cận",
                    "{E:2,C:red}tự hủy{}",
                }
            },
            j_cry_jimball = {
                name = "Jimball",
                text = {
                    "Lá Joker này nhận {X:mult,C:white} X#1# {} Điểm nhân",
                    "cho mỗi lá bài {C:attention}liên tiếp{} được đánh",
                    "khi chơi tay bài {C:attention}Poker{} nhiều nhất",
                    "{C:inactive}(Hiện tại {X:mult,C:white} X#2# {C:inactive} Điểm nhân)",
                },
		unlock = {
                    "Thắng một trận đấu",
                    "khi đang chơi một",
                    " {C:attention}một kiểu{}",
                    '{C:attention}tay bài Poker'
                },
            },
            j_cry_jollysus = {
                name = "Joker Vui vẻ?",
                text = {
                    "Tạo ra một lá Joker {C:dark_edition}Vui vẻ{}",
                    "khi một lá Joker được {C:attention}bán{}",
                    "{C:red}Chỉ tác dụng một lần mỗi trận đấu{}",
                    "{C:inactive}#1#{}",
                    "{C:inactive,s:0.8}Nghe có vẻ không sao...{}",
                },
            },
            j_cry_kidnap = {
                name = "Bắt cóc",
                text = {
                    "Nhận {C:money}$#2#{} vào cuối mỗi vòng đấu",
                    "Tăng giá bán lên {C:money}$#1#{}",
                    "nếu như mỗi lá Joker {C:attention}dạng có điểm nhân{} hoặc",
                    "{C:attention}dạng tạo ra chip{} được bán",
                },
            },
            j_cry_kooky = {
                name = "Joker Kì quặc",
                text = {
                    "{C:red}+#1#{} Điểm nhân khi chơi",
                    "tay bài có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_krustytheclown = {
                name = "Chú hề Krusty",
                text = {
                    "Lá Joker này cho",
                    "{X:mult,C:white} X#1# {} Điểm nhân khi",
                    "mọi {C:attention}lá bài{} đánh ra được tính điểm",
                    "{C:inactive}(Hiện tại {X:mult,C:white} X#2# {C:inactive} Điểm nhân)",
                },
            },
            j_cry_kscope = {
                name = "Kính vạn hoa",
                text = {
                    "Nhận một hiệu ứng {C:dark_edition}Đa sắc{} cho",
                    "một lá {C:attention}Joker{} ngẫu nhiên khi",
                    "đánh bại {C:attention)Trùm cược{}",
                },
		unlock = {
                    "Đánh bại {C:attention)Trùm cược",
                    'với {C:attention}5{} nhiều hơn',
                    '{C:attention}Các lá bài được ấn bản{} hoặc',
                    '{C:attention}lá Joker'
                },
            },
            j_cry_lightupthenight = {
                name = "Thắp sáng trời đêm",
                text = {
                    "Với mỗi {C:attention}7{} hoặc {C:attention}2{} đã chơi",
                    "nhận {X:mult,C:white}X#1#{} Điểm nhân khi tính điểm",
                },
            },
            j_cry_longboi = {
                name = "Quái vật",
                text = {
                    "Cho mỗi bản sao sau này của",
                    "lá Joker này {X:mult,C:white}X#1#{} Điểm nhân",
                    "vào cuối mỗi vòng đấu",
                    "{C:inactive}(Hiện tại {X:mult,C:white}X#2#{C:inactive} Điểm nhân){}",
                },
            },
            j_cry_loopy = {
                name = "Lặp lại điên loạn",
                text = {
                    "{C:attention}Tái kích hoạt{} mọi lá Joker",
                    "cho mỗi lá {C:attention}Joker{}",
                    "{C:attention}Vui vẻ{} được bán ở vòng đấu này",
                    "{C:inactive}(Hiện tại{}{C:attention:} #1#{}{C:inactive} Tái kích hoạt){}",
                    "{C:inactive,s:0.8}Thực sự không đủ chỗ...{}",
                },
            },
            j_cry_lucky_joker = {
                name = "Joker May mắn",
                text = {
                    "Nhận {C:money}$#1#{} cho mỗi lần",
                    "Lá bài {C:attention}May mắn{} kích hoạt {C:green}thành công{}",
                },
            },
            j_cry_luigi = {
                name = "Luigi",
                text = {
                    "Mọi lá Joker cho",
                    "{X:chips,C:white} X#1# {} Chip",
                },
            },
            j_cry_m = {
                name = "m",
                text = {
                    "Lá Joker này nhận {X:mult,C:white} X#1# {} Điểm nhân",
                    "khi {C:attention}Joker vui vẻ{} được bán",
                    "{C:inactive}(Hiện tại {X:mult,C:white} X#2# {C:inactive} Điểm nhân)",
                },
            },
            j_cry_M = {
                name = "M",
                text = {
                    "Tạo một lá {C:attention}Joker Vui vẻ{}",
                    "{C:dark_edition}Âm bản{} khi",
                    "{C:attention}tiền cược{} được lựa chọn",
                },
            },
            j_cry_macabre = {
                name = "Joker Rùng rợn",
                text = {
                    "Khi một {C:attention}tiền cược{} được lựa chọn,",
                    "phá hủy mỗi lá {C:attention}Joker{} ngoại trừ",
                    "{C:legendary}M Jokers{} và {C:attention}Các lá Joker vui vẻ{}",
                    "và tạo #1# {C:attention}Joker vui vẻ{}",
                    "cho mỗi lá bài bị phá hủy",
                },
            },
            j_cry_magnet = {
                name = "Nam châm lạnh",
                text = {
                    "Nhận {C:money}$#1#{} cuối mỗi vòng đấu",
                    "Nó sẽ nhận {X:money,C:white} X#2# {} nếu như có",
                    "{C:attention}#3#{} hoặc ít hơn các lá {C:attention}Joker{}",
                },
            },
            j_cry_manic = {
                name = "Joker Hưng cảm",
                text = {
                    "{C:red}+#1#{} Điểm nhân mỗi khi chơi",
                    "tay bài có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_mario = {
                name = "Mario",
                text = {
                    "Mọi Joker sẽ được tái kích hoạt",
                    "thêm {C:attention}#1#{} lần",
                },
            },
            j_cry_mask = {
                name = "Mặt nạ",
                text = {
                    "Tái kích hoạt mọi lá bài chứa {C:attention}mặt{}",
                    "thêm {C:attention}#1#{} lần",
		    "Mọi lá bài {C:attention}không chứa mặt{} sẽ bị debuff",
                },
            },
            j_cry_maximized = {
                name = "Tối đa hóa",
                text = {
                    "Mọi lá bài chứa {C:attention}mặt{}",
                    "sẽ được xem là {C:attention}K{},",
                    "mọi lá bài {C:attention}đánh số{}",
                    "sẽ được xem là {C:attention}10{}",
                },
		unlock = {
                    "Chơi một {C:attention}Thùng Ngũ Quý{}",
                    'của các lá {C:attention}K'
                },
            },
            j_cry_maze = {
                name = "Mê cung",
                text = {
                    "Mọi tay bài sẽ được coi là",
                    "{C:attention}tay đầu tiên{} ở mỗi vòng đấu,",
                    "mọi lượt bỏ sẽ được coi là",
                    "{C:attention}lượt bỏ đầu tiên{} ở mỗi vòng đấu",
                },
            },
            j_cry_Megg = {
                name = "Megg",
                text = {
                    "Bán lá bài này đi để tạo ra",
                    "{C:attention}#2#{} #3# Vui vẻ, tăng lên",
                    "{C:attention}#1#{} vào cuối mỗi vòng đấu",
                },
            },
            j_cry_mellowcreme = {
                name = "Kẹo dẻo mềm",
                text = {
                    "Bán lá bài này đi để {C:attention}nhân",
                    "giá trị của mỗi",
                    "{C:attention}vật phẩm{} lên {C:attention}X#1#"
                }
            },
            j_cry_membershipcard = {
                name = "Thẻ thành viên",
                text = {
                    "{X:mult,C:white}X#1#{} Cho mỗi thành viên",
                    "ở trong {C:attention}Cryptid Discord{}",
                    "{C:inactive}(Hiện tại {X:mult,C:white}X#2#{C:inactive} Điểm nhân)",
                    "{C:blue,s:0.7}https://discord.gg/eUf9Ur6RyB{}",
                },
            },
            j_cry_membershipcardtwo = {
                name = "Thẻ thành viên mục nát", --Could probably have a diff Name imo
                text = {
                    "{C:chips}+#1#{} Chip cho mỗi thành viên",
                    "ở trong {C:attention}Cryptid Discord{}",
                    "{C:inactive}(Hiện tại {C:chips}+#2#{C:inactive} Chip)",
                    "{C:blue,s:0.7}https://discord.gg/eUf9Ur6RyB{}",
                },
            },
            j_cry_meteor = {
                name = "Mưa sao băng",
                text = {
                    "Mỗi lá bài {C:dark_edition}Tráng bạc{}",
                    "sẽ cho {C:chips}+#1#{} Chip",
                },
            },
            j_cry_mneon = {
                name = "Neon M",
                text = {
                    "Nhận {C:money}$#2#{} vào cuối mỗi vòng chơi",
                    "tăng giá bán lên",
                    "{C:money}$#1#{} cho mỗi lá {C:attention}Joker Vui vẻ{}",
                    "hoặc {C:legendary}M Joker{} tại",
                    "cuối vòng đấu",
                },
            },
            j_cry_mondrian = {
                name = "Mondrian",
                text = {
                    "Lá Joker này nhận {X:mult,C:white} X#1# {} Điểm nhân",
                    "nếu như không có {C:attention}lượt bỏ{} nào dùng",
                    "trong vòng này",
                    "{C:inactive}(Hiện tại {X:mult,C:white} X#2# {C:inactive} Điểm nhân)",
                },
            },
            j_cry_monkey_dagger = {
                name = "Dao găm Khỉ",
                text = {
                    "Khi {C:attention}tiền cược{} được lựa chọn,",
                    "phá hủy lá Joker phía bên trái",
                    "và đồng thời nhận {C:attention}mười lần{}",
                    "giá trị bán của nó thành {C:chips}Chip{}",
                    "{C:inactive}(Hiện tại {C:chips}+#1#{C:inactive} Chip)",
                },
            },
            j_cry_monopoly_money = {
                name = "Tiền độc quyền",
                text = {
                    "{C:green}#1# trên #2#{} khả năng",
                    "{C:attention}phá hủy{} những vật phẩm đã mua",
                    "Chia đôi số tiền {C:attention}khi bán",
                }
            },
            j_cry_morse = {
                name = "Mã Morse",
                text = {
                    "Nhận {C:money}$#2#{} vào cuối mỗi vòng đấu",
                    "Tăng giá bán lên {C:money}$#1#{} khi",
                    "một lá bài {C:attention}Ấn bản{} được bán",
                },
            },
            j_cry_mprime = {
                name = "Tredecim",
                text = {
                    "Tạo một lá {C:legendary}M Joker{} vào cuối mỗi vòng đấu",
                    "Nhận lá {C:attention}Joker Vui Vẻ{} hoặc {C:legendary}M Joker",
                    "cho {X:dark_edition,C:white}^#1#{} Điểm nhân",
                    "Tăng cường số lượng lên {X:dark_edition,C:white}^#2#{}",
                    "khi một lá {C:attention}Joker Vui vẻ{} được {C:attention}bán",
                    "{C:inactive,s:0.8}(Loại trừ Tredecim)",
                },
            },
            j_cry_mstack = {
                name = "M Xếp",
                text = {
                    "Tái kích hoạt mọi lá bài đã chơi",
                    "một lần cho tất cả",
                    "{C:attention}#2#{} {C:inactive}[#3#]{} lá {C:attention}Joker Vui vẻ{} được bán",
                    "{C:inactive}(Hiện tại{}{C:attention:} #1#{}{C:inactive} tái kích hoạt){}",
                },
            },
            j_cry_multjoker = {
                name = "Joker Điểm nhân",
                text = {
                    "{C:green}#1# trên #2#{} khả năng cho mỗi",
                    "lá bài {C:attention}Mult{} đã chơi để tạo",
                    "một lá bài {C:spectral}Cryptid{} khi tính điểm",
                    "{C:inactive}(Cần ô trống)",
                },
            },
	    j_cry_necromancer = {
	    	name = "Triệu hồi sư",
		text = {
		    "Khi một lá Joker được {C:attention}bán{} nhiều hơn {C:attention}$0{},",
		    "tạo ra một lá Joker  {C:attention}đã bán{} {C:attention}ngẫu nhiên{} trong trận này",
		    "với giá trị bằng {C:money}$0{}",
		},
	    },
            j_cry_negative = {
                name = "Joker Âm bản",
                text = {
                    "Thêm {C:dark_edition}+#1#{C:attention} ô trống cho Joker{}",
                },
            },
            j_cry_nice = {
                name = "Tuyệt",
                text = {
                    "{C:chips}+#1#{} Chip khi tay bài đã chơi",
                    "có chứa một {C:attention}6{} và một {C:attention}9",
                    "{C:inactive,s:0.8}Nice.{}",
                },
            },
            j_cry_night = {
                name = "Đêm",
                text = {
                    "{X:dark_edition,C:white}^#1#{} Điểm nhân cho",
                    "tay bài cuối cùng của vòng đấu này",
                    "{E:2,C:red}tự hủy{}",
                    "tại tay bài cuối cùng",
                },
            },
            j_cry_nosound = {
                name = "Điếc, mất trí nhớ",
                text = {
                    "Tái kích hoạt mọi lá {C:attention}7{} đã chơi",
                    "thêm {C:attention:}#1#{} lần",
                },
            },
            j_cry_notebook = {
                name = "Vở ghi chép",
                text = {
                    "{C:green} #1# trên #2#{} khả năng để nhận {C:dark_edition}+#6#{} ô Joker",
                    "mỗi lần {C:attention}reroll{} trong shop",
                    "{C:green}Luôn được kích hoạt{} nếu như có",
                    "{C:attention}#5#{} hoặc nhiều hơn các lá {C:attention}Joker Vui vẻ{}",
                    "{C:red}Chỉ dùng một lần mỗi vòng đấu{}",
                    "{C:inactive}(Hiện tại {C:dark_edition}+#3#{}{C:inactive} và #4#){}",
                },
            },
            j_cry_number_blocks = {
                name = "Khối số liệu",
                text = {
                    "Nhận {C:money}$#1#{} vào cuối mỗi vòng đấu",
                    "tăng giá trị bán lên {C:money}$#2#{}",
                    "cho mỗi {C:attention}#3#{} cầm trên tay,",
                    "hạng bậc sẽ thay đổi theo từng vòng chơi",
                },
            },
            j_cry_nuts = {
                name = "Đống hạt",
                text = {
                    "{X:mult,C:white} X#1# {} Điểm nhân khi",
                    "tay bài có chứa",
                    "một {C:attention}#2#",
                },
		unlock = {
                    "Thắng một trận đấu",
                    "Mà không phải chơi",
                    "một {E:1,C:attention}Thùng phá Sảnh"
                },
            },
            j_cry_nutty = {
                name = "Joker hạt",
                text = {
                    "{C:red}+#1#{} Điểm nhân khi",
                    "tay bài có chứa",
                    "một {C:attention}#2#"
                }
            },
	    j_cry_oil_lamp = {
		name = "Đèn dầu",
		text = {
			"Tăng giá trị của lá {C:attention}Joker{} ở bên phải",
			"lên {C:attention}X#1#{} vào cuối mỗi vòng đấu",
		},
	    },
            j_cry_oldblueprint = {
                name = "Bản thiết kế cũ",
                text = {
                    "Sao chép mọi tính năng của",
                    "{C:attention}Joker{} phía bên phải",
                    "{C:green}#1# trên #2#{} khả năng",
                    "lá bài này sẽ bị phá hủy",
                    "vào cuối mỗi vòng đấu",
                },
            },
            j_cry_oldcandy = {
                name = "Kẹo cổ đại",
                text = {
                    "Bác cái lá bài này đi",
                    "để nhận được vĩnh viễn",
                    "{C:attention}+#1#{} kích thước tay bài",
                },
            },
            j_cry_oldinvisible = {
                name = "Joker tàng hình cổ đại",
                text = {
                    "{C:attention}Nhân đôi{} ngẫu nhiên một lá",
                    "{C:attention}Joker{} cho tất cả {C:attention}4",
                    "lá Joker đã bán,
                    "{s:0.8}Ngoại trừ chính nó và bản sao của nó{}",
                    "{C:inactive}(Hiện tại #1#/4){}",
                },
            },
            j_cry_panopticon = {
                name = "Toàn cảnh",
                text = {
                    "Mọi tay bài được coi là",
                    "{C:attention}tay bài cuối cùng{} của mỗi vòng đấu", -- +$4
                },
            },
            j_cry_penetrating = {
                name = "Joker thâm nhập",
                text = {
                    "{C:chips}+#1#{} Chip nếu như các tay bài",
                    "đã chơi có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_pickle = {
                name = "Dưa chuột",
                text = {
                    "Khi {C:attention}tiền cược{} được skip, tạo",
                    "{C:attention}#1#{} nhãn, giảm xuống còn",
                    "{C:red}#2#{} khi {C:attention}tiền cược{} được chọn",
                },
            },
            j_cry_pirate_dagger = {
                name = "Dao găm cướp biển",
                text = {
                    "Khi {C:attention}tiền cược{} được lựa chọn,",
                    "Phá hủy lá Joker ở phía bên phải",
                    "và nhận được {C:attention}1/4{} giá trị bán",
                    "của nó thành điểm {X:chips,C:white} XChip {}",
                    "{C:inactive}(Hiện tại {X:chips,C:white} X#1# {C:inactive} Chip)",
                },
            },
            j_cry_pity_prize = {
                name = "Giải động viên",
                text = {
                    "Nếu như skip một {C:attention}Gói tăng cường{},",
                    "nhận ngẫu nhiên một {C:attention}Nhãn{}",
                },
            },
            j_cry_pot_of_jokes = {
                name = "Nồi chuyện cười",
                text = {
                    "{C:attention}#1#{} kích thước tay bài,",
                    "tăng lên mỗi",
                    "{C:blue}#2#{} vòng đấu",
                },
		unlock = {
                    'tăng cường {C:attention}kích thước tay bài',
                    'lên {C:attention}12'
                },
            },
            j_cry_primus = {
                name = "Nguyên thủy",
                text = {
                    "Lá Joker này nhận {X:dark_edition,C:white} ^#1# {} Điểm nhân",
                    "nếu như tất cả các lá được chơi trên tay là",
                    "{C:attention}Các lá Át{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}7{}",
                    "{C:inactive}(Hiện tại {X:dark_edition,C:white} ^#2# {C:inactive} Điểm nhân)",
                },
            },
	    j_cry_pumpkin = {
                name = "Bí ngô",
                text = {
                    "Tránh thua nếu như tổng số điểm",
                    "khoảng {C:attention}50%{} số chip yêu cầu thì",
                    "{C:attention}Thì sẽ trở thành bí ngô được khoét",
                    "{C:attention}khi{} bị {C:red}phá hủy"
                },
            },
            j_cry_carved_pumpkin = {
                name = "Bí ngô được khoét",
                text = {
                    "{C:attention}#1#{})Trùm cược cược tiếp theo",
                    'sẽ bị {C:attention}disabled{}',
                    'khả năng của nó'
                },
            },
            j_cry_python = {
                name = "Python",
                text = {
                    "Lá Joker này cho",
                    "{X:mult,C:white} X#1# {} Điểm nhân khi một",
                    "lá bài {C:cry_code}Code{} được sử dụng",
                    "{C:inactive}(Hiện tại {X:mult,C:white} X#2# {C:inactive} Điểm nhân)",
                },
            },
            j_cry_queens_gambit = {
                name = "Queen's Gambit",
                text = {
                    "Nếu {C:attention}tay bài Poker{} là một",
                    "{C:attention}Sảnh Rồng{}, hủy số điểm của",
                    "{C:attention}Q{} và tạo một",
                    "{C:attention}Joker {C:red}Quý {C:dark_edition}Âm bản{}",
                },
            },
            j_cry_quintet = {
                name = "Bộ ngũ tấu",
                text = {
                    "{X:mult,C:white} X#1# {} Điểm nhân khi",
                    "tay bài có chứa",
                    "một {C:attention}#2#",
                },
		unlock = {
                    "Thắng một trận đấu với",
                    "tay bài cuối cùng có",
                    "một {E:1,C:attention}Ngũ quý K"
                },
            },
            j_cry_redbloon = {
                name = "Bông hoa đỏ",
                text = {
                    "Nhận {C:money}$#1#{} trên {C:attention}#2#{} vòng đấu",
                    "{C:red,E:2}Tự hủy{}",
                },
            },
            j_cry_redeo = {
                name = "Quay lại",
                text = {
                    "{C:attention}-#1#{} Ante khi",
                    "{C:money}$#2#{} {C:inactive}($#3#){} được chi",
                    "{s:0.8}Yêu cầu tiền cược tăng lên",
                    "{C:attention,s:0.8}nhanh chóng{s:0.8} sau mỗi lần dùng",
                    "{C:money,s:0.8}Lần tăng cược tiếp theo: {s:1,c:money}$#4#",
                },
            },
            j_cry_rescribere = {
                name = 'Viết lại',
                text = {
                    "Khi một lá bài {C:attention}Joker{} được bán,",
                    "thêm hiệu năng của nó cho",
                    "các lá Joker khác",
                    "{C:inactive,s:0.8}Không có tác dụng cho các lá bài Viết lại{}"
                }
            },
            j_cry_reverse = {
                name = "Bài đảo ngược",
                text = {
                    "Làm đầy các ô Joker còn trống {C:inactive}(Max 100){}",
                    "với các lá {C:attention}Joker Vui vẻ{} {C:dark_edition}Óng Ánh{} nếu",
                    "{C:attention}bỏ đi một{} {C:attention}#1#{}",
                    "{C:red,E:2}Tự hủy{}",
                    "{C:inactive,s:0.8}Cú trở lại SIÊU CẤP PRO MAX{}",
                },
            },
            j_cry_rnjoker = {
                name = "RNJoker",
                text = {
                    "Ngẫu nhiên các hiệu năng mỗi {C:attention}Ante{}",
                },
		unlock = {
                    "{C:green}1 trên 20{} khả năng",
                    'mở khóa lá bài này',
                    'tại màn hình {C:attention}Kết thúc'
                },
            },
            j_cry_sacrifice = {
                name = "Hi sinh",
                text = {
                    "Tạo #3# lá bài Joker {C:green}Hiếm{}",
                    "và #2# {C:attention}Joker Vui vẻ{} khi",
                    "một lá bài {C:spectral}Quang phổ{} được sử dụng",
                    "{C:red}Chỉ hoạt động mỗi vòng chơi{}",
                    "{C:inactive}#1#{}",
                },
            },
            j_cry_sapling = {
                name = "Chồi non",
                text = {
                    "Sau khi ghi điểm {C:attention}#2#{} lá bài {C:inactive}[#1#]{} Cường hóa",
                    "bán lá bài này để",
                    "tạo một lá  {C:attention}Joker{} {C:cry_epic}Sử thi{}",
                    "{C:inactive,s:0.8}Có thể sẽ tạo ra {C:attention,s:0.8}Joker{} {C:red,s:0.8}Quý{}",
                    "{C:inactive,s:0.8}nếu như các lá {C:inactive,s:0.8}Joker{} {C:cry_epic,s:0.8}Epic{} bị tắt",
                },
            },
            j_cry_savvy = {
                name = "Joker hiểu biết",
                text = {
                    "{C:chips}+#1#{} Chip nếu như",
                    "tay bài có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_Scalae = {
                name = "Phóng đại",
                text = {
                    "Các lá {C:attention}Joker{} đa thức hệ sẽ phóng đại lên",
                    "đa thức bậc {C:attention}#1#{}",
                    "tăng bậc lên là {C:attention}#2#{}",
                    "ở cuối mỗi vòng",
                    "{C:inactive,s:0.8}({C:attention,s:0.8}Scalae{C:inactive,s:0.8} bị ngoại trừ)",
                },
            },
            j_cry_scrabble = {
                name = "Ngói xếp",
                text = {
                    "{C:green}#1# trên #2#{} khả năng tạo ra",
                    "một lá Joker {C:dark_edition}Vui vẻ {C:green}Hiếm{}",
                    "Khi tay bài đã chơi",
                },
            },
            j_cry_seal_the_deal = {
                name = "Niêm phong thỏa thuận",
                text = {
                    "Thêm một {C:attention}niêm phong ngẫu nhiên{} cho mỗi lá bài",
                    "ghi điểm ở {C:attention}tay chơi cuối cùng{} của vòng đấu",
                },
            },
            j_cry_shrewd = {
                name = "Joker Không ngoan",
                text = {
                    "{C:chips}+#1#{} Chip nếu như chơi",
                    "tay bài có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_silly = {
                name = "Joker xấu hổ",
                text = {
                    "{C:red}+#1#{} Điểm nhân khi",
                    "tay bài có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_smallestm = {
                name = "Tí hon",
                text = {
                    "Tạo ra một nhãn {C:cry_jolly}M Đôi",
                    "nếu {C:attention}tay bài poker{}",
                    "là một {C:attention}#1#{}",
                    "{C:inactive,s:0.8}được rồi, về cơ bản là tôi rất tí hon,ok?",
                },
            },
            j_cry_soccer = {
                name = "Một vì tất cả", --changed the name from latin because this isn't exotic
                text = {
                    "{C:attention}+#1#{} Ô Joker",
                    "{C:attention}+#1#{} Ô Gói tăng cường",
                    "{C:attention}+#1#{} Kích thước tay bài",
                    "{C:attention}+#1#{} Ô vật phẩm",
                    "{C:attention}+#1#{} Thẻ bài trong Shop",
                    "{C:attention}+#1#{} Ô Voucher",
                },
		unlock = {
                    'Thắng một trận đấu với',
                    'chỉ dùng {C:attention}Mậu thầu'
                },
            },
            j_cry_fleshpanopticon = {
                name = "Flesh Panopticon",
                text = {
                    "{C:red}X#1#{} kích thước {C:attention)Trùm cược{}",
                    "Khi {C:attention)Trùm cược{} bị đánh bại,",
                    "{C:red}tự hủy{}, và tạo ra",
                    "một lá bài {C:spectral}Cổng vào{} {C:dark_edition}Âm bản{}",
                    "{C:inactive,s:0.8}\"Nhà tù này... đang giam giữ... tôi sao?\""
                },
            },
            j_cry_spaceglobe = {
                name = "Thiên cầu",
                text = {
                    "Lá Joker này tạo {X:chips,C:white}X#2#{} Chip",
                    "nếu như {C:attention}tay bài poker{} là một {C:attention}#3#{},",
                    "Tay bài sẽ thay đổi mỗi lần cải thiện{}",
                    "{C:inactive}(Hiện tại{} {X:chips,C:white}X#1#{} {C:inactive}Chip){}",
                },
            },
	    j_cry_spectrogram = {
                name = "Quang phổ",
                text = {
                    "{C:attention}Tái kích hoạt{} lá Joker bên phải xa nhất",
                    "mỗt lần cho mỗi {C:attention}bài Vọng",
                    "Đó mới là chơi và ghi điểm",
                },
            },
            j_cry_speculo = {
                name = "Suy đoán",
                text = {
                    "Tạo một bản sao {C:dark_edition}Âm bản{}",
                    "cho một lá {C:attention}Joker{} ngẫu nhiên",
                    "ở phía cuối {C:attention}shop",
                    "{C:inactive,s:0.8}Không thể copy các lá Suy đoán{}",
                },
            },
            j_cry_spy = {
                name = "Gián điệp",
                text = {
                    "{X:mult,C:white} X#2# {} Điểm nhân, {C:dark_edition}+1{} ô {C:attention} Joker{}",
                    "{C:inactive}#1# HẮN là gián điệp!",
                },
            },
            j_cry_stardust = {
                name = "Bụi sao",
                text = {
                    "Các lá bài {C:dark_edition}Đa sắc{}",
                    "sẽ cho {X:mult,C:white}X#1#{} Điểm nhân",
                },
            },
            j_cry_stella_mortis = {
                name = "Ngôi sao chết",
                text = {
                    "Lá Joker này sẽ phá hủy",
                    "ngẫu nhiên một lá bài {C:planet}Hành tinh{}",
                    "và nhận lại {X:dark_edition,C:white} ^#1# {} Điểm nhân",
                    "vào cuối mỗi {C:attention}shop{}",
                    "{C:inactive}(Hiện tại {X:dark_edition,C:white} ^#2# {C:inactive} Điểm nhân)",
                },
            },
            j_cry_stronghold = {
                name = "Thành trì",
                text = {
                    "{X:mult,C:white} X#1# {} Điểm nhân khi",
                    "tay bài có chứa",
                    "một {C:attention}#2#",
                },
		unlock = {
                    "Thắng một trận đấu với",
                    "tay bài cuối cùng của bạn",
                    "một {E:1,C:attention} Bờ Lũy"
                },
            },
            j_cry_subtle = {
                name = "Joker Tinh tế",
                text = {
                    "{C:chips}+#1#{} Chips nếu chơi",
                    "tay bài có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_supercell = {
                name = "Tế bào siêu cấp",
                text = {
                    "{C:chips}+#1#{} Chip, {C:mult}+#1#{} Điểm nhân,",
                    "{X:chips,C:white}X#2#{} Chip, {X:mult,C:white}X#2#{} Điểm nhân",
                    "Nhận lại {C:money}$#3#{} vào",
                    "cuối vòng đấu",
                },
            },
            j_cry_sus = {
                name = "SUS",
                text = {
                    "Vào cuối mỗi vòng đấu, tạo",
                    "một {C:attention}bản sao{} cho một",
                    "lá bài bất kì {C:attention}giữ trên tay{},",
                    "phá hủy toàn bộ lá bài khác",
                    "{C:attention,s:0.8}K{s:0.8} {C:hearts,s:0.8}Cơ{s:0.8} được ưu tiên",
                },
            },
            j_cry_swarm = {
                name = "Bầy đàn",
                text = {
                    "{X:mult,C:white} X#1# {} Điểm nhân khi",
                    "tay bài có chứa",
                    "một {C:attention}#2#",
                },
		unlock = {
                    "Thắng một trận đấu với",
                    "tay bài cuối cùng của bạn",
                    "là {E:1,C:attention}Thùng Ngũ Quý"
                },
            },
            j_cry_sync_catalyst = {
                name = "Chất xúc tác đồng bộ",
                text = {
                    "Cân bằng số {C:chips}Chip{} và {C:mult}Điểm nhân{}",
                    "{C:inactive,s:0.8}Này! Có vẻ tôi đã từng nhìn thứ đó lần nào đó rồi!",
                },
            },
			j_cry_tax_fraud = {
				name = "Gian lần Thuế",
				text = {
					"Nhận {C:attention}$#1#{} mỗi {C:attention}Joker cho thuê",
					"vào cuối mỗi vòng đấu",
				},
			},
            j_cry_tenebris = {
                name = "Tenebris",
                text = {
                    "{C:dark_edition}+#1#{} ô {C:attention} Joker{}",
                    "Nhận {C:money}$#2#{} cuối mỗi vòng đấu",
                },
            },
            j_cry_translucent = {
                name = "Joker mờ ảo",
                text = {
                    "Bán lá bài này để tạo",
                    "một bản sao {C:attention}Chuối dễ hỏng{}",
                    "cho một lá bài {C:attention}Joker{} ngẫu nhiên",
                    "{s:0.8,C:inactive}(Sao chép bỏ qua tính tương thích của dễ hỏng )",
                },
            },
            j_cry_treacherous = {
                name = "Joker phản bội",
                text = {
                    "{C:chips}+#1#{} Chip nếu chơi",
                    "tay bài có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_trick_or_treat = {
                name = "Cho kẹo hay bị ghẹo",
                text = {
                    "Khi {C:attention}bán{}:",
                    "{C:green}#1# trên #2#{} khả năng sẽ tạo {C:attention}2{} {C:cry_candy}Kẹo",
                    "Bên cạnh đó, tạo ra lá Joker {X:cry_cursed,C:white}Nguyền rủa{}",
                    "{C:inactive}(Có thể Overflow)"
                }
            },
            j_cry_tricksy = {
                name = "Joker xảo quyệt",
                text = {
                    "{C:chips}+#1#{} Chip nếu chơi",
                    "tay bài có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_triplet_rhythm = {
                name = "Nhịp điệu ba",
                text = {
                    "{X:mult,C:white} X#1# {} Điểm nhân khi tay bài ghi điểm",
                    "chứa {C:attention}duy nhất{} ba lá {C:attention}3",
                },
            },
            j_cry_tropical_smoothie = {
                name = "Sinh tố nhiệt đới",
                text = {
                    "Bán lá bài này",
		    "để {C:attention}nhân{} giá trị",
                    "các lá bài joker đang sử dụng lên {C:attention}X#1#{}",
                },
            },
            j_cry_unity = {
                name = "Sự đoàn kết",
                text = {
                    "{X:mult,C:white} X#1# {} Điểm nhân khi",
                    "tay bài có chứa",
                    "một {C:attention}#2#",
                },
		unlock = {
                    "Thắng một trận đấu with",
                    "tay bài cuối cùng của bạn",
                    "một {E:1,C:attention}Thùng Cù lũ"
                },
            },
            j_cry_universe = {
                name = "Vũ trụ",
                text = {
                    "Các lá bài {C:dark_edition}tinh tú{}",
                    "sẽ cho {X:dark_edition,C:white}^#1#{} Điểm nhân",
                },
            },
            j_cry_universum = {
                name = "Toàn diện vật",
                text = {
                    "{C:attention}Tay bài Poker{} nhận",
                    "{X:red,C:white} X#1# {} Điểm nhân và {X:blue,C:white} X#1# {} Chip",
                    "khi lên cấp",
                },
            },
            j_cry_unjust_dagger = {
                name = "Con dao bất công",
                text = {
                    "Khi {C:attention}tiền cược{} được lựa chọn,",
                    "phá hủy lá Joker ở phía bên trái",
                    "và nhận {C:attention}1/5{} của",
                    "giá trị của nó rồi biến thành {X:mult,C:white} X Điểm nhân {}",
                    "{C:inactive}(Hiện tại {X:mult,C:white} X#1# {C:inactive} Điểm nhân)",
                },
            },
            j_cry_verisimile = {
                name = "Không xác thực",
                text = {
                    "Khi có bất kỳ xác suất nào",
                    "mà nó kích hoạt {C:green}thành công{},",
                    "lá Joker này nhận {X:red,C:white}X Điểm nhân{}",
                    "bằng với {C:attention}tỷ lệ{} cược được liệt kê của nó",
                    "{C:inactive}(Hiện tại {X:mult,C:white} X#1# {C:inactive} Điểm nhân)",
                },
            },
            j_cry_virgo = {
                name = "Xử Nữ",
                text = {
                    "Joker này cho {C:money}$#1#{} của {C:attention}giá trị bán ra{}",
                    "nếu {C:attention}tay bài poker{} chứa một {C:attention}#2#{}",
                    "Bán lá bài này đi để tạo",
                    "{C:attention}Joker Vui vẻ{} {C:dark_edition}Đa sắc{} cho",
                    "mọi {C:money}$4{} của {C:attention}giá trị bán ra{} {C:inactive}(Min 1){}",
                },
            },
            j_cry_wacky = {
                name = "Joker lập dị",
                text = {
                    "{C:red}+#1#{} Điểm nhân khi",
                    "tay bài có chứa",
                    "một {C:attention}#2#"
                }
            },
            j_cry_waluigi = {
                name = "Waluigi",
                text = {
                    "Tất cả lá Joker cho",
                    "{X:mult,C:white} X#1# {} Điểm nhân",
                },
            },
            j_cry_wario = {
                name = "Wario",
                text = {
                    "Tất cả lá Joker cho",
                    "{C:money}$#1#{} khi kích hoạt",
                },
            },
            j_cry_wee_fib = {
                name = "Weebonacci",
                text = {
                    "Lá Joker này nhận",
                    "{C:mult}+#2#{} Điểm nhân khi chơi",
                    "{C:attention}Át{}, {C:attention}2{}, {C:attention}3{}, {C:attention}5{}, or {C:attention}8{}",
                    "is scored",
                    "{C:inactive}(Hiện tại {C:mult}+#1#{C:inactive} Điểm nhân)",
                },
            },
            j_cry_weegaming = {
                name = "2D",
                text = {
                    "Tái kích hoạt lá {C:attention}2{}", --wee gaming
                    "thêm {C:attention:}#1#{} lần", --wee gaming?
                    "{C:inactive,s:0.8}Wee Gaming?{}",
                },
            },
            j_cry_wheelhope = {
                name = "Wheel of Hope",
                text = {
                    "Lá Joker này nhận",
                    "{X:mult,C:white} X#1# {} Điểm nhân khi mà bị thua",
                    "một {C:attention}Wheel of Fortune{}",
                    "{C:inactive}(Hiện tại {X:mult,C:white} X#2# {C:inactive} Điểm nhân)",
                },
            },
            j_cry_whip = {
                name = "The WHIP",
                text = {
                    "Lá Joker này nhận {X:mult,C:white} X#1# {} Điểm nhân",
                    "nếu {C:attention}tay bài đã chơi{} chứa một",
                    "{C:attention}2{} và {C:attention}7{} khác chất",
                    "{C:inactive}(Hiện tại {X:mult,C:white} X#2# {C:inactive} Điểm nhân)",
                },
            },
            j_cry_wrapped = {
                name = "Kẹo gói",
                text = {
                    "Tạo ngẫu nhiên một {C:attention}Joker Đồ ăn{}",
                    "trong {C:attention}#1#{} vòng đấu",
                    "{C:red,E:2}lá tự hủy{}",
                },
            },
            j_cry_wtf = {
                name = "CÁI ĐỆCH!?",
                text = {
                    "{X:mult,C:white} X#1# {} Điểm nhân khi",
                    "tay bài có chứa",
                    "một {C:attention}#2#",
                },
		unlock = {
                    "Thắng một trận đấu với",
                    "tay bài cuối cùng của bạn",
                    "một {E:1,C:attention}Mớ chết tiệt"
                },
            },
	    j_cry_zooble = {
                name = "Zooble",
                text = {
                    "nếu chơi tay bài mà",
                    "{C:attention}không{} chứa một {C:attention}Sảnh{},",
                    "Lá Joker này nhận {C:mult}+#2#{} Điểm nhân cho mỗi",
                    "{C:attention}thứ bậc độc quyền{} trong tay bài đang tính điểm",
                    "{C:inactive}(Hiện tại {C:mult}+#1#{C:inactive} Điểm nhân)",
                },
            },
        },
        Planet = {
            c_cry_Klubi = {
                name = "Risti",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Thăng cấp",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "và {C:attention}#3#{}",
                },
            },
            c_cry_Lapio = {
                name = "Pata",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Thăng cấp",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "và {C:attention}#3#{}",
                },
            },
            c_cry_Kaikki = {
                name = "Kaikki",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Thăng cấp",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "và {C:attention}#3#{}",
                },
            },
            c_cry_nstar = {
                name = "Sao Neutron",
                text = {
                    "Nâng cấp ngẫu nhiên",
                    "tay bài bất kì lên",
                    "{C:attention}1{} cấp cho mỗi lá",
                    "{C:attention}Sao Neutron{} được sử dụng",
                    "trong trận này",
                    "{C:inactive}(Hiện tại{C:attention} #1#{C:inactive}){}",
                },
            },
            c_cry_planetlua = {
                name = "Planet.lua",
                text = {
                    "{C:green}#1# trên #2#{} khả năng để",
                    "nâng cấp toàn bộ",
                    "{C:legendary,E:1}tay bài poker{}",
                    "lên {C:attention}1{} cấp",
                },
            },
            c_cry_Sydan = {
                name = "Hertta",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Thăng cấp",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "và {C:attention}#3#{}",
                },
            },
            c_cry_Timantti = {
                name = "Ruutu",
                text = {
                    "({V:1}lvl.#4#{})({V:2}lvl.#5#{})({V:3}lvl.#6#{})",
                    "Thăng cấp",
                    "{C:attention}#1#{},",
                    "{C:attention}#2#{},",
                    "và {C:attention}#3#{}",
                },
            },
            c_cry_marsmoons = {
                name = 'Phobos & Deimos',
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Thăng cấp",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Điểm nhân và",
                    "{C:chips}+#4#{} chip"
                }
            },
            c_cry_void = {
                name = 'Hư vô',
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Thăng cấp",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Điểm nhân và",
                    "{C:chips}+#4#{} chip"
                }
            },
            c_cry_asteroidbelt = {
                name = 'Vành đai tiểu hành tinh',
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Thăng cấp",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Điểm nhân và",
                    "{C:chips}+#4#{} chip"
                }
            },
            c_cry_universe = {
                name = 'Toàn bộ thực thể chết tiệt trong vũ trụ',
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Thăng cấp",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Điểm nhân và",
                    "{C:chips}+#4#{} chip"
                }
            },
	    c_cry_sunplanet = {
                name = 'Sol',
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){}",
                    "Thăng cấp sức mạnh cho",
		    "các tay bài {C:attention}Thăng thiên{} lên {X:gold,C:white}0.05{}",
		    "{C:inactive}(Hiện tại {X:gold,C:white}X(#2#^asc){C:inactive})"
                }
            },
        },
        Sleeve = {
			sleeve_cry_bountiful_sleeve = {
				name = "Bọc Phong phú",
				text = {
                    "Sau khi {C:blue}Chơi{} hoặc {C:red}Bỏ{},",
                    "luôn rút {C:attention}5{} lá bài"
				},
			},
            sleeve_cry_ccd_sleeve = {
                name = "Bọc CCD",
                text = {
                    "Every card is also",
                    "a {C:attention}random{} consumable",
                },
            },
            sleeve_cry_conveyor_sleeve = {
                name = "Bọc Băng tải",
                text = {
                    "Các Joker có thể {C:attention}không{} di chuyển được",
                    "vào đầu mỗi vòng đấu,",
                    "{C:attention}nhân đôi{} lá Joker bên phải xa nhất",
                    "và {C:attention}phá hủy{} lá Joker bên trái xa nhất",
                },
            },
            sleeve_cry_critical_sleeve = {
                name = "Bọc Thiết yếu",
                text = {
                    "Sau mỗi tay bài đã chơi,",
                    "{C:green}1 trên 4{} khả năng cho {X:dark_edition,C:white} ^2 {} Điểm nhân",
                    "{C:green}1 trên 8{} khả năng cho {X:dark_edition,C:white} ^0.5 {} Điểm nhân",
                },
            },
            sleeve_cry_encoded_sleeve = {
                name = "Bọc Được mã hóa",
                text = {
                    "Bắt đầu với lá {C:cry_code,T:j_cry_CodeJoker}Code Joker{}",
                    "và một lá {C:cry_code,T:j_cry_copypaste}Copy/Paste{}",
                    "Chỉ có lá bài {C:cry_code}Code{} xuất hiện trong cửa hàng",
                },
            },
            sleeve_cry_equilibrium_sleeve = {
                name = "Bọc Bình đẳng",
                text = {
                    "Mọi lá bài đều có",
                    "{C:attention}chung tỉ lệ{}",
                    "xuất hiện trong shop,",
                    "bắt đầu với",
                    "{C:attention,T:v_overstock_plus}+2 ô Shop",
                },
            },
            sleeve_cry_infinite_sleeve = {
                name = "Bọc Không giới hạn",
                text = {
                    "Bạn có thể chọn {C:attention}bất kì",
                    "số lượng lá bài",
                    --someone do the hand size thing for me
                },
            },
            sleeve_cry_misprint_sleeve = {
                name = "Bọc In lỗi",
                text = {
                    "Các giá trị của các lá bài",
                    "đều {C:attention}ngẫu nhiên",
                },
            },
            sleeve_cry_redeemed_sleeve = {
                name = "Bọc Đổi thưởng",
                text = {
                    "Khi một {C:attention}Voucher{} được bán,",
                    "tăng nó thêm một {C:attention}mức độ cao hơn",
                },
            },
			sleeve_cry_spooky_sleeve = {
                name = "Bọc Ma quái",
                text = {
                    "Bắt đầu với một {C:attention,T:j_cry_chocolate_dice}Xúc xắc sô cô la{} {C:eternal}Vĩnh cửu",
                    "Sau mỗi {C:attention}Ante{}, tạo một",
                    "{C:cry_candy}Kẹo{} và lá Joker bị {X:cry_cursed,C:white}Bị nguyền{}",
                }
            },
            sleeve_cry_wormhole_sleeve = {
                name = "Bọc Lỗ giun",
                text = {
                    "Bắt đầu với một lá Joker {C:cry_exotic}Sử thi{C:attention}",
                    "Các lá Joker thêm {C:attention}20X{} tỉ lệ",
                    "trở nên {C:dark_edition}Âm bản",
                    "{C:attention}-2{} Ô Joker",
                },
            },
			sleeve_cry_legendary_sleeve = {
                name = "Bọc Huyền thoại",
                text = {
                    "Start with an {C:legendary}Legendary{C:legendary} Joker",
                    "{C:green}1 in 5{} chance to create another",
					"when)Trùm cược Blind is defeated {C:inactive}(must have room){}",
                },
            },
        },
        Spectral = {
            c_cry_adversary = {
                name = "Kẻ thù",
                text = {
                    "{C:red}Tất cả{} các lá bài {C:attention}Joker{} trở thành {C:dark_edition}Âm bản{},",
                    "{C:red}Tất cả{} các lá bài {C:attention}Joker{} trong shop sẽ tốn",
                    "{C:red}gấp hai lần{} cho tới cuốt trận đấu",
                },
            },
            c_cry_analog = {
                name = "Tương tự",
                text = {
                    "Tạo {C:attention}#1#{} bản sao cho",
                    "{C:attention}Joker{} bất kỳ, phá hủy",
                    "mọi lá Joker, {C:attention}+#2#{} Ante",
                },
            },
            c_cry_chambered = {
                name = "Tạo khoang",
                text = {
                    "Tạo bản sao {C:attention}#1#{} {C:dark_edition}Âm bản{}",
                    "cho một",
                    "vật phẩm {C:attention}bất kỳ{}",
                    "thuộc quyền sở hữu của bạn",
                    "{C:inactive,s:0.8}Không sao chép Tạo khoang{}"
                },
            },
            c_cry_conduit = {
                name = "Ống chuyền",
                text = {
                    "tráo đổi {C:attention}các ấn bản{} của",
                    "{C:attention}2{} lá bài được chọn hoặc các lá {C:attention}Joker{}",
                },
            },
            c_cry_gateway = {
                name = "Cổng vào",
                text = {
                    "Tạo ngẫu nhiên một",
                    "{C:attention}Joker{} {C:cry_exotic,E:1}Sử thi{}, phá hủy",
                    "các lá Joker khác",
                },
            },
            c_cry_hammerspace = {
                name = "Búa không gian",
                text = {
                    "Thêm {C:attention}các vật phẩm{} ngẫu nhiên",
                    "như thể chúng là các {C:dark_edition}Cường hóa{}",
                    "cho các lá bài trên tay",
                },
            },
            c_cry_lock = {
                name = "Khóa",
                text = {
                    "Loại bỏ {C:red}mọi{} sticker",
                    "khỏi {C:red}mọi{} Joker,",
                    "sao đó thêm sự {C:purple,E:1}Vĩnh cửu{}",
                    "cho một {C:attention}Joker{} ngẫu nhiên",
                },
            },
            c_cry_pointer = {
                name = "POINTER://",
                text = {
                    "Tạo một lá bài",
                    "mà {C:cry_code}bạn chọn",
                    "{C:inactive,s:0.8}(trừ các lá Sử thi #1#)",
                },
            },
            c_cry_replica = {
                name = "Bản chép lại",
                text = {
                    "Chuyển đổi các lá bài",
                    "cầm trên tay",
                    "thành một lá bài {C:attention}ngẫu nhiên{}",
                    "cầm trên tay",
                },
            },
            c_cry_ritual = {
                name = "Nghi thức",
                text = {
                    "Áp dụng {C:dark_edition}Âm bản{}, {C:dark_edition}Khảm mảnh{},",
                    "hoặc {C:dark_edition}tinh tú{} thành {C:attention}#1#{}",
                    "lá bài được chọn trên tay",
                },
            },
            c_cry_source = {
                name = "Nguồn gốc",
                text = {
                    "Thêm một {C:cry_code}Con dấu xanh lá{}",
                    "vào {C:attention}#1#{} lá bài được chọn",
                    "trên tay",
                },
            },
            c_cry_summoning = {
                name = "Triệu hồi",
                text = {
                    "Tạo ngẫu nhiên một",
                    "lá {C:joker}Joker{} {C:cry_epic}Sử thi{}, phá hủy",
                    "một {C:joker}Joker{} ngẫu nhiên",
                },
            },
            c_cry_trade = {
                name = "Lái buôn",
                text = {
                    "{C:attention}Mất{} ngẫu nhiên một Voucher,",
                    "được {C:attention}2{} Voucher ngẫu nhiên",
                },
            },
            c_cry_typhoon = {
                name = "Cơn bão",
                text = {
                    "Thêm một {C:cry_azure}Dấu ấn xanh lam{}",
                    "cho {C:attention}#1#{} lá bài được chọn",
                    "trên tay",
                },
            },
            c_cry_vacuum = {
                name = "Hút bụi",
                text = {
                    "Loại bỏ {C:red}mọi {C:green}sửa đổi{}",
                    "khỏi {C:red}mọi{} lá bài cầm trên tay,",
                    "Nhận {C:money}$#1#{} mỗi {C:green}sửa đổi{} được loại bỏ",
                    "{C:inactive,s:0.7}(ví dụ. Cường hóa, Dấu ấn, Ấn bản)",
                },
            },
            c_cry_white_hole = {
                name = "Lỗ trắng",
                text = {
                    "{C:attention}Loại bỏ{} mọi lá bài có cấp độ,",
                    "nâng cấp tay bài poker {C:legendary,E:1}chơi nhiều nhất{}",
                    "lên {C:attention}3{} cho mỗi cấp độ được loại bỏ",
                },
            },
        },
        Stake = {
            stake_cry_pink = {
                name = "Stake Hồng",
                colour = "Hồng", --this is used for auto-generated sticker localization
                text = {
                    "Điểm số yêu cầu tăng nhanh hơn",
                    "với mỗi {C:attention}Ante",
                },
            },
            stake_cry_brown = {
                name = "Stake Nâu",
                colour = "Nâu",
                text = {
                    "Mọi {C:attention}sticker{} tương thích",
                    "với nhau",
                },
            },
            stake_cry_yellow = {
                name = "Stake Vàng",
                colour = "Vàng",
                text = {
                    "Các {C:attention}Sticker{} có thể xuất hiện trong",
                    "tất cả các vật phẩm có thể mua được",
                },
            },
            stake_cry_jade = {
                name = "Stake Cẩm thạch",
                colour = "Cẩm thạch",
                text = {
                    "Các lá bài được rút có thể bị {C:attention}úp mặt xuống{}",
                },
            },
            stake_cry_cyan = {
                name = "Stake Lục lam",
                colour = "Lục lam",
                text = {
                    "Các lá Joker {C:green}hiếm{} và {C:red}Quý{} đều",
                    "có thể ít xuất hiện hơn trước",
                },
            },
            stake_cry_gray = {
                name = "Stake xám",
                colour = "Xám",
                text = {
                    "Mỗi reroll sẽ tăng lên {C:attention}$2{} mỗi lần",
                },
            },
            stake_cry_crimson = {
                name = "Stake đỏ thẩm",
                colour = "Đỏ thẫm",
                text = {
                    "Các Voucher sẽ luôn hết ở {C:attention}mọi{} Ante",
                },
            },
            stake_cry_diamond = {
                name = "Stake Kim cương",
                colour = "Kim cương",
                text = {
                    "Cần đánh đến Ante thứ {C:attention}10{} để thắng",
                },
            },
            stake_cry_amber = {
                name = "Stake Hổ phách",
                colour = "Hổ phách",
                text = {
                    "{C:attention}-1{} ô Gói tăng cường",
                },
            },
            stake_cry_bronze = {
                name = "Stake Đồng",
                colour = "Đồng",
                text = {
                    "Các Voucher sẽ đắt lên {C:attention}50%{} giá trị",
                },
            },
            stake_cry_quartz = {
                name = "Stake Thạch anh",
                colour = "Thạch anh",
                text = {
                    "Các Joker có thể bị {C:attention}Ghim lại{}",
                    "{s:0.8,C:inactive}(Giữ nguyên vị trí ở bên trái nhất){}",
                },
            },
            stake_cry_ruby = {
                name = "Stake Hồng ngọc",
                colour = "Hồng ngọc",
                text = {
                    "Các tiền cược cược {C:attention}Lớn{} có thể trở thành",
                    "các {C:attention)Trùm cược{}",
                },
            },
            stake_cry_glass = {
                name = "Stake Thủy tinh",
                colour = "Thủy tinh",
                text = {
                    "Các lá bài có thể {C:attention}vỡ{} khi ghi điểm",
                },
            },
            stake_cry_sapphire = {
                name = "Stake Lam ngọc",
                colour = "Lam ngọc",
                text = {
                    "Mất {C:attention}25%{} số tiền hiện tại",
                    "vào cuối mỗi ante",
                    "{s:0.8,C:inactive}(Tối đa $10){}",
                },
            },
            stake_cry_emerald = {
                name = "Stake Ngọc lục bảo",
                colour = "Ngọc lục bảo",
                text = {
                    "Các lá bài, gói, và voucher",
                    "có thể {C:attention}úp mặt{}",
                    "{s:0.8,C:inactive}(Không thể nhìn cho tới khi mua){}",
                },
            },
            stake_cry_platinum = {
                name = "Stake Bạch kim",
                colour = "Bạch kim",
                text = {
                    "Mọi tiền cược nhỏ (small blind) {C:attention}bị loại bỏ{}",
                },
            },
            stake_cry_twilight = {
                name = "Stake Chạng Vạng",
                colour = "Chạng Vạng",
                text = {
                    "Mọi lá bài có thể giống {C:attention}Chuối tiêu{}",
                    "{s:0.8,C:inactive}(1 trên 10 khả năng bị phá hủy mỗi vòng đấu){}",
                },
            },
            stake_cry_verdant = {
                name = "Stake Xanh ngát",
                colour = "Xanh ngát",
                text = {
                    "Điểm yêu cầu tăng nhanh hơn",
                    "cho mỗi {C:attention}Ante",
                },
            },
            stake_cry_ember = {
                name = "Stake Than hồng",
                colour = "Than hồng",
                text = {
                    "Mọi vật phẩm đều vô giá trị khi bán",
                },
            },
            stake_cry_dawn = {
                name = "Stake Bình minh",
                colour = "Bình minh",
                text = {
                    "Các lá Tarot và Quang phổ nhắm mục tiêu ít hơn {C:attention}1",
                    "lá bài",
                    "{s:0.8,C:inactive}(Tối thiểu là 1){}",
                },
            },
            stake_cry_horizon = {
                name = "Stake Hoàng hôn",
                colour = "Hoàng hôn",
                text = {
                    "Khi tiền cược được chọn, thêm một",
                    "{C:attention}lá bài bất kì{} vào bộ bài",
                },
            },
            stake_cry_blossom = {
                name = "Stake Hoa",
                colour = "Hoa",
                text = {
                    "Trùm cược {C:attention}Cuối cùng{} có thể xuất hiện",
                    "ở {C:attention}bất kì{} Ante nào",
                },
            },
            stake_cry_azure = {
                name = "Stake Xanh dương nhạt",
                colour = "Xanh dương nhạt",
                text = {
                    "Mọi lá Joker đều bị suy giảm giá trị",
                    "khoảng {C:attention}20%{}",
                },
            },
            stake_cry_ascendant = {
                name = "Stake Ưu việt",
                colour = "Ưu việt",
                text = {
                    "{C:attention}-1{} ô Shop",
                },
            },
        },
        Tag = {
            tag_cry_astral = {
                name = "Nhãn tinh tú",
                text = {
                    "Ấn bản shop kế nghiệm",
                    "lá Joker sẽ miễn phí và",
                    "trở thành {C:dark_edition}Tinh tú{}",
                },
            },
            tag_cry_banana = {
                name = "Nhãn chuối tiêu",
                text = {
                    "Tạo {C:attention}#1#",
                    "{C:inactive}(Cần ô trống){}",
                },
            },
            tag_cry_bettertop_up = {
                name = "Nhãn nạp tốt hơn",
                text = {
                    "Tạo lên tới {C:attention}#1#",
                    "lá bài Joker {C:green}Hiếm{}",
                    "{C:inactive}(Cần ô trống){}",
                },
            },
            tag_cry_better_voucher = {
                name = "Nhãn Voucher Hoàng kim",
                text = {
                    "Thêm một cấp {C:attention}#1#{} Voucher",
                    "vào cửa hàng kế tiếp",
                },
            },
            tag_cry_blur = {
                name = "Nhãn mờ",
                text = {
                    "Vào cửa hàng ấn bản kế nhiệm",
                    "lá Joker sẽ miễn phí và",
                    "trở nên {C:dark_edition}Mờ ảo{}",
                },
            },
            tag_cry_booster = {
                name = "Nhãn tăng cường",
                text = {
                    "{C:cry_code}Gói tăng cường{} kế tiếp có",
                    "các lá bài được {C:attention}nhân đôi{} và",
                    "các lựa chọn cũng được {C:attention}nhân đôi{}",
                },
            },
            tag_cry_bundle = {
                name = "Nhãn gói",
                text = {
                    "Tạo một {C:attention}Nhãn tiêu chuẩn{}, {C:tarot}Nhãn bùa{},",
                    "{C:attention}Nhãn hề{}, và {C:planet}Nhãn sao băng",
                },
            },
            tag_cry_cat = {
                name = "Nhãn mèo",
                text = { "Meow.", "{C:inactive}Cấp độ {C:dark_edition}#1#" },
            },
            tag_cry_console = {
                name = "Nhãn bảng điều khiển",
                text = {
                    "Cho miễn phí một",
                    "{C:cry_code}Gói Chương trình",
                },
            },
            tag_cry_double_m = {
                name = "Nhãn M Đôi",
                text = {
                    "Shop có thêm",
                    "{C:legendary}M Joker{C:dark_edition}Vui vẻ{} ",
                },
            },
            tag_cry_empowered = {
                name = "Nhãn Uỷ quyền",
                text = {
                    "Cho miễn phí một {C:spectral}Gói Quang Phổ",
                    "cùng với {C:legendary,E:1}Lá linh hồn{} và {C:cry_exotic,E:1}Cổng vào{}",
                },
            },
            tag_cry_epic = {
                name = "Nhãn Sử thi",
                text = {
                    "Shop sẽ chỉ còn giá giảm gấp 2 lần đối với",
                    "{C:cry_epic}Joker sử thi",
                },
            },
            tag_cry_gambler = {
                name = "Nhãn Con Bạc",
                text = {
                    "{C:green}#1# trên #2#{} khả năng để tạo",
                    "một {C:cry_exotic,E:1}Nhãn Uỷ quyền",
                },
            },
            tag_cry_glass = {
                name = "Nhãn dễ vỡ",
                text = {
                    "Vào shop kế nhiệm",
                    "lá Joker sẽ miễn phí và",
                    "trở nên {C:dark_edition}Dễ vỡ{}",
                },
            },
            tag_cry_glitched = {
                name = "Nhãn nhiễu loạn",
                text = {
                    "Vào shop kế nhiệm",
                    "lá Joker sẽ miễn phí và",
                    "trở nên {C:dark_edition}Nhiễu loạn{}",
                },
            },
            tag_cry_gold = {
                name = "Nhãn hoàng kim",
                text = {
                    "Vào shop kế nhiệm",
                    "Lá Joker sẽ miễn phí và",
                    "trở thành {C:dark_edition}Hoàng kim{}",
                },
            },
            tag_cry_gourmand = {
                name = "Nhãn tham ăn",
                text = {
                    "Shop sẽ miễn phí",
                    "{C:attention}Joker đồ ăn",
                },
            },
            tag_cry_loss = {
                name = "Mất mát",
                text = {
                    "Bố thí một",
                    "{C:cry_ascendant}Gói Meme",
                },
            },
            tag_cry_m = {
                name = "Nhãn Vui vẻ",
                text = {
                    "Vào cửa hàng kế nhiệm",
                    "lá Joker sẽ miễn phí và",
                    "trở thành {C:dark_edition}Vui vẻ{}",
                },
            },
            tag_cry_memory = {
                name = "Nhãn kí ức",
                text = {
                    "Tạo {C:attention}#1#{} bản sao của",
                    "{C:attention}Nhãn{} cuối cùng đã sử dụng",
                    "trong trận đấu này",
                    "{s:0.8,C:inactive}Ngoại trừ nhãn sao chép",
                    "{s:0.8,C:inactive}Hiện tại: {s:0.8,C:attention}#2#",
                },
            },
            tag_cry_mosaic = {
                name = "Nhãn khảnh mảnh",
                text = {
                    "Vào cửa hàng kế nhiệm",
                    "Các lá Joker sẽ miễn phí",
                    "và trở thành {C:dark_edition}Khảnh mảnh{}",
                },
            },
            tag_cry_oversat = {
                name = "Nhãn quá bão hòa",
                text = {
                    "Vào cửa hàng kế nhiệm",
                    "Các lá Joker sẽ miễn phí",
                    "và trở thành {C:dark_edition}Quá bão hòa{}",
                },
            },
            tag_cry_quadruple = {
                name = "Nhãn Bốn lần",
                text = {
                    "Tạo {C:attention}#1#{} bản sao của",
                    "{C:attention}Nhãn{} lựa chọn kế nhiệm",
                    "{s:0.8,C:inactive}Nhãn sao chép được loại trừ",
                },
            },
            tag_cry_quintuple = {
                name = "Nhãn Năm lần",
                text = {
                    "Tạo {C:attention}#1#{} bản sao của",
                    "{C:attention}Nhãn{} lựa chọn kế nhiệm",
                    "{s:0.8,C:inactive}Nhãn sao chép được loại trừ",
                },
            },
            tag_cry_rework = {
                name = "Nhãn tái khởi động",
                text = {
                    "Shop có một",
                    "{C:dark_edition}#1# {C:cry_code}#2#",
                },
            },
            tag_cry_schematic = {
                name = "Nhãn sơ đồ",
                text = {
                    "Shop có một",
                    "{C:attention}Động não",
                },
            },
            tag_cry_scope = {
                name = "Nhãn phạm vi",
                text = {
                    "{C:attention}+#1# {C:blue}tay bài{} và",
                    "{C:red}lượt bỏ{} vào vòng kế tiếp",
                },
            },
            tag_cry_triple = {
                name = "Nhãn gấp ba",
                text = {
                    "Tạo {C:attention}#1#{} bản sao của",
                    "{C:attention}Nhãn{} lựa chọn kế nhiệm",
                    "{s:0.8,C:inactive}Nhãn sao chép được loại trừ",
                },
            },
        },
        Tarot = {
            c_cry_automaton = {
                name = "Máy tự động hóa",
                text = {
                    "Tạo lên tới {C:attention}#1#",
                    "lá bài {C:cry_code}Code{} ngẫu nhiên",
                    "{C:inactive}(Cần ô trống)",
                },
            },
            c_cry_eclipse = {
                name = "Nhật thực",
                text = {
                    "Cải tiến {C:attention}#1#{} lá bài được chọn",
                    "trở thành một {C:attention}Lá bài Vọng",
                },
            },
            c_cry_meld = {
                name = "Meld",
                text = {
                    "Chọn một lá {C:attention}Joker{} hoặc",
                    "{C:attention}Lá bài đang chơi{} để",
                    "trở thành {C:dark_edition}Hai mặt",
                },
            },
            c_cry_theblessing = {
                name = "Phước lành",
                text = {
                    "Tạo {C:attention}1{}",
                    "{C:attention}vật phẩm tiêu thụ{} ngẫu nhiên",
                    "{C:inactive}(Cần ô trống){}",
                },
            },
	    c_cry_seraph = {
                name = "Thiên thần Seraph",
                text = {
                    "Tăng cường {C:attention}#1#{} lá bài được chọn",
                    "thành một {C:attention}Lá bài Dạ Quang",
                },
            },
        },
        Voucher = {
            v_cry_asteroglyph = {
                name = "Khắc họa tinh vân",
                text = {
                    "Thiết lập Ante về {C:attention}#1#{}",
                },
		unlock = {
                    'Tới Ante thứ {C:attention}36'
                },
            },
            v_cry_blankcanvas = {
                name = "Tấm vải trắng",
                text = {
                    "{C:attention}+#1#{} kích thức tay",
                },
		unlock = {
                    'Giảm {C:attention}kích thước tay{} của bạn',
                    'về {C:attention}0'
                },
            },
            v_cry_clone_machine = {
                name = "Máy tạo bản sao",
                text = {
                    "Nhãn nhân đôi trở thành",
                    "{C:attention}Nhãn gấp năm{} và",
                    "{C:attention}4X{} như bình thường",
                },
            },
            v_cry_command_prompt = {
                name = "Command Prompt",
                text = {
                    "Các lá bài {C:cry_code}Code{}",
                    "có thể xuất hiện",
                    "trong {C:attention}shop{}",
                },
            },
            v_cry_copies = {
                name = "Sao chép",
                text = {
                    "Nhãn nhân đôi trở thành",
                    "{C:attention}Nhãn gấp ba{} và",
                    "{C:attention}2X{} như bình thường",
                },
            },
            v_cry_curate = {
                name = "Giám tuyển",
                text = {
                    "Mọi lá bài",
                    "xuất hiện cùng với",
                    "một {C:dark_edition}Ấn bản{}",
                },
		unlock = {
                    "Khám phá",
                    'toàn bộ {C:attention}Ấn bản'
                },
            },
            v_cry_dexterity = {
                name = "Khéo léo",
                text = {
                    "Vĩnh viễn",
                    "nhận {C:blue}+#1#{} tay bài",
                    "mỗi vòng đấu",
                },
		unlock = {
                    "Chơi tổng cộng {C:attention}5000{}",
                    '{C:attention}Các lá bài đang chơi{}',
                },
            },
            v_cry_double_down = {
                name = "Đôi dưới",
                text = {
                    "Sau mọi vòng đấu,",
                    "{X:dark_edition,C:white} X1.5 {} cho tổng các giá trị",
                    "vào mặt sau của các lá bài",
                    "{C:dark_edition}Hai mặt"
                },
            },
            v_cry_double_slit = {
                name = "Đôi khe",
                text = {
                    "{C:attention}Meld{} có thể suất hiện",
                    "trong shop hoặc",
                    "Gói Arcana",
                },
            },
            v_cry_double_vision = {
                name = "Đôi tầm nhìn",
                text = {
                    "Các lá bài {C:dark_edition}Hai mặt{} xuất hiện",
                    "{C:attention}4X{} lần thường xuyên hơn",
                },
            },
            v_cry_fabric = {
                name = "Đài phổ thông",
                text = {
                    "{C:dark_edition}+#1#{} Ô lá Joker",
                },
		unlock = {
                    '{C:dark_edition}Phản vật chất{} được tặng thêm',
                    '{C:attention}10{} lần'
                },
            },
            v_cry_massproduct = {
                name = "Tăng sản lượng",
                text = {
                    "Mọi lá bài và gói",
                    "trong shop tốn thêm {C:attention}$1{}",
                },
		unlock = {
                    "Nhận {C:attention}25",
                    '{C:attention}Voucher',
                    'trong một màn chơi'
                },
            },
            v_cry_moneybean = {
                name = "Cây đậu tiền",
                text = {
                    "Tăng lợi tức lãi suất",
                    "kiếm được ở mỗi vòng chơi",
                    "lên {C:money}$#1#{}",
                },
		unlock = {
                    "Tối đa hóa",
                    '{C:attention}lợi tức nhận được{}',
                    'cho mỗi {C:attention}toàn bộ cuộc chơi',
                },
            },
            v_cry_overstock_multi = {
                name = "Hàng tồn kho",
                text = {
                    "{C:attention}+#1#{} ô thẻ bài,",
                    "{C:attention}+#1#{} ô gói tăng cường,",
                    "and {C:attention}+#1#{} ô voucher,",
                    "luôn luôn có tại shop",
                },
		unlock = {
                    "Chi tiêu khoảng {C:attention}1000$",
                    'trong shop',
                    'trong một cuộc chơi'
                },
            },
            v_cry_pacclimator = {
                name = "Thiết bị thích nghi hành tinh",
                text = {
                    "Các lá {C:planet}Hành tinh{} xuất hiện",
                    "{C:attention}X#1#{} thường xuyên hơn",
                    "trong shop",
                    "Mọi lá bài {C:planet}Hành tinh{} sau này",
                    "sẽ {C:green}miễn phí{}",
                },
		unlock = {
                    "Mua tổng {C:attention}100{}",
                    'lá bài {C:planet}Hành tinh',
                    'trong shop',
                },
            },
            v_cry_pairamount_plus = {
                name = "Pairamount Plus",
                text = {
                    "{C:attention}Tái kích hoạt{} mọi lá M Joker",
                    "cho tất cả Đôi",
                    "{C:attention}có trong{} tay bài đã chơi",
                },
            },
            v_cry_pairing = {
                name = "Đang Đôi",
                text = {
                    "{C:attention}Tái kích hoạt{} mọi lá M Joker",
                    "nếu tay chơi là một {C:attention}Đôi",
                },
            },
            v_cry_quantum_computing = {
                name = "Máy tính lượng tử",
                text = {
                    "Các lá bài {C:cry_code}Code{} có thể xuất hiện",
                    "cùng với ấn bản {C:dark_edition}Âm bản{}",
                },
            },
            v_cry_repair_man = {
                name = "Người sửa chữa",
                text = {
                    "{C:attention}Tái kích hoạt{} mọi lá M Joker",
                    "nếu chơi tay bài có chứa một {C:attention}Đôi",
                },
            },
            v_cry_rerollexchange = {
                name = "Buôn Reroll",
                text = {
                    "Mọi reroll",
                    "tốn {C:attention}$2{}",
                },
		unlock = {
                    "{C:attention}Reroll{} shop",
                    'tổng cộng',
                    '{C:attention}250 lần{}',
                    'trong một trận đấu'
                },
            },
            v_cry_satellite_uplink = {
                name = "Đường lên vệ tinh",
                text = {
                    "Các lá bài {C:cry_code}Code{} có thể",
                    "xuất trong những",
                    "{C:attention}Gói thiên thể{}",
                },
            },
            v_cry_scope = {
                name = "Phạm vi thiên hà",
                text = {
                    "Tạo một lá bài {C:planet}Hành tinh",
                    "cho mỗi",
                    "{C:attention}tay poker{} đã chơi",
                    "{C:inactive}(Cần ô trống){}",
                },
		unlock = {
                    "Sử dụng tổng cộng {C:attention}50{}",
                    'lá bài {C:planet}Hành tinh{} trong',
                    '{C:attention}Các gói tăng cường{}',
                    'trong một trận đấu'
                },
            },
            v_cry_tacclimator = {
                name = "Tarot thích nghi",
                text = {
                    "Các lá bài {C:tarot}Tarot{} xuất hiện",
                    "{C:attention}X#1#{} thường xuyên hơn",
                    "trong shop",
                    "Mọi lá {C:tarot}Tarot{} sau này",
                    "đều sẽ {C:green}miễn phí{}",
                },
		unlock = {
                    "Mua tổng cộng {C:attention}100{} lá bài {C:tarot}Tarot",
                    'trong shop',
                },
            },
            v_cry_tag_printer = {
                name = "Nhãn Máy in",
                text = {
                    "Nhãn nhân đôi trở thành",
                    "{C:attention}Nhãn gấp bốn{} và",
                    "{C:attention}3X{} như bình thường",
                },
            },
            v_cry_threers = {
                name = "3 R",
                text = {
                    "Vĩnh viễn",
                    "Nhận {C:red}+#1#{} lượt bỏ(s)",
                    "mỗi vòng đấu",
                },
		unlock = {
                    "Bỏ tổng cộng {C:attention}5000{}",
                    '{C:attention}Lá bài đang chơi{}',
                },
            },
            v_cry_stickyhand = {
                name = "Tay nhớt dính",
                text = {
                    "{C:attention}+#1#{} giới hạn chọn lá bài",
                },
            },
            v_cry_grapplinghook = {
                name = "Móc vật lộn",
                text = {
                    "{C:attention}+#1#{} giới hạn chọn lá bài",
                    "{C:inactive,s:0.7}Bây có thể làm được nhiều thứ hơn so với bây nghĩ đó{}",
                },
            },
            v_cry_hyperspacetether = {
                name = "Liên dẫn không gian siêu tốc",
                text = {
                    "{C:attention}+#1#{} giới hạn chọn lá bài",
                    "Tất cả lá bài được chọn đều",
                    "trở thành {C:attention}Bàn tay thăng thiên{}",
                },
            },
        },
        Other = {
            banana = {
                name = "Chuối tiêu",
                text = {
                    "{C:green}#1# trên #2#{} khả năng sẽ",
                    "bị phá hủy mỗi vòng đấu",
                },
            },
            cry_absolute = {
                name = "Tuyệt đối",
                text = {
                    "Không thể bán",
                    "hoặc phá hủy",
                    "{C:attention}Không thể ruồng bỏ{}",
                },
            },
            cry_rigged = {
                name = "Gian lận",
                text = {
                    "Mọi xác suất {C:cry_code}được liệt kê ra{}",
                    "đều {C:cry_code}đảm bảo",
                },
            },
            cry_hooked = {
                name = "Đã kết nối",
                text = {
                    "Khi lá Joker này được {C:cry_code}Kích hoạt{},",
                    "kích hoạt {C:cry_code}#1#",
                },
            },
            cry_flickering = {
                name = "Nhấp nháy",
                text = {
                    "Bị phá hủy sau khi",
                    "{C:attention}#1#{} Kích hoạt",
                    "{C:inactive}({C:attention}#2#{C:inactive} còn lại)"
                },
            },
            cry_flickering_desc = { --used by choco dice
                name = "Nhấp nháy",
                text = {
                    "Bị phá hủy sau khi",
                    "{C:attention}#1#{} Kích hoạt",
                },
            },
            cry_possessed = {
                name = "Chiếm hữu",
                text = {
                    "{C:attention}Vô hiệu hóa{} và {C:attention}đảo ngược{}",
                    "hiệu ứng, nếu có thể",
                    "Bị phá hủy cùng {C:attention}Ma"
                },
            },
            --todo? add candy jokers to list
            food_jokers = {
                name = "Các lá Joker đồ ăn",
                text = {
                    "{s:0.8}Chuối Gros Michel, Trứng, Cà Rem, Chuối Cavendish,",
                    "{s:0.8}Đậu đen, Cola không đường, Bỏng ngô, Ramen,",
                    "{s:0.8}Nước có ga, Dưa chuột, Ớt Chili cay, Caramel,",
                    "{s:0.8}Kẹo cổ đại, M thức ăn nhanh, etc.",
                },
            },
            ev_cry_choco0 = {
                name = "",
                text = {
                    "Chi tiết về một hoạt động",
                    "{C:cry_ascendant,E:1}sự kiện{} sẽ xuất hiện ở đây"
                }
            },
            ev_cry_choco1 = {
                name = "1: Sự chiếm hữu",
                text = {
                    "Các lá {C:attention}Joker{} những lá bài đang chơi có một",
                    "{C:green}1 trên 3{} cơ hội đạt được Nhấp nháy",
                    "Tạo một {C:attention}Ma",
                    "{C:inactive,s:0.7}Bạn đã bị ma ám và",
                    "{C:inactive,s:0.7}ý thức nhấp nháy lúc vào lúc ra."
                }
            },
            ev_cry_choco2 = {
                name = "2: Nhà bị ám",
                text = {
                    "Không thể bỏ qua {C:attention}tiền cược{} ở thời điểm hiện tại",
                    "Một lần {C:attention}reroll{} được cho phép cho mỗi shop",
                    "{C:attention}Voucher{} giá cả gấp đôi",
                    "{C:inactive,s:0.7}Những linh hồn ma quái đã chiếm lấy! Đừng chạm vào",
                    "{C:inactive,s:0.7}bất cứ điều gì và thoát ra càng sớm càng tốt!",
                }
            },
            ev_cry_choco3 = {
                name = "3: Bình pha chế của phù thủy",
                text = {
                    "Tạo 3 {C:attention}Bình thuốc",
                    "Sử dụng nó vào cuối mỗi {C:attention}Cược nhỏ(gà nhỏ){},",
                    "hoặc {C:attention}mọi{} suy nhược sẽ bị áp dụng vào mỗi {C:attention}Ante",
                    "{C:inactive,s:0.7}Bạn đã bị một phù thủy bắt cóc!",
                    "{C:inactive,s:0.7}Bà ta đưa cho bạn ba lọ thuốc và theo dõi bạn một cách chặt chẽ.",
                    "{C:inactive,s:0.7}Hãy chọn một, nếu không bà ta sẽ quyết định thay bạn.",
                }
            },
            ev_cry_choco4 = {
                name = "4: Nguyệt vực",
                text = {
                    "Các lá bài đã chơi có {C:green}1 trên 4{} khả năng",
                    "để biến thành lá bài hình chất {C:club}Chuồn{}",
                    "Chia {C:attention}Điểm nhân{} cho số lượng lá bài hình đã chơi",
                    "{C:inactive,s:0.7}Ngay cả một người đàn ông có trái tim trong sáng",
                    "{C:inactive,s:0.7}và cầu nguyện vào ban đêm..."
                }
            },
            ev_cry_choco5 = {
                name = "5: Bú máu",
                text = {
                    "Xóa bỏ các {C:attention}Nâng cấp{} của mọi lá bài đã chơi",
                    "{C:green}1 trên 3{} khả năng bị phá hủy",
                    "các lá bài {C:heart}Cơ{} và {C:diamond}Rô{}",
                    "{C:inactive,s:0.7}Hãy cảnh giác vào lúc nửa đêm, vì",
                    "{C:inactive,s:0.7,E:1}chúng ở trong bóng tối{C:inactive,s:0.7} tìm cách giải cơn khát của chúng..."
                }
            },
            ev_cry_choco6 = {
                name = "6: Làm ơn chọn một",
                text = {
                    "Tại {C:attention}cuối mỗi vòng{}, mở một",
                    "gói {C:attention}Tăng cường{} ngẫu nhiên",
                    "{C:inactive,s:0.7}Khi bạn đi dạo trên phố, bạn phát hiện ra một",
                    "{C:inactive,s:0.7}hộp nhiều gói Booster Pack khác nhau. Tốt nhất là nên lấy một gói!"
                }
            },
            ev_cry_choco7 = {
                name = "7: Không khí lễ hội",
                text = {
                    "Tạo 3 {C:attention}Cho kẹo hay bị ghẹo{} và 1 {C:attention}Giỏ kẹo",
                    "Các shop có một {C:attention}Cho kẹo hay bị ghẹo{} tại mỗi vòng chơi",
                    "{C:cry_candy}Các viên kẹo{} cho {C:money}$3{} nếu nhận được",
                    "{C:inactive,s:0.7}Toàn bộ khu phố được trang trí cho những hoạt động ma quái,",
                    "{C:inactive,s:0.7}hãy đến và tận hưởng không khí lễ hội!"
                }
            },
            ev_cry_choco8 = {
                name = "8: Mưa kẹo",
                text = {
                    "Khi {C:attention}tiền cược{} bị đánh bại, nhận 1 {C:cry_candy}viên kẹo{}",
                    "sau mỗi tay còn lại; Nhận một lá {C:attention}Joker đồ ăn{}",
                    "khi mà một {C:cry_candy}Viên kẹo{} được tạo ra",
                    "{C:inactive,s:0.7}Kẹo rơi từ trên trời xuống! Nhanh lên,",
                    "{C:inactive,s:0.7,E:1}hãy lấy càng nhiều càng tốt!"
                }
            },
            ev_cry_choco9 = {
                name = "9: Sự giàu có ma quái",
                text = {
                    "Nhận được {C:money}$20",
                    "Mọi {C:money}số tiền{} kiếm được sẽ {C:attention}nhân đôi",
                    "{C:inactive,s:0.7}Bóng ma của một người họ hàng đã mất từ lâu của bạn",
                    "{C:inactive,s:0.7}ghé thăm bạn vào lúc nửa đêm!",
                    "{C:inactive,s:0.7}Không nói một lời, họ đặt một túi tiền vào tay bạn,",
                    "{C:inactive,s:0.7}mỉm cười nồng nhiệt và vẫy tay khi họ tan biến vào không khí.",
                }
            },
            ev_cry_choco10 = {
                name = "10: Đồ cổ được tôn kính",
                text = {
                    "Một lá {C:attention}Joker{} {C:legendary}Huyền thoại{} xuất hiện",
                    "trong ô {C:attention}Voucher{} với {C:money}$50",
                    "Chỉ có thể mua được vật phẩm {C:attention}cuối cùng{} trong shop",
                    "{C:inactive,s:0.7}Bạn đã thu hút sự chú ý của tinh linh thánh tích,",
                    "{C:inactive,s:0.7}nhưng sẽ không dễ để dập tắt.",
                }
            },
            cry_https_disabled = {
                name = "M",
                text = {
                    "{C:attention,s:0.7}Nâng cấp{s:0.7} bị vô hiệu hóa bởi mặc định ({C:attention,s:0.7}HTTPS Module{s:0.7})",
                },
            },
            --i am so sorry for this
            --actually some of this needs to be refactored at some point
            cry_eternal_booster = {
                name = "Vĩnh cửu",
                text = {
                    "Mọi lá bài trong gói",
                    "đều {C:attention}Vĩnh cửu{}",
                },
            },
            cry_perishable_booster = {
                name = "Dễ hỏng",
                text = {
                    "Mọi lá bài trong gói",
                    "đều {C:attention}Dễ hỏng{}",
                },
            },
            cry_rental_booster = {
                name = "Cho thuê",
                text = {
                    "Mọi lá bài trong gói",
                    "đều {C:attention}Cho thuê{}",
                },
            },
            cry_pinned_booster = {
                name = "Đã ghim",
                text = {
                    "Mọi lá bài trong gói",
                    "đều {C:attention}Đã ghim{}",
                },
            },
            cry_banana_booster = {
                name = "Chuối tiêu",
                text = {
                    "Mọi lá bài trong gói",
                    "đều {C:attention}Chuối tiêu{}",
                },
            },
            cry_eternal_voucher = {
                name = "Vĩnh cửu",
                text = {
                    "Không thể trao đổi",
                },
            },
            cry_perishable_voucher = {
                name = "Dễ hỏng",
                text = {
                    "Suy yếu sau khi",
                    "{C:attention}#1#{} vòng",
                    "{C:inactive}({C:attention}#2#{C:inactive} còn lại)",
                },
            },
            cry_rental_voucher = {
                name = "Cho thuê",
                text = {
                    "Mất {C:money}$#1#{} tại",
                    "cuối mỗi vòng đấu",
                },
            },
            cry_pinned_voucher = {
                name = "Đã ghim",
                text = {
                    "Luôn có trong shop",
                    "cho tới khi được lấy",
                },
            },
            cry_banana_voucher = {
                name = "Chuối tiêu",
                text = {
                    "{C:green}#1# trên #2#{} khả năng",
                    "không được chuộc lại mỗi vòng",
                },
            },
            cry_perishable_consumeable = {
                name = "Dễ hỏng",
                text = {
                    "Suy yếu tại",
                    "cuối mỗi vòng đấu",
                },
            },
            cry_rental_consumeable = {
                name = "Cho thuê",
                text = {
                    "Mất {C:money}$#1#{} tại cuối mỗi",
                    "vòng đấu và khi sử dụng",
                },
            },
            cry_pinned_consumeable = {
                name = "Đã ghim",
                text = {
                    "Không thể dùng",
                    "những vật phẩm {C:attention}Đã ghim{} khác",
                },
            },
            cry_banana_consumeable = {
                name = "Chuối tiêu",
                text = {
                    "{C:green}#1# trên #2#{} khả năng",
                    "không có gì để dùng",
                },
            },
            p_cry_code_normal_1 = {
                name = "Gói Chương trình",
                text = {
                    "Chọn {C:attention}#1#{} trong tối đa",
                    "{C:attention}#2#{C:cry_code} lá bài Code{}",
                },
            },
            p_cry_code_normal_2 = {
                name = "Gói Chương trình",
                text = {
                    "Chọn {C:attention}#1#{} trong tối đa",
                    "{C:attention}#2#{C:cry_code} lá bài Code{}",
                },
            },
            p_cry_code_jumbo_1 = {
                name = "Jumbo Program Pack",
                text = {
                    "Chọn {C:attention}#1#{} trong tối đa",
                    "{C:attention}#2#{C:cry_code} lá bài Code{}",
                },
            },
            p_cry_code_mega_1 = {
                name = "Mega Program Pack",
                text = {
                    "Chọn {C:attention}#1#{} trong tối đa",
                    "{C:attention}#2#{C:cry_code} lá bài Code{}",
                },
            },
            p_cry_empowered = {
                name = "Gói Quang Phổ [Nhãn Uỷ quyền]",
                text = {
                    "Chọn {C:attention}#1#{} trong tối đa",
                    "{C:attention}#2#{C:spectral} lá bài Quang phổ",
                    "{s:0.8,C:inactive}(Được tạo bởi nhãn Uỷ quyền)",
                },
            },
            p_cry_meme_1 = {
                name = "Gói Meme",
                text = {
                    "Chọn {C:attention}#1#{} trong tối đa",
                    "{C:attention}#2# Các lá meme Joker{}",
                },
            },
            p_cry_meme_two = {
                name = "Gói Meme",
                text = {
                    "Chọn {C:attention}#1#{} trong tối đa",
                    "{C:attention}#2# Các lá meme Joker{}",
                },
            },
            p_cry_meme_three = {
                name = "Gói Meme",
                text = {
                    "Chọn {C:attention}#1#{} trong tối đa",
                    "{C:attention}#2# Các lá meme Joker{}",
                },
            },
            undiscovered_code = {
                name = "Chưa được khám phá",
                text = {
                    "Mua hoặc sử dụng",
                    "lá bài này",
                    "trong trận đấu chưa khám phá ra để",
                    "để học nó là cái gì"
                }
            },
            undiscovered_unique = {
                name = "Chưa được khám phá",
                text = {
                    "Mua hoặc sử dụng",
                    "lá bài này",
                    "trong trận đấu chưa khám phá ra để",
                    "để học nó là cái gì"
                }
            },
            cry_green_seal = {
                name = "Ấn xanh lá",
                text = {
                    "Tạo một lá {C:cry_code}Code{}",
                    "khi chơi và không tính điểm",
                    "{C:inactive}(Cần ô trống",
                },
            },
            cry_azure_seal = {
                name = "Ấn xanh dương nhạt",
                text = {
                    "Tạo {C:attention}#1#{} {C:dark_edition}Âm bản{}",
                    "{C:planet}Hành tinh{} cho mỗi",
                    "{C:attention}tay poker{} được chơi, sau đó",
                    "{C:red}phá hủy{} lá bài này",
                },
            },
            blurred_sdm0 = {
                name = "a",
                text = {
                    "{C:inactive,s:0.8}\"Tôi ghét lá bài này\" - SDM_0, 2024{}",
                },
            },
        },
        Unique = {
            c_cry_potion = {
                name = "Lọ thuốc",
                text = {
                    "Áp dụng một",
                    "{C:attention}căn bệnh ác tính{} tiềm ẩn khi sử dụng",
                    "{C:inactive,s:0.7}Nhận được từ Xúc xắc Sô cô la"
                }
            }
        }
    },
    misc = {
        poker_hands = {
            ['cry_Bulwark'] = "Bờ Lũy",
            ['cry_Clusterfuck'] = "Mớ chết tiệt",
            ['cry_UltPair'] = "Đôi tối thượng",
            ['cry_WholeDeck'] = "Đệch mịa điên vãi loz toàn bộ luôn",
        },
        poker_hand_descriptions = {
            ['cry_Bulwark'] = {
                '5 lá bài không có thứ hạng, không có chất',
            },
            ['cry_Clusterfuck'] = {
                'Ít nhất 8 lá bài không chứa',
                'Đôi, Đồng chất hoặc Sảnh',
            },
            ['cry_UltPair'] = {
                'Hai Hai Đôi là khi ',
                'có hai bộ đôi khác nhau',
				'mỗi bộ đôi thuộc một chất khác nhau.',
            },
            ['cry_WholeDeck'] = {
                'Một bàn tay chứa đựng mọi thứ',
                'lá bài tìm thấy trong bộ bài 52 lá.',
                'Bây điên mịa rồi?',
            },
        },
        achievement_names = {
            ach_cry_ace_in_crash = "ÁT bỏ túi",
            ach_cry_blurred_blurred_joker = "tiền cược hợp pháp",
            ach_cry_bullet_hell = "Bullet Hell",
            ach_cry_break_infinity = "Phá vỡ vô thời hạn",
            ach_cry_cryptid_the_cryptid = "Cryptid the Cryptid",
            ach_cry_exodia = "Di cư",
            ach_cry_freak_house = "Ngôi nhà kỳ dị",
            ach_cry_googol_play_pass = "Googol Play Pass",
            ach_cry_haxxor = "H4xx0r",
            ach_cry_home_realtor = "Nhà môi giới bất động sản",
            ach_cry_jokes_on_you = "Đùa giỡn với bạn đấy, bạn ơi!",
            ach_cry_niw_uoy = "!iốr gnằht yáM",
            ach_cry_now_the_fun_begins = "Cuộc vui giờ mới bắt đầu.",
            ach_cry_patience_virtue = "Kiên nhẫn là một đức tính tốt",
            ach_cry_perfectly_balanced = "Perfectly Balanced",
            ach_cry_pull_request = "Pull Request",
            ach_cry_traffic_jam = "Tắc đường",
            ach_cry_ult_full_skip = "Skip đầy đủ tối thượng",
            ach_cry_used_crash = "Tao đã bảo mầy đừng làm vậy rồi mà",
            ach_cry_what_have_you_done = "LÀM CÁI CON KHỈ GÌ THẾ?!",
        },
        achievement_descriptions = {
            ach_cry_ace_in_crash = 'check_for_unlock({type = "ace_in_crash"})',
            ach_cry_blurred_blurred_joker = "Nhận một Joker mờ mờ trồng chất",
            ach_cry_bullet_hell = "Có 15 AP Joker",
            ach_cry_break_infinity = "Có 1,79e308 Chip trong một ván bài",
            ach_cry_cryptid_the_cryptid = "Use Cryptid on Cryptid",
            ach_cry_exodia = "Có 5 lá Joker sử thi",
            ach_cry_freak_house = "Chơi một tay bài Thùng cù lũ gồm các lá 6 và 9 của chất Tim trong khi sở hữu Nice.",
            ach_cry_googol_play_pass = "Rig a Googol Play Card",
            ach_cry_haxxor = "Dùng cheat code",
            ach_cry_home_realtor = "Kích hoạt Happy House trước Ante 8 (không sử dụng DoE/Antimatter).",
            ach_cry_jokes_on_you = "Kích hoạt hiệu ứng của The Joke trên Ante 1 và chiến thắng lượt chơi.",
            ach_cry_niw_uoy = "Đạt mức Ante -8.",
            ach_cry_now_the_fun_begins = "Thu được Canvas",
            ach_cry_patience_virtue = "Chờ hết Lavender Loop trong 2 phút trước khi chơi ván bài đầu tiên và thắng cược blind.",
            ach_cry_perfectly_balanced = "Thắng bộ bài Rất Công Bằng trên Cược Ưu việt",
            ach_cry_pull_request = "Yêu cầu ://COMMIT tạo lại cùng một lá Joker mà nó đã phá hủy.",
            ach_cry_traffic_jam = "Đánh bại mọi thử thách Rush thời gian,
            ach_cry_ult_full_skip = "Thắng trong 1 vòng",
            ach_cry_used_crash = "Dùng ://CRASH",
            ach_cry_what_have_you_done = "Phá hủy hoặc hi sinh một Joker Kì lạ",
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
            cry_set_features = "Features",
            cry_set_music = "Nhạc",
            cry_set_enable_features = "Chọn features để đáp ứng (áp dụng khi khởi động lại trò chơi):",
            cry_feat_achievements = "Thành tựu",
            ["cry_feat_antimatter deck"] = "Bộ bài phản vật chất",
            cry_feat_blinds = "Tiền cược",
            cry_feat_challenges = "Thử thách",
            ["cry_feat_code cards"] = "Bài Code",
            ["cry_feat_misc. decks"] = "Bộ bài đa dạng",
            ["cry_feat_https module"] = "HTTPS Module",
            ["cry_feat_timer mechanics"] = "Cơ chế hẹn giờ",
            ["cry_feat_enhanced decks"] = "Bộ bài nâng cao",
            ["cry_feat_epic jokers"] = "Joker Sử thi",
            ["cry_feat_exotic jokers"] = "Joker Kì lạ",
            ["cry_feat_m jokers"] = "Joker M",
            cry_feat_menu = "Menu chính tùy chỉnh",
            ["cry_feat_misc."] = "Đa dạng",
            ["cry_feat_misc. jokers"] = "Joker đa dạng",
            cry_feat_planets = "Các hành tinh",
            cry_feat_jokerdisplay = "JokerDisplay (Không làm gì cả)",
            cry_feat_tags = "Nhãn",
            cry_feat_sleeves = "Bọc",
            cry_feat_spectrals = "Quang phổ",
            cry_feat_spooky = "Update Oái ăm",
            ["cry_feat_more stakes"] = "Stake",
            cry_feat_vouchers = "Voucher",
            cry_mus_jimball = "Jimball (Funkytown by Lipps Inc. - Copyrighted)",
            cry_mus_code = "Code Cards (://LETS_BREAK_THE_GAME by HexaCryonic)",
            cry_mus_exotic = "Exotic Jokers (Joker in Latin by AlexZGreat)",
            cry_mus_high_score = "High Score (Final Boss [For Your Computer] by AlexZGreat)",

            k_cry_program_pack = "Gói Chương trình",
            k_cry_meme_pack = "Gói Meme",

            cry_critical_hit_ex = "Đòn chí mạng!",
            cry_critical_miss_ex = "Đòn chí hụt!",

            cry_potion1 = "-1 cho tất cả các cấp độ tay bài",
            cry_potion2 = "X1.15 kích thước Tiền cược",
            cry_potion3 = "-1 Tay bài và Lượt bỏ",

            cry_debuff_oldhouse = "Không cù lũ",
            cry_debuff_oldarm = "Chỉ dùng 4 bài hoặc ít hơn",
            cry_debuff_oldpillar = "Không sảnh",
            cry_debuff_oldflint = "Không thùng",
            cry_debuff_oldmark = "Không lá bài nào có chứa đôi",
            cry_debuff_obsidian_orb = "Áp dụng khả năng của tất cả các trùm đã bị đánh bại",

            cry_tax_placeholder = "(X0.4 tiền cược yêu cầu)",
            cry_joke_placeholder = "(hệ số nhân lên 8)",

            k_code = "Code",
            k_unique = "Độc Quyền",
            b_code_cards = "Bài Code",
            b_unique_cards = "Bài Độc Quyền",
            b_pull = "PULL",
            cry_hooked_ex = "Đã kết nối!",
            k_end_blind = "Kết thúc tiền cược",

            cry_code_rank = "NHẬP XẾP HẠNG",
            cry_code_enh = "NHẬP CẢI TIẾN",
            cry_code_hand = "NHẬP TAY POKER",
            cry_code_enter_card = "NHẬP MỘT LÁ",
            cry_code_apply = "ÁP DỤNG",
            cry_code_apply_previous = "ÁP DỤNG TRƯỚC ĐÓ",
            cry_code_exploit = "KHAI THÁC",
            cry_code_exploit_previous = "KHAI THÁC TRƯỚC ĐÓ",
            cry_code_create = "TẠO",
            cry_code_create_previous = "TẠO TRƯỚC ĐÓ",
            cry_code_execute = "THỰC HIỆN",
            cry_code_cancel = "HỦY BỎ",

            b_flip = "LẬT LẠI",
            b_merge = "HỢP NHẤT",

            cry_hand_bulwark = "Bờ lũy",
            cry_hand_clusterfuck = "Mớ chết tiệt",
            cry_hand_ultpair = "Đôi tối thượng",

            cry_asc_hands = "Asc. Hands",
            cry_p_star = "Sao",

            cry_again_q = "Lại nữa?",
            cry_curse = "Nguyền rủa",
            cry_curse_ex = "Nguyền rủa!",
            cry_sobbing = "Cứu tui...",
            cry_gaming = "Gaming",
            cry_gaming_ex = "Gaming!",
            cry_good_luck_ex = "Chúc may mắn!",
            cry_sus_ex = "Impostor!",
            cry_jolly_ex = "Vui lên nào!",
            cry_m_minus = "m",
            cry_m = "M",
            cry_m_ex = "M!",
            cry_minus_round = "-1 Vòng đấu",
            cry_plus_cryptid = "+1 Cryptid",
            cry_plus_card = "+1 Lá bài",
            cry_plus_code = "+1 Code",
            cry_no_triggers = "Không còn kích hoạt!",
            cry_unredeemed = "Chưa được đổi...",
            cry_active = "Hoạt động",
            cry_inactive = "Dừng hoạt động",

            k_disable_music = "Tắt nhạc",

            k_cry_epic = "Sử thi",
            k_cry_exotic = "Kì lạ",
            k_cry_candy = "Kẹo",
            k_cry_cursed  = "Đã nguyền rủa",
            k_planet_disc = "Đĩa tiền hành tinh",
            k_planet_satellite = "Vệ tinh tự nhiên",
            k_planet_universe = "Toàn bộ vũ trụ chết tiệt",

            cry_notif_jimball_1 = "Jimball",
            cry_notif_jimball_2 = "Copyright Notice",
            cry_notif_jimball_d1 = "Jimball plays the song \"Funkytown\",",
            cry_notif_jimball_d2 = "which is copyrighted and can't be",
            cry_notif_jimball_d3 = "used for streams and videos.",
        },
        labels = {
            food_jokers = "Joker Đồ ăn",
            banana = "Chuối",
            cry_absolute = "Tuyệt đối",
            code = "Code",
            unique = "Độc nhất",
            cry_rigged = "Gian lận",
            cry_hooked = "Đã kết nối",
            cry_flickering = "Nhấp nháy",
            cry_possessed = "Bị chiếm hữu",

            cry_green_seal = "Con dấu xanh lá",
            cry_azure_seal = "Con dấu xanh dương nhạt",

            cry_astral = "Tinh tú",
            cry_blur = "Mờ ảo",
            cry_double_sided = "Hai mặt",
            cry_glass = "Dễ vỡ",
            cry_glitched = "Nhiễu loạn",
            cry_gold = "Hoàng kim",
            cry_m = "Vui vẻ",
            cry_mosaic = "Khảm mảnh",
            cry_noisy = "Ồn ào",
            cry_oversat = "Quá bão hòa",

            k_cry_epic = "Sử thi",
            k_cry_exotic = "Kì lạ",
            k_cry_candy = "Kẹo",
            k_cry_cursed  = "Bị nguyền",
        },
        rnj_loc_txts = {
            stats = {
                plus_mult = { "{C:red}+#2#{} Điểm nhân" },
                plus_chips = { "{C:blue}+#2#{} Chip" },
                x_mult = { "{X:red,C:white} X#2#{} Điểm nhân" },
                x_chips = { "{X:blue,C:white} X#2#{} Chip" },
                h_size = { "{C:attention}+#2#{} Kích thước tay bài" },
                money = { "{C:money}+$#2#{} bán ra" },
            },
            stats_inactive = {
                plus_mult = { "{C:inactive}(Hiện tại {C:red}+#1#{C:inactive} Điểm nhân)" },
                plus_chips = { "{C:inactive}(Hiện tại {C:blue}+#1#{C:inactive} Chip)" },
                x_mult = { "{C:inactive}(Hiện tại {X:red,C:white} X#1# {C:inactive} Điểm nhân)" },
                x_chips = { "{C:inactive}(Hiện tại {X:blue,C:white} X#1# {C:inactive} Chip)" },
                h_size = { "{C:inactive}(Hiện tại {C:attention}+#1#{C:inactive} Kích thước tay bài)" },
                money = { "{C:inactive}(Hiện tại {C:money}+$#1#{C:inactive})" },
            },
            actions = {
                make_joker = { "Tạo {C:attention}#2# Joker{}" },
                make_tarot = { "Tạo {C:attention}#2#{C:tarot} lá bài Tarot{}" },
                make_planet = { "Tạo {C:attention}#2#{C:planet} lá bài Hành tinh{}" },
                make_spectral = { "Tạo {C:attention}#2#{C:spectral} lá bài Quang Phổ{}" },
                add_dollars = { "Nhận {C:money}$#2#{}" },
            },
            contexts = {
                open_booster = { "khi một {C:attention}Gói tăng cường{} được mở" },
                buying_card = { "khi một card được bán" },
                selling_self = { "khi lá bài này được bán" },
                selling_card = { "khi một lá bài được bán" },
                reroll_shop = { "đang reroll" },
                ending_shop = { "vào cuối mỗi {C:attention}shop{}" },
                skip_blind = { "khi một {C:attention}tiền cược{} bị skip" },
                skipping_booster = { "khi một {C:attention}gói tăng cường{} bị skip" },
                playing_card_added = { "mỗi lần một {C:attention}lá bài đang chơi{} được thêm vào bộ bài của bạn" },
                first_hand_drawn = { "khi vòng đấu bắt đầu" },
                setting_blind = { "khi {C:attention}Tiền cược{} được chọn" },
                remove_playing_cards = { "khi một lá bài bị phá hủy" },
                using_consumeable = { "khi một lá bài {C:attention}tiêu thụ{} được sử dụng" },
                debuffed_hand = { "nếu chơi {C:attention}tay bài{} không được phép" },
                pre_discard = { "trước mỗi lượt bỏ" },
                discard = { "cho mỗi lượt bỏ" },
                end_of_round = { "vào cuối mỗi {C:attention}vòng đấu{}" },
                individual_play = { "cho mỗi lá bài được ghi điểm" },
                individual_hand_score = { "cho mỗi lá bài cầm trên tay trong khi tính điểm" },
                individual_hand_end = { "cho mỗi lá bài cầm trên tay vào cuối mỗi {C:attention}vòng đấu{}" },
                repetition_play = { "Tái kích hoạt lá bài đã chơi" },
                repetition_hand = { "Tái kích hoạt lá bài cầm trên tay" },
                other_joker = { "mỗi lá {C:attention}Joker{}" },
                before = { "trước mỗi {C:attention}tay bài{}" },
                after = { "sau mỗi {C:attention}tay bài{}" },
                joker_main = {},
            },
            conds = {
                buy_common = { "nếu như nó là  {C:attention}Joker{} {C:blue}Thường{}" },
                buy_uncommon = { "nếu như nó là  {C:attention}Joker{} {C:green}Hiếm{}" },
                tarot = { "nếu lá bài là một lá {C:tarot}Tarot{}" },
                planet = { "nếu lá bài là một lá {C:planet}Planet{}" },
                spectral = { "nếu lá bài là một lá {C:spectral}Spectral{}" },
                joker = { "nếu lá bài là một lá {C:attention}Joker{}" },
                suit = { "nếu lá bài là một lá {V:1}#3#{}" },
                rank = { "nếu lá bài có bậc là {C:attention}#3#{}" },
                face = { "nếu lá bài là một lá {C:attention}face{} card" },
                boss = { "nếu {C:attention}tiền cược{} là một {C:attention}Trùm {C:attention}Cược{}" },
                non_boss = { "nếu {C:attention}tiền cược{} không phải là một {C:attention}Trùm {C:attention}Cược{}" },
                small = { "nếu {C:attention}tiền cược{} là một {C:attention}Cược {C:attention}Nhỏ{}" },
                big = { "nếu {C:attention}tiền cược{} là một {C:attention}Cược {C:attention}Lớn{}" },
                first = { "nếu nó là {C:attention}tay bài {C:attention}đầu tiên{}" },
                last = { "nếu nó là {C:attention}tay bài {C:attention}cuối cùng{}" },
                common = { "nếu như nó là {C:attention}Joker{} {C:blue}Thường{}" },
                uncommon = { "nếu như nó là {C:attention}Joker{} {C:green}Hiếm{}" },
                rare = { "nếu như nó là  {C:attention}Joker{} {C:red}Quý{}" },
                poker_hand = { "nếu như nó là {C:attention}#3#{}" },
                or_more = { "nếu tay bài có chứa {C:attention}#3#{} hoặc nhiều hơn lá bài" },
                or_less = { "nếu tay bài có chứa {C:attention}#3#{} hoặc ít hơn lá bài" },
                hands_left = { "nếu #3# {C:blue}tay bài{} còn lại ở cuối vòng" },
                discards_left = { "nếu #3# {C:red}lượt bỏ{} còn lại ở cuối vòng" },
                first_discard = { "nếu nó là {C:attention}lượt bỏ {C:attention}đầu tiên{}" },
                last_discard = { "nếu nó là {C:attention}lượt bỏ {C:attention}cuối cùng{}" },
                odds = { "cùng với {C:green}#4# {C:green}trên {C:green}#3#{} khả năng" },
            },
        },
        v_dictionary = {
            a_xchips = {"X#1# Chip"},
            a_powmult = {"^#1# Điểm nhân"},
            a_powchips = {"^#1# Chip"},
            a_powmultchips = {"^#1# Điểm nhân+Chip"},
            a_round = {"+#1# Vòng"},
            a_candy = {"+#1# Kẹo"},
            a_xchips_minus = {"-X#1# Chip"},
            a_powmult_minus = {"-^#1# Điểm nhân"},
            a_powchips_minus = {"-^#1# Chip"},
            a_powmultchips_minus = {"-^#1# Điểm nhân+Chip"},
            a_round_minus = {"-#1# Vòng"},

            a_tag = {"#1# Nhãn"},
            a_tags = {"#1# Nhãn"},

            cry_sticker_name = {"#1# Sticker"},
            cry_sticker_desc = {
                "Đã dùng lên Joker này",
                "để thắng trên #2##1#",
                "#2#Stake#3# Độ khó"
            },

            cry_art = {"Art: #1#"},
            cry_code = {"Code: #1#"},
            cry_idea = {"Idea: #1#"}
        },
        v_text = {
            ch_c_cry_all_perishable = {"Mọi lá Joker đều {C:eternal}Dễ hỏng{}"},
            ch_c_cry_all_rental = {"Mọi lá Joker đều {C:eternal}Cho thuê{}"},
            ch_c_cry_all_pinned = {"Mọi lá Joker đều {C:eternal}Đã ghim{}"},
            ch_c_cry_all_banana = {"Mọi lá Joker đều {C:eternal}Chuối tiêu{}"},
            ch_c_all_rnj = {"Mọi lá Joker đều {C:attention}RNJoker{}"},
            ch_c_cry_sticker_sheet_plus = {"Tất cả các mặt hàng có thể mua đều có sticker"},
            ch_c_cry_rush_hour = {"Mọi trùm cược đều {C:attention}Đồng hồ{} hoặc {C:attention}Vòng oải hương"},
            ch_c_cry_rush_hour_ii = {"Mọi tiền cược là {C:attention)Trùm cược{}"},
            ch_c_cry_rush_hour_iii = {"{C:attention}Đồng hồ{} và {C:attention}Vòng oải hương{} mở rộng quy mô nhanh {C:attention}gấp đôi{}"},
            ch_c_cry_no_tags = {"Skip đã bị {C:attention}vô hiệu hóa{}"},
            ch_c_cry_no_vouchers = {"{C:attention}Các Voucher{} không còn xuất hiện trong shop"},
            ch_c_cry_no_boosters = {"{C:attention}Các Gói tăng cường{} không còn xuất hiện trong shop"},
            ch_c_cry_no_rerolls = {"Reroll bị {C:attention}vô hiệu hóa{}"},
            ch_c_cry_no_consumables = {"{C:attention}Vật phẩm tiêu thụ{} không còn xuất hiện"}
        },
        -- Thanks to many members of the community for contributing to all of these quips!
        -- There's too many to credit so just go here: https://discord.com/channels/1116389027176787968/1209506360987877408/1237971471146553406
        -- And here: https://discord.com/channels/1116389027176787968/1219749193204371456/1240468252325318667
        very_fair_quips = {
            { "L", "KHÔNG CÓ PHIẾU ƯU ĐÃI", "CHO BẠN" },
            { "BOZO", "BẠN NGHĨ RẰNG TÔI SẼ", "CHO BẠN PHIẾU ƯU ĐÃI SAO?" },
            { "NOPE!", "KHÔNG CÓ PHIẾU ƯU ĐÃI Ở ĐÂY!", "(PHIÊN BẢN SLUMPAGE)" },
            { "VẤN ĐỀ KỸ NĂNG", "HÃY THỬ GIỎI ĐỦ ĐỂ", "NHẬN PHIẾU ƯU ĐÃI" },
            { "JIMBO", "TỪ BAN QUẢN LÝ", "QUÊN BỔ SUNG HÀNG" },
            { "OOPS!", "KHÔNG CÓ PHIẾU ƯU ĐÃI", "" },
            { "BẠN LÀ MỘT TRÒ HỀ,", "TẠI SAO BẠN NHÌN", "SANG ĐÂY? LOL" },
            { "PHIẾU ƯU ĐÃI", "ĐANG Ở", "MỘT TÒA LÂU ĐÀI KHÁC" },
            { "$0", "PHIẾU TRỐNG", "(HIỂU CHỨ?)" },
            { "LỖI", "KHÔNG THỂ TÍNH TOÁN TRÊN GIÁ TRỊ NIL", "(tier4vouchers.lua)" },
            { "GIẢM GIÁ 100%", "CHO TẤT CẢ PHIẾU ƯU ĐÃI", "(AI ĐÓ ĐÃ MUA HẾT RỒI)" },
            { "THỬ LẠI SAU", "GỢI Ý: BẠN CŨNG KHÔNG", "CÓ ĐỦ TIỀN ĐÂU" },
            { "HẢ?", '"PHIẾU ƯU ĐÃI"?', "ĐÓ THẬM CHÍ KHÔNG PHẢI LÀ TỪ ĐÚNG..." },
            { 'NHẤN "R"', "ĐỂ BỔ SUNG", "TẤT CẢ PHIẾU ƯU ĐÃI" },
            { "BẠN CÓ BIẾT KHÔNG?", "NHẤN ALT+F4", "ĐỂ NHẬN PHIẾU ƯU ĐÃI MIỄN PHÍ!" },
            { "XIN LỖI,", "KHÔNG CÓ PHIẾU ƯU ĐÃI", "DO CẮT GIẢM NGÂN SÁCH" },
            { "GỌI 1-600-JIMBO", "ĐỂ ĐÁNH GIÁ", "TRẢI NGHIỆM PHIẾU ƯU ĐÃI" },
            { "ĐÁNH BẠI", "ANTE 39 TRÙM CƯỢC", "ĐỂ BỔ SUNG HÀNG" },            
            { "TRÒ ẢO THUẬT", "TÔI ĐÃ LÀM CHO PHIẾU ƯU ĐÃI NÀY", "BIẾN MẤT" },
            { "TẠI SAO", "PHIẾU ƯU ĐÃI LẠI GIỐNG", "MỘT BÀN VIẾT?" },
            { "CHÚNG TÔI ĐÃ THU HỒI", "PHIẾU CỦA BẠN, CHÚNG SẼ ĐƯỢC", "SỬ DỤNG TỐT HƠN TRONG CÁC LƯỢT KHÁC" },
            { "TẠI SAO HỌ GỌI ĐÓ LÀ PHIẾU", "KHI ĐÃ LÀM MÁT CÁI NÓNG", "VÀ ĂN CON CHIP LẠNH?" },
            { "XIN LỖI", "PHIẾU ĐANG GẶP SỰ CỐ", "VOUCHIFIA ABORTUS" },
            { "THẬT KHÔNG MAY", "BẢN CẬP NHẬT VOUCHRX REWRITE", "ĐÃ BỊ HỦY" },
            { "ĐÁNH BẠI", "TRÙM BLIND", "ĐỂ KHÔNG THAY ĐỔI GÌ CẢ" },
            { "CHIM ĐANG HÓT", "HOA ĐANG NỞ", "NHỮNG ĐỨA TRẺ NHƯ BẠN..." },
            { "CHÚNG TÔI XIN THÔNG BÁO", "TẤT CẢ PHIẾU ĐÃ BỊ THU HỒI", "DO NGUY CƠ NHIỄM SALMONELLA" },
            { "PHIẾU KHÔNG THỂ ĐẾN", "DO BỐ CỤC CỬA HÀNG", "VƯỢT NGÂN SÁCH 200%" },
            { "BẠN THÍCH", "MUA PHIẾU, PHẢI KHÔNG?", "BẠN LÀ NGƯỜI MUA PHIẾU" },
            { "PHIẾU ƯU ĐÃI", "!E", "HỒ BƠI PHIẾU ƯU ĐÃI" },
            { "KHÔNG CÓ", "PHIẾU", "Ở ĐÂY" },
            { "KHÔNG CÓ", "ÔNG GIÀ NOEL", "VÀ KHÔNG CÓ PHIẾU ƯU ĐÃI" },
            { "", "KHÔNG PHIẾU?", "" },
            { "BẠN", "VỪA THUA", "TRÒ CHƠI" },
            { "TÔI CÓ THỂ ĐỀ XUẤT", "MỘT QUẢ TRỨNG TỐT", "TRONG THỜI GIAN KHÓ KHĂN NÀY KHÔNG?" },
            { "RA NGOÀI CHƠI", "THAY VÌ DÙNG", "BỘ BÀI NÀY" },
            { "BẠN CÓ THỂ", "ĐANG CHƠI BỘ BÀI XANH", "NGAY BÂY GIỜ" },
            { "ĐỒ MIỄN PHÍ", "LẤY NGAY TRƯỚC KHI", "QUÁ MUỘN (hết hàng)" },
            { "CHỨNG MINH BẠN ĐÚNG", "BẰNG CÁCH MUA", "PHIẾU VÔ HÌNH VỚI GIÁ 10 USD" },
            { "", "không có phiếu?", "" },
            { "THẤY QUẢNG CÁO NÀY?", "NẾU CÓ, NÓ ĐANG HOẠT ĐỘNG", "VÀ BẠN CÓ THỂ SỞ HỮU NÓ" },
            { "BẠN ĐANG BỎ LỠ", "ÍT NHẤT 5 PHIẾU ƯU ĐÃI", "tonktonktonktonktonk" },
            { "10", "20 KHÔNG PHIẾU XD", "30 GOTO 10" },
            { "PHIẾU ƯU ĐÃI", "LÀ TÍNH NĂNG CAO CẤP", "MỞ KHÓA VỚI 199,99 JOLLARS" },
            { "THỰC SỰ KHÔNG CÓ PHIẾU!?!?", "CHỈ DÀNH CHO CƯỢC TĂNG DẦN", "BỘ BÀI RẤT CÔNG BẰNG" },
            { "BẠN CÓ HÀI LÒNG VỚI", "TRẢI NGHIỆM PHIẾU ƯU ĐÃI? ĐÁNH GIÁ", "5 SAO TRÊN JESTELP" },
            { "PHIẾU MIỄN PHÍ", "PHIẾU NÓNG GẦN BẠN", "LẤY PHIẾU NHANH VỚI MẸO NÀY" },
            { "GIỚI THIỆU", "PHIẾU CẤP 0 ĐẦU TIÊN!", "(sắp ra mắt trong Cryptid 1.0)" },
            { "MỘT PHIẾU!", "NÓ CHỈ LÀ TƯỞNG TƯỢNG", "CHÚNG TÔI TƯỞNG BẠN MUỐN CÓ NÓ" },            
            { "TẮT TRÌNH CHẶN QUẢNG CÁO", "NẾU KHÔNG CÓ QUẢNG CÁO, CHÚNG TÔI KHÔNG THỂ", "BÁN PHIẾU CHO BẠN" },
            { "NẾU BẠN CÓ", "VẤN ĐỀ VỚI VIỆC NÀY", "HÃY GỬI EMAIL ĐẾN NORESPONSE@JMAIL.COM" },
            { "KHÔNG ĐỦ TIỀN", "ĐỂ MUA PHIẾU NÀY", "VẬY TẠI SAO CHÚNG TÔI LẠI ĐẶT NÓ Ở ĐÂY?" },
            { "MUỐN MỘT PHIẾU ƯU ĐÃI?", "VẬY IM ĐI", "BẠN KHÔNG THỂ CÓ ĐÂU LOL" },
            { "^$%& KHÔNG", "PHIẾU ^%&% %&$^% CHO", "$%&%%$ %&$&*%$^ BẠN" },
            { "MỘT PHIẾU (TIN TƯỞNG)", "|\\/|", "|/\\|" },            
            {
                "... --- ...",
                ".--. .-.. .- -.-- . .-. -.. . -.-. --- -.. . -.. -- --- .-. ... .",
                "-.-. --- -.. . - --- ..-. .. -. -.. .- ...- --- ..- -.-. .... . .-.",
            },
            { "CHẠY > MỚI", "NHÌN CHẰM CHẰM VÀO HƯ KHÔNG", "TRONG MỘT HOẶC HAI TIẾNG" },
            { "CHÚNG TÔI RẤT XIN LỖI", "NGƯỜI TRƯỚC HOẢNG LOẠN MUA HẾT", "TẤT CẢ CÁC PHIẾU" },
            { "CẢM GIÁC NHƯ", "MUA ĐƯỢC", "KHÔNG PHIẾU" },
            { "JIMBO QUAY TRÚNG MẶT 1", "VÀ NÉM TẤT CẢ", "PHIẾU VÀO HỐ" },
            { "THỬ TRUY CẬP", "THÀNH PHẦN 'PHIẾU'", "(MỘT GIÁ TRỊ NULL)" },
            {
                "ÔI BẠN THẬT SỰ NGHĨ RẰNG ĐỌC HẾT TẤT CẢ NHỮNG DÒNG NÀY SẼ MANG PHIẾU CỦA BẠN TRỞ LẠI Ư?",
                "RẤT TIẾC PHẢI NÓI VỚI BẠN RẰNG, BỘ BÀI NÀY KHÔNG CHỨA NHỮNG PHIẾU MÀ BẠN ĐANG TÌM KIẾM.",
                "VĂN BẢN DÀI MỘT CÁCH BẤT THƯỜNG NÀY CÓ MẶT Ở ĐÂY CHỈ ĐỂ LÃNG PHÍ THỜI GIAN VÀ NỖ LỰC CỦA BẠN KHI ĐỌC NÓ.",
            },
            { "TRUY CẬP", "https://youtu.be/p7YXXieghto", "ĐỂ NHẬN PHIẾU MIỄN PHÍ" },            
        }
    }
}
