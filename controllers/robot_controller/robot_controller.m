% MATLAB controller for Webots
% File:          robot_controller.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 64;
motorLP = wb_robot_get_device('motorLP');
motorLZ = wb_robot_get_device('motorLZ');
motorPP = wb_robot_get_device('motorPP');
motorPZ = wb_robot_get_device('motorPZ');

irP = wb_robot_get_device('irP');
irL = wb_robot_get_device('irL');

dst = wb_robot_get_device('dst');

wb_distance_sensor_enable(irP,TIME_STEP);
wb_distance_sensor_enable(irL,TIME_STEP);
wb_distance_sensor_enable(dst,TIME_STEP);

wb_motor_set_position(motorLP, inf);
wb_motor_set_position(motorLZ, inf);
wb_motor_set_position(motorPP, inf);
wb_motor_set_position(motorPZ, inf);

wb_motor_set_velocity(motorLP, -2);
wb_motor_set_velocity(motorLZ, -2);
wb_motor_set_velocity(motorPP, 2);
wb_motor_set_velocity(motorPZ, 2);




% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
%  motor = wb_robot_get_device('motor');

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%
while wb_robot_step(TIME_STEP) ~= -1

irP_value = wb_distance_sensor_get_value(irP);
irL_value = wb_distance_sensor_get_value(irL);
dst_value = wb_distance_sensor_get_value(dst);

if irL_value > 500

wb_motor_set_velocity(motorLP, 0);
wb_motor_set_velocity(motorLZ, 0);
wb_motor_set_velocity(motorPP, 3);
wb_motor_set_velocity(motorPZ, 3);

elseif irP_value > 500

wb_motor_set_velocity(motorLP, -3);
wb_motor_set_velocity(motorLZ, -3);
wb_motor_set_velocity(motorPP, 0);
wb_motor_set_velocity(motorPZ, 0);


else

wb_motor_set_velocity(motorLP, -2);
wb_motor_set_velocity(motorLZ, -2);
wb_motor_set_velocity(motorPP, 2);
wb_motor_set_velocity(motorPZ, 2);

end

if dst_value < 60

wb_motor_set_velocity(motorLP, 0);
wb_motor_set_velocity(motorLZ, 0);
wb_motor_set_velocity(motorPP, 0);
wb_motor_set_velocity(motorPZ, 0);

end


  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end

% cleanup code goes here: write data to files, etc.
