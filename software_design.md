# App overview
TicTacToe / Four connect AR Facade game
### AR System
 - Input: Camera video stream
 - Output: 
### Next steps AR System
- Get video stream from camera to display in Godot window
- Get window corner points and overlay window detection in godot application
- Camera calibration



### Godot side
- Input: 
    - Image stream
    - Window corner points
    - Camera pose (From slam or homography)

- Requires: Pose of the plane of the facade -> translate and rotate playing board to match the facade
- Requires: Pose of the camera -> translate and rotate the camera to match the facade
- Output: 3D UI elements (buttons, text, etc) on the facade

### Next steps Godot side
- fake pose detection for testing:
    - render 2d sprites for tictactoe UI elements on window pixel coordinates
    - create clickable buttons that change the state of the displayed sprite
- Simple prototype to align a quad to the facade and have camera in the correct position

### To do
- pose estimation (camera and facade)
- 

### Backlog
- SLAM Tracking 
