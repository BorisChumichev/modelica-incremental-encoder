  model Test "Incremental Shaft Encoder model test"
      IncrementalShaftEncoder encoder;
      EncoderDirectionIdentifier dirId;
      Real angle;
      Boolean out1;
      Boolean out2;
      Boolean out3;
      Boolean out4;
    equation
      der(angle) = if time < 0.25 then 5 else -5;
      connect(angle, encoder.theta);
      connect(encoder.a, dirId.a);
      connect(encoder.b, dirId.b);
      connect(out1, encoder.a);
      connect(out2, encoder.b);
      connect(out3, encoder.z);
      connect(out4, dirId.q);
  end Test;