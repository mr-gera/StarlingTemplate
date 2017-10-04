package {

import flash.utils.ByteArray;

import flump.display.Library;
import flump.display.LibraryLoader;
import flump.display.*;
import flump.executor.Future;

import starling.core.Starling;

import starling.display.Sprite;
import starling.events.Event;

public class Game extends Sprite
{
    protected var _movieCreator :MovieCreator;

    [Embed(source="/mascot.zip", mimeType="application/octet-stream")]
    private static const MASCOT_ZIP :Class;



    public function Game()
    {
        super();

        const loader :Future = LibraryLoader.loadBytes(ByteArray(new MASCOT_ZIP()));
        loader.succeeded.connect(onLibraryLoaded);
        loader.failed.connect(function (e :Error) :void { throw e; });

        addEventListener(starling.events.Event.ADDED_TO_STAGE, handleAdded)
    }


    function handleAdded(e: starling.events.Event) {
        trace("Yo");
    }

    protected function onLibraryLoaded (library :Library) :void {
        var movie :Movie = library.createMovie("walk")
                //_movieCreator.createMovie("walk");
        movie.x = 320;
        movie.y = 240;
        addChild(movie);

        movie.play();

        // Clean up after ourselves when the screen goes away.
        addEventListener(Event.REMOVED_FROM_STAGE, function (..._) :void {
            library.dispose();
        });
    }
}

}
