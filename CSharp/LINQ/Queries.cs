using System;
using System.Collections.Generic;
using System.Linq;

namespace Dummy
{
    class Program
    {
        static void Main(string[] args)
        {
            var customerTypes = new List<CustomerType>
            {
                new CustomerType { Type = 1, Description = "Elite Customer"},
                new CustomerType { Type = 2, Description = "Special Customer"},
                new CustomerType { Type = 3, Description = "Ordinary Customer"}
            };
            var customers = new List<Customer>
            {
                new Customer { FirstName = "Chety", LastName = "Clooney", City = "Muş", Population = 49000, Type = 1},
                new Customer { FirstName = "Diego Armando", LastName = "Maradona", City = "Muş" , Population = 49000,Type = 1},
                new Customer { FirstName = "Lionel", LastName = "Messi", City = "Barcelona", Population = 5000000, Type = 2},
                new Customer { FirstName = "Van", LastName = "Basten", City = "Van", Population = 150000, Type = 2},
                new Customer { FirstName = "Franz", LastName = "Kafka", City = "Prag", Population = 2345000, Type = 1},
                new Customer { FirstName = "Kaleki", LastName = "Baş", City = "Barcelona", Population = 5000000, Type = 2},
                new Customer { FirstName = "Xavi", LastName = "Hernandez", City = "Barcelona", Population = 5000000, Type = 3},
            };

            var purchasedProducts = new List<Product> {
                new Product {Id = 1, Name = "Laptop", Price = 3000},
                new Product {Id = 1, Name = "Laptops", Price = 3000},
                new Product {Id = 2, Name = "Desktop", Price = 5000},
                new Product {Id = 3, Name = "Book", Price = 800},
                new Product {Id = 4, Name = "Headphone", Price = 556},
                new Product {Id = 4, Name = "Headphone", Price = 556},
                new Product {Id = 4, Name = "Headphone", Price = 556}
            };

            //DISTINCT

            //To Get distinct products
            //IEnumerable<Product> distinctProducts = purchasedProducts.Distinct(new EqualityComparer<Product>((p1,p2) => p1.Id == p2.Id));
            //foreach (var product in distinctProducts)
            //{
            //    Console.WriteLine(product);
            //}

            //If Id and Name of the 2 product is same, then products are same. It is very flexible solution
            //we can return anything we want for compare function
            //IEnumerable<Product> distinctProducts = purchasedProducts.Distinct(new ProductComparer(p => new { p.Id, p.Name}));
            //foreach (var product in distinctProducts)
            //{
            //    Console.WriteLine(product);
            //}

            //*********************

            //var customerQuery = from cust in customers
            //                    where cust.City == "Muş"
            //                    orderby cust.FirstName descending
            //                    select new { FullName = $"{cust.FirstName} {cust.LastName}", City = $"City Of {cust.City}" };

            //customerQuery.ToList().ForEach(c => Console.WriteLine($"{c.FullName} lives in {c.City}"));

            //*********************

            //GROUP BY
            //Group customers by their city
            //IEnumerable<IGrouping<string, Customer>> cityGroupQuery =
            //    from c in customers
            //    group c by c.City;

            //foreach (var stateGroup in cityGroupQuery)
            //{
            //    //Group by this key which is city
            //    Console.WriteLine(stateGroup.Key);
            //    foreach (var customer in stateGroup)
            //    {
            //        Console.WriteLine($"   {customer.FirstName} {customer.LastName}");
            //    }
            //}

            //*********************

            //Group city by their population
            //IEnumerable<IGrouping<bool, Customer>> cityPopulationGroup =
            //    from  c in customers
            //    group c by c.Population > 1000000;
            //foreach (var stateGroup in cityPopulationGroup)
            //{
            //    Console.WriteLine(stateGroup.Key ? "Mega Cities\n=====" : "Small Cities\n=====");
            //    foreach (var customer in stateGroup)
            //    {
            //        Console.WriteLine($"  {customer.City} - {customer.Population}");
            //    }
            //}

            //*********************

            //JOIN
            //Join customer and customertypes to write customer names and their types
            //var joinQuery = from c in customers
            //                join t in customerTypes on c.Type equals t.Type
            //                select new { FullName = $"{c.FirstName} {c.LastName}", Type = t.Description };
            //foreach (var customer in joinQuery)
            //{
            //    Console.WriteLine($"{customer.FullName} => {customer.Type}");
            //}

            //*********************

            //JOIN & GROUP BY
            //Group by customer types
            //var joinQueryWithGroup = from c in customers
            //                         join t in customerTypes on c.Type equals t.Type
            //                         select new { FullName = $"{c.FirstName} {c.LastName}", Type = t.Description } into a
            //                         group a by a.Type;

            //foreach (var typeGroup in joinQueryWithGroup)
            //{
            //    Console.WriteLine(typeGroup.Key);
            //    Console.WriteLine("--------------");
            //    foreach (var item in typeGroup)
            //    {
            //        Console.WriteLine($"\t{item.FullName}");
            //    }
            //    Console.WriteLine();
            //}

            //*********************
            //ORDER BY
            //order user by city, and if city is same then order descending by name
            IEnumerable<Customer> orderedCustomers = customers.OrderBy(c => c.City).ThenByDescending(c => c.FirstName);
            orderedCustomers.ToList().ForEach(Console.WriteLine);
            Console.ReadLine();
        }
    }
}
