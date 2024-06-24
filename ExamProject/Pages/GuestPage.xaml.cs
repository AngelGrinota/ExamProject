using ExamProject.Classes;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ExamProject.Pages
{
    public partial class GuestPage : Page
    {
        public GuestPage()
        {
            InitializeComponent();

            Style = (Style)FindResource(typeof(Page));
        }

        private void AddOrderMenuItem_Click(object sender, RoutedEventArgs e)
        {

        }
        public void GetListOrder()
        {
            orderListBox.ItemsSource = DataAccessLayer.GetOrder();
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationManager.NavFrame.GoBack();
            NavigationManager.NavFrame.NavigationService.RemoveBackEntry();
        }

        private void SortByPriceComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            GetListProduct();
        }

        private void FilterComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            GetListProduct();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            sortByPriceComboBox.SelectedIndex = 0;
            filterComboBox.SelectedIndex = 0;
            GetListProduct();
            GetListOrder();
        }

        public void GetListProduct()
        {
            string? filter = ((ComboBoxItem)filterComboBox.SelectedItem)?.Content.ToString();
            string? sorter = ((ComboBoxItem)sortByPriceComboBox.SelectedItem)?.Content.ToString();

            if (filterComboBox.SelectedItem != null && sortByPriceComboBox.SelectedItem != null)
            {
                productListBox.ItemsSource = DataAccessLayer.GetProduct(filter, sorter, searchTextBox.Text);
            }
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            GetListProduct();
        }
    }
}
