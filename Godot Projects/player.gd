extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var move_speed = 50


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Hello, I'm the player!!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var offset = Vector2(0, 0)
	if Input.is_action_pressed("move_left"):
		offset.x = -1
	if Input.is_action_pressed("move_right"):
		offset.x = 1
	if Input.is_action_pressed("move_up"):
		offset.y = -1
	if Input.is_action_pressed("move_down"):
		offset.y = 1
		
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		
		# Make it so the HYPOTENUSE of he offet vector is 1.0
	offset = offset.normalized()
	
	#offset = offset * (move_speed * delta)
	
	# Instead of the above, use move_and_slide to do movement
	 # and collision
	offset = offset * move_speed
	move_and_slide(offset)
