/*
 * Copyright (c) 2011.
 * @author - Seyran Sitshayev <seyrancom@gmail.com>
 */

package nz.co.codec.flexorm.criteria
{
    public class InCondition extends ParameterisedCondition
    {
        private var _value:Array;
        private var _params:Array;

        public function InCondition(table:String, column:String, value:Array)
        {
            super(table, column, column);
            _value = value;
            updateParams();
        }

        protected function get value():Array
        {
            return _value;
        }

        public function get params():Array
        {
            return _params;
        }

        protected function updateParams():void
        {
            _params = [];
            for (var i:int = 0; i < value.length; i++)
            {
                _params[column + "_" + i] = value[i];
            }
        }

        public function setParams(prevParams:Object):Object
        {
            for (var paramName:String in params)
            {
                prevParams[paramName] = params[paramName];
            }
            return prevParams;
        }

        override public function toString():String
        {
            var result:String = column + " in ( ";
            for (var param:String in params)
            {
                result += ":" + param + ",";
            }
            result = result.substring(0, result.length - 1) + " )";

            return result;
        }
    }
}