  model Test "Incremental Shaft Encoder model test"
      import Modelica.Blocks.Sources;
      IncrementalShaftEncoder encoder;
      EncoderDirectionIdentifier dirId;
      //EncoderTrivialDirectionIdentifier dirId;
      Sources.ExpSine impact(freqHz=20, damping=12, amplitude=3);
      Boolean out1;
      Boolean out2;
      Boolean out3;
      Boolean out4;
    equation
      connect(impact.y, encoder.theta);
      connect(encoder.a, dirId.a);
      connect(encoder.b, dirId.b);
      connect(out1, encoder.a);
      connect(out2, encoder.b);
      connect(out3, encoder.z);
      connect(out4, dirId.q);
  end Test;