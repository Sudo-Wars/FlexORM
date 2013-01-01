/*
 * Copyright (c) 2011.
 * @author - Seyran Sitshayev <seyrancom@gmail.com>
 */

package nz.co.codec.flexorm.criteria
{
    import nz.co.codec.flexorm.metamodel.Entity;

    public class Criteria
    {
        private var _entity:Entity;

        private var _joins:Array;

        private var _filters:Array;

        private var _groupBy:Array;

        private var _sorts:Array;

        private var _limits:Array;

        private var _params:Object;

        public function Criteria(entity:Entity)
        {
            _entity = entity;
            _filters = [];
            _groupBy = [];
            _sorts = [];
            _limits = [];
            _joins = [];
            _params = {};
        }

        public function get entity():Entity
        {
            return _entity;
        }

        public function get filters():Array
        {
            return _filters;
        }

        public function get sorts():Array
        {
            return _sorts;
        }

        public function get limits():Array
        {
            return _limits;
        }

        public function get joins():Array
        {
            return _joins;
        }

        public function get groupBy():Array
        {
            return _groupBy;
        }

        public function get params():Object
        {
            return _params;
        }

        public function addSort(property:String, order:String = null, table:String = null):Criteria
        {
            //var column:Object = _entity.getColumn(property);
            var column:Object = getColumnObject(property, table);
            if (column)
            {
                _sorts.push(new Sort(column.table, column.column, order, column.isCompositeColumn));
            }
            return this;
        }

        public function addLimit(limitCount:uint, limitFrom:uint = 0):Criteria
        {
            _limits.push(new LimitCondition(limitCount, limitFrom));
            return this;
        }

        public function createAndJunction():Junction
        {
            return Junction.and(_entity);
        }

        public function createOrJunction():Junction
        {
            return Junction.or(_entity);
        }

        public function addJunction(junction:Junction):Criteria
        {
            _filters.push(junction);
            return this;
        }

        private function getColumnObject(property:String, table:String = null):Object
        {
            if (table != null && property != null)
            {
                return {table:table, column:property}
            }

            var column:Object = _entity.getColumn(property);

            if (column != null)
            {
                return column;
            }

            if (_joins != null)
            {
                for each(var join:JoinCondition in joins)
                {
                    column = join.entity.getColumn(property);
                    if (column != null && column.table == table && column != null)
                    {
                        break;
                    }
                }
            }

            return column;
        }

        public function addInCondition(property:String, value:Array, table:String = null):Criteria
        {
            var column:Object = getColumnObject(property, table);
            if (column && value != null && value.length > 0)
            {
                var ic:InCondition = new InCondition(column.table, column.column, value);
                _filters.push(ic);
                ic.setParams(_params);
            }
            return this;
        }

        public function addGroupBy(property:String, table:String = null, isCompositeColumn:Boolean = false):Criteria
        {
            var column:Object = getColumnObject(property, table);
            if (column)
            {
                var ic:ICondition = new GroupByCondition(column.table, column.column, isCompositeColumn);
                _groupBy.push(ic);
            }
            return this;
        }

        public function addJoinCondition(entity:Entity, pk:String, fkColumn:String = null, fkTable:String = null):Criteria
        {
            if (entity != null && pk != null)
            {
                _joins.push(new JoinCondition(entity, pk, fkColumn, fkTable));
            }
            return this;
        }

        public function addEqualsCondition(property:String, value:Object, table:String = null):Criteria
        {
            var column:Object = getColumnObject(property, table);
            if (column)
            {
                _filters.push(new EqualsCondition(column.table, column.column, property));
                _params[property] = value;
            }
            return this;
        }

        public function addNotEqualsCondition(property:String, value:Object, table:String = null):Criteria
        {
            var column:Object = getColumnObject(property, table);
            if (column)
            {
                _filters.push(new NotEqualsCondition(column.table, column.column, property));
                _params[property] = value;
            }
            return this;
        }

        public function addGreaterThanCondition(property:String, value:int, table:String = null):Criteria
        {
            var column:Object = getColumnObject(property, table);
            if (column)
            {
                _filters.push(new GreaterThanCondition(column.table, column.column, property + "_greaterThan"));
                _params[property + "_greaterThan"] = value;
            }
            return this;
        }

        public function addGreaterOrEqualThanCondition(property:String, value:int, table:String = null):Criteria
        {
            var column:Object = getColumnObject(property, table);
            if (column)
            {
                _filters.push(new GreaterOrEqualThanCondition(column.table, column.column, property + "_greaterOrEqualThan"));
                _params[property + "_greaterOrEqualThan"] = value;
            }
            return this;
        }

        public function addLessThanCondition(property:String, value:int, table:String = null):Criteria
        {
            var column:Object = getColumnObject(property, table);
            if (column)
            {
                _filters.push(new LessThanCondition(column.table, column.column, property + "_lessThan"));
                _params[property + "_lessThan"] = value;
            }
            return this;
        }

        public function addLessOrEqualThanCondition(property:String, value:int, table:String = null):Criteria
        {
            var column:Object = getColumnObject(property, table);
            if (column)
            {
                _filters.push(new LessOrEqualThanCondition(column.table, column.column, property + "_lessOrEqualThan"));
                _params[property + "_lessOrEqualThan"] = value;
            }
            return this;
        }

        public function addLikeCondition(property:String, str:String, table:String = null):Criteria
        {
            var column:Object = getColumnObject(property, table);
            if (column)
            {
                _filters.push(new LikeCondition(column.table, column.column, str, column.isCompositeColumn));
            }
            return this;
        }

        public function addLikeConditionByAlias(property:String, str:String, table:String = null):Criteria
        {
            _filters.push(new LikeCondition(_entity.table, property, str, true));
            return this;
        }

        public function addNullCondition(property:String, table:String = null):Criteria
        {
            var column:Object = getColumnObject(property, table);
            if (column)
            {
                _filters.push(new NullCondition(column.table, column.column));
            }
            return this;
        }

        public function addNotNullCondition(property:String, table:String = null):Criteria
        {
            var column:Object = getColumnObject(property, table);
            if (column)
            {
                _filters.push(new NotNullCondition(column.table, column.column));
            }
            return this;
        }

    }
}