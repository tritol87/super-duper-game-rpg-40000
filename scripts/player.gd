extends CharacterBody2D
@export var move_speed = 50
var screen_size
func _ready():
	screen_size = get_viewport_rect().size
	global_position = GameState.player_position

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			
			$NavigationAgent2D.target_position = get_global_mouse_position()
	

func _physics_process(delta):
	if $NavigationAgent2D.is_navigation_finished():
		velocity = Vector2.ZERO
	else:
		var next_position = $NavigationAgent2D.get_next_path_position()
		var direction = global_position.direction_to(next_position)
		velocity = direction * move_speed
	
	move_and_slide()
	if velocity.length() > 0:
		if abs(velocity.x) > abs(velocity.y):
			# Рух переважно вліво/вправо
			$AnimatedSprite2D.play("side_run")
			$AnimatedSprite2D.flip_h = velocity.x > 0
			
		elif velocity.y < 0:
			# Рух переважно вгору
			$AnimatedSprite2D.play("top_run")
			$AnimatedSprite2D.flip_h = false
			
		else:
			# Рух переважно вниз
			$AnimatedSprite2D.play("down_run")
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("idle")
