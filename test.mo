model Test "Incremental Shaft Encoder model test"
  IncrementalShaftEncoder encoder;
  Real angle;
  Boolean out1;
  Boolean out2;
  Boolean out3;
equation
  der(angle) = 10;
  connect(angle, encoder.theta);
  connect(out1, encoder.a);
  connect(out2, encoder.b);
  connect(out3, encoder.z);
end Test;