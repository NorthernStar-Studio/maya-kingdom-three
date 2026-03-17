class_name PlatformContext
extends Node

## Shared portability prep entry point.
##
## This groups together config, input routing, and platform services so
## scenes can depend on one boundary instead of directly on engine globals.

var config: GameConfig
var input_router: InputRouter
var services: PlatformServices

func initialize() -> void:
	if config != null:
		return
	config = GameConfig.create_default()
	input_router = InputRouter.new(config)
	services = PlatformServices.new()
	input_router.ensure_default_bindings()

func _ready() -> void:
	initialize()
