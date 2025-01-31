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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace LibraryManagement
{
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void kycubtn_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn1 = ConnectDB.GetConnection())
            {
                try
                {
                    conn1.Open();
                    SqlCommand cmd1 = new SqlCommand("select Username, Password from [User] where Username = @Username and Password = @Password", conn1);
                    cmd1.Parameters.AddWithValue("@Username", usernametxtBox.Text);
                    cmd1.Parameters.AddWithValue("@Password", pswtxtBox.Text);
                    SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
                    DataTable dt1 = new DataTable();
                    da1.Fill(dt1);
                    if (dt1.Rows.Count > 0)
                    {

                        Dashboard dashboard = new Dashboard();
                        dashboard.ShowDialog();
                        this.Hide();
                    }
                    else
                    {
                        MessageBox.Show("Keni gabuar kredencialet");
                    }

                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click_1(object sender, EventArgs e)
        {

        }
    }
}
