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
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DB_AFS
{
    /// <summary>
    /// Interaktionslogik für MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void ButtonAdem_Click(object sender, RoutedEventArgs e)
        {
            MainWindow_A newMainWindow = new MainWindow_A();
            newMainWindow.Show();
        }

        private void ButtonMo_Click(object sender, RoutedEventArgs e)
        {
            MainWindow_M newMainWindow = new MainWindow_M();
            newMainWindow.Show();
        }

        private void ButtonFatih_Click(object sender, RoutedEventArgs e)
        {
            MainWindow_F newMainWindow = new MainWindow_F();
            newMainWindow.Show();
        }
    }
}


