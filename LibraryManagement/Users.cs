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
    public partial class Users : Form
    {
        public Users()
        {
            InitializeComponent();
        }
        DataTable dt = new DataTable();

        public void GetUsers()
        {
            using (SqlConnection conn = ConnectDB.GetConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SELECT User_ID, Username, Password, Role FROM [User]", conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    conn.Open();
                    da.Fill(dt);
                    dgvUsers.DataSource = dt;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void InsertUser()
        {
            if (string.IsNullOrWhiteSpace(txtUsername.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text) ||
                string.IsNullOrWhiteSpace(cmbRole.Text))
            {
                MessageBox.Show("Ju lutem plotësoni të gjitha fushat e domosdoshme!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = ConnectDB.GetConnection())
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO [User] (Username, Password, Role) VALUES (@Username, @Password, @Role)", conn);

                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@Role", cmbRole.Text);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Përdoruesi u shtua me sukses!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    GetUsers();
                    ClearFields();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gabim:" + ex.Message);
                }
            }
        }

        private void UpdateUser()
        {
            if (string.IsNullOrWhiteSpace(txtUserID.Text))
            {
                MessageBox.Show("Zgjidhni një përdorues për të ndryshuar!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = ConnectDB.GetConnection())
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE [User] SET Username = @Username, Password = @Password, Role = @Role WHERE User_ID = @UserID", conn);

                    cmd.Parameters.AddWithValue("@UserID", txtUserID.Text);
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@Role", cmbRole.Text);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Përdoruesi u përditësua me sukses!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    GetUsers();
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
            txtUserID.Clear(); 
            txtUsername.Clear();
            txtPassword.Clear();
            cmbRole.SelectedIndex = -1;
        }

        private void dgvUsers_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                txtUserID.Text = dgvUsers.Rows[e.RowIndex].Cells[0].Value.ToString();
                txtUsername.Text = dgvUsers.Rows[e.RowIndex].Cells[1].Value.ToString();
                txtPassword.Text = dgvUsers.Rows[e.RowIndex].Cells[2].Value.ToString();
                cmbRole.Text = dgvUsers.Rows[e.RowIndex].Cells[3].Value.ToString();
            }
        }


        private void cmbRole_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btnAddMaterial_Click(object sender, EventArgs e)
        {
            InsertUser();
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dgvUsers_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            GetUsers();
        }

        private void txtUserID_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnUpdateUser_Click(object sender, EventArgs e)
        {
            UpdateUser();
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

        private void dilbtn_Click(object sender, EventArgs e)
        {
            Login LoginForm = new Login();
            LoginForm.Show();
            this.Hide();
        }

        private void perdoruesitbtn_Click(object sender, EventArgs e)
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

        private void Users_Load(object sender, EventArgs e)
        {
            GetUsers();
        }
    }
}
