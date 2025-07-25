require("sound-util")
local RememberNoUnderscores = "RTHatches"

data:extend({
{
	type = "collision-layer",
	order = "51",
	name = RememberNoUnderscores
},

{
type = "simple-entity-with-owner",
name = "HatchRT",
icon = renaiIcons .. "hatch_icon.png",
icon_size = 64,
flags = {"placeable-neutral", "player-creation"},
collision_mask = {layers={[RememberNoUnderscores]=true}},
collision_box = {{-0.35, -0.3}, {0.35, 0.55}},
selection_box = {{-0.25, -0.25}, {0.25, 0.25}},
selection_priority = 255,
dying_explosion = "iron-chest-explosion",
minable = {mining_time = 0.2, result = "HatchRT"},
render_layer = "under-elevated",
picture =
	{
		filename = renaiEntity .. "hatch/hatch.png",
		width = 64,
		height = 64,
		scale = 0.5
	}
},

{ --------- The hatch item -------------
	type = "item",
	name = "HatchRT",
	icon = renaiIcons .. "hatch_icon.png",
	icon_size = 64,
	subgroup = "RT",
	order = "f",
	place_result = "HatchRT",
	stack_size = 50
},

{ --------- The hatch recipe ----------
	type = "recipe",
	name = "HatchRT",
	enabled = false,
	energy_required = 1,
	ingredients =
		{
			{type="item", name="pipe-to-ground", amount=1},
			{type="item", name="pipe", amount=1},
			{type="item", name="copper-plate", amount=2}
		},
	results = {
		{type="item", name="HatchRT", amount=1}
	}
},

------------------ Ejector hatch ---------------------
{
	type = "inserter",
	name = "RTThrower-EjectorHatchRT",
	icon = renaiIcons .. "EjeectorIccon.png",
	icon_size = 64,
	flags = {"placeable-neutral", "player-creation"},
	collision_mask = {layers={[RememberNoUnderscores]=true}},
	collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
	selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
	selection_priority = 255,
	dying_explosion = "iron-chest-explosion",
	minable = {mining_time = 0.2, result = "RTThrower-EjectorHatchRT"},
	render_layer = "under-elevated",
	filter_count = 5,
	energy_source =
	{
		type = "electric",
		usage_priority = "secondary-input",
		drain = "0.4kW"
	},
	--[[working_sound = {
	  match_progress_to_activity = true,
	  sound =
	  {
	    variations = sound_variations(renaiSounds .. "pop", 15, 0.8, {volume_multiplier("main-menu", 2), volume_multiplier("tips-and-tricks", 1.8)}),
	    audible_distance_modifier = 0.8
	  },
	},]]
	energy_per_movement = "5kJ",
	energy_per_rotation = "5kJ",
	extension_speed = 0.03,
	rotation_speed = 0.014,
	pickup_position = {0, -0.2},
	insert_position = {0, 19.9},
	--starting_distance 
	allow_custom_vectors = false,
	chases_belt_items = false,
	draw_held_item = false,
	hand_base_picture = emptypic,
	hand_open_picture = emptypic,
	hand_closed_picture = emptypic,



	--[[hand_base_picture =
	{
		filename = "__base__/graphics/entity/inserter/inserter-hand-base.png",
		priority = "extra-high",
		width = 32,
		height = 136,
		scale = 0.25
	},
	hand_closed_picture =
	{
		filename = "__base__/graphics/entity/inserter/inserter-hand-closed.png",
		priority = "extra-high",
		width = 72,
		height = 164,
		scale = 0.25
	},
	hand_open_picture =
	{
		filename = "__base__/graphics/entity/inserter/inserter-hand-open.png",
		priority = "extra-high",
		width = 72,
		height = 164,
		scale = 0.25
	},]]

	--integration_patch_render_layer = "air-object",
	platform_picture =
	{
		sheet =
		{
			filename = renaiEntity .. "hatch/EjectorHatch.png",
			priority = "extra-high",
			width = 96,
			height = 96,
			scale = 0.5
		}
	},
	circuit_wire_connection_points = circuit_connector_definitions["inserter"].points,
	circuit_connector_sprites = circuit_connector_definitions["inserter"].sprites,
	circuit_wire_max_distance = inserter_circuit_wire_max_distance,
	default_stack_control_input_signal = inserter_default_stack_control_input_signal
},

{ --------- The ejector hatch item -------------
	type = "item",
	name = "RTThrower-EjectorHatchRT",
	icon = renaiIcons .. "EjeectorIccon.png",
	icon_size = 64,
	subgroup = "RT",
	order = "f",
	place_result = "RTThrower-EjectorHatchRT",
	stack_size = 50
},

{ --------- The ejector hatch recipe ----------
	type = "recipe",
	name = "RTThrower-EjectorHatchRT",
	enabled = false,
	energy_required = 1,
	ingredients =
	{
		{type="item", name="HatchRT", amount=1},
		{type="item", name="RTBouncePlate", amount=1},
		{type="item", name="electronic-circuit", amount=2}
	},
	results = {
		{type="item", name="RTThrower-EjectorHatchRT", amount=1}
	}
},
---------- sprites because inserters dont render above a lot of things
{
	type = "animation",
	name = "EjectorHatchFrames",
	filename = renaiEntity .. "hatch/EjectorHatch.png",
	size = 96,
	frame_count = 4,
	line_length = 4,
	animation_speed = 0.1,
	scale = 0.5
},

})
