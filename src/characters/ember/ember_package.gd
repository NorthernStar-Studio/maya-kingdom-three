## Ember Character Package
##
## Package entry point for Ember and his Fire card pool.

class_name EmberPackage
extends CharacterPackage

func get_id() -> String:
	return EmberCharacter.CHARACTER_ID

func get_display_name() -> String:
	return EmberCharacter.CHARACTER_NAME

func get_theme() -> String:
	return "Anger, passion, and controlled destruction"

func get_summary() -> Dictionary:
	return {
		"id": get_id(),
		"name": get_display_name(),
		"theme": get_theme(),
		"emotion_family": "Fire",
		"arc": "From ignition to mastery through six heat-driven phases",
		"starting_health": 100,
		"starting_energy": 3,
		"starting_plays": 3,
		"special_mechanics": [
			"Heat scaling for damage and card efficiency",
			"Burn effects that persist across turns",
			"Phase progression tied to combat play volume"
		],
		"phases": EmberCharacter.FirePhase.keys()
	}

func create_character() -> Character:
	return EmberCharacter.new()

func load_cards() -> Array[Card]:
	return EmberCardFactory.create_all_cards()

func load_starter_deck() -> Array[Card]:
	return EmberCardFactory.create_phase_cards(1)

func create_card_effects(_character: Character = null) -> Node:
	return EmberCardEffectHandler.new()
