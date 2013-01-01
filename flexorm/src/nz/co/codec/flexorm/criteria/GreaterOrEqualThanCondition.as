/*
 * Copyright (c) 2011.
 * @author - Seyran Sitshayev <seyrancom@gmail.com>
 */

package nz.co.codec.flexorm.criteria
{
    public class GreaterOrEqualThanCondition extends ParameterisedCondition
    {
        public function GreaterOrEqualThanCondition(table:String, column:String, param:String)
        {
            super(table, column, param);
        }

        override public function toString():String
        {
            return column + ">=:" + param;
        }
    }
}