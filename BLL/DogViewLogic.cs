using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DAL;

namespace BLL
{
    public class DogViewLogic
    {
        public DogsVM GetDogsVM()
        {
            DogsVM vm = new DogsVM();
            using (UnitOfWork uow = new UnitOfWork())
            {
                foreach (Dog dog in uow.GetDogDAO().GetAllDogs())
                {
                    ViewDogVM dogVM = new ViewDogVM();
                    dogVM.Id = dog.Id;
                    dogVM.Age = dog.Age;
                    dogVM.Name = dog.Name;
                    dogVM.Breed = uow.GetBreedDAO().GetBreedByDog(dog).Type;
                    vm.Dogs.Add(dogVM);
                }
            }
            return vm;
        }

        public void DeleteDog(int id)
        {
            using (UnitOfWork uow = new UnitOfWork())
            {
                Dog dog = uow.GetDogDAO().GetDogById(id);
                uow.GetDogDAO().DeleteDog(dog);
            }
        }
    }
}
