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
    /// Логика взаимодействия для MnTask.xaml
    /// </summary>
    public partial class MnTask : Page
    {
        ManagerTaskPage page;
        public List<DBModel.Task> tasks = new List<DBModel.Task>();
        public void GetList() //загрузить данные о задачах
        {
            using (TaskManagerDBEntities1 tmdb = new TaskManagerDBEntities1())
            {
                tasks = tmdb.Task.ToList();
                gr.ItemsSource= tasks;
            }   
        }
        public MnTask(ManagerTaskPage pg)
        {
            page = pg;
            InitializeComponent();
            GetList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)  //Перейти к конкретному этапу
        {
            NavigationService.Navigate(new ManagerStep((DBModel.Task)gr.SelectedItem, page));
        }

        private void Button_Click_1(object sender, RoutedEventArgs e) //Перейти на страницу добавления задачи
        {
            page.fr.Navigate(new AddTask(this));
        }

        private void Button_Click_2(object sender, RoutedEventArgs e) //удалить задачу
        {
            if (gr.SelectedItem != null)
            {
                using (TaskManagerDBEntities1 tmdb = new TaskManagerDBEntities1())
                { 
                    var t = (DBModel.Task)gr.SelectedItem;
                    var _ = tmdb.Database.ExecuteSqlCommand("DELETE FROM Task WHERE ID = @id", new SqlParameter("@id", t.ID));
                    tmdb.SaveChanges();
                    GetList();
                    gr.ItemsSource = null;
                    gr.ItemsSource = tasks;
                }

            }
            else return;
        }
    }
}
