extends CharacterBody2D
@export var speed = 150
var ball_position : Vector2 
var dist : int
var move_by : float
func _ready():
	# Add this paddle to a group called "paddles". We'll use this later.
	add_to_group("paddles")

# This function runs every single physics frame. Perfect for movement!
func _physics_process(delta):
	ball_position = $"../Ball".position
	dist = position.y - ball_position.y
	if abs(dist) > 0:
		move_by = speed * delta * (dist / abs(dist))
	position.y -= move_by
	
	position.y = clamp(position.y, 50, 175)

func spawn(pos):
	position = pos
