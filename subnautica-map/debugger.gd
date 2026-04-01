extends Node
func _ready():
	var root = get_tree().get_first_node_in_group("Root")
	var biomes = BiomeLoader.load_biomes()
	for biome in biomes:
		var biome_map: BitMap = biome.biome_present_at
		var biome_img = biome_map.convert_to_image()
		var biome_size = biome_img.get_size()
		for x in biome_size.x:
			for y in biome_size.y:
				if biome_img.get_pixel(x,y) == Color.BLACK:
					biome_img.set_pixel(x,y,Color.TRANSPARENT)
		var show = Sprite2D.new()
		show.texture = ImageTexture.create_from_image(biome_img)
		root.add_child(show)
