extends Node

var players = []

var turn = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called when a new player is added to the game
func add_player(pawn):
	var NewPlayer = pawn.instantiate()
	add_child(NewPlayer)

	players.append(NewPlayer)

	print_debug(players)

func _process(_delta):
	# Relay input state to each pawn
	pass

func _input(event):
	if( len(players) > 0 ):
		players[turn].process_input(event)
