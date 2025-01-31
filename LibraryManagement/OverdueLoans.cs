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
    public partial class OverdueLoans : Form
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        public OverdueLoans()
        {
            InitializeComponent();

            LoadOverdueLoans();

            dtpFilterDate.ValueChanged += dtpFilterDate_ValueChanged;
        }

        private void LoadOverdueLoans()
        {
            DateTime filterDate = dtpFilterDate.Value.Date; 

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT Loan_ID, Client_ID, First_Name, Last_Name, Material_ID, Loan_Date, 
                                        Return_Date, Actual_Return_Date, Days_Overdue, Penalty_Fee
                                 FROM vSelectOverdueLoans
                                 WHERE Loan_Date <= @FilterDate"; 

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@FilterDate", filterDate);

                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    conn.Open();
                    da.Fill(dt);
                    conn.Close();

                    dgvOverdueLoans.DataSource = dt; 
                }
            }
        }

        private void dtpFilterDate_ValueChanged(object sender, EventArgs e)
        {
            LoadOverdueLoans();
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dilbtn_Click(object sender, EventArgs e)
        {
            Login LoginForm = new Login();
            LoginForm.Show();
            this.Hide();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Dashboard DashboardForm = new Dashboard();
            DashboardForm.Show();
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
            ClientsPayment ClientsPaymentForm = new ClientsPayment();
            ClientsPaymentForm.Show();
            this.Hide();
        }

        private void aktivbtn_Click(object sender, EventArgs e)
        {
            ActiveClients ActiveClients = new ActiveClients();
            ActiveClients.Show();
            this.Hide();
        }
    }
}
