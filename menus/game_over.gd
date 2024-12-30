extends Control

@export var game_stats: GameStats

@onready var score_value_label: Label = %ScoreValueLabel
@onready var highscore_value_label: Label = %HighscoreValueLabel

func _ready() -> void:
	if game_stats.score > game_stats.highscore:
		game_stats.highscore = game_stats.score
	score_value_label.text = str(game_stats.score)
	highscore_value_label.text = str(game_stats.highscore)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		game_stats.score = 0
		get_tree().change_scene_to_file("res://world.tscn")
