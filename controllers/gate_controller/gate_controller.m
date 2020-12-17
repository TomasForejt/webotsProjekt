% MATLAB controller for Webots
% File:          gate_controller.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 64;

motor1 = wb_robot_get_device('motor1');
motor2 = wb_robot_get_device('motor2');
wb_motor_set_position(motor1, inf);
wb_motor_set_position(motor2, inf);

dist = wb_robot_get_device('dist');
wb_distance_sensor_enable(dist, TIME_STEP);

% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
%  motor = wb_robot_get_device('motor');

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%
while wb_robot_step(TIME_STEP) ~= -1

dist_value = wb_distance_sensor_get_value(dist);

if dist_value < 60
  if x < 10000
  
  wb_motor_set_velocity(motor1, -1);
  wb_motor_set_velocity(motor2, -1);
  
  end
  
end

x = x + 1



  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;
end

% cleanup code goes here: write data to files, etc.
