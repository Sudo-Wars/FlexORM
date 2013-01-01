/*
 * Copyright (c) 2011.
 * @author - Seyran Sitshayev <seyrancom@gmail.com>
 */

package nz.co.codec.flexorm.criteria
{
    public class LessOrEqualThanCondition extends ParameterisedCondition
    {
        public function LessOrEqualThanCondition(table:String, column:String, param:String)
        {
            super(table, column, param);
        }

        override public function toString():String
        {
            return column + "<=:" + param;
        }
    }
}