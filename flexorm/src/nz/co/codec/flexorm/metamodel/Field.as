package nz.co.codec.flexorm.metamodel
{
    public class Field
    {
        public var column:String;

        public var property:String;

        public var type:String;

        public var expression:String = null;

        public function get isCompositeColumn():Boolean
        {
            return expression != null;
        }

        public function Field(hash:Object = null)
        {
            for (var key:String in hash)
            {
                if (hasOwnProperty(key))
                {
                    this[key] = hash[key];
                }
            }
        }

    }
}