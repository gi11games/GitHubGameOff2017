extends KinematicBody2D

#Contants
const MAX_SPEED = 200

#Movement
var motion

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _physics_process(delta):
	#set_z(get_position().y)
	motion = Vector2()
	
	motion.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	motion.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	motion = motion.normalized() * MAX_SPEED
	
	move_and_slide(motion)