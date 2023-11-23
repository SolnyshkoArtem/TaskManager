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
    /// Логика взаимодействия для ManagerStep.xaml
    /// </summary>
    public partial class ManagerStep : Page
    {
        public void GetList(DBModel.Task task)              //Загрузить список Этапов
        {
            TaskManagerDBEntities1 tmdb = new TaskManagerDBEntities1();
            
                var Steps = tmdb.Step.Where(p => p.IDTask == task.ID).ToList();
                gr.ItemsSource = Steps;

            
        }
        ManagerTaskPage page;
       public DBModel.Task task;
        public ManagerStep(DBModel.Task tsk, ManagerTaskPage pg)
        {
            page = pg;
            task=tsk;
            InitializeComponent();
            GetList(tsk);
            
        }

        private void AddButton(object sender, RoutedEventArgs e) //Перейти на страницу добавления этапа
        {
            page.fr.Navigate(new StepInfo(this, null, task.ID));
        }

        private void SeeButton(object sender, RoutedEventArgs e) //перейти на страницу информации об этапе
        {
            page.fr.Navigate(new StepInfo(this, (Step)gr.SelectedItem, task.ID));
        }

        private void DelButton(object sender, RoutedEventArgs e) //удалить этап
        {
            using (TaskManagerDBEntities1 tmdb = new TaskManagerDBEntities1())
            {
                var step = (Step)gr.SelectedItem;
                var _ = tmdb.Database.ExecuteSqlCommand("DELETE FROM Step WHERE ID=@id", new SqlParameter("@id", step.ID));
                tmdb.SaveChanges();
                GetList(task);
            }
        }
    }
}
