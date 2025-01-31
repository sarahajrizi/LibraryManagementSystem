using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LibraryManagement
{
    public partial class ClientsPayment : Form
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;

        public ClientsPayment()
        {
            InitializeComponent();
            LoadPaymentTypes(); 
            LoadPayments();

            cmbPaymentType.SelectedIndexChanged += cmbPaymentType_SelectedIndexChanged;
        }

        private void LoadPaymentTypes()
        {
            cmbPaymentType.Items.Add("Të gjitha"); 
            cmbPaymentType.Items.Add("Pagesë mujore");
            cmbPaymentType.Items.Add("Pagesë vjetore");
            cmbPaymentType.Items.Add("Dënim për vonesë");

            cmbPaymentType.SelectedIndex = 0;
        }

        private void LoadPayments(string paymentType = "Të gjitha")
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM vSelectClientsPayment"; 

                if (paymentType != "Të gjitha")
                {
                    query += " WHERE Payment_Types LIKE @PaymentType";
                }

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (paymentType != "Të gjitha")
                    {
                        cmd.Parameters.AddWithValue("@PaymentType", "%" + paymentType + "%");
                    }

                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    conn.Open();
                    da.Fill(dt);
                    conn.Close();

                    dgvPayments.DataSource = dt; 
                }
            }
        }


        private void cmbPaymentType_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadPayments(cmbPaymentType.SelectedItem.ToString());
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void ClientsPayment_Load(object sender, EventArgs e)
        {

        }

        private void dilbtn_Click(object sender, EventArgs e)
        {
            Login LoginForm = new Login();
            LoginForm.Show();
            this.Hide();
        }

        private void materialetbtn_Click(object sender, EventArgs e)
        {
            Materials MaterialsForm = new Materials();
            MaterialsForm.Show();
            this.Hide();
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

        }

        private void HuazimetVbtn_Click(object sender, EventArgs e)
        {
            OverdueLoans OverdueLoansForm = new OverdueLoans();
            OverdueLoansForm.Show();
            this.Hide();
        }

        private void aktivbtn_Click(object sender, EventArgs e)
        {
            ActiveClients ActiveClientsForm = new ActiveClients();
            ActiveClientsForm.Show();
            this.Hide();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Dashboard DashboardForm = new Dashboard();
            DashboardForm.Show();
            this.Hide();
        }
    }
}
