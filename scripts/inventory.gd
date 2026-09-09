extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.player = $"../player"
	$Label/agility.text = "СПРИТНІСТЬ: " + str(GameState.player.stats["agility"])
	$Label/strenght.text = "СИЛА: " + str(GameState.player.stats["strenght"])
	$Label/intelligence.text = "ІНТЕЛЕКТ: " + str(GameState.player.stats["intelligence"])
	$Label/magic_power.text = "СИЛА МАГІЇ: " + str(GameState.player.stats["magic_power"])
