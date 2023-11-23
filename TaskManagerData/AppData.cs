using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaskManagerData;


namespace TaskManager.Classes
{
    public class AppData
    {

            TaskManagerDBEntities tmdb = new TaskManagerDBEntities();
        public List<TaskManagerData.Task> ReturnListTasks(Employee employee)
        {

                List<TaskManagerData.Task> tasks = new List<TaskManagerData.Task>();
               
                    List<int> taskid = (from step in tmdb.Step
                                        where step.Employee == employee
                                        select step.IDTask).ToList();
                    foreach (int a in taskid)
                    {
                        tasks.Add(tmdb.Task.FirstOrDefault(p => p.ID == a));
                    }

                
                return tasks;
            
        }

        public Employee Authorise(string log, string pas)
        {
            
                var a = tmdb.Employee.FirstOrDefault(p=> p.Login==log && p.Password==pas);
                if (a != null) return a;
                else
                return null;
            
        }
    }
}
