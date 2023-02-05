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
using System.Text.Json;
using System.IO;
using System.Net;
using ProgrammingEducationProject.Models;

namespace ProgrammingEducationProject
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            List<ThemesBlock> themesBlocks = new List<ThemesBlock>();

            var themes = GetThemes();

            foreach(var theme in themes)
            {
                themesBlocks.Add(new ThemesBlock(theme));
            }

            themesList.ItemsSource = themesBlocks;

            List<QuestionsBlock> questionsBlocks = new List<QuestionsBlock>();

            var questions = GetQuestions();

            foreach(var question in questions)
            {
                questionsBlocks.Add(new QuestionsBlock(question));
            }

            questionsList.ItemsSource = questionsBlocks;

            themesList.SelectedIndex = 0;
        }

        private List<Questions> GetQuestions()
        {
            List<Questions> questions = new List<Questions>();

            bool flag = true;
            int i = 1;

            while (flag)
            {
                HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create($"http://f0773505.xsph.ru/ProgrammingLessonsApi/questions/{i}");
                HttpWebResponse httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse();

                string jsonString = "";

                using (StreamReader reader = new StreamReader(httpWebResponse.GetResponseStream()))
                {
                    jsonString = reader.ReadToEnd();
                }

                if(jsonString != "null")
                {
                    questions.Add(JsonSerializer.Deserialize<Questions>(jsonString));
                }
                else
                {
                    flag = false;
                }

                i++;
            }

            return questions;
        }

        private List<Themes> GetThemes()
        {
            List<Themes> themes = new List<Themes>();

            bool flag = true;
            int i = 1;

            while (flag)
            {
                HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create($"http://f0773505.xsph.ru/ProgrammingLessonsApi/themes/{i}");
                HttpWebResponse httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse();

                string jsonString = "";

                using (StreamReader reader = new StreamReader(httpWebResponse.GetResponseStream()))
                {
                    jsonString = reader.ReadToEnd();
                }

                if (jsonString != "null")
                {
                    themes.Add(JsonSerializer.Deserialize<Themes>(jsonString));
                }
                else
                {
                    flag = false;
                }

                i++;
            }

            return themes;
        }

        private List<Theory> GetTheory()
        {
            List<Theory> theory = new List<Theory>();

            bool flag = true;
            int i = 1;

            while (flag)
            {
                HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create($"http://f0773505.xsph.ru/ProgrammingLessonsApi/theory/{i}");
                HttpWebResponse httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse();

                string jsonString = "";

                using (StreamReader reader = new StreamReader(httpWebResponse.GetResponseStream()))
                {
                    jsonString = reader.ReadToEnd();
                }

                if (jsonString != "null")
                {
                    theory.Add(JsonSerializer.Deserialize<Theory>(jsonString));
                }
                else
                {
                    flag = false;
                }

                i++;
            }

            return theory;
        }

        private void themesList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            List<QuestionsBlock> questionsBlocks = new List<QuestionsBlock>();

            Themes theme = (Themes)((ThemesBlock)themesList.SelectedItem).DataContext;

            var theory = GetTheory().Where(i => i.TheoryId == theme.ThemeTheoryId).FirstOrDefault();

            theoryText.Text = theory.TheoreticalInformation;

            var questions = GetQuestions().Where(i => i.ThemeId == theme.ThemeId).ToList();

            foreach(var question in questions)
            {
                questionsBlocks.Add(new QuestionsBlock(question));
            }

            questionsList.ItemsSource = questionsBlocks;
        }
    }
}
