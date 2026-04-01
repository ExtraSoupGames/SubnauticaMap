class_name BiomeElement extends Area2D
@export var hovered: Color
@export var unhovered: Color
var show: Sprite2D
func _ready():
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
func populate(biome_map: BitMap, biome_img: Image):
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
		
func _on_mouse_entered():
	show.modulate = hovered

	
func _on_mouse_exited():
	show.modulate = unhovered
