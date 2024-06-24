using ExamProject.Classes;
using ExamProject.Windows;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
    public partial class AuthorizationPage : Page
    {
        public AuthorizationPage()
        {
            InitializeComponent();
            Style = (Style)FindResource(typeof(Page));
        }
        private void EnterButton_Click(object sender, RoutedEventArgs e)
        {
            if (DataAccessLayer.Enter(loginTextBox.Text, passwordBox.Password) == true)
            {
                App.CurrentUser = DataAccessLayer.GetUser(loginTextBox.Text, passwordBox.Password);
                if (App.CurrentUser.RoleID == 2)
                {
                    NavigationManager.NavFrame.Navigate(new ManagerPage());
                }
                else if (App.CurrentUser.RoleID == 1)
                {
                    NavigationManager.NavFrame.Navigate(new ClientPage());
                }
                else
                {
                    NavigationManager.NavFrame.Navigate(new AdminPage());
                }
            }
            else
                MessageBox.Show("Ошибка входа!");
        }
        private void GuestEnterButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationManager.NavFrame.Navigate(new GuestPage());
        }
        
        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            //loginTextBox.Text = null;
            //passwordBox.Password = null;
        }
    }
}
