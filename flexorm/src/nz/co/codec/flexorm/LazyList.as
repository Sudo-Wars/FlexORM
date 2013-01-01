/*
 * Copyright (c) 2011.
 * @author - Seyran Sitshayev <seyrancom@gmail.com>
 */

package nz.co.codec.flexorm
{
    import mx.collections.ArrayList;

    import nz.co.codec.flexorm.metamodel.IListAssociation;
    import nz.co.codec.flexorm.metamodel.ManyToManyAssociation;
    import nz.co.codec.flexorm.metamodel.OneToManyAssociation;

    public class LazyList extends ArrayList
    {
        private var _em:EntityManager;

        private var _a:IListAssociation;

        private var _idMap:Object;

        private var _loaded:Boolean = true;

        public function LazyList(em:EntityManager, a:IListAssociation, idMap:Object)
        {
            super();
            _em = em;
            _a = a;
            _idMap = idMap;
        }

        public function initialise():void
        {
            _loaded = false;
        }

        public function get loaded():Boolean
        {
            return _loaded;
        }

        override public function get source():Array
        {
            if (!_loaded)
            {
                _loaded = true;
                if (_a is OneToManyAssociation)
                {
                    var otmAssociations:Array = _em.loadOneToManyAssociation(OneToManyAssociation(_a), _idMap);
                    if (otmAssociations)
                    {
                        super.source = otmAssociations;
                        dispatchEvent(new LazyListEvent(LazyListEvent.LIST_LOADED));
                    }
                }
                else if (_a is ManyToManyAssociation)
                {
                    var mtmAssociations:Array = _em.loadManyToManyAssociation(ManyToManyAssociation(_a), _idMap);
                    if (mtmAssociations)
                    {
                        super.source = mtmAssociations;
                        dispatchEvent(new LazyListEvent(LazyListEvent.LIST_LOADED));
                    }
                }
            }
            return super.source;
        }

    }
}