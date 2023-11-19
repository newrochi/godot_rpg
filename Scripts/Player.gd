extends CharacterBody2D

@export var speed=50

func _physics_process(delta):
	#Get player input
	var direction:Vector2
	direction.x=Input.get_action_strength("ui_right")- Input.get_action_strength("ui_left")
	direction.y=Input.get_action_strength("ui_down")- Input.get_action_strength("ui_up")
	
	#If the movement is diagonal, normalize it for diagonal movement
	if abs(direction.x)==1 and abs(direction.y)==1:
		direction=direction.normalized()
	
	#Apply movement
	var movement= +direction * speed * delta
	move_and_collide(movement)
