class_name BiomeElement extends Area2D
@export var selected: Color
var is_hovered: bool
var show: Sprite2D
var ui_element: Label
var id: int
var color: Color
func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	input_event.connect(_on_input_event)
	
func populate(biome_map: BitMap, biome_img: Image, element: Label, identification: int):
	ui_element = element
	id = identification
	show = Sprite2D.new()
	var texture = ImageTexture.create_from_image(biome_img)
	show.texture = texture
	add_child(show)
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
	is_hovered = false
	if ui_element.hovered_biome == self:
		ui_element.hovered_biome = null
		
func _on_mouse_entered():
	color = ui_element.biome_colours[id]

	show.modulate = color
	is_hovered = true
	ui_element.hovered_biome = self

	
func _on_mouse_exited():
	if ui_element.selected_biome == self:
		return
	color = ui_element.biome_colours[id]

	show.modulate = color
	is_hovered = false
	if ui_element.hovered_biome == self:
		ui_element.hovered_biome = null #TODO remove highlight when a different biome is selected
	
func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("Clicked this biome!")
			ui_element.text = ui_element.biome_data[id]
			ui_element.selected_biome = self
			color = ui_element.biome_colours[id] - selected
			show.modulate = color
