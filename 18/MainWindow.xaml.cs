using System;
using System.Collections.Generic;
using System.Data.Entity;
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

namespace _18
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        //Получаем доступ к контексту данных
        TennisEntities db = TennisEntities.GetContext();
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //Загружаем таблицу из БД
            db.Tennis.Load();
            //Загружаем таблицу в DataGrid без отслеживания изменений контекста 
            //DataGrid1.ItemsSource = db.Tennis.ToList();
            //Загружаем таблицу в DataGrid с отслеживанием изменения контекста 
            DataGrid1.ItemsSource = db.Tennis.Local.ToBindingList();
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            //Открываем форму Добавить
            Add f = new Add();
            f.ShowDialog();
            DataGrid1.Focus();
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            int indexRow = DataGrid1.SelectedIndex;
            if (indexRow != -1)
            {
                //Получаем ключ текущей записи
                Tenni row = (Tenni)DataGrid1.Items[indexRow];
                Data.Number = row.Number;
                //Открываем форму Редактировать
                Edit f = new Edit();
                f.ShowDialog();
                //Обновляем таблицу
                DataGrid1.Items.Refresh();
                DataGrid1.Focus();
            }
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            int indexRow = DataGrid1.SelectedIndex;
            MessageBoxResult result;
            result = MessageBox.Show("Удалить запись?","Удаление записи",
                MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    //Получаем текущую запись
                    //Tenni row = (Tenni)DataGrid1.SelectedItems[0];
                    Tenni row = (Tenni)DataGrid1.Items[indexRow];
                    //Tenni row = (Tenni)DataGrid1.CurrentCell.Item;
                    //Удаляем запись
                    db.Tennis.Remove(row);
                    db.SaveChanges();
                }
                catch (ArgumentOutOfRangeException)
                {
                    MessageBox.Show("Выберите запись");
                }
            }
        }

        private void Find_Click(object sender, RoutedEventArgs e)
        {
            for (int i = 0; i < DataGrid1.Items.Count; i++)
            {
                //Получаем строку таблицы
                var row = (Tenni)DataGrid1.Items[i];
                string findContent = row.Surname;
                try
                {
                    if (findContent != null && findContent.Contains(TextFind.Text))
                    {
                        object item = DataGrid1.Items[i];
                        DataGrid1.SelectedItem = item;//Выделяем элемент
                        DataGrid1.ScrollIntoView(item);//Скролим к нему окно
                        DataGrid1.Focus();
                        break;
                    }
                }
                catch 
                {
                    MessageBox.Show("Неверные данные!", "Ошибка", MessageBoxButton.OK,
                MessageBoxImage.Error);
                }
            }
        }

        List<Tenni> _tenni;//Описываем коллекцию
        private void Filtered_Click(object sender, RoutedEventArgs e)
        {
            //Загружаем в коллекцию таблицу
            _tenni = db.Tennis.ToList();
            //Формируем новую таблицу по фильтру
            //var filtered = _tenni.Where(_tenni => _tenni.Surname == TextFiltered.Text);
            var filtered = _tenni.Where(_tenni => _tenni.Surname.Contains(TextFiltered.Text));
            //var filtered = _tenni.Where(_tenni => _tenni.Surname.StartsWith(TextFiltered.Text));
            //Отображем полученную таблицу
            DataGrid1.ItemsSource = filtered;
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Information_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Калион Екатерина " +
                "\n18 пр" +
                "\nВариант 1." +
                "Учет рейтинга теннисистов за 5 лет.Каждая запись содержит поля: фамилия, имя," +
                "отчество спортсмена, пол, год рождения, фамилия, имя, отчество тренера, названия стран" +
                "и пять полей с рейтингом.", "Информация", MessageBoxButton.OK, MessageBoxImage.Question);
        }

        private void Reset_Click(object sender, RoutedEventArgs e)
        {
            TextFind.Clear();
            TextFiltered.Clear();
        }
    }
}
