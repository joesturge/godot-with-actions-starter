# This script is a tool script that exports the project using export presets.
# It sets the project version based on the command line argument and exports the project
# using the specified export_presets.cfg configuration file.

@tool
extends SceneTree

# Initialize the export process
func _initialize():
	# Get the command line arguments
	var args = OS.get_cmdline_args()
	
	# Set the project version based on the last command line argument
	if len(args) > 2:
		print("Setting project version to: ", args[-1])
		print()
		ProjectSettings.set_setting("application/config/version", args[-1])
		ProjectSettings.save()
	
	# Load the export presets configuration file
	var exportConfig: ConfigFile = ConfigFile.new();
	exportConfig.load("res://export_presets.cfg")
	
	# Get the sections (export presets) from the configuration file
	var sections  = exportConfig.get_sections();
	
	# Iterate through each section (export preset)
	for section in sections:
		# Skip sections that end with ".options"
		if (!section.ends_with(".options")):
			# Get the name and export path from the export preset
			var name = exportConfig.get_value(section, "name", null) as String;
			var path = exportConfig.get_value(section, "export_path", null) as String;
			
			# Check if the name is set for the export preset
			if name == null || name == "":
				push_error("Name not set for export preset: " + section);
				quit(1);
				return;
			
			# Check if the export path is set for the export preset
			if path == null || path == "":
				push_error("Path not set for export preset: " + name);
				quit(1);
				return;
			
			# Create the directory for the export path
			DirAccess.make_dir_recursive_absolute("/".join(path.split("/").slice(0, -1)));
			
			# Print the export progress
			print("Exporting project to ", name)
			print()
			
			# Execute the export command
			var exitCode = OS.execute("godot", ["--export-release", "--headless", name])
			
			# Check if the export was successful
			if exitCode != 0:
				push_error("Could not export project.")
				quit(exitCode)
				return;
			
			# Print the export success message
			print("Exported successfully to ", name)
			print()
	
	# Quit the tool script
	quit()
