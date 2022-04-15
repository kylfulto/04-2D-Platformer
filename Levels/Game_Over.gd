extends Control

func _on_Play_Again_pressed():
	Global.score = 0
	Global.lives = 5
	get_tree().change_scene("res://Levels/Level1.tscn")


func _on_Quit_pressed():
	get_tree().quit()
