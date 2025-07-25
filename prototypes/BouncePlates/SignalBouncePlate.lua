local ConnectionPoints =
		{
			shadow =
			{
				red = util.by_pixel(12, 14),
				green = util.by_pixel(5, 14)
			},
			wire =
			{
				red = util.by_pixel(11, 13),
				green = util.by_pixel(5, 12)
			}
		}

data:extend({

	{ --------- Bounce plate entity --------------
		type = "constant-combinator",
		name = "SignalBouncePlate",
		icon = renaiIcons .. "SignalPlateIconn.png",
		icon_size = 64,
		flags = {"placeable-neutral", "player-creation", "hide-alt-info"},
		minable = {mining_time = 0.2, result = "SignalBouncePlate"},
		max_health = 200,
			collision_box = {{-0.25, -0.25}, {0.25, 0.25}}, --{{-0.35, -0.35}, {0.35, 0.35}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fast_replaceable_group = "bouncers",
		item_slot_count = 18,
		circuit_wire_max_distance = 9,
		sprites = 
			{
			layers =
				{
					{
						filename = renaiEntity .. "SignalBouncePlate/Plate_shadow.png",
						priority = "medium",
						width = 66,
						height = 76,
						shift = util.by_pixel(8, -0.5),
						draw_as_shadow = true,
						scale = 0.5
					},
					{
						filename = renaiEntity .. "SignalBouncePlate/SignalPlate.png",
						priority = "medium",
						width = 66,
						height = 76,
						shift = util.by_pixel(-0.5, -0.5),
						scale = 0.5
					}
				}
			},
		activity_led_sprites = emptypic,
		activity_led_light_offsets =
		{
			{0.296875, -0.40625},
			{0.25, -0.03125},
			{-0.296875, -0.078125},
			{-0.21875, -0.46875}
		},
		circuit_wire_connection_points =
		{
			ConnectionPoints,
			ConnectionPoints,
			ConnectionPoints,
			ConnectionPoints
		},
		radius_visualisation_specification =
			{
				sprite = 
					{
						filename = "__RenaiTransportation__/graphics/testalt2.png",
						size = 1280
					},
				draw_on_selection = true,
				distance = 10
			}
	},
	
	{ --------- The Bounce plate item -------------
		type = "item",
		name = "SignalBouncePlate",
		icon = renaiIcons .. "SignalPlateIconn.png",
		icon_size = 64,
		subgroup = "RT",
		order = "a-c",
		place_result = "SignalBouncePlate",
		stack_size = 50
	},
	
	{ --------- The Bounce plate recipe ----------
		type = "recipe",
		name = "SignalBouncePlate",
		enabled = false,
		energy_required = 1,
		ingredients = 
			{
				{type="item", name="constant-combinator", amount=1},
				{type="item", name="RTBouncePlate", amount=1}
			},
		results = {
			{type="item", name="SignalBouncePlate", amount=1}
		}
	},
	
	{ --------- bounce effect ----------
		type = "optimized-particle",
		name = "SignalBouncePlateParticle",
		life_time = 8,	
		render_layer = "higher-object-above",
		pictures =
			{
				filename = renaiEntity .. "SignalBouncePlate/SignalParticle.png",
				--width = 64,
				--height = 64,
				size = 32,
				priority = "extra-high",
				line_length = 4, -- frames per row
				frame_count = 4, -- total frames
				animation_speed = 0.5
			}
	}
})	