## Wren Character Package
##
## Package entry point for loading Wren character and cards.

class_name WrenPackage
extends CharacterPackage

func get_id() -> String:
	return WrenCharacter.CHARACTER_ID

func get_display_name() -> String:
	return WrenCharacter.CHARACTER_NAME

func get_theme() -> String:
	return "Grief, memory, and carrying loss forward"

func get_summary() -> Dictionary:
	return {
		"id": get_id(),
		"name": get_display_name(),
		"theme": get_theme(),
		"emotion_family": "Shadow",
		"arc": "Learning to carry loss without being consumed by it",
		"starting_health": 90,
		"starting_energy": 3,
		"starting_plays": 3,
		"special_mechanics": [
			"Memory Tokens - persist across encounters",
			"Grief Counter - accumulates through combat",
			"Phase Progression - cards unlock as emotional journey progresses",
			"Echo Mechanic - repeat previous card effects"
		],
		"phases": ["Denial", "Weight", "Haunting", "Bargaining", "Shadows", "Wren"]
	}

func create_character() -> Character:
	return WrenCharacter.new()

func load_cards() -> Array[Card]:
	return WrenCardData.create_all_cards()

func load_starter_deck() -> Array[Card]:
	return WrenCardData.get_starter_deck()

func create_card_effects(_character: Character = null) -> Node:
	return WrenCardEffects.new()

func create_support_systems(character: Character = null) -> Dictionary:
	var systems := {}
	if character is WrenCharacter:
		var phase_manager = WrenPhaseManager.new()
		phase_manager.initialize(character)
		systems["phase_manager"] = phase_manager
	return systems

func get_all_card_ids() -> Array[String]:
	var ids: Array[String] = []
	for card in load_cards():
		ids.append(card.id)
	return ids

func get_phase_descriptions() -> Dictionary:
	return {
		"DENIAL": {
			"name": "Denial",
			"description": "Pretending nothing changed",
			"cards": ["Pretend", "Everything's Fine", "Photo Album", "Ghost"]
		},
		"WEIGHT": {
			"name": "Weight",
			"description": "The heaviness of absence",
			"cards": ["Heavy Heart", "Anchor", "Sinking", "Gravity", "Burden", "Stone"]
		},
		"HAUNTING": {
			"name": "Haunting",
			"description": "Memories that won't let go",
			"cards": ["Memory Strike", "Echo", "Phantom Pain", "Reminiscence", "Hallucination"]
		},
		"BARGAINING": {
			"name": "Bargaining",
			"description": "\"If I just tried harder...\"",
			"cards": ["Acceptance", "Flight", "What If"]
		},
		"SHADOWS": {
			"name": "Shadows",
			"description": "Accepting the loss exists",
			"cards": ["Shadows"]
		},
		"WREN": {
			"name": "Wren",
			"description": "Carrying memory forward",
			"cards": ["Songbird", "Legacy", "Carry Forward"]
		}
	}
