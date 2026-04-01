extends Node
func _ready():
	var root = get_tree().get_first_node_in_group("Root")
	var biomes = BiomeLoader.load_biomes()
	for biome in biomes:
		var biome_map: BitMap = biome.biome_present_at
		var biome_img = biome_map.convert_to_image()
		biome_img.convert(Image.FORMAT_RGBA8)
		var biome_size = biome_img.get_size()
		for x in biome_size.x:
			for y in biome_size.y:
				if biome_img.get_pixel(x,y) == Color.BLACK:
					biome_img.set_pixel(x,y,Color(0, 0, 0, 0))
		var biome_scene = preload("res://biome_element.tscn")
		var new_element = biome_scene.instantiate()
		new_element.populate(biome_map, biome_img)
		root.add_child(new_element)
