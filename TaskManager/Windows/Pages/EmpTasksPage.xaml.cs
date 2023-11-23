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
using TaskManager.Classes;
using TaskManager.DBModel;

namespace TaskManager.Windows.Pages
{
    /// <summary>
    /// Логика взаимодействия для EmpTasksPage.xaml
    /// </summary>
    public partial class EmpTasksPage : Page
    {
        static Employee employee;
        TaskManagerDBEntities1 tmdb = new TaskManagerDBEntities1();

        public Window window;
        private void LoadTasks(Employee emp, DataGrid grid) //загрузка Задач для конкретного пользователя
        {
               
                employee= emp;
                fio.Content = emp.Name + " " + emp.SName;
                pos.Content = emp.Position;
                List<DBModel.Task> tasks = new List<DBModel.Task>();
                List<Step> taskid = emp.Step.ToList();
                DBModel.Task temp;
                foreach (Step a in taskid)
                {
                    temp = tmdb.Task.FirstOrDefault(p => p.ID == a.IDTask);
                    if (tasks.Contains(temp)) continue;
                    tasks.Add(temp);
                }
                grid.ItemsSource = tasks;
        }

        public EmpTasksPage(Employee employee1, Window wnd)
        {
            window = wnd;
            employee = employee1;
            InitializeComponent();
            LoadTasks(employee, gr);
        }

        private void Ellipse_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void Button_Click(object sender, RoutedEventArgs e) //переход на страницу с этапами выбранной задачи
        {
            NavigationService.Navigate(new EmpCurTaskPage(this, employee, (DBModel.Task)gr.SelectedItem));
        }

        private void Button_Click_1(object sender, RoutedEventArgs e) //выход в окно авторизации
        {
            MainWindow main = new MainWindow();
            main.Show();
            window.Close();
            
        }

        private void Ellipse_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            window.WindowState= WindowState.Minimized;
        }
    }
}
