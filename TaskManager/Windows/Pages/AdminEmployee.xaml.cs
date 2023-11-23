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
    /// Логика взаимодействия для AdminEmployee.xaml
    /// </summary>
    public partial class AdminEmployee : Page
    {
        public void GetList()
        {
            using(TaskManagerDBEntities1  tmdb = new TaskManagerDBEntities1())
            {
                gr.ItemsSource = tmdb.Employee.ToList();
            }
        }
        AdminMainPage page;
        public AdminEmployee(AdminMainPage pg)
        {
            page = pg;
            InitializeComponent();
            GetList();
        }

        private void Button_Click(object sender, RoutedEventArgs e) //Удаление работника
        {
            using(TaskManagerDBEntities1 db = new TaskManagerDBEntities1())
            {
                Employee emp = (Employee)gr.SelectedItem;
               var _= db.Database.ExecuteSqlCommand("DELETE FROM Employee WHERE ID=@id", new SqlParameter("@id", emp.ID));
                db.SaveChanges();
            }
            GetList();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddEmp(this));
        }
    }
}
