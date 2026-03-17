## Character Package Contract
##
## A package encapsulates everything needed to load a playable character:
## metadata, the character instance, starter deck, full card pool, and any
## optional support systems such as effect handlers or phase managers.

class_name CharacterPackage
extends RefCounted

func get_id() -> String:
	return ""

func get_display_name() -> String:
	return "Unnamed"

func get_theme() -> String:
	return ""

func get_summary() -> Dictionary:
	return {
		"id": get_id(),
		"name": get_display_name(),
		"theme": get_theme()
	}

func create_character() -> Character:
	return null

func load_cards() -> Array[Card]:
	return []

func load_starter_deck() -> Array[Card]:
	return []

func create_card_effects(_character: Character = null) -> Node:
	return null

func create_support_systems(_character: Character = null) -> Dictionary:
	return {}
