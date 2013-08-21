using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class BreedDAO : DAO
    {
        public BreedDAO(SqlConnection connection)
            : base(connection)
        {

        }

        private List<Breed> Read(string procedure)
        {
            using (SqlCommand command = new SqlCommand(procedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddRange(this.Parameters.ToArray());
                this.Parameters.Clear();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    List<Breed> results = new List<Breed>();
                    while (reader.Read())
                    {
                        Breed breed = new Breed();
                        breed.Id = Convert.ToInt32(reader["Id"]);
                        breed.Type = reader["Type"].ToString();
                        results.Add(breed);
                    }
                    return results;
                }
            }
        }

        public List<Breed> GetAllBreeds()
        {
            return Read("GetAllBreeds");
        }

        public Breed GetBreedByDog(Dog dog)
        {
            AddParam("@DogId", dog.Id);
            return Read("GetBreedByDog").SingleOrDefault();
        }

        public Breed GetBreedById(int id)
        {
            AddParam("@Id", id);
            return Read("GetBreedById").Single();
        }
    }
}
