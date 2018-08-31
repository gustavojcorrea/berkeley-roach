#include <ros/ros.h>
#include <tf/transform_datatypes.h>
#include <ar_track_alvar_msgs/AlvarMarkers.h>


#include "geometry_msgs/PoseStamped.h"

void cb(ar_track_alvar_msgs::AlvarMarkers req) {
    if (!req.markers.empty()) {
      tf::Quaternion q(req.markers[0].pose.pose.orientation.x, req.markers[0].pose.pose.orientation.y, req.markers[0].pose.pose.orientation.z, req.markers[0].pose.pose.orientation.w);
      tf::Matrix3x3 m(q);
      double roll, pitch, yaw;
      m.getRPY(roll, pitch, yaw);
      ROS_INFO("roll, pitch, yaw=%1.2f  %1.2f  %1.2f", roll, pitch, yaw);
      // roll  --> rotate around vertical axis
      // pitch --> rotate around horizontal axis
      // yaw   --> rotate around depth axis
    } // if
}

void pose_callback(const geometry_msgs::PoseStamped::ConstPtr& pose){
	float x_pos = pose->pose.position.x;
	float y_pos = pose->pose.position.y;
	float z_pos = pose->pose.position.z;

	ROS_INFO("x, y, z= %1.2f %1.2f %1.2f" , x_pos, y_pos, z_pos);
}
int main(int argc, char **argv) {
  ros::init(argc, argv, "arlistener");
  ros::NodeHandle nh;
  ros::Subscriber sub = nh.subscribe("/visp_auto_tracker/object_position", 1, pose_callback);
  ros::spin();
  return 0;

}
