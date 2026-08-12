extends CharacterBody2D
@export var speed = 150


func _ready():
	# Add this paddle to a group called "paddles". We'll use this later.
	add_to_group("paddles")

# This function runs every single physics frame. Perfect for movement!
func _physics_process(delta):
	var direction = 0
	if Input.is_action_pressed("Up1"):
		direction = -1 # In 2D, negative Y is up
	elif Input.is_action_pressed("Down1"):
		direction = 1 # Positive Y is down
	
	velocity.y = direction * speed
	move_and_collide(Vector2(0, velocity.y * delta))
	position.y = clamp(position.y, 50, 175)

func spawn(pos):
	position = pos
