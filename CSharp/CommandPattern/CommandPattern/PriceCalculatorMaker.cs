using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Tutorials.ChangeCondition
{
    public class PriceCalculatorMaker
    {
        Dictionary<string, IPriceCalculator> calculatorBase;
        public double CalculatePrice(string locale, double price)
        {
            createCalculatorStore();
            return calculatorBase[locale].Calculate(price);
        }

        private void createCalculatorStore()
        {
            if (calculatorBase == null)
            {
                calculatorBase = new Dictionary<string, IPriceCalculator>
                {
                    { "tr-TR", new PriceCalculatorForTurkey() },
                    { "gm-GM", new PriceCalculatorForGermany() },
                    { "au-AU", new PriceCalculatorForAustria() }
                };
            }
        }
    }
}
