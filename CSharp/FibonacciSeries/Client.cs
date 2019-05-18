using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeSnippetsRepo.FibonacciSeries
{
    class Client
    {
        private static void Main(string[] args)
        {
            var fibonacci = new Fibonacci();
            fibonacci.GetFibonacciByLoop(5);
            fibonacci.GetFibonacciByLoop2(5);
            fibonacci.GetFibonacciByRecursive(5);
        }

    }
}
