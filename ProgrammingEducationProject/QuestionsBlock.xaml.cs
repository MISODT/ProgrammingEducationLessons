using ProgrammingEducationProject.Models;
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

namespace ProgrammingEducationProject
{
    /// <summary>
    /// Логика взаимодействия для QuestionsBlock.xaml
    /// </summary>
    public partial class QuestionsBlock : UserControl
    {
        private Questions curQuestion;

        public QuestionsBlock(Questions questions)
        {
            InitializeComponent();

            if(questions != null)
            {
                curQuestion = questions;
            }

            DataContext = curQuestion;

            string[] options = questions.AnswerOptions.Split(',');

            AnswerButton1.Content = options[0];
            AnswerButton2.Content = options[1];
            AnswerButton3.Content = options[2];
        }

        private void AnswerButton_Click(object sender, RoutedEventArgs e)
        {
            string option = (sender as Button).Content.ToString();

            if(option == curQuestion.CorrectAnswer)
            {
                (sender as Button).Background = Brushes.DarkGreen;
            }
            else
            {
                (sender as Button).Background = Brushes.DarkRed;
            }
        }
    }
}
