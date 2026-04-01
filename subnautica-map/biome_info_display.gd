class_name BiomeInfoDisplay extends Label
var biome_data: Dictionary = {}
var biome_colours: Dictionary = {}
var selected_biome: BiomeElement
var hovered_biome: BiomeElement

func _ready():
	biome_data[0] = "Dunes"
	biome_data[1] = "Sea Treader's Path"
	biome_data[2] = "Grand Reef"
	biome_data[3] = "Blood Kelp Zone"
	biome_data[4] = "Mushroom Forest"
	biome_data[5] = "Sparse Reef"
	biome_data[6] = "Grassy Plateaus"
	biome_data[7] = "Creepvine Forest"
	biome_data[8] = "Safe Shallows"
	biome_data[9] = "Underwater Islands"
	biome_data[10] = "Crag Field"
	biome_data[11] = "Mountains"
	biome_data[12] = "Crash Zone"
	biome_data[13] = "Bulb Zone"

	biome_colours[0]  = Color(0.76, 0.70, 0.50) # Dunes - sandy tan
	biome_colours[1]  = Color(0.55, 0.75, 0.65) # Sea Treader's Path - muted seafoam
	biome_colours[2]  = Color(0.20, 0.60, 0.80) # Grand Reef - deep blue
	biome_colours[3]  = Color(0.55, 0.10, 0.15) # Blood Kelp Zone - dark red
	biome_colours[4]  = Color(0.80, 0.55, 0.20) # Mushroom Forest - warm amber
	biome_colours[5]  = Color(0.60, 0.80, 0.75) # Sparse Reef - pale teal
	biome_colours[6]  = Color(0.35, 0.70, 0.40) # Grassy Plateaus - green
	biome_colours[7]  = Color(0.15, 0.50, 0.45) # Creepvine Forest - dark teal
	biome_colours[8]  = Color(0.40, 0.85, 0.95) # Safe Shallows - bright cyan
	biome_colours[9]  = Color(0.30, 0.55, 0.80) # Underwater Islands - steel blue
	biome_colours[10] = Color(0.65, 0.60, 0.55) # Crag Field - grey brown
	biome_colours[11] = Color(0.70, 0.70, 0.75) # Mountains - cool grey
	biome_colours[12] = Color(0.80, 0.40, 0.20) # Crash Zone - burnt orange
	biome_colours[13] = Color(0.50, 0.20, 0.75) # Bulb Zone - purple

func _process(delta: float):
	var active_biome = hovered_biome if hovered_biome != null else selected_biome
	if active_biome == null:
		text = ""
		return
	text = biome_data.get(active_biome.id, "Unknown Biome")
