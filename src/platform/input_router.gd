class_name InputRouter
extends RefCounted

## Maps raw engine input to semantic game commands.
##
## This keeps input handling portable: gameplay code can respond to
## Command values without caring whether they came from keyboard, pad,
## touch, or a future platform-specific adapter.

enum Command {
	NONE,
	CONFIRM,
	CANCEL,
	PAUSE
}

var _config: GameConfig

func _init(config: GameConfig = null) -> void:
	_config = config if config != null else GameConfig.create_default()

func resolve_event(event: InputEvent) -> Command:
	if event.is_action_pressed(_config.action_confirm):
		return Command.CONFIRM
	if event.is_action_pressed(_config.action_cancel):
		return Command.CANCEL
	if event.is_action_pressed(_config.action_pause):
		return Command.PAUSE
	return Command.NONE

func ensure_default_bindings() -> void:
	_ensure_key_binding(_config.action_confirm, KEY_SPACE)
	_ensure_key_binding(_config.action_cancel, KEY_ESCAPE)
	_ensure_key_binding(_config.action_pause, KEY_TAB)

func _ensure_key_binding(action_name: StringName, keycode: Key) -> void:
	if not InputMap.has_action(action_name):
		InputMap.add_action(action_name)

	for event in InputMap.action_get_events(action_name):
		if event is InputEventKey and event.keycode == keycode:
			return

	var key_event := InputEventKey.new()
	key_event.keycode = keycode
	InputMap.action_add_event(action_name, key_event)
