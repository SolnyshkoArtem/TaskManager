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
    /// Логика взаимодействия для AddEmp.xaml
    /// </summary>
    public partial class AddEmp : Page
    {
        AdminEmployee page;
        public AddEmp(AdminEmployee pg)
        {
            page= pg;
            InitializeComponent();
        }

        private void SaveButton(object sender, RoutedEventArgs e)  //добавление нового пользователя
        {
            if(name.Text == "" || sname.Text == ""
                || pass.Text == "" || pos.Text == ""
                || log.Text == "")
            {
                return;
            }
            else
            {

                using(TaskManagerDBEntities1 tmdb = new TaskManagerDBEntities1())
                {
                    Employee emp = new Employee()
                    {
                        Name =name.Text,
                        SName = sname.Text,
                        Position = pos.Text,
                        Login = log.Text,
                        Password = pass.Text
                    };
                    tmdb.Employee.Add(emp);
                    tmdb.SaveChanges();
                    

                }
            }
            page.GetList();
            NavigationService.GoBack();
        }
    }
}
