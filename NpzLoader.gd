extends Node

class_name NpzLoader

func load_from_buffer(data):
	var buffer = PackedByteArray(data)
	var npz_data = {}
	
	# Define sizes
	var mtx_size = 3 * 3
	var dist_size = 1 * 5
	
	# Extract mtx and dist
	var mtx_buffer = buffer.subarray(0, mtx_size * 4)
	var dist_buffer = buffer.subarray(mtx_size * 4, (mtx_size + dist_size) * 4)
	
	var mtx = PackedFloat32Array(mtx_buffer)
	var dist = PackedFloat32Array(dist_buffer)
	
	npz_data["mtx"] = mtx
	npz_data["dist"] = dist
	
	return npz_data
