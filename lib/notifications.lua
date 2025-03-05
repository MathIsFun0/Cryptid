-- notifications.lua - Adds notification system for Cryptid

function Cryptid.notification_overlay(key)
	if not G.SETTINGS.cryptid_notifs then -- I want this to be across profiles
		G.SETTINGS.cryptid_notifs = {}
	end
	if not G.SETTINGS.cryptid_notifs[key] then
		G.E_MANAGER:add_event(
			Event({
				trigger = "immediate",
				no_delete = true,
				func = function()
					if not G.OVERLAY_MENU then
						G.SETTINGS.paused = true
						G.FUNCS.overlay_menu({
							definition = create_UIBox_cryptid_notif(key),
						})
						play_sound("foil1", 0.7, 0.3)
						play_sound("gong", 1.4, 0.15)
						G.SETTINGS.cryptid_notifs[key] = true
						G:save_settings()
						return true
					end
				end,
			}),
			"unlock"
		)
	end
end

function create_UIBox_cryptid_notif(key)
	local t = create_UIBox_generic_options({
		padding = 0,
		back_label = localize("b_continue"),
		no_pip = true,
		snap_back = true,
		back_func = "continue_unlock",
		minw = 4.5,
		contents = {
			{
				n = G.UIT.R,
				config = { align = "cm", padding = 0 },
				nodes = {
					{
						n = G.UIT.R,
						config = { align = "cm", padding = 0.1 },
						nodes = {
							{
								n = G.UIT.R,
								config = { align = "cm", padding = 0.1 },
								nodes = {
									{
										n = G.UIT.R,
										config = { align = "cm", padding = 0 },
										nodes = {
											{
												n = G.UIT.O,
												config = {
													object = DynaText({
														string = { localize("cry_notif_" .. key .. "_1") },
														colours = { G.C.BLUE },
														shadow = true,
														rotate = true,
														bump = true,
														pop_in = 0.3,
														pop_in_rate = 2,
														scale = 1.2,
													}),
												},
											},
										},
									},
									{
										n = G.UIT.R,
										config = { align = "cm", padding = 0 },
										nodes = {
											{
												n = G.UIT.O,
												config = {
													object = DynaText({
														string = { localize("cry_notif_" .. key .. "_2") },
														colours = { G.C.RED },
														shadow = true,
														rotate = true,
														bump = true,
														pop_in = 0.6,
														pop_in_rate = 2,
														scale = 0.8,
													}),
												},
											},
										},
									},
								},
							},
							{
								n = G.UIT.R,
								config = { align = "cm", padding = 0.2 },
								nodes = {
									{
										n = G.UIT.R,
										config = {
											align = "cm",
											padding = 0.05,
											emboss = 0.05,
											colour = G.C.WHITE,
											r = 0.1,
										},
										nodes = {
											Cryptid.notifications[key].nodes(),
										},
									},
								},
							},
						},
					},
					Cryptid.notifications[key].cta and {
						n = G.UIT.R,
						config = {
							id = "overlay_menu_back_button",
							align = "cm",
							minw = 2.5,
							padding = 0.1,
							r = 0.1,
							hover = true,
							colour = G.C.BLUE,
							button = "notif_" .. key,
							shadow = true,
							focus_args = { nav = "wide", button = "b" },
						},
						nodes = {
							{
								n = G.UIT.R,
								config = { align = "cm", padding = 0, no_fill = true },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											text = localize(Cryptid.notifications[key].cta.label),
											scale = 0.5,
											colour = G.C.UI.TEXT_LIGHT,
											shadow = true,
											func = "set_button_pip",
											focus_args = { button = "b" },
										},
									},
								},
							},
						},
					} or nil,
				},
			},
		},
	})
	return t
end

-- I couldn't figure out how to fully use localization for this, so this implementation is pretty scuffed
Cryptid.notifications = {
	jimball = {
		nodes = function()
			return {
				n = G.UIT.R,
				config = {
					align = "cm",
					colour = empty and G.C.CLEAR or G.C.UI.BACKGROUND_WHITE,
					r = 0.1,
					padding = 0.04,
					minw = 2,
					minh = 0.8,
					emboss = not empty and 0.05 or nil,
					filler = true,
				},
				nodes = {
					{
						n = G.UIT.R,
						config = { align = "cm", padding = 0.03 },
						nodes = {
							{
								n = G.UIT.R,
								config = { align = "cm", padding = 0 },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											text = localize("cry_notif_jimball_d1"),
											scale = 0.5,
											colour = G.C.BLACK,
										},
									},
								},
							},
							{
								n = G.UIT.R,
								config = { align = "cm", padding = 0 },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											text = localize("cry_notif_jimball_d2"),
											scale = 0.5,
											colour = G.C.BLACK,
										},
									},
								},
							},
							{
								n = G.UIT.R,
								config = { align = "cm", padding = 0 },
								nodes = {
									{
										n = G.UIT.T,
										config = {
											text = localize("cry_notif_jimball_d3"),
											scale = 0.5,
											colour = G.C.BLACK,
										},
									},
								},
							},
						},
					},
				},
			}
		end,
		cta = {
			label = "k_disable_music",
		},
	},
}
