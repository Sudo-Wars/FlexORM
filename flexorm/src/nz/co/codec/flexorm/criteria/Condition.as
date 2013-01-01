/*
 * Copyright (c) 2011.
 * @author - Seyran Sitshayev <seyrancom@gmail.com>
 */

package nz.co.codec.flexorm.criteria
{
    public class Condition implements ICondition
    {
        private var _table:String;

        private var _column:String;

        private var _isCompositeColumn:Boolean;

        public function Condition(table:String, column:String, isCompositeColumn:Boolean = false)
        {
            _table = table;
            _column = column;
            _isCompositeColumn = isCompositeColumn;
        }

        public function get table():String
        {
            return _table;
        }

        public function get isCompositeColumn():Boolean
        {
            return _isCompositeColumn;
        }

        public function get column():String
        {
            return _column;
        }

        // abstract
        public function toString():String
        {
            return null;
        }
    }
}