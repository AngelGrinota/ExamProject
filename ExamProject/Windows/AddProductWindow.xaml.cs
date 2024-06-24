using ExamProject.Classes;
using ExamProject.Pages;
using System.Windows;

namespace ExamProject.Windows
{
    public partial class AddProductWindow : Window
    {
        public AddProductWindow()
        {
            InitializeComponent();

            Style = (Style)FindResource(typeof(Window));
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            if (DataAccessLayer.ArticleSecurityLight(articleTextBox.Text) == true)
            {
                try
                {
                    DataAccessLayer.AddProduct(articleTextBox.Text, nameTextBox.Text, Convert.ToDecimal(priceTextBox.Text), manufacturerTextBox.Text, Convert.ToInt32(categoryTextBox.Text), Convert.ToInt32(discountTextBox.Text), Convert.ToInt32(quantityTextBox.Text), descriptionTextBox.Text);
                    MessageBox.Show("Товар успешно добавлен");
                }
                catch (Exception)
                {
                    MessageBox.Show("Не удалось выполнить запрос");
                }
            }
            else
                MessageBox.Show("Введите правильный артикул!");
        }
    }
}
