model IncrementalShaftEncoder "Incremental Shaft Encoder model"
  //dependencies
  import Modelica.Constants;
  import Modelica.Blocks.Interfaces;
  //variables
  constant Real pi = Constants.pi;
  parameter Real ppr = 16 "Pulses per revolution (PPR) of the encoder";
  Real pulseTheta "Angular step of the encoder";
  //connectors
  Interfaces.RealInput theta "Input angle";
  Interfaces.BooleanOutput a;
  Interfaces.BooleanOutput b;
  Interfaces.BooleanOutput z;
equation
  pulseTheta = (2*pi)/(ppr*4);
  a = mod(theta, pulseTheta) >= 0 and mod(theta, pulseTheta) <= pulseTheta/2;
  b = mod(theta, pulseTheta) >= 0 and mod(theta-pulseTheta/4, pulseTheta) <= pulseTheta/2;
  z = mod(theta, 2*pi) >= 0 and mod(theta, 2*pi) <= pulseTheta;
end IncrementalShaftEncoder;