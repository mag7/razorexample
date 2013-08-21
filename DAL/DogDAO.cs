using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
    public class DogDAO : DAO
    {
        public DogDAO(SqlConnection connection)
            : base(connection)
        {

        }

        private List<Dog> Read(string procedure)
        {
            using (SqlCommand command = new SqlCommand(procedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddRange(this.Parameters.ToArray());
                this.Parameters.Clear();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    List<Dog> results = new List<Dog>();
                    while (reader.Read())
                    {
                        Dog dog = new Dog();
                        dog.Id = Convert.ToInt32(reader["Id"]);
                        dog.Name = reader["Name"].ToString();
                        dog.Age = Convert.ToInt32(reader["Age"]);
                        results.Add(dog);
                    }
                    return results;
                }
            }
        }

        public List<Dog> GetAllDogs()
        {
            return Read("GetAllDogs");
        }

        public Dog GetDogById(int id)
        {
            AddParam("@Id", id);
            return Read("GetDogById").SingleOrDefault();
        }

        public List<Dog> GetDogsByBreed(Breed breed)
        {
            AddParam("@BreedId", breed.Id);
            return Read("GetDogsByBreed");
        }

        public int CreateDog(Dog dog, Breed breed)
        {
            AddParam("@Name", dog.Name);
            AddParam("@Age", dog.Age);
            AddParam("@BreedId", breed.Id);
            return Convert.ToInt32(ExecuteScalar("CreateDog"));
        }

        public void UpdateDog(Dog dog)
        {
            AddParam("@Id", dog.Id);
            AddParam("@Name", dog.Name);
            AddParam("@Age", dog.Age);
            AddParam("@Active", true);
            ExecuteScalar("UpdateDog");
        }

        public void UpdateDogBreed(Dog dog, Breed breed)
        {
            AddParam("@BreedId", breed.Id);
            AddParam("@DogId", dog.Id);
            ExecuteScalar("UpdateDogBreed");
        }

        public void DeleteDog(Dog dog)
        {
            AddParam("@Id", dog.Id);
            AddParam("@Name", dog.Name);
            AddParam("@Age", dog.Age);
            AddParam("@Active", false);
            ExecuteScalar("UpdateDog");
        }
    }
}
