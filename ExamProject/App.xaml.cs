using ExamProject.Classes;
using System.Configuration;
using System.Data;
using System.Windows;

namespace ExamProject
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static User? CurrentUser { get; set; }
    }
}
