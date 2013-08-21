using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class DogsVM
    {
        public List<ViewDogVM> Dogs { get; set; }

        public DogsVM()
        {
            Dogs = new List<ViewDogVM>();
        }
    }
}
