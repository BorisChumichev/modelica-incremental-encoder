class EncoderDirectionIdentifier "Encoder's rotation direction identifier model"
  //dependencies
  import Modelica.Blocks.Interfaces;
  //variables
  Boolean eccw "Counterclockwise rotation event";
  Boolean ecw "Clockwise rotation event";
  //inputs
  Interfaces.BooleanInput a "Channel A of the encoder";
  Interfaces.BooleanInput b "Channel B of the encoder";
  //outputs
  Interfaces.BooleanOutput q "Rotation direction flag (true for CCW and false for CW)";
equation
  ecw = b and not pre(b) and not pre(a)
    or a and pre(b) and not pre(a)
    or not b and pre(b) and pre(a)
    or not pre(b) and pre(a) and not a;
  eccw = b and not pre(b) and pre(a)
    or a and not pre(b) and not pre(a)
    or not b and pre(b) and not pre(a)
    or pre(b) and pre(a) and not a;
  q = eccw or not ecw and pre(q);
end EncoderDirectionIdentifier;