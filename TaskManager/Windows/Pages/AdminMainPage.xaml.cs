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
using TaskManager.DBModel;

namespace TaskManager.Windows.Pages
{
    /// <summary>
    /// Логика взаимодействия для AdminMainPage.xaml
    /// </summary>
    public partial class AdminMainPage : Page
    {
        Window window;

        public AdminMainPage(Window wnd, Employee emp)
        {
            
            window= wnd;
            
            InitializeComponent();
            fio.Content = emp.Name + " " + emp.SName;
            pos.Content = emp.Position;
            fr.NavigationService.Navigate(new AdminEmployee(this));
        }

        private void Ellipse_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void exit_Click(object sender, RoutedEventArgs e)
        {
            if (fr.NavigationService.CanGoBack == false)
            {
                MainWindow main = new MainWindow();
                main.Show();
                window.Close();
            }
            else
            NavigationService.GoBack();
        }

        

        private void Ellipse_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
           
            window.WindowState = WindowState.Minimized;
        }
    }
}
