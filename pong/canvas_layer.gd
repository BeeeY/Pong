extends CanvasLayer
signal playervplayer
signal easy 
signal medium
signal hard
signal wall
signal game_over
var player_game = false
var player1score = 0
var player2score = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PlayerVsPlayer.hide()
	$Easy.hide()
	$Medium.hide()
	$Hard.hide()
	$Wall.hide()
	$Bots.hide()
	$Winner.hide()
	$Player1Score.hide()
	$Player2Score.hide()
	$Back.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player1score == 5:
		game_over.emit()
		if player_game == false:
			$Winner.text = "You Win!"
			$Winner.show()
			$Back.show()
		else:
			$Winner.text = "Blue Wins!"
			$Winner.show()
			$Back.show()
	elif player2score == 5:
		game_over.emit()
		if player_game == false:
			$Winner.text = "Bot Wins!"
			$Winner.show()
			$Back.show()
		else:
			$Winner.text = "Red Wins!"
			$Winner.show()
			$Back.show()

func _on_play_pressed() -> void:
	$Play.hide()
	$Title.hide()
	$PlayerVsPlayer.show()
	$Easy.show()
	$Medium.show()
	$Hard.show()
	$Wall.show()
	$Bots.show()

func _on_player_vs_player_pressed() -> void:
	$PlayerVsPlayer.hide()
	$Easy.hide()
	$Medium.hide()
	$Hard.hide()
	$Wall.hide()
	$Bots.hide()
	player1score = 0
	player2score = 0
	$Player1Score.text = "0"
	$Player2Score.text = "0"
	$Player1Score.show()
	$Player2Score.show()
	player_game = true
	playervplayer.emit()

func _on_easy_pressed() -> void:
	$PlayerVsPlayer.hide()
	$Easy.hide()
	$Medium.hide()
	$Hard.hide()
	$Wall.hide()
	$Bots.hide()
	player1score = 0
	player2score = 0
	$Player1Score.text = "0"
	$Player2Score.text = "0"
	$Player1Score.show()
	$Player2Score.show()
	player_game = false
	easy.emit()

func _on_medium_pressed() -> void:
	$PlayerVsPlayer.hide()
	$Easy.hide()
	$Medium.hide()
	$Hard.hide()
	$Wall.hide()
	$Bots.hide()
	player1score = 0
	player2score = 0
	$Player1Score.text = "0"
	$Player2Score.text = "0"
	$Player1Score.show()
	$Player2Score.show()
	player_game = false
	medium.emit()

func _on_hard_pressed() -> void:
	$PlayerVsPlayer.hide()
	$Easy.hide()
	$Medium.hide()
	$Hard.hide()
	$Wall.hide()
	$Bots.hide()
	player1score = 0
	player2score = 0
	$Player1Score.text = "0"
	$Player2Score.text = "0"
	$Player1Score.show()
	$Player2Score.show()
	player_game = false
	hard.emit()
	
func _on_wall_pressed() -> void:
	$PlayerVsPlayer.hide()
	$Easy.hide()
	$Medium.hide()
	$Hard.hide()
	$Wall.hide()
	$Bots.hide()
	player1score = 0
	$Player1Score.text = "0"
	$Player1Score.show()
	player_game = false
	wall.emit()


func _on_main_player_1_scored() -> void:
	player1score += 1
	$Player1Score.text = str(player1score)

func _on_main_player_2_scored() -> void:
	player2score += 1
	$Player2Score.text = str(player2score)


func _on_back_pressed() -> void:
	player1score = 0
	player2score = 0
	$Winner.hide()
	$Player1Score.hide()
	$Player2Score.hide()
	$Back.hide()
	$PlayerVsPlayer.show()
	$Easy.show()
	$Medium.show()
	$Hard.show()
	$Wall.show()
	$Bots.show()


func _on_main_wall_game_over() -> void:
	game_over.emit()
	$Winner.text = "Game Over  Score:" + str(player1score)
	$Winner.show()
	$Back.show()
