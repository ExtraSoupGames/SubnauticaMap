class_name BiomeInfo extends RefCounted
var biome_present_at: BitMap
func _init(w: int, h: int):
	biome_present_at = BitMap.new()
	biome_present_at.resize(Vector2i(w,h))
func set_pixel_to_biome(x: int, y: int):
	biome_present_at.set_bit(x, y, 1)
