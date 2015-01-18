class EncoderTrivialDirectionIdentifier "Encoder's trivial rotation direction identifier model"
  //dependencies
  import Modelica.Blocks.Interfaces;
  //inputs
  Interfaces.BooleanInput a "Channel A of the encoder";
  Interfaces.BooleanInput b "Channel B of the encoder";
  //outputs
  Interfaces.BooleanOutput q "Rotation direction flag (true for CCW and false for CW)";
equation
  q = if edge(b) then a else pre(q); 
end EncoderTrivialDirectionIdentifier;