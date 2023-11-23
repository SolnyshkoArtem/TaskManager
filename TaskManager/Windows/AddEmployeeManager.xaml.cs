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
using System.Windows.Shapes;
using TaskManager.DBModel;
using TaskManager.Windows.Pages;

namespace TaskManager.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddEmployeeManager.xaml
    /// </summary>
    public partial class AddEmployeeManager : Window
    {
        TaskManagerDBEntities1 tmdb = new TaskManagerDBEntities1();
        StepInfo page;
        public AddEmployeeManager(StepInfo pg)
        {
            page = pg;
            InitializeComponent();
            gr.ItemsSource = tmdb.Employee.ToList();
        }

        private void AddButton(object sender, RoutedEventArgs e)    //добавление нового пользователя
        {
            if(gr.SelectedItems.Count != 0)
            {
                int idstep = page.step.ID;
                int idemp;
                foreach(Employee b in gr.SelectedItems)
                {
                    idemp = b.ID;
                    try
                    {
                        var _ = tmdb.Database.ExecuteSqlCommand("INSERT INTO StepEmp VALUES (@emp, @step)", 
                            new SqlParameter("@emp", idemp), new SqlParameter("@step", idstep));
                        tmdb.SaveChanges();
                }
                    catch { continue; }

            }
                page.GetList();
            }
            Close();
        }
    }
}
