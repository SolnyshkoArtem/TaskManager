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
    /// Логика взаимодействия для StepInfo.xaml
    /// </summary>
    public partial class StepInfo : Page
    {
        ManagerTaskPage mnpage;
        ManagerStep page;
        
        public Step step;
        int taskID;
        public void GetList() //загрузить Этапы задачи
        {
            TaskManagerDBEntities1 tmdb = new TaskManagerDBEntities1();
            Step TempStep = tmdb.Step.FirstOrDefault(p => p.ID==step.ID);
            gr.ItemsSource = TempStep.Employee;
            Panel.DataContext = TempStep;
        }
        public StepInfo( ManagerStep mn, DBModel.Step step1, int id)
        {
            InitializeComponent();
            taskID= id;
            
            this.page = mn;
                step = step1;
            if(step1 != null)       //проверка режима работы(добавление, просмотр информации)
            {
                GetList();
            }
            else
            {
                addBtn.Visibility = Visibility.Hidden;
                gr.Visibility = Visibility.Hidden;
                stat.Visibility = Visibility.Hidden;
                stsLabel.Visibility = Visibility.Hidden;
            }
            
            
        }

        private void SaveButton(object sender, RoutedEventArgs e)   //сохранить изменения и вернуться
        {
            TaskManagerDBEntities1 db = new TaskManagerDBEntities1();
            if (step != null)
            {
            
            var _ = db.Database.ExecuteSqlCommand("UPDATE Step SET Name = @name, Day = CONVERT(int,@day), Status = @stat WHERE ID=@id", new SqlParameter("@name", name.Text),
                new SqlParameter("@day", day.Text), new SqlParameter("@stat", stat.Text), new SqlParameter("@id", step.ID));
            db.SaveChanges();
            NavigationService.GoBack();
            }
            else
            {
                    var _ = db.Database.ExecuteSqlCommand("INSERT INTO Step VALUES(@name, CONVERT(int, @day), 0, @id)", new SqlParameter("@name", name.Text),
                        new SqlParameter("@day", day.Text), new SqlParameter("@id", taskID));
                    db.SaveChanges();
                    page.GetList(page.task);
                    NavigationService.GoBack();
            }
        }

        private void AddButton(object sender, RoutedEventArgs e)
        {
            AddEmployeeManager manager = new AddEmployeeManager(this);
            manager.Show();
        }

       

        private void gr_PreviewKeyDown(object sender, KeyEventArgs e)   //нажатие на клавишу delete для удаления работника
        {
            if (e.Key == Key.Delete)
            {
                TaskManagerDBEntities1 db = new TaskManagerDBEntities1();
                var em = (Employee)gr.SelectedItem;
                var _ = db.Database.ExecuteSqlCommand("DELETE FROM StepEmp WHERE IDEmp = @emp AND IDStep = @step", new SqlParameter("@emp", em.ID), new SqlParameter("@step", step.ID));
                db.SaveChanges();
                GetList();
            }
        }
    }
}
