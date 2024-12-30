extends Node2D

@onready var left_cannon: Marker2D = $LeftCannon
@onready var right_cannon: Marker2D = $RightCannon
@onready var spawner_component: SpawnerComponent = $SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var ship_animation: AnimatedSprite2D = $ShipAnimation
@onready var move_component: MoveComponent = $MoveComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fire_rate_timer.timeout.connect(fire_lasers)
	pass # Replace with function body.
	
func _input(_event: InputEvent) -> void:
	if(!Input.is_key_pressed(KEY_SPACE)):
		fire_rate_timer.stop()
	else:
		if(fire_rate_timer.is_stopped()):
			fire_lasers()
			fire_rate_timer.start()
	
func fire_lasers() -> void:
	scale_component.tween_scale()
	spawner_component.spawn(left_cannon.global_position)
	spawner_component.spawn(right_cannon.global_position)

func _process(_delta: float) -> void:
	animate_ship()
	
func animate_ship() -> void:
	if move_component.velocity.x < 0:
		ship_animation.play("bank_left")
	elif move_component.velocity.x > 0:
		ship_animation.play("bank_right")
	else :
		ship_animation.play("center")
