  model DirectionIdentifiersTest "Direction Identifiers"
      import Modelica.Blocks.Sources;
      IncrementalShaftEncoder encoder;
      EncoderDirectionIdentifier dirId;
      EncoderTrivialDirectionIdentifier dirIdTriv;
      Sources.ExpSine impact(offset=2, freqHz=20, damping=20, amplitude=4);
      Boolean out1;
      Boolean out2;
      Boolean out3;
      Boolean qTriv;
      Boolean q;
    equation
      connect(impact.y, encoder.theta);
      connect(encoder.a, dirId.a);
      connect(encoder.b, dirId.b);
      connect(encoder.a, dirIdTriv.a);
      connect(encoder.b, dirIdTriv.b);
      connect(out1, encoder.a);
      connect(out2, encoder.b);
      connect(out3, encoder.z);
      connect(qTriv, dirIdTriv.q);
      connect(q, dirId.q);
  end DirectionIdentifiersTest;