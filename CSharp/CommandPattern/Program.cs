using System;
using System.Collections.Generic;
using System.Text;
using Tutorials.ChangeCondition;

namespace Tutorials
{
    class Program
    {
        static void Main(string[] args)
        {
            stringDemo();
            Console.ReadLine();
        }
        
        private static void stringDemo()
        {
            Console.WriteLine(DateTime.Now.ToLongTimeString());
            string s = "";
            var builder = new StringBuilder(100000); 
            for (int i = 0; i < 10000000;i++)
            {
                //s += "Hi ";
                builder.Append("Hi ");
            }
            Console.WriteLine(DateTime.Now.ToLongTimeString());
        }       
    }
}
