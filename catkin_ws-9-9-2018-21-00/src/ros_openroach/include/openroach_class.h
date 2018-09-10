#ifndef OPENROACH_CLASS_H_
#define OPENROACH_CLASS_H_

//some generically useful stuff to include...
#include <math.h>
#include <stdlib.h>
#include <string>
#include <vector>

#include <ros/ros.h> //ALWAYS need to include this
#include "geometry_msgs/PoseStamped.h"
//#include <tf/transform_broadcaster.h>

#include <ar_track_alvar_msgs/AlvarMarkers.h>

//message types used in this example code;  include more message types, as needed
#include <std_msgs/Bool.h> 
#include <std_msgs/Float32.h>


// define a class, including a constructor, member variables and member functions
class OpenRoachClass
{
public:
    OpenRoachClass(ros::NodeHandle* nodehandle); //"main" will need to instantiate a ROS nodehandle, then pass it to the constructor
    // may choose to define public methods or public variables, if desired
private:
    // put private member data here;  "private" data will only be available to member functions of this class;
    ros::NodeHandle nh_; // we will need this, to pass between "main" and constructor
    // some objects to support subscriber, service, and publisher
    ros::Subscriber tag_pose_sub; //these will be set up within the class constructor, hiding these ugly details
    ros::ServiceServer minimal_service_;
    ros::Publisher  minimal_publisher_;
    
    double val_to_remember_; // member variables will retain their values even as callbacks come and go
    float x_pos_tag;
    float y_pos_tag;
    float z_pos_tag;
    double roll_tag;
    double pitch_tag;
    double yaw_tag;
    //tf::Transform transform_tag;
 
    float x_pos_cam;
    float y_pos_cam;
    float z_pos_cam;
    //tf::Transform transform_cam;
    float DUTY_MAX;
    float DUTY_L;
    float DUTY_R;

    float prevXerror;

    std::string WORLD_FRAME_NAME;
    std::string BODY_FRAME_NAME;    
    // member methods as well:
    void initializeSubscribers(); // we will define some helper methods to encapsulate the gory details of initializing subscribers, publishers and services
    void initializePublishers();
    void initializeServices();
   
    void tag_pose_callback(const geometry_msgs::PoseStamped::ConstPtr& pose); 
 }; // note: a class definition requires a semicolon at the end of the definition

#endif  // this closes the header-include trick...ALWAYS need one of these to match #ifndef

