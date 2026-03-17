class_name PlatformServices
extends RefCounted

## Thin service boundary for platform queries/capabilities.
##
## Gameplay code should ask this object about platform support instead of
## reaching into OS / DisplayServer directly. That makes future console or
## desktop-specific implementations easier to swap in.

func get_platform_name() -> String:
	return OS.get_name()

func is_handheld_profile() -> bool:
	var platform_name := get_platform_name().to_lower()
	return platform_name in ["android", "ios"]

func supports_keyboard_mouse() -> bool:
	return not is_handheld_profile()

func supports_touch_input() -> bool:
	var platform_name := get_platform_name().to_lower()
	return platform_name in ["android", "ios"]

func prefers_compact_ui() -> bool:
	return is_handheld_profile()
