extends Area2D

@export var max_speed: float = 450.0       
@export var acceleration: float = 1.0
@export var friction: float = 0.06
@onready var sprite: AnimatedSprite2D = $SpaceShipsPlayer0001

var velocity: Vector2 = Vector2.ZERO
var screen_size: Vector2
var OGbullet = preload("res://player bullets.tscn")
var angle = 0

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var direction = Vector2.ZERO
	var mouse = get_local_mouse_position()
	var directionToMouse = mouse - position
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("left"):
		direction.x = -1
	if Input.is_action_pressed("right"):
		direction.x = 1
	if Input.is_action_pressed("up"):
		direction.y = -1
	if Input.is_action_pressed("down"):
		direction.y = 1
	if Input.is_action_pressed("shoot"):
		var clone = OGbullet.instantiate()
		clone.rotation = rotation
		clone.position = position
		get_tree().current_scene.add_child(clone)
		

	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = velocity.lerp(direction * max_speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)

	position += velocity * delta
