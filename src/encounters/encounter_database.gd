class_name EncounterDatabase
extends Node

@export_dir var encounter_directory: String = "res://data/encounters"
@export var load_on_ready: bool = true

var loader: EncounterLoader
var _encounters: Dictionary = {}

func _ready() -> void:
	loader = EncounterLoader.new()
	add_child(loader)
	if load_on_ready:
		reload()

func reload() -> void:
	_encounters = loader.load_encounters_in_directory(encounter_directory)

func has_encounter(encounter_id: String) -> bool:
	return _encounters.has(encounter_id)

func get_encounter(encounter_id: String) -> EncounterDefinition:
	return _encounters.get(encounter_id)

func list_encounter_ids() -> Array[String]:
	var ids: Array[String] = []
	for encounter_id in _encounters.keys():
		ids.append(str(encounter_id))
	ids.sort()
	return ids

func build_runtime_payload(encounter_id: String) -> Dictionary:
	var encounter = get_encounter(encounter_id)
	if encounter == null:
		return {}
	return loader.build_runtime_payload(encounter)
