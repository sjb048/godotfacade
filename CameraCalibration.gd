extends Camera2D  # Change to Camera3D if using 3D

var mtx
var dist

func _ready():
	load_calibration_parameters("res://calibration_result.npz")

func load_calibration_parameters(path):
	var file = File.new()
	if file.file_exists(path):
		file.open(path, File.READ)
		var data = file.get_buffer(file.get_len())
		file.close()

		var npz = NpzLoader.new()
		npz.load_from_buffer(data)
		mtx = npz.get("mtx")
		dist = npz.get("dist")
		print("Loaded calibration parameters")

func undistort_image(image):
	if mtx and dist:
		# Convert Image to OpenCV format (numpy array) if necessary
		# Apply the undistortion here using mtx and dist
		# Godot doesn't directly support numpy, so you might need to use GDScript to manually undistort the image or pre-process images externally
		pass
