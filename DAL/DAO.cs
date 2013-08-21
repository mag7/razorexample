using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;

namespace DAL
{
    public class DAO
    {
        protected List<SqlParameter> Parameters { get; set; }

        protected SqlConnection connection { get; private set; }

        public DAO(SqlConnection connection)
        {
            this.connection = connection;
            this.Parameters = new List<SqlParameter>();
        }

        public void AddParam(string name, object value)
        {
            Parameters.Add(new SqlParameter(name, value));
        }

        public object ExecuteScalar(string procedure)
        {
            using (SqlCommand command = new SqlCommand(procedure, connection))
            {
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddRange(this.Parameters.ToArray());
                this.Parameters.Clear();
                return command.ExecuteScalar();
            }
        }
    }
}
