// camera_calibration.cpp
#include <Godot.hpp>
#include <opencv2/opencv.hpp>
#include <Reference.hpp>

using namespace godot;

class CameraCalibration : public Reference {
    GODOT_CLASS(CameraCalibration, Reference)

public:
    static void _register_methods() {
        register_method("calibrate_camera", &CameraCalibration::calibrate_camera);
        register_method("undistort_image", &CameraCalibration::undistort_image);
    }

    void _init() {}

    Dictionary calibrate_camera(Array image_paths) {
        // OpenCV camera calibration logic here
        std::vector<std::string> paths;
        for (int i = 0; i < image_paths.size(); i++) {
            paths.push_back(String(image_paths[i]).utf8().get_data());
        }

        cv::Size pattern_size(9, 6);
        std::vector<std::vector<cv::Point2f>> image_points;
        std::vector<cv::Point3f> obj;
        for (int i = 0; i < pattern_size.height; ++i) {
            for (int j = 0; j < pattern_size.width; ++j) {
                obj.push_back(cv::Point3f((float)j, (float)i, 0));
            }
        }

        std::vector<std::vector<cv::Point3f>> object_points(1, obj);
        object_points.resize(paths.size(), object_points[0]);

        cv::Mat image;
        std::vector<cv::Point2f> corners;
        for (const auto &path : paths) {
            image = cv::imread(path, 0);
            bool found = cv::findChessboardCorners(image, pattern_size, corners);
            if (found) {
                image_points.push_back(corners);
            }
        }

        cv::Mat camera_matrix, dist_coeffs;
        cv::calibrateCamera(object_points, image_points, image.size(), camera_matrix, dist_coeffs, cv::noArray(), cv::noArray());

        Dictionary result;
        result["camera_matrix"] = Variant(camera_matrix);
        result["dist_coeffs"] = Variant(dist_coeffs);
        return result;
    }

    Image undistort_image(Image img, Dictionary calibration_data) {
        cv::Mat camera_matrix = calibration_data["camera_matrix"];
        cv::Mat dist_coeffs = calibration_data["dist_coeffs"];

        // Convert Godot image to OpenCV Mat
        cv::Mat input_img(img.get_height(), img.get_width(), CV_8UC3, img.get_data().read().ptr());

        cv::Mat undistorted;
        cv::undistort(input_img, undistorted, camera_matrix, dist_coeffs);

        // Convert back to Godot Image
        Image gd_image;
        gd_image.create_from_data(undistorted.cols, undistorted.rows, false, Image.FORMAT_RGB8, undistorted.data);
        return gd_image;
    }
};

extern "C" void GDN_EXPORT godot_gdnative_init(godot_gdnative_init_options *o) {}
extern "C" void GDN_EXPORT godot_gdnative_terminate(godot_gdnative_terminate_options *o) {}
extern "C" void GDN_EXPORT godot_nativescript_init(void *handle) {
    godot::Godot::nativescript_init(handle);
    godot::register_class<CameraCalibration>();
}
