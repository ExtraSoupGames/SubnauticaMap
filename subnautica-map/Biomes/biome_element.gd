class_name BiomeElement extends TextureButton
var ui_element: Label
var id: int
var color: Color
func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	pressed.connect(on_click)
	
func populate(biome_map: BitMap, biome_img: Image, element: Label, identification: int):
	ui_element = element
	id = identification
	color = ui_element.biome_colours[id]
	texture_click_mask = biome_map
	texture_normal = ImageTexture.create_from_image(set_img_colour(biome_img, 0))
	texture_hover = ImageTexture.create_from_image(set_img_colour(biome_img, 0.2))
	texture_pressed = ImageTexture.create_from_image(set_img_colour(biome_img, 0.5))
	var polygons = biome_map.opaque_to_polygons(
		Rect2(Vector2.ZERO, biome_map.get_size()), 2.0
	)
	
	for poly in polygons:
		var col = CollisionPolygon2D.new()
		# Offset to center (sprites are centered by default)
		var offset_poly = PackedVector2Array()
		for p in poly:
			offset_poly.append(p - biome_map.get_size() / 2.0)
		col.polygon = offset_poly
		add_child(col)

	if ui_element.hovered_biome == self:
		ui_element.hovered_biome = null
		
func _on_mouse_entered():
	ui_element.hovered_biome = self

	
func _on_mouse_exited():
	if ui_element.hovered_biome == self:
		ui_element.hovered_biome = null
	
func on_click():
	ui_element.text = ui_element.biome_data[id]
	ui_element.selected_biome = self
	
	
func set_img_colour(img: Image, factor: float) -> Image:
	var out = img.duplicate()
	for y in out.get_height():
		for x in out.get_width():
			var c = out.get_pixel(x, y)
			if c == Color(0,0,0,0):
				continue
			out.set_pixel(x, y, color.darkened(factor))
	return out
