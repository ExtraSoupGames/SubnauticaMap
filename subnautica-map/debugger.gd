extends Node
var ui_element: Label
func _ready():
	var root = get_tree().get_first_node_in_group("Root")
	ui_element = root.get_node("Label")
	var biomes = BiomeLoader.load_biomes()
	var running_biome_id = 0
	for biome in biomes:
		var biome_map: BitMap = biome.biome_present_at
		var biome_img = biome_map.convert_to_image()
		biome_img.convert(Image.FORMAT_RGBA8)
		var biome_size = biome_img.get_size()
		for x in biome_size.x:
			for y in biome_size.y:
				if biome_img.get_pixel(x,y) == Color.BLACK:
					biome_img.set_pixel(x,y,Color(0, 0, 0, 0))
		var biome_scene = preload("res://Biomes/biome_element.tscn")
		var new_element = biome_scene.instantiate()
		new_element.populate(biome_map, biome_img, ui_element, running_biome_id)
		root.add_child(new_element)
		running_biome_id += 1;
