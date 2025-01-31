using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LibraryManagement
{
    public partial class Dashboard : Form
    {
        public Dashboard()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Materials MaterialsForm = new Materials();
            MaterialsForm.Show();
            this.Hide();
        }

        private void HuazimetVbtn_Click(object sender, EventArgs e)
        {
            Loans LoansForm = new Loans();
            LoansForm.Show();
            this.Hide();
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {

        }

        private void klientetbtn_Click(object sender, EventArgs e)
        {
            Clients ClientsForm = new Clients();
            ClientsForm.Show();
            this.Hide();
        }

        private void huazimetbtn_Click(object sender, EventArgs e)
        {
            Loans LoansForm = new Loans();
            LoansForm.Show();
            this.Hide();
        }

        private void pagesatbtn_Click(object sender, EventArgs e)
        {
            Payments PaymentsForm = new Payments();
            PaymentsForm.Show();
            this.Hide();
        }

        private void perdoruesitbtn_Click(object sender, EventArgs e)
        {
            Users UsersForm = new Users();
            UsersForm.Show();
            this.Hide();
        }

        private void pagesatKbtn_Click(object sender, EventArgs e)
        {
            ClientsPayment ClientsPaymentForm = new ClientsPayment();
            ClientsPaymentForm.Show();
            this.Hide();
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            Materials MaterialsForm = new Materials();
            MaterialsForm.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            ClientsPayment ClientsPaymentForm = new ClientsPayment();
            ClientsPaymentForm.Show();
            this.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Payments PaymentsForm = new Payments();
            PaymentsForm.Show();
            this.Hide();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Users UsersForm = new Users();
            UsersForm.Show();
            this.Hide();
        }

        private void dilbtn_Click(object sender, EventArgs e)
        {
            Login LoginForm = new Login();
            LoginForm.Show();
            this.Hide();
        }
    }
}
