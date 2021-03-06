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
using System.Windows.Shapes;
using _18;

namespace _18
{
    /// <summary>
    /// Логика взаимодействия для Add.xaml
    /// </summary>
    public partial class Add : Window
    {
        public Add()
        {
            InitializeComponent();
            TextNumber.Focus();
        }
        //Получаем доступ к контексту данных
        TennisEntities db = TennisEntities.GetContext();
        

        private void AddForm_Click(object sender, RoutedEventArgs e)
        {
            //Проверка каждого обязательного для заполнения поля
            StringBuilder errors = new StringBuilder();
            if (TextNumber.Text.Length == 0 || double.TryParse(TextNumber.Text, out double x) == false) errors.AppendLine("Введите номер");
            if (TextSurname.Text.Length == 0) errors.AppendLine("Введите фамилию");
            if (TextName.Text.Length == 0) errors.AppendLine("Введите имя");
            if (TextPatronymic.Text.Length == 0) errors.AppendLine("Введите отчество");
            if (CBGender.Text != "Муж" && CBGender.Text != "Жен")
                errors.AppendLine("Введите пол Муж/Жен");
            if (TextYearOfBirth.Text.Length != 4 ||
                double.TryParse(TextYearOfBirth.Text, out double x1) == false)
                errors.AppendLine("Неправильный год рождения");
            if (TextRating1.Text.Length == 0) errors.AppendLine("Введите рейтинг за 1 год");
            if (TextRating2.Text.Length == 0) errors.AppendLine("Введите рейтинг за 2 год");
            if (TextRating3.Text.Length == 0) errors.AppendLine("Введите рейтинг за 3 год");
            if (TextRating4.Text.Length == 0) errors.AppendLine("Введите рейтинг за 4 год");
            if (TextRating5.Text.Length == 0) errors.AppendLine("Введите рейтинг за 5 год");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            //Создаем элемент таблицы
            Tenni p1 = new Tenni();
            //Заполняем этот элемент
            p1.Number = Convert.ToInt32(TextNumber.Text);
            p1.Surname = TextSurname.Text;
            p1.Name = TextName.Text;
            p1.Patronymic = TextPatronymic.Text;
            p1.Gender = CBGender.Text;
            p1.YearOfBirth = Convert.ToInt32(TextYearOfBirth.Text);
            p1.SurnameTrainer = TextSurnameTrainer.Text;
            p1.NameTrainer = TextNameTrainer.Text;
            p1.PatronymicTrainer = TextPatronymicTrainer.Text;
            p1.Country = TextCountry.Text;
            p1.Rating1 = Convert.ToInt32(TextRating1.Text);
            p1.Rating2 = Convert.ToInt32(TextRating2.Text);
            p1.Rating3 = Convert.ToInt32(TextRating3.Text);
            p1.Rating4 = Convert.ToInt32(TextRating4.Text);
            p1.Rating5 = Convert.ToInt32(TextRating5.Text);
            try
            {
                //Добавляем в БД
                db.Tennis.Add(p1);
                //Сохраняем изменения
                db.SaveChanges();
                MessageBox.Show("Информация сохранена!");
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
