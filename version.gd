@tool
extends SceneTree

func _initialize():
	var args = OS.get_cmdline_args()
	ProjectSettings.set_setting("application/config/version", args[-1])
	ProjectSettings.save()
	quit()
