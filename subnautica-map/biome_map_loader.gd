class_name BiomeLoader extends RefCounted

static func load_biomes() -> Array[BiomeInfo]:
	var biome_colours: Dictionary[Color, BiomeInfo] = {}
	var biome_map: Image = preload("res://biome-map.png").get_image()
	var map_width: int = biome_map.get_width()
	var map_height: int = biome_map.get_height()
	for x in map_width:
		for y in map_height:
			var pixel_value = biome_map.get_pixel(x,y)
			if pixel_value in biome_colours.keys():
				biome_colours[pixel_value].set_pixel_to_biome(x,y)
			else:
				biome_colours[pixel_value] = BiomeInfo.new(map_width, map_height)
	var out_biomes: Array[BiomeInfo]
	for biome in biome_colours.values():
		out_biomes.append(biome)
	out_biomes.remove_at(0)
	return out_biomes
