extends Node3D

var HubPawn = load("res://pawn/Base/BasicPawn.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	# Create the default player
	SessionManager.add_player(HubPawn)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
