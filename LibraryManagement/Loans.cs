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
    public partial class Loans : Form
    {
        public Loans()
        {
            InitializeComponent();
            LoadClientIDs();
            LoadMaterialIDs();

        }

        DataTable dt = new DataTable();

        public void GetLoans()
        {
            using (SqlConnection conn = ConnectDB.GetConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM Loans", conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    conn.Open();
                    dt.Clear();
                    da.Fill(dt);
                    dvgLoans.DataSource = dt;
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

        private void LoadMaterialIDs()
        {
            using (SqlConnection conn = ConnectDB.GetConnection())
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT Material_ID FROM Bibliographic_Materials", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    cmbMaterialID.Items.Clear();
                    while (reader.Read())
                    {
                        cmbMaterialID.Items.Add(reader["Material_ID"].ToString());
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gabim në marrjen e MaterialID: " + ex.Message);
                }
            }
        }

        private void InsertLoan()
        {
            if (cmbClientID.SelectedItem == null || 
                cmbMaterialID.SelectedItem == null)
            {
                MessageBox.Show("Ju lutem zgjidhni ClientID dhe MaterialID!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = ConnectDB.GetConnection())
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Loans(Client_ID, Material_ID, Loan_Date, Return_Date, Actual_Return_Date, Penalty_Fee) VALUES(@ClientID, @MaterialID, @LoanDate, @ReturnDate, @ActualReturnDate, @PenaltyFee)", conn);

                    cmd.Parameters.AddWithValue("@ClientID", cmbClientID.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@MaterialID", cmbMaterialID.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@LoanDate", dtpLoanDate.Value);
                    cmd.Parameters.AddWithValue("@ReturnDate", dtpReturnDate.Value);
                    cmd.Parameters.AddWithValue("@ActualReturnDate", dtpActualReturnDate.Value);
                    cmd.Parameters.AddWithValue("@PenaltyFee", nudPenaltyFee.Value);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Huazimi u regjistrua me sukses!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    GetLoans();
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
            txtLoans.Clear();
            cmbClientID.SelectedIndex = -1;
            cmbMaterialID.SelectedIndex = -1;
            dtpLoanDate.Value = DateTime.Now;
            dtpReturnDate.Value = DateTime.Now;
            dtpActualReturnDate.Value = DateTime.Now;
            nudPenaltyFee.Value = 0;
        }



        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panel2_Paint_1(object sender, PaintEventArgs e)
        {

        }

        private void txtHoansID_TextChanged(object sender, EventArgs e)
        {

        }

        private void dtpLoanDate_ValueChanged(object sender, EventArgs e)
        {

        }

        private void nudPenaltyFee_ValueChanged(object sender, EventArgs e)
        {

        }

        private void btnRegisterLoan_Click(object sender, EventArgs e)
        {
            InsertLoan();
        }

        private void txtLoans_TextChanged(object sender, EventArgs e)
        {

        }

        private void cmbMaterialID_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void panel2_Paint_2(object sender, PaintEventArgs e)
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

        private void Loans_Load(object sender, EventArgs e)
        {
            GetLoans();
        }

        private void dilbtn_Click(object sender, EventArgs e)
        {
            Login LoginForm = new Login();
            LoginForm.Show();
            this.Hide();
        }

        private void huazimetbtn_Click(object sender, EventArgs e)
        {

        }

        private void pagesatKbtn_Click(object sender, EventArgs e)
        {
            ClientsPayment ClientsPaymentForm = new ClientsPayment();
            ClientsPaymentForm.Show();
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
            ActiveClientsForm.Hide();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Dashboard DashboardForm = new Dashboard();
            DashboardForm.Show();
            this.Hide();
        }
    }
}
