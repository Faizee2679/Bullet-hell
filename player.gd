extends Area2D

@export var max_speed: float = 450.0       
@export var acceleration: float = 1.0
@export var friction: float = 0.06
@onready var sprite: AnimatedSprite2D = $SpaceShipsPlayer0001
@onready var health_1: AnimatedSprite2D = $"../Health/AnimatedSprite2D"
@onready var health_2: AnimatedSprite2D = $"../Health2/AnimatedSprite2D"
@onready var health_3: AnimatedSprite2D = $"../Health3/AnimatedSprite2D"
@export var explosionOG:PackedScene
@onready var shield:Area2D = get_node("shield")

var velocity: Vector2 = Vector2.ZERO
var screen_size: Vector2
var OGbullet = preload("res://player bullets.tscn")
var angle = 0
var health = 3

func _ready():
	screen_size = get_viewport_rect().size
	health_1.animation = "full"
	health_2.animation = "full"
	health_3.animation = "full"
	shield.hide()
	shield.process_mode = Node.PROCESS_MODE_DISABLED

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


func _on_area_entered(area: Area2D) -> void:
	health -= 1
	if health == 2:
		health_3.animation = "dead"
	if health == 1:
		health_2.animation = "dead"
	if health <= 0:
		health_1.animation = "dead"
		var exclone = explosionOG.instantiate()
		exclone.global_position = global_position
		get_tree().current_scene.add_child(exclone)
		queue_free()
		
