extends Button

var clicks = 0

@onready var click_text = $"../../Label"
@onready var click_sound = $AudioStreamPlayer2D

func _ready() -> void:
	load_game()
	update_text()

func _on_pressed() -> void:
	clicks += 1
	update_text()
	click_sound.play()
	save_game()

func _on_reset_progress_pressed() -> void:
	clicks = 0
	save_game()
	update_text()

func update_text() -> void:
	click_text.text = "Clicks: " + str(clicks)

func save_game() -> void:
	var file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	file.store_var(clicks)

func load_game() -> void:
	if FileAccess.file_exists("user://savegame.save"):
		var file = FileAccess.open("user://savegame.save", FileAccess.READ)
		clicks = file.get_var()
