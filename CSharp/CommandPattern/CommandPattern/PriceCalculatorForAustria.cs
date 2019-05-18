using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tutorials.ChangeCondition
{
    public class PriceCalculatorForAustria : AbstractBasePriceCalculator, IPriceCalculator
    {
        private const double TAX_RATE = 0.18;
        public double Calculate(double price)
        {
            return base.CalculatePrice(price, TAX_RATE);
        }
    }
}
