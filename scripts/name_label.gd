extends MarginContainer


export(String) var text

func _ready() -> void:
	$Label.text = text
