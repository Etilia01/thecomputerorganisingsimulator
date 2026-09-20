extends Area2D

@export var pointvalue: int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", _on_body_entered)


func _on_body_entered(body):
	if body.is_in_group("player"):
		Global.add_score(pointvalue)
		queue_free()
