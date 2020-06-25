namespace Dummy
{
    class Customer
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string City { get; set; }
        public int Population { get; set; }

        public int Type { get; set; }

        public override string ToString()
        {
            return $"FirstName: {FirstName}, LastName: {LastName}, City: {City}";
        }
    }
}
