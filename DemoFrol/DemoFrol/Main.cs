using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DemoFrol
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
        }

        private void Main_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "demoFrolDataSet._1". При необходимости она может быть перемещена или удалена.
            this._1TableAdapter.Fill(this.demoFrolDataSet._1);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            ManagerForm mf = new ManagerForm();
            mf.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            AddForm ad = new AddForm();
            ad.Show();
        }
    }
}
