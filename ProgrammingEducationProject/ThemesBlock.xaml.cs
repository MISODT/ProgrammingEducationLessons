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
    /// Логика взаимодействия для ThemesBlock.xaml
    /// </summary>
    public partial class ThemesBlock : UserControl
    {
        public ThemesBlock(Themes themes)
        {
            InitializeComponent();

            DataContext = themes;
        }
    }
}
