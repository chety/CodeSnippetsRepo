using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tutorials.ChangeCondition
{
    public class PriceCalculatorForTurkey : AbstractBasePriceCalculator, IPriceCalculator
    {
        private const double TAX_RATE = 0.19;

        public double Calculate(double price)
        {
            return CalculatePrice(price, TAX_RATE);
        }
    }
}
