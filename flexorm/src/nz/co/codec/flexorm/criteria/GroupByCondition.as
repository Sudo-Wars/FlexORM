/*
 * Copyright (c) 2011.
 * @author - Seyran Sitshayev <seyrancom@gmail.com>
 */

package nz.co.codec.flexorm.criteria
{
    public class GroupByCondition extends Condition
    {
        public function GroupByCondition(table:String, column:String, isCompositeColumn:Boolean = false)
        {
            super(table, column, isCompositeColumn);
        }

        override public function toString():String
        {
            return column;
        }
    }
}