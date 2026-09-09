extends Node2D

@onready var city_interface = $CanvasLayer/city_interface

var player_inside = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		player_inside = true
		print(player_inside)
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		player_inside = false
		print(player_inside)
func _process(delta):
	if player_inside == true and Input.is_action_just_pressed("enter"):
		city_interface.visible = true
