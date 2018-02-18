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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        static string connString = string.Format("Data Source=ADMIN-PC;Initial Catalog=lab10;User ID= {0};Password= {1}", Login.UserName, Password.Pass);
        SqlConnection sqlConn = new SqlConnection(connString);

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string connString = string.Format("Data Source=ADMIN-PC;Initial Catalog=lab10;User ID= {0};Password= {1}", txtLogin.Text, txtPass.Text);
            Password.Pass = txtPass.Text;
            Login.UserName = txtLogin.Text;
            SqlConnection sqlConn = new SqlConnection(connString);
            try
            {
                {
                    sqlConn.Open();
                    Menu menu = new Menu();
                    this.Hide();
                    menu.Show();
                }
            }
            catch
            {
                MessageBox.Show("Пользователь не существует / Или неверный Логин или Пароль");
            }
        }

        private void btnGrate_Click(object sender, EventArgs e)
        {
            string connString = string.Format("Data Source=ADMIN-PC;Initial Catalog=lab10;User ID= {0};Password= {1}", txtLogin.Text, txtPass.Text);
            Password.Pass = txtPass.Text;
            Login.UserName = txtLogin.Text;
            SqlConnection sqlConn = new SqlConnection(connString);
            try
            {
                {
                    sqlConn.Open();
                    Grate grate = new Grate();
                    this.Hide();
                    grate.Show();
                }
            }
            catch
            {
                MessageBox.Show("Пользователь не существует / Или неверный Логин или Пароль");
            }
        }
    }
}

