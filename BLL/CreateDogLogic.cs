using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DAL;

namespace BLL
{
    public class CreateDogLogic
    {
        public EditDogVM GetEditDogVM(int id)
        {
            EditDogVM vm = new EditDogVM();
            using (UnitOfWork uow = new UnitOfWork())
            {
                vm.Breeds = GetBreedVMs(uow);
                DogVM dogVM = new DogVM();
                Dog dog = uow.GetDogDAO().GetDogById(id);
                dogVM.Id = id;
                dogVM.Age = dog.Age;
                dogVM.Name = dog.Name;
                BreedVM breedVM = new BreedVM();
                Breed breed = uow.GetBreedDAO().GetBreedByDog(dog);
                breedVM.Id = breed.Id;
                breedVM.Type = breed.Type;
                vm.Dog = dogVM;
                vm.Breed = breedVM;
            }
            return vm;
        }

        public CreateDogVM GetCreateDogVM()
        {
            CreateDogVM vm = new CreateDogVM();
            using (UnitOfWork uow = new UnitOfWork())
            {
                vm.Breeds = GetBreedVMs(uow);
            }
            return vm;
        }

        private List<BreedVM> GetBreedVMs(UnitOfWork uow)
        {
            List<BreedVM> breeds = new List<BreedVM>();
            foreach (Breed breed in uow.GetBreedDAO().GetAllBreeds())
            {
                BreedVM breedVM = new BreedVM();
                breedVM.Id = breed.Id;
                breedVM.Type = breed.Type;
                breeds.Add(breedVM);
            }
            return breeds;
        }

        public void UpdateDog(DogFM fm)
        {
            using (UnitOfWork uow = new UnitOfWork())
            {
                Dog dog = uow.GetDogDAO().GetDogById(fm.Id);
                dog.Name = fm.Name;
                dog.Age = fm.Age;
                uow.GetDogDAO().UpdateDog(dog);
                Breed breed = uow.GetBreedDAO().GetBreedById(fm.BreedId);
                uow.GetDogDAO().UpdateDogBreed(dog, breed);
            }
        }

        public void SaveNewDog(DogFM fm)
        {
            Dog dog = new Dog();
            dog.Name = fm.Name;
            dog.Age = fm.Age;
            using (UnitOfWork uow = new UnitOfWork())
            {
                Breed breed = uow.GetBreedDAO().GetBreedById(fm.BreedId);
                uow.GetDogDAO().CreateDog(dog, breed);
            }
        }
    }
}
