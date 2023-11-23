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
    /// Логика взаимодействия для AddTask.xaml
    /// </summary>
    public partial class AddTask : Page
    {
        public AddTask(MnTask pg)
        {
            page = pg;
            InitializeComponent();
        }
        MnTask page;
        

        

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            //Проверка введенных данных
            bool errCount = false;
            if (name.Text == "")
            {
                nameErr.Content = "Вы не ввели название";
                errCount = true;
            }
            else nameErr.Content = "";
            if (start.Text == "")
            {
                StartErr.Content = "Вы не ввели начальную дату";
                errCount = true;
            }
            else StartErr.Content = "";
            if (end.Text == "")
            {
                EndErr.Content = "Вы не ввели конечную дату";
            }
            else EndErr.Content = "";
            if (!errCount)
            {

                
                string Inname = name.Text;
                string Stat = "Принят";
                
                using (TaskManagerDBEntities1 tmdb = new TaskManagerDBEntities1())
                {
                    var _ = tmdb.Database.ExecuteSqlCommand("INSERT INTO Task VALUES (@nam, @stat, Convert(date, @star), Convert(date, @end))",
                        new SqlParameter("@nam", Inname), new SqlParameter("@stat", Stat),
                        new SqlParameter("@star", start.Text), new SqlParameter("@end", end.Text));
                    //tmdb.Task.Add(tska);
                    tmdb.SaveChanges();
                    page.gr.ItemsSource = null;
                    page.GetList();
                    
                    NavigationService.GoBack();

                }

            }
            else return;
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
