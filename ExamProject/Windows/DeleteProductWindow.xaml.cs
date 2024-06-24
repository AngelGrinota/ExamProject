using ExamProject.Classes;
using ExamProject.Pages;
using System.Windows;

namespace ExamProject.Windows
{
    public partial class DeleteProductWindow : Window
    {
        public DeleteProductWindow()
        {
            InitializeComponent();

            Style = (Style)FindResource(typeof(Window));
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            if (DataAccessLayer.ArticleSecurityPro(articleTextBox.Text))
            {
                try
                {
                    DataAccessLayer.DeleteProduct(articleTextBox.Text);
                    MessageBox.Show("Товар успешно удален");
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
