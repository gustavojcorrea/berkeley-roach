#!/bin/sh
# 2017-11-29 LLW shell script for changing ownership and sticky bit for ros_openroach
# usage: ~/bin/edumip_change_perms.sh
#
echo ls -l ~/catkin_ws/devel/lib/ros_openroach/ros_openroach
ls -l ~/catkin_ws/devel/lib/ros_openroach/ros_openroach

echo sudo chown root:root  ~/catkin_ws/devel/lib/ros_openroach/ros_openroach
sudo chown root:root  ~/catkin_ws/devel/lib/ros_openroach/ros_openroach

echo sudo chmod u+s  ~/catkin_ws/devel/lib/ros_openroach/ros_openroach
sudo chmod u+s  ~/catkin_ws/devel/lib/ros_openroach/ros_openroach

echo ls -l ~/catkin_ws/devel/lib/ros_openroach/ros_openroach
ls -l ~/catkin_ws/devel/lib/ros_openroach/ros_openroach
