package {

import flash.display.Sprite;
import flash.text.TextField;
import starling.core.Starling;

import flump.display.*;


public class Main extends Sprite {

    private var _starling:Starling;

    public function Main() {
        ///var textField:TextField = new TextField();
//        textField.text = "Hello, World";
//        addChild(textField);

        _starling = new Starling(Game, stage);
        _starling.start();

        _starling.antiAliasing = 1;
    }
}
}
