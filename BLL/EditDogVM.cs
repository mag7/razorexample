using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class EditDogVM
    {
        public List<BreedVM> Breeds { get; set; }

        public EditDogVM()
        {
            Breeds = new List<BreedVM>();
        }

        public DogVM Dog { get; set; }

        public BreedVM Breed { get; set; }
    }
}
