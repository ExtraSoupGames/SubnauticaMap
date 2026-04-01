class_name BiomeLoader extends RefCounted

static func load_biomes() -> Array[BiomeInfo]:
	var biome_colours: Dictionary[Color, BiomeInfo] = {}
	var biome_map: Image = preload("res://biome-map.png").get_image()
	var map_width: int = biome_map.get_width()
	var map_height: int = biome_map.get_height()
	for x in map_width:
		for y in map_height:
			var pixel_value = biome_map.get_pixel(x,y)
			if pixel_value in biome_colours:
				pass
			else:
				biome_colours[pixel_value] = BiomeInfo.new()
	return []
