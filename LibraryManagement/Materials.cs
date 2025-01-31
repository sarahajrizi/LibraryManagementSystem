using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LibraryManagement
{
    public partial class Materials : Form
    {
        public Materials()
        {
            InitializeComponent();
        }
        DataTable dt =  new DataTable();

        public void GetMaterials()
        {
            using (SqlConnection conn = ConnectDB.GetConnection())
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM  Bibliographic_Materials", conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    conn.Open();
                    dt.Clear();
                    da.Fill(dt);
                    dgvMaterials.DataSource = dt;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }

            }
        }

        private void InsertMaterial()
        {
            if (string.IsNullOrWhiteSpace(txtTitle.Text) ||
                string.IsNullOrWhiteSpace(txtAuthor.Text) ||
                string.IsNullOrWhiteSpace(cmbMaterialType.Text))
            {
                MessageBox.Show("Ju lutem plotësoni të gjitha fushat e domosdoshme!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (SqlConnection conn = ConnectDB.GetConnection())
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO Bibliographic_Materials(Title, Author, Co_Authors, Publisher, Publication_Date, ISBN, DOI, Material_Type, Abstract, Available_Copies, Date_Added) VALUES(@Title, @Author, @CoAuthors, @Publisher, @PublicationDate, @ISBN, @DOI, @MaterialType, @Abstract, @AvailableCopies, @DateAdded)", conn);

                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@Author", txtAuthor.Text);
                    cmd.Parameters.AddWithValue("@CoAuthors", txtCoAuthors.Text);
                    cmd.Parameters.AddWithValue("@Publisher", txtPublisher.Text);
                    cmd.Parameters.AddWithValue("@PublicationDate", dtpPublicationDate.Value);
                    cmd.Parameters.AddWithValue("@ISBN", txtISBN.Text);
                    cmd.Parameters.AddWithValue("@DOI", txtDOI.Text);
                    cmd.Parameters.AddWithValue("@MaterialType", cmbMaterialType.Text);
                    cmd.Parameters.AddWithValue("@Abstract", txtAbstract.Text);
                    cmd.Parameters.AddWithValue("@AvailableCopies", txtAvailableCopies.Text);
                    cmd.Parameters.AddWithValue("@DateAdded", dtpDateAdded.Value);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Materiali u shtua me sukses!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    GetMaterials();
                    ClearFields();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Gabim:" + ex.Message);
                }
            }
        }

        private void UpdateMaterial()
        {
            if (string.IsNullOrWhiteSpace(txtMaterialID.Text))
            { 
                MessageBox.Show("Zgjidhni një material për të ndryshuar!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;

            }

            using (SqlConnection conn = ConnectDB.GetConnection())
            {
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE Bibliographic_Materials SET Title = @Title, Author = @Author, Co_Authors = @CoAuthors, Publisher = @Publisher, Publication_Date = @PublicationDate, ISBN = @ISBN, DOI = @DOI, Material_Type = @MaterialType, Abstract = @Abstract, Available_Copies = @AvailableCopies, Date_Added = @DateAdded WHERE Material_ID = @MaterialID", conn);

                    cmd.Parameters.AddWithValue("@MaterialID", txtMaterialID.Text);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                    cmd.Parameters.AddWithValue("@Author", txtAuthor.Text);
                    cmd.Parameters.AddWithValue("@CoAuthor", txtCoAuthors.Text);
                    cmd.Parameters.AddWithValue("Publisher", txtPublisher.Text);
                    cmd.Parameters.AddWithValue("@PublicationDate", dtpPublicationDate.Value);
                    cmd.Parameters.AddWithValue("@ISBN", txtISBN.Text);
                    cmd.Parameters.AddWithValue("@DOI", txtDOI.Text);
                    cmd.Parameters.AddWithValue("@MaterialType", cmbMaterialType.Text);
                    cmd.Parameters.AddWithValue("@Abstract", txtAbstract.Text);
                    cmd.Parameters.AddWithValue("@AvailableCopies", txtAvailableCopies.Text);
                    cmd.Parameters.AddWithValue("DateAdded", dtpDateAdded);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Materiali u përditësua me sukses!", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    GetMaterials();
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
            txtMaterialID.Clear();
            txtTitle.Clear();
            txtAuthor.Clear();
            txtCoAuthors.Clear();
            txtPublisher.Clear();
            txtISBN.Clear();
            txtDOI.Clear();
            cmbMaterialType.SelectedIndex = -1;
            txtAbstract.Clear();
            txtAvailableCopies.Clear();
            dtpPublicationDate.Value = DateTime.Now;
            dtpDateAdded.Value = DateTime.Now;
        }

        private void dgvMaterials_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                txtMaterialID.Text = dgvMaterials.Rows[e.RowIndex].Cells[0].Value.ToString();
                txtTitle.Text = dgvMaterials.Rows[e.RowIndex].Cells[1].Value.ToString();
                txtAuthor.Text = dgvMaterials.Rows[e.RowIndex].Cells[2].Value.ToString();
                txtCoAuthors.Text = dgvMaterials.Rows[e.RowIndex].Cells[3].Value.ToString();
                txtPublisher.Text = dgvMaterials.Rows[e.RowIndex].Cells[4].Value.ToString();
                dtpPublicationDate.Value = Convert.ToDateTime(dgvMaterials.Rows[e.RowIndex].Cells[5].Value);
                txtISBN.Text = dgvMaterials.Rows[e.RowIndex].Cells[6].Value.ToString();
                txtDOI.Text = dgvMaterials.Rows[e.RowIndex].Cells[7].Value.ToString();
                cmbMaterialType.Text = dgvMaterials.Rows[e.RowIndex].Cells[8].Value.ToString();
                txtAbstract.Text = dgvMaterials.Rows[e.RowIndex].Cells[9].Value.ToString();
                txtAvailableCopies.Text = dgvMaterials.Rows[e.RowIndex].Cells[10].Value.ToString();
                dtpDateAdded.Value = Convert.ToDateTime(dgvMaterials.Rows[e.RowIndex].Cells[11].Value);
            }
        }

        private void btnAddMaterial_Click(object sender, EventArgs e)
        {
            InsertMaterial();
        }

        private void btnUpdateMaterial_Click(Object sender, EventArgs e)
        { 
            UpdateMaterial();
        }

        private void MaterialForm_Load(object sender, EventArgs e)
        {
            GetMaterials();
        }

        private void cmbMaterialType_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        private void dgvMaterials_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
        }

        private void dtpPublicationDate_ValueChanged(object sender, EventArgs e)
        {
        }

        private void txtAuthor_TextChanged(object sender, EventArgs e)
        {
        }

        private void txtAvailableCopies_TextChanged(object sender, EventArgs e)
        {
        }

        private void txtCoAuthors_TextChanged(object sender, EventArgs e)
        {
        }

        private void txtMaterialID_TextChanged(object sender, EventArgs e)
        {
        }

        private void txtPublisher_TextChanged(object sender, EventArgs e)
        {
        }

        private void txtTitle_TextChanged(object sender, EventArgs e)
        {
        }

        private void klientetbtn_Click(object sender, EventArgs e)
        {
            Clients ClientsForm = new Clients();
            ClientsForm.Show();
            this.Hide();
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

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

        private void Materials_Load(object sender, EventArgs e)
        {
            GetMaterials();
        }

        private void aktivbtn_Click(object sender, EventArgs e)
        {
            ActiveClients ActiveClientsForm = new ActiveClients();
            ActiveClientsForm.Show();
            this.Hide();
        }

        private void dilbtn_Click(object sender, EventArgs e)
        {
            Login LoginForm = new Login();
            LoginForm.Show();
            this.Hide();
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

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Dashboard DashboardForm = new Dashboard();
            DashboardForm.Show();
            this.Hide();
        }
    }
}
