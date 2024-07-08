## Save this script as CaptureImage.gd and attach it to a Button node
#
#extends Button
#
#var capture_directory = "res://calibration_images/"
#var camera_node
#var mtx
#var dist
#
#func _ready():
	#ensure_capture_directory_exists()
	#
	## Get the camera node, ensure this path is correct in your scene tree
	#camera_node = get_parent().get_node("Camera2D")  # Change to "Camera3D" if using 3D
#
	## Connect the button's pressed signal to the _on_Button_pressed function
	#self.connect("pressed", Callable(self, "_on_Button_pressed"))
#
	## Load calibration parameters
	#load_calibration_parameters("res://calibration_result.npz")
#
#func ensure_capture_directory_exists():
	#var dir = DirAccess.open(capture_directory)
	#if dir == null:
		#dir = DirAccess.open("res://")
		#dir.make_dir_recursive("calibration_images")
#
#func _on_Button_pressed():
	#capture_image()
#
#func capture_image():
	#var img = get_viewport().get_texture().get_data()
	#img.flip_y()  # Flip the image if needed
	##var timestamp = generate_timestamp()
	#var file_path = capture_directory + "image_" + ".png"
	#img.save_png(file_path)
	#print("Captured and saved:", file_path)
#
#
##func load_calibration_parameters(path):
	##var file = File.new()
	##if file.file_exists(path):
		##file.open(path, File.READ)
		##var data = file.get_buffer(file.get_len())
		##file.close()
##
		##var npz = NpzLoader.new()
		##var parsed = npz.load_from_buffer(data)
		##mtx = parsed["mtx"]
		##dist = parsed["dist"]
		##print("Loaded calibration parameters")
