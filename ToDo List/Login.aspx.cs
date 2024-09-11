using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToDo_List
{
    public partial class About : Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myconnect"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            byte[] hs = new byte[50];
            string pass = password.Text;
            MD5 md5 = MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(pass);
            byte[] hash = md5.ComputeHash(inputBytes);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                hs[i] = hash[i];
                sb.Append(hs[i].ToString("x2"));

            }
            var hash_pass = sb.ToString();


            conn.Open();
            SqlCommand cmd = new SqlCommand("select COUNT(*) from regForm where email = '" + email.Text + "' and password ='" + hash_pass + "'");

            cmd.Connection = conn;
            int OBJ = Convert.ToInt32(cmd.ExecuteScalar());
            if (OBJ > 0)
            {
                if (RememberMe.Checked)
                {
                    HttpCookie mycookie = new HttpCookie(email.Text, password.Text);
                    mycookie.Expires = DateTime.Now.AddMinutes(30);
                    Response.Cookies.Add(mycookie);


                }
                Session["email"] = email.Text;
                Session["password"] = password.Text;
                Response.Redirect("Dashboard.aspx");

            }
            else
            {
                error_msg.Text = "Invalid Username or Password.";
                this.error_msg.ForeColor = Color.Red;
            }
        }
    }
}