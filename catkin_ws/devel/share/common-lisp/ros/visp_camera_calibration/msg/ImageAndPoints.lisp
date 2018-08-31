; Auto-generated. Do not edit!


(cl:in-package visp_camera_calibration-msg)


;//! \htmlinclude ImageAndPoints.msg.html

(cl:defclass <ImageAndPoints> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (points
    :reader points
    :initarg :points
    :type (cl:vector visp_camera_calibration-msg:ImagePoint)
   :initform (cl:make-array 0 :element-type 'visp_camera_calibration-msg:ImagePoint :initial-element (cl:make-instance 'visp_camera_calibration-msg:ImagePoint))))
)

(cl:defclass ImageAndPoints (<ImageAndPoints>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImageAndPoints>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImageAndPoints)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name visp_camera_calibration-msg:<ImageAndPoints> is deprecated: use visp_camera_calibration-msg:ImageAndPoints instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ImageAndPoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_camera_calibration-msg:header-val is deprecated.  Use visp_camera_calibration-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <ImageAndPoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_camera_calibration-msg:image-val is deprecated.  Use visp_camera_calibration-msg:image instead.")
  (image m))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <ImageAndPoints>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader visp_camera_calibration-msg:points-val is deprecated.  Use visp_camera_calibration-msg:points instead.")
  (points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImageAndPoints>) ostream)
  "Serializes a message object of type '<ImageAndPoints>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImageAndPoints>) istream)
  "Deserializes a message object of type '<ImageAndPoints>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'visp_camera_calibration-msg:ImagePoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImageAndPoints>)))
  "Returns string type for a message object of type '<ImageAndPoints>"
  "visp_camera_calibration/ImageAndPoints")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImageAndPoints)))
  "Returns string type for a message object of type 'ImageAndPoints"
  "visp_camera_calibration/ImageAndPoints")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImageAndPoints>)))
  "Returns md5sum for a message object of type '<ImageAndPoints>"
  "0fea5fc0844344ec4ec1adadebd18f75")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImageAndPoints)))
  "Returns md5sum for a message object of type 'ImageAndPoints"
  "0fea5fc0844344ec4ec1adadebd18f75")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImageAndPoints>)))
  "Returns full string definition for message of type '<ImageAndPoints>"
  (cl:format cl:nil "# An image with an array of 2D points selected in the image~%~%Header header~%~%sensor_msgs/Image image~%visp_camera_calibration/ImagePoint[] points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: visp_camera_calibration/ImagePoint~%# a point (pixel coordinates) selected in an image~%~%int32 x~%int32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImageAndPoints)))
  "Returns full string definition for message of type 'ImageAndPoints"
  (cl:format cl:nil "# An image with an array of 2D points selected in the image~%~%Header header~%~%sensor_msgs/Image image~%visp_camera_calibration/ImagePoint[] points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: visp_camera_calibration/ImagePoint~%# a point (pixel coordinates) selected in an image~%~%int32 x~%int32 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImageAndPoints>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImageAndPoints>))
  "Converts a ROS message object to a list"
  (cl:list 'ImageAndPoints
    (cl:cons ':header (header msg))
    (cl:cons ':image (image msg))
    (cl:cons ':points (points msg))
))