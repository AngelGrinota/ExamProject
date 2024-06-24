using ExamProject.Classes;
using ExamProject.Pages;
using ExamProject.Windows;
using System.Windows;

namespace ExamProject
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            Style = (Style)FindResource(typeof(Window));

            NavigationManager.NavFrame = mainFrame;
            NavigationManager.NavFrame.Navigate(new Pages.AuthorizationPage());
        }
    }
}