extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	# set test as number from project file
	text = "Version: " + str(ProjectSettings.get_setting("application/config/version"))
