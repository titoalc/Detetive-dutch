extends CharacterBody2D

@export var speed : float = 400.0
var target : Vector2 = Vector2.ZERO

func _ready():
	# Isso impede que o personagem tente "achar o chão" e cair
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	target = global_position

func _input(event):
	# Detecta clique ou toque (mais eficiente que o _process para performance)
	if (event is InputEventMouseButton or event is InputEventScreenTouch) and event.pressed:
		target = get_global_mouse_position()

func _physics_process(_delta):
	var distance_to_target = global_position.distance_to(target)
	
	if distance_to_target > 10:
		# Calcula a direção e aplica na velocity
		var direction = (target - global_position).normalized()
		velocity = direction * speed
		
		# O move_and_slide usa a 'velocity' para mover e checar colisões
		move_and_slide()
	else:
		# Para o personagem totalmente ao chegar no alvo
		velocity = Vector2.ZERO
		global_position = target
