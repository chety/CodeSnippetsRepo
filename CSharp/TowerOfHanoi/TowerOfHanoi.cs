using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeSnippetsRepo.TowerOfHanoi
{
    class TowerOfHanoi
    {
        public void FindTowerOfHanoiPath()
        {
            towerOfHanoi(3, 'A', 'C', 'B');
        }
        private void towerOfHanoi(int n, char sourcePeg, char destinationPeg, char sparePeg)
        {
            if (n == 1)
            {
                Console.WriteLine($"Move disk 1 from {sourcePeg} ->  {destinationPeg}");
            }
            else
            {
                towerOfHanoi(n - 1, sourcePeg, sparePeg, destinationPeg);
                Console.WriteLine($"Move disk {n} from {sourcePeg} ->  {destinationPeg}");
                towerOfHanoi(n - 1, sparePeg, destinationPeg, sourcePeg);
            }

        }
    }
}
