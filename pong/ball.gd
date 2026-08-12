extends CharacterBody2D
@export var speed = 200
var wall_game = false
func start():

	position = get_viewport_rect().size / 2
	set_physics_process(false)
	await get_tree().create_timer(1).timeout
	set_physics_process(true)
	velocity = Vector2.ZERO
	# Give it a random starting direction
	var direction_x = 1.0 if randf() > 0.5 else -1.0 # Go left or right
	var direction_y = randf_range(-0.5, 0.5) # Go slightly up or down

	# Apply the direction and speed. .normalized() keeps the speed consistent.
	velocity = Vector2(direction_x, direction_y).normalized() * speed

# This function is called automatically when the game starts.
func _ready():
	set_physics_process(false)

func _physics_process(delta):
	
	# Move the ball and check if we hit anything
	var collision = move_and_collide(velocity * delta)
	
	# If we hit something...
	if collision:
		# "bounce" is a handy function that reflects the velocity perfectly
		velocity = velocity.bounce(collision.get_normal())
		
		# Let's make the game harder as it goes on
		var thing_we_hit = collision.get_collider()
		if thing_we_hit.is_in_group("paddles"):
			var direction_y = randf_range(-1, 1)
			velocity *= 1.05 # Increase speed by 5%


func _on_score_area_1_body_entered(body: Node2D) -> void:
	start()

func _on_score_area_2_body_entered(body: Node2D) -> void:
	if wall_game == false:
		start()


func _on_main_wall() -> void:
	wall_game = true


func _on_main_game_over() -> void:
	wall_game = false
