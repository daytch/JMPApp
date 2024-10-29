using JMPApp.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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

namespace JMPApp
{
    /// <summary>
    /// Interaction logic for CustomerPage.xaml
    /// </summary>
    public partial class CustomerPage : Page
    {
        public CustomerPage()
        {
            DatabaseHelper helper = new DatabaseHelper();
            InitializeComponent();
            dataGrid.ItemsSource = helper.GetCustomers();
        }


        private void DataGrid_CellEditEnding(object sender, DataGridCellEditEndingEventArgs e)
        {
            if (e.EditAction == DataGridEditAction.Commit)
            {
                var newCustomer = e.Row.Item as Customer;
                DatabaseHelper helper = new DatabaseHelper();
                // If the Id is 0, it means it's a new row (not yet saved to the DB)
                if (newCustomer.CustomerID == 0)
                {
                    helper.SaveNewCustomer(newCustomer);
                    dataGrid.Items.Refresh();
                }
                else
                {
                    helper.SaveToDatabase(newCustomer, false);
                }
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

            var addcustomer = new AddCustomer();

        }
    }
}
