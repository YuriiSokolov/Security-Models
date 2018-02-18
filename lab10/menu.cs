using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace lab10
{
    public partial class Menu : Form
    {
        public Menu()
        {
            InitializeComponent();
        }

        static string connString = string.Format("Data Source=ADMIN-PC;Initial Catalog=lab10;User ID= {0};Password= {1}", Login.UserName, Password.Pass);
        SqlConnection sqlConn = new SqlConnection(connString);

        private void btnInsert_Click(object sender, EventArgs e)
        {
            sqlConn.Open();
            try
            {
                SqlCommand cmd = sqlConn.CreateCommand();
                string str = string.Format("INSERT INTO {0} VALUES('{1}')", comboBoxTables.Text.Trim(), txtInfo.Text);
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = str;
                cmd.ExecuteNonQuery();
            }
            catch
            {
                MessageBox.Show("Ваш уровень не позволяет совершить действие Insert в таблицу " + comboBoxTables.Text);
            }
            sqlConn.Close();
        }

        private void btnSelect_Click(object sender, EventArgs e)
        {
            sqlConn.Open();
            try
            {
                SqlCommand cmd = sqlConn.CreateCommand();
                string str = string.Format("SELECT * FROM {0}", comboBoxTables.Text.Trim());
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = str;
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                DataView.DataSource = dt;
            }
            catch
            {
                MessageBox.Show("Ваш уровень не позволяет совершить действие Select в таблицу " + comboBoxTables.Text);
            }
            sqlConn.Close();
        }

        private void Menu_Load(object sender, EventArgs e)
        {
            string[] tables_list = { "Unclassified", "Confidential", "Secret", "TopSecret", "Unclassified_Biba", "Confidential_Biba", "Secret_Biba", "TopSecret_Biba" };
            comboBoxTables.Items.AddRange(tables_list);
        }
    }
}
