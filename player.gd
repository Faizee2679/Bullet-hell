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

	if Input.is_action_pressed("left"):
		sprite.flip_v = false
		direction.x = -1
		rotation = deg_to_rad(-90)
		angle = -90asd
	if Input.is_action_pressed("right"):
		sprite.flip_v = false
		direction.x = 1
		rotation = deg_to_rad(90)
		angle = 90
	if Input.is_action_pressed("up"):
		rotation = 0
		direction.y = -1
		sprite.flip_v = false
	if Input.is_action_pressed("down"):
		rotation = 0
		direction.y = 1
		sprite.flip_v = true
	if Input.is_action_pressed("shoot"):
		var clone = OGbullet.instantiate()
		clone.rotation = deg_to_rad(angle)
		add_child(clone)
		

	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = velocity.lerp(direction * max_speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)

	position += velocity * delta
