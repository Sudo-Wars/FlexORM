/*
 * Copyright (c) 2011.
 * @author - Seyran Sitshayev <seyrancom@gmail.com>
 */

package nz.co.codec.flexorm.criteria
{
    import mx.utils.StringUtil;

    public class LimitCondition extends Condition
    {
        private var limitCount:uint;
        private var limitFrom:uint;

        public function LimitCondition(limitCount:uint, limitFrom:uint = 0, isCompositeColumn:Boolean = false)
        {
            super(table, column, isCompositeColumn);
            this.limitCount = limitCount;
            this.limitFrom = limitFrom;
        }

        override public function toString():String
        {
            return StringUtil.substitute(" limit {0},{1} ", limitFrom, limitCount);
        }

    }
}