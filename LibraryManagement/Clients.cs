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
    public partial class Clients : Form
    {
        public Clients()
        {
            InitializeComponent();
        }
        DataTable dt = new DataTable();

        public void GetClients()
        {
            using (SqlConnection conn = ConnectDB.GetConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM  Clients", conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    conn.Open();
                    dt.Clear();
                    da.Fill(dt);
                    dgvClients.DataSource = dt;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }

            }
        }

        private void InsertClients()
        {
            if (string.IsNullOrWhiteSpace(txtFirstName.Text) ||
                string.IsNullOrWhiteSpace(txtLastName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPhone.Text) ||
                string.IsNullOrWhiteSpace(txtAdress.Text) ||
                dtpDateOfBirth.Value == DateTime.MinValue) 
            {
                MessageBox.Show("Ju lutem plotësoni të gjitha fushat e detyrueshme!", "Gabim", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = ConnectDB.GetConnection())
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Clients (First_Name, Last_Name, Date_of_Birth, Email, Phone, Address, Membership_Active) VALUES (@FirstName, @LastName, @DateOfBirth, @Email, @Phone, @Address, @MembershipActive)", conn);

                    cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                    cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                    cmd.Parameters.AddWithValue("@DateOfBirth", dtpDateOfBirth.Value);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAdress.Text);
                    cmd.Parameters.AddWithValue("@MembershipActive", 1); 

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Klienti u shtua me sukses!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    GetClients();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gabim: " + ex.Message);
                }
            }
        }

        private void UpdateClients()
        {
            if (string.IsNullOrWhiteSpace(txtFirstName.Text))
            {
                MessageBox.Show("Zgjidhni një klient për të ndryshuar!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = ConnectDB.GetConnection())
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE Clients SET First_Name = @FirstName, Last_Name = @LastName, Date_of_Birth = @DateOfBirth, Email = @Email, Phone = @Phone, Address = @Address, Membership_Active = @MembershipActive WHERE Client_ID = @ClientID", conn);

                    cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                    cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                    cmd.Parameters.AddWithValue("@DateOfBirth", dtpDateOfBirth.Value);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAdress.Text);
                    cmd.Parameters.AddWithValue("@MembershipActive", chkMembershipActive.Checked ? 1 : 0); 

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Klienti u përditësua me sukses!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    GetClients();
                    ClearClientFields();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gabim: " + ex.Message);
                }
            }
        }

        private void ClearClientFields()
        {
            txtFirstName.Clear();
            txtLastName.Clear();
            txtEmail.Clear();
            txtPhone.Clear();
            txtAdress.Clear();
            dtpDateOfBirth.Value = DateTime.Now;
            chkMembershipActive.Checked = false;
        }

        private void dgvClients_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                txtFirstName.Text = dgvClients.Rows[e.RowIndex].Cells[1].Value.ToString();
                txtLastName.Text = dgvClients.Rows[e.RowIndex].Cells[2].Value.ToString();
                dtpDateOfBirth.Value = Convert.ToDateTime(dgvClients.Rows[e.RowIndex].Cells[3].Value);
                txtEmail.Text = dgvClients.Rows[e.RowIndex].Cells[4].Value.ToString();
                txtPhone.Text = dgvClients.Rows[e.RowIndex].Cells[5].Value.ToString();
                txtAdress.Text = dgvClients.Rows[e.RowIndex].Cells[6].Value.ToString();
                chkMembershipActive.Checked = Convert.ToBoolean(dgvClients.Rows[e.RowIndex].Cells[7].Value);
            }
        }


        private void materialetbtn_Click(object sender, EventArgs e)
        {
            Materials MaterialsForm = new Materials();
            MaterialsForm.Show();
            this.Hide();
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void txtFirstName_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtLastName_TextChanged(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void dtpDateOfBirth_ValueChanged(object sender, EventArgs e)
        {

        }

        private void txtEmail_TextChanged(object sender, EventArgs e)
        {

        }

        private void dgvClients_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnAddClients_Click(object sender, EventArgs e)
        {
            InsertClients();
        }

        private void btnUpdateClients_Click(object sender, EventArgs e)
        { 
            UpdateClients();
        }

        private void perdoruesitbtn_Click(object sender, EventArgs e)
        {
            Users UsersForm = new Users();
            UsersForm.Show();
            this.Hide();
        }

        private void pagesatbtn_Click(object sender, EventArgs e)
        {
            Payments PaymentsForm = new Payments();
            PaymentsForm.Show();
            this.Hide();
        }

        private void huazimetbtn_Click(object sender, EventArgs e)
        {
            Loans LoansForm = new Loans();
            LoansForm.Show();
            this.Hide();
        }

        private void dilbtn_Click(object sender, EventArgs e)
        {
            Login LoginForm = new Login();
            LoginForm.Show();
            this.Hide();
        }

        private void klientetbtn_Click(object sender, EventArgs e)
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
            this.Hide();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Dashboard DashboardForm = new Dashboard();
            DashboardForm.Show();
            this.Hide();
        }

        private void Clients_Load(object sender, EventArgs e)
        {
            GetClients();
        }
    }
}
