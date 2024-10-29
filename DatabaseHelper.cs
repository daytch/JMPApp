using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using JMPApp.Models;
using System.Collections.ObjectModel;
using System.Windows.Controls;

public class DatabaseHelper
{
    private string connectionString = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;

    public DataTable GetTransactionData(DateTime tanggalAwal, DateTime tanggalAkhir, string productID = null)
    {
        DataTable result = new DataTable();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand("dbo.GetTransactionData", connection))
            {
                command.CommandType = CommandType.StoredProcedure;

                // Menambahkan parameter
                command.Parameters.Add(new SqlParameter("@TanggalAwal", SqlDbType.DateTime) { Value = tanggalAwal });
                command.Parameters.Add(new SqlParameter("@TanggalAkhir", SqlDbType.DateTime) { Value = tanggalAkhir });
                command.Parameters.Add(new SqlParameter("@ProductID", SqlDbType.VarChar) { Value = (object)productID ?? DBNull.Value });

                // Mengambil data dari Stored Procedure
                using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                {
                    adapter.Fill(result);
                }
            }
        }

        return result;
    }
    public class Barang
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }
    public List<Barang> GetProducts()
    {
        List<Barang> products = new List<Barang>();

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("dbo.GetProducts", conn)
            {
                CommandType = CommandType.StoredProcedure
            };

            conn.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    products.Add(new Barang
                    {
                        Id = reader.GetInt32(reader.GetOrdinal("Id")),
                        Name = reader.GetString(reader.GetOrdinal("Name"))
                    });
                }
            }
        }

        return products;
    }

    public ObservableCollection<Customer> GetCustomers()
    {
        ObservableCollection<Customer> customers = new ObservableCollection<Customer>();

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand("dbo.GetCustomers", conn)
            {
                CommandType = CommandType.StoredProcedure
            };

            conn.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    customers.Add(new Customer
                    {
                        CustomerID = reader.GetInt32(reader.GetOrdinal("CustomerID")),
                        Nama = reader.GetString(reader.GetOrdinal("Name"))
                    });
                }
            }
        }

        return customers;
    }

    public void SaveNewCustomer(Customer Customer)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            var cmd = new SqlCommand("INSERT INTO Customers (Name) OUTPUT INSERTED.Id VALUES (@name, @address, @phone, @class)", conn);
            cmd.Parameters.AddWithValue("@name", Customer.Nama);

            Customer.CustomerID = (int)cmd.ExecuteScalar();
        }
    }

    public void SaveToDatabase(Customer Customer, bool isNew)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            var cmd = new SqlCommand("UPDATE Customers SET Name = @name, Address = @address, Phone = @phone, Class = @class WHERE Id = @id", conn);
            cmd.Parameters.AddWithValue("@id", Customer.CustomerID);
            cmd.Parameters.AddWithValue("@name", Customer.Nama);
        }
    }

}
