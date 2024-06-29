class_name ExampleTest
extends GdUnitTestSuite

func test_version_number() -> void:
	var runner := scene_runner("res://Scenes/Main/Main.tscn")
	runner.await_signal("ready")
	var version = auto_free(runner.find_child("Version") as RichTextLabel)
	assert_object(version).is_not_null()
	assert_str(version.text).contains(str(ProjectSettings.get_setting("application/config/version")))
	
