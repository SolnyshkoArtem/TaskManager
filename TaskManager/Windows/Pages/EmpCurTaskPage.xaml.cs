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
    /// Логика взаимодействия для EmpCurTaskPage.xaml
    /// </summary>
    public partial class EmpCurTaskPage : Page
    {
        public List<Step> StepList;
        Employee employee;
        DBModel.Task task1;
        EmpTasksPage page;
        private void GetList(int id) //Получение данных из БД
        {
            using(TaskManagerDBEntities1 tmdb = new TaskManagerDBEntities1())
            {

            StepList = tmdb.Step.Where(p => p.IDTask == id).ToList();
            }
        }
        
        public EmpCurTaskPage(EmpTasksPage pg, DBModel.Employee emp, DBModel.Task task)
        {
            page = pg;
            GetList(task.ID);
            task1 = task;
            employee= emp;
            InitializeComponent();
            gr.ItemsSource = StepList;

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
            
        }

        private void Ellipse_MouseDown(object sender, MouseButtonEventArgs e)
        {
            Application.Current.Shutdown();
           
        }

        private void Button_Click_1(object sender, RoutedEventArgs e) //Пометить этап завершенным
        {

            if (gr.SelectedItem == null)
            {
                gr.ItemsSource = null;
                gr.ItemsSource = StepList;
            }
            else
            {

                var updstat = (Step)gr.SelectedItem;
                using (TaskManagerDBEntities1 tmdb = new TaskManagerDBEntities1())
                {

                    var _ = tmdb.Database.ExecuteSqlCommand("UPDATE Step SET Status = 1 where ID = @idst", new SqlParameter("@idst", updstat.ID));
                    tmdb.SaveChanges();
                }

                GetList(task1.ID);
                gr.ItemsSource = null;
                gr.ItemsSource = StepList;
            }
        }

        private void Ellipse_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            page.window.WindowState = WindowState.Minimized;
        }
    }
}
