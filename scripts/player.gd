extends CharacterBody2D
var screen_size
@export var move_speed = 50
#на будуще сделаю пока

var stats = {
	"agility": 1,
	"strenght": 1,
	"intelligence": 1,
	"magic_power": 1,
}

func _change_stats(attribute, score):
	stats = [attribute] + score
	_stats_was_changed()
	return stats
	
	
func _stats_was_changed():
	_hp_and_mana_calculate(stats)
	
func _hp_and_mana_calculate(player_stats):
	var hp = stats["strenght"] * 5
	var mana = stats["intelligence"] * 5
	return hp and mana

func _ready():
	GameState.player = self
	screen_size = get_viewport_rect().size
	global_position = GameState.player_position

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			
			$NavigationAgent2D.target_position = get_global_mouse_position()
	
func _physics_process(_delta):
	if $NavigationAgent2D.is_navigation_finished():
		velocity = Vector2.ZERO
	else:
		var next_position = $NavigationAgent2D.get_next_path_position()
		var direction = global_position.direction_to(next_position)
		velocity = direction * move_speed
	
	move_and_slide()
	#Снизу хуйня яка робить анімації нормальними 
	if velocity.length() > 0:
		if abs(velocity.x) > abs(velocity.y):
			$AnimatedSprite2D.play("side_run")
			$AnimatedSprite2D.flip_h = velocity.x > 0
			
		elif velocity.y < 0:
			$AnimatedSprite2D.play("top_run")
			$AnimatedSprite2D.flip_h = false
			
		else:
			$AnimatedSprite2D.play("down_run")
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("idle")
