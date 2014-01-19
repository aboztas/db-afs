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
using DB_AFS.Database;

namespace DB_AFS
{
    /// <summary>
    /// Interaktionslogik für Form_Details_Customer.xaml
    /// </summary>
    public partial class Form_Details_Customer : UserControl
    {
        public Form_Details_Customer(int id)
        {
            InitializeComponent();
            DatenbankEntities db = new DatenbankEntities();
            Kunde k = db.Kunde.Find(id);
            Name_Value.Content = k.Name;
        }
    }
}
