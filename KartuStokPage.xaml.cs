using System;
using System.Collections.Generic;
using System.Data;
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
using static DatabaseHelper;

namespace JMPApp
{
    /// <summary>
    /// Interaction logic for KartuStokPage.xaml
    /// </summary>
    public partial class KartuStokPage : Page
    {
        public KartuStokPage()
        {
            InitializeComponent();
            DatabaseHelper dbHelper = new DatabaseHelper();
            List<Barang> ListBarang = dbHelper.GetProducts();
            cmbBarang.ItemsSource = ListBarang;
        }

        private void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            DateTime? tanggalAwal = datePickerAwal.SelectedDate;
            DateTime? tanggalAkhir = datePickerAkhir.SelectedDate;
            string? productID = cmbBarang.SelectedValue == null ? null : cmbBarang.SelectedValue.ToString();
            DateTime tanggalHariIni = DateTime.Today;


            if (!tanggalAwal.HasValue || !tanggalAkhir.HasValue)
            {
                MessageBox.Show("Silakan pilih tanggal awal dan akhir.", "Peringatan", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (tanggalAwal > tanggalHariIni || tanggalAkhir > tanggalHariIni)
            {
                MessageBox.Show("Tanggal tidak boleh lebih dari hari ini.", "Peringatan", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (tanggalAkhir < tanggalAwal)
            {
                MessageBox.Show("Tanggal Akhir tidak boleh lebih awal dari Tanggal Awal.", "Peringatan", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            DatabaseHelper dbHelper = new DatabaseHelper();
            DataTable data = dbHelper.GetTransactionData(tanggalAwal.Value, tanggalAkhir.Value, string.IsNullOrEmpty(productID) ? null : productID);

            // Tampilkan hasil di DataGrid
            dataGridResults.ItemsSource = data.DefaultView;
        }

    }
}
