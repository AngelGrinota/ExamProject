using ExamProject.Classes;
using ExamProject.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace ExamProject.Windows
{
    public partial class UpdateProductWindow : Window
    {
        public UpdateProductWindow()
        {
            InitializeComponent();

            Style = (Style)FindResource(typeof(Window));
        }

        private void UpdateButton_Click(object sender, RoutedEventArgs e)
        {
            if (DataAccessLayer.ArticleSecurityPro(articleTextBox.Text) == true)
            {
                try
                {
                    DataAccessLayer.UpdateProduct(articleTextBox.Text, nameTextBox.Text, Convert.ToDecimal(firstPriceTextBox.Text), manufacturerTextBox.Text,
                        Convert.ToInt32(categoryTextBox.Text), Convert.ToInt32(discountTextBox.Text),
                        Convert.ToInt32(quantityTextBox.Text), descriptionTextBox.Text);
                    MessageBox.Show("Товар успешно отредактирован");
                }
                catch (Exception)
                {
                    MessageBox.Show("Не удалось выполнить запрос");
                }
            }
            else
                MessageBox.Show("Введите существующий артикул!");
        }
    }
}
