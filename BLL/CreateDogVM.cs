using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class CreateDogVM
    {
        public List<BreedVM> Breeds { get; set; }
        public CreateDogVM()
        {
            Breeds = new List<BreedVM>();
        }
    }
}
