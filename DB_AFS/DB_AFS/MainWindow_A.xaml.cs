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
using DB_AFS.Database;

namespace DB_AFS
{
    /// <summary>
    /// Interaktionslogik für MainWindow_A.xaml
    /// </summary>
    public partial class MainWindow_A : Window
    {
        public MainWindow_A()
        {
            InitializeComponent();

            DatenbankEntities db = new DatenbankEntities();

            DataGrid_Kunden.ItemsSource = db.Kunde.ToList();
            DataGrid_Sendungen.ItemsSource = db.Sendung.ToList();
        }

        private void DataGrid_Kunden_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {

            Kunde kunde = (Kunde)DataGrid_Kunden.SelectedItem;
            TabItem tabItem = new TabItem();
            Form_Details_Customer form = new Form_Details_Customer(kunde.Id);

            tabItem.Header = kunde.Name;
            tabItem.Content = form;
            TabControl_Kunde.Items.Add(tabItem);
            TabControl_Kunde.SelectedItem = tabItem;

            e.Handled = true;
        }
    }
}
