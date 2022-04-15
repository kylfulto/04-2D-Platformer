extends Area2D

var points = 10


func _ready():
	pass


func _on_Gem_body_entered(body):
	if body.name == "Player":
		Global.update_score(points)
		queue_free()
