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

namespace lab10
{
    public partial class Grate : Form
    {
        public Grate()
        {
            InitializeComponent();
        }

        static string connString = string.Format("Data Source=ADMIN-PC;Initial Catalog=lab10;User ID= {0};Password= {1}", Login.UserName, Password.Pass);
        SqlConnection sqlConn = new SqlConnection(connString);

        private void btnSelect_Click(object sender, EventArgs e)
        {
            int size = 1;
            //int[] accept = new int[size];

            int UserLvl = 0;
            sqlConn.Open();
            SqlCommand cmd1 = sqlConn.CreateCommand();
            cmd1.CommandType = CommandType.Text;
            string lvlRequest = string.Format("SELECT Lvl FROM Users Where UserName = '{0}'", Login.UserName);
            cmd1.CommandText = lvlRequest;
            UserLvl = Convert.ToInt32(cmd1.ExecuteScalar());
            sqlConn.Close();

            int[] accept = new int[UserLvl];

            for (int i = 1; i <= UserLvl; i++)
            {
                if (UserLvl % i == 0)
                {
                    accept[size] = i;
                    size++;
                }
            }

            sqlConn.Open();
            try
            {
                DataTable dt = new DataTable();
                for (int i = 0; i < accept.Length; i++)
                {
                    SqlCommand cmd = sqlConn.CreateCommand();
                    string str = string.Format("SELECT * FROM InformLvl Where InfoLvl = {0}", accept[i]);
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = str;
                    cmd.ExecuteNonQuery();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
                DataView.DataSource = dt;
            }
            catch
            {
                MessageBox.Show("Что то пошло не так!!!");
            }
            sqlConn.Close();
        }
    }
}
