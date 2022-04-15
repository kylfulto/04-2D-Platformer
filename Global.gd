extends Node

var score = 0
var lives = 5

var fade = null
var fade_speed = 0.015

var fade_in = false
var fade_out = ""

var death_zone = 1000

func _ready():
	update_score(0)
	update_lives(0)

func _physics_process(_delta):
	if fade == null:
		fade = get_node_or_null("/root/Game/Camera/Fade")
	if fade_out != "":
		execute_fade_out(fade_out)
	if fade_in:
		execute_fade_in()
		

func start_fade_in():
	if fade != null:
		fade.visible = true
		fade.color.a = 1
		fade_in = true

func start_fade_out(target):
	if fade != null:
		fade.color.a = 0
		fade.visible = true
		fade_out = target

func execute_fade_in():
	if fade != null:
		fade.color.a -= fade_speed
		if fade.color.a <= 0:
			fade_in = false

func execute_fade_out(target):
	if fade != null:
		fade.color.a += fade_speed
		if fade.color.a >= 1:
			fade_out = ""
			

func update_score(s):
	Global.score += s
	var Score = get_node_or_null("/root/Game/Viewport/HUD/Score")
	if Score != null:
		Score.text = "Score: " + str(Global.score)

func update_lives(l):
	Global.lives += l
	if Global.lives < 0:
		var _scene = get_tree().change_scene("res://Levels/Game_Over.tscn")
	else:
		var Lives = get_node_or_null("/root/Game/Viewport/HUD/Lives")
		if Lives != null:
			Lives.text = "Lives: " + str(Global.lives)

func _unhandled_input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()
