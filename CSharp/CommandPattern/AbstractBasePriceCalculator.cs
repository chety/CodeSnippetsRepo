using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tutorials.ChangeCondition
{
    public abstract class AbstractBasePriceCalculator
    {
        public double CalculatePrice(double price, double textRate)
        {
            return (100 * textRate) + price;
        }
    }
}
