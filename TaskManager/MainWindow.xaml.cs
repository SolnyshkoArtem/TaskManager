using TaskManager;

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
using TaskManager.Windows;
using TaskManager.DBModel;
using TaskManager.Classes;

namespace TaskManager
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        public MainWindow()
        {
            RoutedEventHandler handler = null; //Применение эффекта стекла
            handler = (s, e) =>
            {
                Loaded -= handler;
                this.EnableBlur();
            };
            Loaded += handler;
            InitializeComponent();
        }

        private void Ellipse_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string log = login.Text;
            string pass = pas.Password;
            
            if(log == "" || pass == "")
            {
                return;
            }
            TaskManagerDBEntities1 tmdb = new TaskManagerDBEntities1();
           

            Employee a = tmdb.Employee.FirstOrDefault(p => p.Login == log && p.Password == pass);
            if (a != null)
            {
                
                EmployeeWin win = new EmployeeWin(a);
                win.Show();
                Close();
            }
            else return;  
        }

        private void Ellipse_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }
    }
}
