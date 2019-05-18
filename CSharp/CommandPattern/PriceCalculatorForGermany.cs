using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tutorials.ChangeCondition
{
    public class PriceCalculatorForGermany : AbstractBasePriceCalculator, IPriceCalculator
    {
        private const double TAX_RATE = 0.20;

        public double Calculate(double price)
        {
            return base.CalculatePrice(price, TAX_RATE);
        }
    }
}
