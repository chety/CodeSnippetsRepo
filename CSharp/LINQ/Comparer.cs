namespace Dummy
{
  class ProductComparer : IEqualityComparer<Product>
    {
        private readonly Func<Product, object> _keySelector;
        public ProductComparer(Func<Product, object> keySelector)
        {
            _keySelector = keySelector;
        }


        public bool Equals(Product x, Product y)
        {
            return _keySelector(x).Equals(_keySelector(y));
        }

        public int GetHashCode(Product obj)
        {
            return _keySelector(obj).GetHashCode();
        }
    }

    class EqualityComparer<T> : IEqualityComparer<T> where T : class
    {
        public Func<T, T, bool> CompareFunction { get; set; }

        public EqualityComparer(Func<T, T, bool> compareFunction)
        {
            CompareFunction = compareFunction;
        }

        public bool Equals(T x, T y)
        {
            Console.WriteLine($"Equals called. Result: {CompareFunction(x, y)}");
            return CompareFunction(x, y);
        }

        //Equality comparer will first look GetHashCode. If it is unique then the object is unique.
        //Otherwise it will check Equals method.
        public int GetHashCode(T obj)
        {
            if (obj is Product p)
            {
                return p.Id.GetHashCode();
            }
            return obj.GetHashCode();
        }
    }
}
