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

namespace DB_AFS
{
    /// <summary>
    /// Interaktionslogik für MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        GridLength[] starHeight;

        public MainWindow()
        {
            InitializeComponent();

            starHeight = new GridLength[expanderGrid.RowDefinitions.Count];
            starHeight[0] = expanderGrid.RowDefinitions[0].Height;
            starHeight[2] = expanderGrid.RowDefinitions[2].Height;
            ExpandedOrCollapsed(topExpander);
            ExpandedOrCollapsed(middleExpander);
            ExpandedOrCollapsed(bottomExpander);

            // InitializeComponent calls topExpander.Expanded
            // while bottomExpander is null, if we hook this up in the xaml
            topExpander.Expanded += ExpandedOrCollapsed;
            topExpander.Collapsed += ExpandedOrCollapsed;
            middleExpander.Expanded += ExpandedOrCollapsed;
            middleExpander.Collapsed += ExpandedOrCollapsed;
            bottomExpander.Expanded += ExpandedOrCollapsed;
            bottomExpander.Collapsed += ExpandedOrCollapsed;
        }

        void ExpandedOrCollapsed(object sender, RoutedEventArgs e)
        {
            ExpandedOrCollapsed(sender as Expander);
        }

        void ExpandedOrCollapsed(Expander expander)
        {
            var rowIndex = Grid.GetRow(expander);
            var row = expanderGrid.RowDefinitions[rowIndex];
            if (expander.IsExpanded)
            {
                row.Height = starHeight[rowIndex];
                row.MinHeight = 50;
            }
            else
            {
                starHeight[rowIndex] = row.Height;
                row.Height = GridLength.Auto;
                row.MinHeight = 0;
            }
        }

        private void Button_Click1(object sender, RoutedEventArgs e)
        {
            myTabControl.SelectedIndex = 0;
        }

        private void Button_Click2(object sender, RoutedEventArgs e)
        {
            myTabControl.SelectedIndex = 1;
        }

        private void Button_Leeren(object sender, RoutedEventArgs e)
        {
            foreach (UIElement element in Kundendatengrid.Children)
            {
                TextBox textbox = element as TextBox;
                if (textbox != null)
                {
                    textbox.Text = String.Empty;
                }
            }

            foreach (UIElement element in Ladestellegrid.Children)
            {
                TextBox textbox = element as TextBox;
                if (textbox != null)
                {
                    textbox.Text = String.Empty;
                }
            }

            foreach (UIElement element in Ansprechpartnergrid.Children)
            {
                TextBox textbox = element as TextBox;
                if (textbox != null)
                {
                    textbox.Text = String.Empty;
                }
            }

        }
    }
}