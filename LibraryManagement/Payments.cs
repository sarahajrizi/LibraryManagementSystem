using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LibraryManagement
{
    public partial class Payments : Form
    {
        public Payments()
        {
            InitializeComponent();
            LoadClientIDs();
        }

        DataTable dt = new DataTable();

        public void GetPayments()
        {
            using (SqlConnection conn = ConnectDB.GetConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM Payments", conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    conn.Open();
                    dt.Clear();
                    da.Fill(dt);
                    dvgPayments.DataSource = dt;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void LoadClientIDs()
        {
            using (SqlConnection conn = ConnectDB.GetConnection())
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT Client_ID FROM Clients", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    cmbClientID.Items.Clear();
                    while (reader.Read())
                    {
                        cmbClientID.Items.Add(reader["Client_ID"].ToString());
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gabim në marrjen e ClientID: " + ex.Message);
                }
            }
        }

        private void InsertPayment()
        {
            if (cmbClientID.SelectedItem == null || string.IsNullOrWhiteSpace(cmbPaymentType.Text))
            {
                MessageBox.Show("Ju lutem zgjidhni ClientID dhe shkruani llojin e pagesës!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = ConnectDB.GetConnection())
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Payments(Client_ID, Amount, Payment_Date, Payment_Type) VALUES(@ClientID, @Amount, @PaymentDate, @PaymentType)", conn);

                    cmd.Parameters.AddWithValue("@ClientID", cmbClientID.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@Amount", nudAmount.Value);
                    cmd.Parameters.AddWithValue("@PaymentDate", dtpPaymentDate.Value);
                    cmd.Parameters.AddWithValue("@PaymentType", cmbPaymentType.Text);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Pagesa u regjistrua me sukses!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    GetPayments();
                    ClearFields();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gabim: " + ex.Message);
                }
            }
        }

        private void ClearFields()
        {
            cmbClientID.SelectedIndex = -1; 
            nudAmount.Value = 0; 
            dtpPaymentDate.Value = DateTime.Now; 
            cmbPaymentType.SelectedIndex = -1; 
        }




        private void txtPaymentID_TextChanged(object sender, EventArgs e)
        {

        }

        private void dtpPaymentDate_ValueChanged(object sender, EventArgs e)
        {

        }

        private void cmbPaymentType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnRegisterPayment_Click(object sender, EventArgs e)
        {
            InsertPayment();
        }

        private void nudAmount_ValueChanged(object sender, EventArgs e)
        {

        }

        private void cmbClientID_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label13_Click(object sender, EventArgs e)
        {

        }

        private void label17_Click(object sender, EventArgs e)
        {

        }

        private void label14_Click(object sender, EventArgs e)
        {

        }

        private void label15_Click(object sender, EventArgs e)
        {

        }

        private void label16_Click(object sender, EventArgs e)
        {

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

        private void perdoruesitbtn_Click(object sender, EventArgs e)
        {
            Users UsersForm = new Users();
            UsersForm.Show();
            this.Hide();
        }

        private void Payments_Load(object sender, EventArgs e)
        {
            GetPayments();
        }

        private void dilbtn_Click(object sender, EventArgs e)
        {
            Login LoginForm = new Login();
            LoginForm.Show();
            this.Hide();
        }

        private void pagesatbtn_Click(object sender, EventArgs e)
        {

        }

        private void pagesatKbtn_Click(object sender, EventArgs e)
        {
            ClientsPayment ClientPaymentForm = new ClientsPayment();
            ClientPaymentForm.Show();
            this.Hide();
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
