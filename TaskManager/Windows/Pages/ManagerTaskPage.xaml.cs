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
using TaskManager.DBModel;

namespace TaskManager.Windows.Pages
{
    /// <summary>
    /// Логика взаимодействия для ManagerTaskPage.xaml
    /// </summary> 7    7
    public partial class ManagerTaskPage : Page
    {
        Window window;
        public ManagerTaskPage(Window wnd, Employee emp)
        {
           window= wnd;
            InitializeComponent();
            fr.Navigate(new MnTask(this));
            fio.Content = emp.Name + " " + emp.SName;
            pos.Content = emp.Position;  
        }

        private void Ellipse_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void Button_Click(object sender, RoutedEventArgs e) //вернутся назад
        {
            if (fr.NavigationService.CanGoBack == false)
            {
                MainWindow main = new MainWindow();
                main.Show();
                window.Close();
            }
            else
            fr.NavigationService.GoBack();
        }

        private void Ellipse_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            window.WindowState = WindowState.Minimized;
        }
    }
}
