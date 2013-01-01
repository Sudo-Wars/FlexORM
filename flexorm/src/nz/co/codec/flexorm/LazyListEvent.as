/*
 * Copyright (c) 2011.
 * @author - Seyran Sitshayev <seyrancom@gmail.com>
 */

/**
 * Created by IntelliJ IDEA.
 * User: Seyran
 * Date: 1/13/11
 * Time: 8:47 PM
 * To change this template use File | Settings | File Templates.
 */
package nz.co.codec.flexorm
{
    import flash.events.Event;

    public class LazyListEvent extends Event
    {
        public static const LIST_LOADED:String = "lazyListLoadedEvent";

        public function LazyListEvent(type:String)
        {
            super(type);
        }
    }
}
