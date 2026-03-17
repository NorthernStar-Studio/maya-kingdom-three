## Maya Character Package
##
## Package entry point for Maya and her Warmth/Shadow card pool.

class_name MayaPackage
extends CharacterPackage

func get_id() -> String:
	return MayaCharacter.CHARACTER_ID

func get_display_name() -> String:
	return MayaCharacter.CHARACTER_NAME

func get_theme() -> String:
	return "Warmth, family, and unresolved grief"

func get_summary() -> Dictionary:
	return {
		"id": get_id(),
		"name": get_display_name(),
		"theme": get_theme(),
		"emotion_family": "Warmth",
		"arc": "From resentment toward understanding and resolution",
		"starting_health": 80,
		"starting_energy": 3,
		"starting_plays": 3,
		"special_mechanics": [
			"Resonance bonuses for clustering emotion families",
			"Story-driven emotional state progression",
			"Ending paths unlocked by emotional dominance and story flags"
		]
	}

func create_character() -> Character:
	return MayaCharacter.new()

func load_cards() -> Array[Card]:
	var cards: Array[Card] = []
	cards.append_array(MayaCards.get_shadow_cards())
	cards.append_array(MayaCards.get_fire_cards())
	cards.append_array(MayaCards.get_warmth_cards())
	cards.append_array(MayaCards.get_storm_cards())
	cards.append_array(MayaCards.get_special_cards())
	return cards

func load_starter_deck() -> Array[Card]:
	return MayaCards.get_starting_deck()

func create_card_effects(_character: Character = null) -> Node:
	return MayaCardEffects.new()

func create_support_systems(_character: Character = null) -> Dictionary:
	## Maya's phase/story system needs extra runtime dependencies (turn system,
	## combat hooks), so the package exposes a stable extension point without
	## forcing partial initialization here.
	return {}
