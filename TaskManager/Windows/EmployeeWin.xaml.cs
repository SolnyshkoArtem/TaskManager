using TaskManager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using TaskManager.Classes;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using TaskManager.Windows.Pages;
using TaskManager.DBModel;

namespace TaskManager.Windows
{
    /// <summary>
    /// Логика взаимодействия для EmployeeWin.xaml
    /// <
    /// /summary>

    
    public partial class EmployeeWin : Window
    {
        

        public EmployeeWin(Employee emp)
        {
           
            
            InitializeComponent();
            if(emp.Position == "Менеджер")
            {
                frakm.Navigate(new ManagerTaskPage(this, emp));
            }
            else if(emp.Position == "Администратор")
            {
                frakm.Navigate(new AdminMainPage(this, emp));
            }
            else
            frakm.Navigate(new EmpTasksPage(emp, this));
        }

        private void Ellipse_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Glass.EnableBlurr(this, true);
        }

       
    }
}
