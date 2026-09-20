extends Area2D

@export var win: Label

func _on_body_entered(body: Node) -> void:

	if body.is_in_group("player"):
		trigger_game_over()

func trigger_game_over() -> void:
	win.show()
	get_tree().paused = true
