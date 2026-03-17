## Character Registry
##
## Central registry for playable character packages. Add new package scripts to
## PACKAGE_SCRIPTS and the rest of the game can discover them through this API.

class_name CharacterRegistry
extends RefCounted

const PACKAGE_SCRIPTS: Array[Script] = [
	preload("res://src/characters/maya/maya_package.gd"),
	preload("res://src/characters/ember/ember_package.gd"),
	preload("res://src/characters/wren/wren_package.gd")
]

static var _packages_by_id: Dictionary = {}
static var _ordered_packages: Array[CharacterPackage] = []

static func get_packages() -> Array[CharacterPackage]:
	_ensure_loaded()
	return _ordered_packages.duplicate()

static func get_playable_character_ids() -> Array[String]:
	_ensure_loaded()
	var ids: Array[String] = []
	for package in _ordered_packages:
		ids.append(package.get_id())
	return ids

static func has_character(character_id: String) -> bool:
	_ensure_loaded()
	return _packages_by_id.has(character_id)

static func get_package(character_id: String) -> CharacterPackage:
	_ensure_loaded()
	return _packages_by_id.get(character_id)

static func create_character(character_id: String) -> Character:
	var package = get_package(character_id)
	return package.create_character() if package else null

static func load_cards(character_id: String) -> Array[Card]:
	var package = get_package(character_id)
	return package.load_cards() if package else []

static func load_starter_deck(character_id: String) -> Array[Card]:
	var package = get_package(character_id)
	return package.load_starter_deck() if package else []

static func create_card_effects(character_id: String, character: Character = null) -> Node:
	var package = get_package(character_id)
	return package.create_card_effects(character) if package else null

static func create_support_systems(character_id: String, character: Character = null) -> Dictionary:
	var package = get_package(character_id)
	return package.create_support_systems(character) if package else {}

static func get_character_summaries() -> Array[Dictionary]:
	_ensure_loaded()
	var summaries: Array[Dictionary] = []
	for package in _ordered_packages:
		summaries.append(package.get_summary())
	return summaries

static func _ensure_loaded() -> void:
	if not _ordered_packages.is_empty():
		return

	for package_script in PACKAGE_SCRIPTS:
		var package = package_script.new() as CharacterPackage
		if package == null:
			push_warning("CharacterRegistry: failed to instantiate package script %s" % package_script)
			continue
		if package.get_id().is_empty():
			push_warning("CharacterRegistry: skipping package with empty id: %s" % package_script)
			continue
		if _packages_by_id.has(package.get_id()):
			push_warning("CharacterRegistry: duplicate character id '%s'" % package.get_id())
			continue

		_packages_by_id[package.get_id()] = package
		_ordered_packages.append(package)
