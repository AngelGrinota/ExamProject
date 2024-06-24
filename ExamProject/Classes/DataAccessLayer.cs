using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace ExamProject.Classes
{
    public class DataAccessLayer
    {
        public static string DataSource { get; set; } = @"DESKTOP-5OUHPCO";
        public static string UserID { get; set; } = "exam2103";
        public static string Password { get; set; } = "12345";
        public static string InitialCatalog { get; set; } = "ExamDataBase";

        public static string ConnectionString
        {
            get
            {
                SqlConnectionStringBuilder builder = new()
                {
                    DataSource = DataSource,
                    UserID = UserID,
                    Password = Password,
                    InitialCatalog = InitialCatalog,
                    TrustServerCertificate = true,
                };
                return builder.ConnectionString;
            }
        }
        public static bool Enter(string login, string password)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            DataTable table = new();

            SqlDataAdapter adapter = new("SELECT * FROM ExamUser WHERE Login = @uL AND Password = @uP", connection);
            adapter.SelectCommand.Parameters.AddWithValue("@uL", login);
            adapter.SelectCommand.Parameters.AddWithValue("@uP", password);

            adapter.Fill(table);

            return table.Rows.Count > 0;
        }
        public static User GetUser(string login, string password)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            string query = "SELECT * FROM ExamUser WHERE Login = @uL AND Password = @uP";
            using (SqlCommand command = new(query, connection))
            {
                command.Parameters.AddWithValue("@uL", login);
                command.Parameters.AddWithValue("@uP", password);

                using (var reader = command.ExecuteReader())
                {
                    User user = null;

                    if (reader.Read())
                    {
                        user = new User
                        {
                            RoleID = reader.GetInt32("IdRole"),
                            UserLogin = reader.GetString("Login"),
                            UserPassword = reader.GetString("Password"),
                            UserName = reader.GetString("Name"),
                            UserPatronymic = reader.GetString("Patronymic"),
                            UserSurname = reader.GetString("Surname")
                        };
                    }
                    return user;
                }
            }
        }
        public static List<Order> GetOrder()
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            var query = "SELECT * FROM ExamOrder";

            using (SqlCommand command = new(query, connection))

            using (var reader = command.ExecuteReader())
            {
                List<Order> orders = new();

                while (reader.Read())
                {
                    Order order = new()
                    {
                        IdOrder = reader.GetInt32("IdOrder"),
                        DateOrder = reader.GetDateTime("DateOrder"),
                        DateDelivery = reader.GetDateTime("DateDelivery"),
                        PickUpPoint = reader.GetInt32("PickUpPoint"),
                        IdDeliveryPoint = reader.GetInt32("IdDeliveryPoint")
                    };
                    orders.Add(order);
                }
                return orders;
            }
        }

        public static List<Product> GetProduct(string? filt, string? sort, string? search)
        {
            string update = "UPDATE dbo.ExamProduct SET LastPrice = FirstPrice -  (FirstPrice * (((1 - NowDiscount)) - 1) / -100)";
            string query = $"{update} SELECT * FROM ExamProduct ";

            List<string> whereCondisions = new();

            if (!string.IsNullOrEmpty(filt))
            {
                if (filt == "0-9,99%")
                    whereCondisions.Add(" AND NowDiscount BETWEEN 0 AND 9.99 ");
                else if (filt == "10-14,99%")
                    whereCondisions.Add(" AND NowDiscount BETWEEN 10 AND 14.99 ");
                else if (filt == "15% и более")
                    whereCondisions.Add(" AND NowDiscount BETWEEN 15 AND 100 ");
            }

            if (!string.IsNullOrEmpty(search))
            {
                whereCondisions.Add($" AND NameProduct LIKE '{search}%'");
            }

            string whereQuery = whereCondisions.Count > 0 ? " WHERE Quantity > 0 " + string.Join(" ", whereCondisions) : "";

            string sortQuery = "";
            if (sort == "По возрастанию")
                sortQuery = " ORDER BY LastPrice";
            else if (sort == "По убыванию")
                sortQuery = " ORDER BY LastPrice DESC";

            string resultQuery = query + whereQuery + sortQuery;

            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            using (SqlCommand command = new(resultQuery, connection))

            using (var reader = command.ExecuteReader())
            {
                List<Product> products = new();

                while (reader.Read())
                {
                    Product product = new()
                    {
                        NameProduct = reader.GetString("NameProduct"),
                        Description = reader.GetString("Description"),
                        IdManufacturer = reader.GetInt32("IdManufacturer"),
                        FirstPrice = reader.GetDecimal("FirstPrice"),
                        Discount = reader.GetInt32("NowDiscount"),
                        Category = reader.GetInt32("Category"),
                        LastPrice = reader.GetDecimal("LastPrice")
                    };
                    products.Add(product);
                }
                return products;
            }
        }

        public static void AddProduct(string article, string name, decimal price, string manufacturerId, int categoty, int discount, int quantity, string? description)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            var query = "AddProduct";

            SqlCommand command = new(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@article", article);
            command.Parameters.AddWithValue("@name", name);
            command.Parameters.AddWithValue("@price", price);
            command.Parameters.AddWithValue("@manufacturerId", manufacturerId);
            command.Parameters.AddWithValue("@categoty", categoty);
            command.Parameters.AddWithValue("@discount", discount);
            command.Parameters.AddWithValue("@quantity", quantity);
            command.Parameters.AddWithValue("@description", description);
            command.ExecuteNonQuery();
        }
        public static void UpdateProduct(string article, string name, decimal price, string manufacturerId, int categoty, int discount, int quantity, string? description)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            var query = "UpdateProduct";

            SqlCommand command = new(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@article", article);
            command.Parameters.AddWithValue("@name", name);
            command.Parameters.AddWithValue("@price", price);
            command.Parameters.AddWithValue("@manufacturerId", manufacturerId);
            command.Parameters.AddWithValue("@categoty", categoty);
            command.Parameters.AddWithValue("@discount", discount);
            command.Parameters.AddWithValue("@quantity", quantity);
            command.Parameters.AddWithValue("@description", description);
            command.ExecuteNonQuery();
        }
        public static bool ArticleSecurityLight(string article)
        {
            if (article.Length != 6)
                return false;
            else 
                return true;
        }
        public static bool ArticleSecurityPro(string article)
        {
            if (article.Length != 6)
                return false;

            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            DataTable table = new();

            SqlDataAdapter adapter = new("SELECT * FROM ExamProduct WHERE Article = @article", connection);
            adapter.SelectCommand.Parameters.AddWithValue("@article", article);

            adapter.Fill(table);

            return table.Rows.Count > 0;
        }
        public static void DeleteProduct(string article)
        {
            using SqlConnection connection = new(ConnectionString);
            connection.Open();

            var query = "DeleteProduct";

            SqlCommand command = new(query, connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@article", article);
            command.ExecuteNonQuery();
        }
    }
}

