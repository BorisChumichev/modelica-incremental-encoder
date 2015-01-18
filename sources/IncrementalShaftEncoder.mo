class IncrementalShaftEncoder "Incremental Shaft Encoder model"
  //dependencies
  import Modelica.Constants;
  import Modelica.Blocks.Interfaces;
  //variables
  constant Real pi = Constants.pi;
  parameter Real ppr = 16 "Pulses per revolution (PPR) of the encoder";
  Real pulseTheta = (2*pi)/(ppr*4) "Angular step of the encoder";
  //inputs
  Interfaces.RealInput theta "Angular position of the shaft";
  //outputs
  Interfaces.BooleanOutput a "Channel A";
  Interfaces.BooleanOutput b "Channel B";
  Interfaces.BooleanOutput z "Marker (aka index) sigal Z";
equation 
  a = mod(theta, pulseTheta) > 0 
    and mod(theta, pulseTheta) < pulseTheta/2;
  b = mod(theta, pulseTheta) > 0 
    and mod(theta-pulseTheta/4, pulseTheta) < pulseTheta/2;
  z = mod(theta, 2*pi) > 0 
    and mod(theta, 2*pi) < pulseTheta;
end IncrementalShaftEncoder;
