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
    public partial class ActiveClients : Form
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["DbConnectionString"].ConnectionString;
        public ActiveClients()
        {
            InitializeComponent();

            LoadRegistrationYears(); 
            LoadActiveClients();

            cmbRegistrationYear.SelectedIndexChanged += cmbRegistrationYear_SelectedIndexChanged;
        }

        private void LoadRegistrationYears()
        {
            cmbRegistrationYear.Items.Add("Të gjitha"); 
            cmbRegistrationYear.Items.Add("2022");
            cmbRegistrationYear.Items.Add("2023");
            cmbRegistrationYear.Items.Add("2024");
            cmbRegistrationYear.Items.Add("2025");

            cmbRegistrationYear.SelectedIndex = 0;
        }

        private void LoadActiveClients(string registrationYear = "Të gjitha")
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM vSelectActiveClients"; 

                if (registrationYear != "Të gjitha")
                {
                    query += " WHERE Registration_Year = @RegistrationYear";
                }

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (registrationYear != "Të gjitha")
                    {
                        cmd.Parameters.AddWithValue("@RegistrationYear", registrationYear);
                    }

                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    conn.Open();
                    da.Fill(dt);
                    conn.Close();

                    dgvActiveClients.DataSource = dt; 
                }
            }
        }

        private void cmbRegistrationYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadActiveClients(cmbRegistrationYear.SelectedItem.ToString());
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void ActiveClients_Load(object sender, EventArgs e)
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
            ClientsPayment ClientsPaaymentsForm = new ClientsPayment();
            ClientsPaaymentsForm.Show();
            this.Hide();
        }

        private void HuazimetVbtn_Click(object sender, EventArgs e)
        {
            OverdueLoans OverdueLoansForm = new OverdueLoans();
            OverdueLoansForm.Show();
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
