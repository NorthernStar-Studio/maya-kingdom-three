class_name EncounterLoader
extends Node

const CharacterBase = preload("res://src/characters/base/character.gd")

## Loads authorable encounter content from JSON and can build simple runtime payloads.
## The current combat state machine is 1v1, so runtime helpers expose a primary enemy
## while preserving the full authored enemy list for future multi-enemy support.

signal encounter_loaded(encounter: EncounterDefinition)
signal encounter_load_failed(path: String, error_message: String)

func load_encounter(path: String) -> EncounterDefinition:
	var json_text := FileAccess.get_file_as_string(path)
	if json_text.is_empty():
		_emit_load_failed(path, "Encounter file was empty or missing")
		return null

	var parsed = JSON.parse_string(json_text)
	if not parsed is Dictionary:
		_emit_load_failed(path, "Encounter file must contain a top-level JSON object")
		return null

	var encounter := EncounterDefinition.from_dict(parsed)
	var validation_errors := validate_encounter(encounter)
	if not validation_errors.is_empty():
		_emit_load_failed(path, "; ".join(validation_errors))
		return null

	encounter_loaded.emit(encounter)
	return encounter

func load_encounters_in_directory(directory_path: String) -> Dictionary:
	var encounters := {}
	var directory := DirAccess.open(directory_path)
	if directory == null:
		return encounters

	directory.list_dir_begin()
	var file_name := directory.get_next()
	while not file_name.is_empty():
		if not directory.current_is_dir() and file_name.ends_with(".json"):
			var path = directory_path.path_join(file_name)
			var encounter = load_encounter(path)
			if encounter:
				encounters[encounter.encounter_id] = encounter
		file_name = directory.get_next()
	directory.list_dir_end()

	return encounters

func validate_encounter(encounter: EncounterDefinition) -> Array[String]:
	var errors: Array[String] = []
	if encounter == null:
		errors.append("Encounter payload was null")
		return errors

	if encounter.encounter_id.is_empty():
		errors.append("Encounter id is required")
	if encounter.title.is_empty():
		errors.append("Encounter title is required")
	if encounter.enemy_setups.is_empty():
		errors.append("Encounter must define at least one enemy")

	for enemy in encounter.enemy_setups:
		if enemy.enemy_id.is_empty():
			errors.append("Each enemy must have an id")
		if int(enemy.stats.get("max_health", 0)) <= 0:
			errors.append("Enemy '%s' must define stats.max_health" % enemy.enemy_id)

	return errors

func build_runtime_payload(encounter: EncounterDefinition) -> Dictionary:
	var enemies: Array[Node] = []
	for setup in encounter.enemy_setups:
		enemies.append(instantiate_enemy(setup))

	return {
		"definition": encounter,
		"primary_enemy": enemies[0] if not enemies.is_empty() else null,
		"enemies": enemies,
		"rewards": encounter.rewards.duplicate(),
		"objectives": encounter.objectives.duplicate(true),
		"metadata": encounter.metadata.duplicate(true)
	}

func instantiate_enemy(setup: EncounterDefinition.EnemySetup) -> Character:
	var enemy: Character = CharacterBase.new()
	enemy.character_id = setup.enemy_id
	enemy.character_name = setup.display_name
	enemy.description = setup.description
	enemy.max_health = int(setup.stats.get("max_health", 10))
	enemy.current_health = enemy.max_health
	enemy.attack_power = int(setup.stats.get("attack_power", 0))
	enemy.defense_power = int(setup.stats.get("defense_power", 0))
	enemy.speed = int(setup.stats.get("speed", 0))
	enemy.emotional_capacity = int(setup.stats.get("emotional_capacity", 1))
	enemy.current_plays = enemy.emotional_capacity
	enemy.max_energy = int(setup.stats.get("max_energy", 1))
	enemy.current_energy = enemy.max_energy
	return enemy

func create_objective_summary(encounter: EncounterDefinition) -> Array[Dictionary]:
	var summary: Array[Dictionary] = []
	for objective in encounter.objectives:
		summary.append({
			"type": str(objective.get("type", "custom")),
			"description": str(objective.get("description", "")),
			"optional": bool(objective.get("optional", false))
		})
	return summary

func apply_objectives_to_win_conditions(encounter: EncounterDefinition, win_conditions: WinConditions) -> void:
	if encounter == null or win_conditions == null:
		return

	win_conditions.clear_conditions()
	for objective in encounter.objectives:
		var objective_type := str(objective.get("type", ""))
		var description := str(objective.get("description", objective_type.capitalize()))
		var optional := bool(objective.get("optional", false))

		match objective_type:
			"defeat_all_enemies":
				win_conditions.add_defeat_all_enemies_condition(optional)
			"survive_rounds":
				win_conditions.add_survive_rounds_condition(int(objective.get("rounds", 1)), optional)
			"score_threshold":
				win_conditions.add_score_threshold_condition(int(objective.get("score", 0)), optional)
			"complete_objective":
				win_conditions.add_objective_condition(str(objective.get("id", "objective")), description, optional)
			"hp_above_threshold":
				win_conditions.add_hp_threshold_condition(int(objective.get("hp_threshold", 1)), optional)
			_:
				push_warning("Unknown encounter objective type '%s' on '%s'" % [objective_type, encounter.encounter_id])

func _emit_load_failed(path: String, error_message: String) -> void:
	encounter_load_failed.emit(path, error_message)
	push_warning("Encounter load failed for %s: %s" % [path, error_message])
