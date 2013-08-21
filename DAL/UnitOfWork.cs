using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;

namespace DAL
{
    public class UnitOfWork : IDisposable
    {
        private SqlConnection connection { get; set; }

        public UnitOfWork()
        {
            connection = new SqlConnection(@"Data Source = .\SQLEXPRESS; Initial Catalog = DogApp; Integrated Security = SSPI;");
            connection.Open();
        }

        public BreedDAO GetBreedDAO()
        {
            return new BreedDAO(connection);
        }

        public DogDAO GetDogDAO()
        {
            return new DogDAO(connection);
        }

        public void Dispose()
        {
            connection.Dispose();
        }
    }
}
