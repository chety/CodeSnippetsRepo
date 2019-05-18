using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeSnippetsRepo.FibonacciSeries
{
    class Fibonacci
    {
        internal void GetFibonacciByLoop(int number)
        {
            Console.WriteLine("GetFibonacciByLoop");
            var firstValue = 0;
            var secondValue = 1;
            Console.WriteLine(firstValue);
            for (int i = 0; i < number; i++)
            {
                var next = firstValue + secondValue;
                firstValue = secondValue;
                secondValue = next;
                Console.WriteLine(firstValue);
            }
        }
        internal void GetFibonacciByLoop2(int number)
        {
            Console.WriteLine("GetFibonacciByLoop2");
            var firstValue = 0;
            var secondValue = 1;
            Console.WriteLine(firstValue);
            Console.WriteLine(secondValue);

            Enumerable.Range(0, number - 1).ToList().ForEach(num =>
            {
                var next = firstValue + secondValue;
                firstValue = secondValue;
                secondValue = next;
                Console.WriteLine(next);
            });
        }

        internal void GetFibonacciByRecursive(int number)
        {
            Console.WriteLine("GetFibonacciByRecursive");
            for (int i = 0; i <= number; i++)
            {
                Console.WriteLine(getFibonacci(i));
            }
        }
        private int getFibonacci(int number)
        {
            if (number <= 1)
            {
                return 1;
            }
            return getFibonacci(number - 1) + getFibonacci(number - 2);
        }
    }
}
