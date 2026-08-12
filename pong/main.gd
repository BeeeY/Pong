extends Node2D
signal player2scored
signal player1scored
signal wall
signal game_over
signal wall_game_over
var game_started = false
var wall_game = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Bot.hide()
	$Player1.set_physics_process(false)
	$Player2.set_physics_process(false)
	$Ball.set_physics_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_started == false:
		$Player1.set_physics_process(false)
		$Player2.set_physics_process(false)
		$Bot.set_physics_process(false)
		$Ball.set_physics_process(false)


func _on_score_area_1_body_entered(body: Node2D) -> void:
	if wall_game == false:
		player2scored.emit()
	else:
		$Player1.set_physics_process(false)
		$Player2.set_physics_process(false)
		$Ball.set_physics_process(false)
		$StaticBody2D3.spawn($PaddleStorage.position)
		game_started = false
		wall_game = false
		wall_game_over.emit()


func _on_score_area_2_body_entered(body: Node2D) -> void:
	if wall_game == false:
		player1scored.emit()

func _on_hud_easy() -> void:
	game_started = true
	$Bot.speed = 30
	$Player1.speed = 200
	$Player2.hide()
	$Player2.spawn($PaddleStorage.position)
	$Bot.show()
	$Player1.spawn($Player1Spawn.position)
	$Bot.spawn($Player2Spawn.position)
	$Player1.set_physics_process(true)
	$Bot.set_physics_process(true)
	$Ball.set_physics_process(true)
	$Ball.start()
func _on_hud_hard() -> void:
	game_started = true
	$Bot.speed = 50
	$Player1.speed = 150
	$Player2.hide()
	$Player2.spawn($PaddleStorage.position)
	$Bot.show()
	$Player1.spawn($Player1Spawn.position)
	$Bot.spawn($Player2Spawn.position)
	$Player1.set_physics_process(true)
	$Bot.set_physics_process(true)
	$Ball.set_physics_process(true)
	$Ball.start()
func _on_hud_medium() -> void:
	game_started = true
	$Bot.speed = 40
	$Player1.speed = 150
	$Player2.hide()
	$Player2.spawn($PaddleStorage.position)
	$Bot.show()
	$Player1.spawn($Player1Spawn.position)
	$Bot.spawn($Player2Spawn.position)
	$Player1.set_physics_process(true)
	$Bot.set_physics_process(true)
	$Ball.set_physics_process(true)
	$Ball.start()
func _on_hud_playervplayer() -> void:
	game_started = true
	$Bot.hide()
	$Bot.spawn($PaddleStorage.position)
	$Player2.show()
	$Player1.spawn($Player1Spawn.position)
	$Player2.spawn($Player2Spawn.position)
	$Player1.set_physics_process(true)
	$Player2.set_physics_process(true)
	$Ball.set_physics_process(true)
	$Ball.start()
func _on_hud_wall() -> void:
	game_started = true
	wall_game = true
	wall.emit()
	$Bot.hide()
	$Player2.hide()
	$Bot.spawn($PaddleStorage.position)
	$Player2.spawn($PaddleStorage.position)
	$Player1.spawn($Player1Spawn.position)
	$StaticBody2D3.spawn($WallPos.position)
	$Player1.set_physics_process(true)
	$Ball.set_physics_process(true)
	$Ball.start()
	
func _on_hud_game_over() -> void:
	$Player1.set_physics_process(false)
	$Player2.set_physics_process(false)
	$Ball.set_physics_process(false)
	game_started = false
	wall_game = false
	game_over.emit()
