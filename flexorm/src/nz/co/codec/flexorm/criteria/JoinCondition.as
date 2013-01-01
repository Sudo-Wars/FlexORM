/*
 * Copyright (c) 2011.
 * @author - Seyran Sitshayev <seyrancom@gmail.com>
 */

package nz.co.codec.flexorm.criteria
{
    import nz.co.codec.flexorm.metamodel.Entity;

    public class JoinCondition extends Condition
    {
        private var _entity:Entity;
        private var _fkColumn:String;
        private var _fkTable:String;
        private var _pk:String;

        public function JoinCondition(entity:Entity, pk:String, fkColumn:String = null, fkTable:String = null)
        {
            super(entity.table, pk, isCompositeColumn);
            _entity = entity;
            _fkColumn = fkColumn;
            _pk = pk;
            _fkTable = fkTable;
        }

        public function get entity():Entity
        {
            return _entity;
        }

        public function get fkColumn():String
        {
            return _fkColumn;
        }

        public function get pk():String
        {
            return _pk;
        }

        public function get fkTable():String
        {
            return _fkTable;
        }

        override public function toString():String
        {
            return null;
        }
    }
}