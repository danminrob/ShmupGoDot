class_name MoveInputController
extends Node

@export var move_component: MoveComponent
@export var move_stats: MoveStats

func _input(_event: InputEvent) -> void:
	var input_axis_x = Input.get_axis("ui_left", "ui_right")
	var input_axis_y = Input.get_axis("ui_up", "ui_down")
	move_component.velocity = Vector2(input_axis_x * move_stats.speed, input_axis_y * move_stats.speed)
