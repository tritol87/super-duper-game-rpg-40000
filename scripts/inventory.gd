extends CanvasLayer
@onready var player = "res://scenes/player.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text("hello")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
