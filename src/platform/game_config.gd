class_name GameConfig
extends Resource

## Centralized gameplay and input configuration.
##
## This is intentionally lightweight: it keeps platform-sensitive values
## and semantic action names out of gameplay scripts so future ports can
## swap bindings or tune behavior in one place.

@export var starting_hand_size: int = 5
@export var max_turns_per_round: int = 10
@export var time_limit_seconds: int = 60

@export var action_confirm: StringName = &"ui_accept"
@export var action_cancel: StringName = &"ui_cancel"
@export var action_pause: StringName = &"ui_focus_next"

static func create_default() -> GameConfig:
	return GameConfig.new()
