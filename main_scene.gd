extends Node2D
@export var enemy:PackedScene

@onready var level1:Node2D = get_node("Level1")
@onready var level2:Node2D = get_node('Level 2')
@onready var level3:Node2D = get_node('Level3')
@onready var playerShield:Area2D = get_node("Player/shield")
@onready var shieldCooler:Node2D = get_node("ShieldCooler")

var currentLevel = "level1"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Label1").hide()
	get_node("Label2").hide()
	level1.show()
	level2.hide()
	level3.hide()
	shieldCooler.hide()
	
	level2.process_mode = Node.PROCESS_MODE_DISABLED
	level3.process_mode = Node.PROCESS_MODE_DISABLED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ! level1.get_children() and currentLevel == "level1":
		level1.hide()
		get_node("Label1").show()
		await get_tree().create_timer(3).timeout
		get_node("Label1").hide()
		currentLevel = "level2"
		level2.show()
		level2.process_mode = Node.PROCESS_MODE_ALWAYS
	elif ! level2.get_children() and currentLevel == "level2":
		level2.process_mode = Node.PROCESS_MODE_DISABLED
		level2.hide()
		get_node("Label2").show()
		await get_tree().create_timer(3).timeout
		get_node("Label2").hide()
		currentLevel = "level3"
		level3.show()
		shieldCooler.show()
		level3.process_mode = Node.PROCESS_MODE_ALWAYS
		playerShield.show()
		playerShield.process_mode = Node.PROCESS_MODE_ALWAYS
		await get_tree().create_timer(5).timeout
		playerShield.hide()
		playerShield.process_mode = Node.PROCESS_MODE_DISABLED
