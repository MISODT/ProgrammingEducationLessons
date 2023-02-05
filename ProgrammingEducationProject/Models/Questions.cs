using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProgrammingEducationProject.Models
{
    public class Questions
    {
        public string QuestionId { get; set; }

        public string Question { get; set; }

        public string AnswerOptions { get; set; }

        public string CorrectAnswer { get; set; }

        public string ThemeId { get; set; }
    }
}
