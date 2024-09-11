using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToDo_List
{
    public partial class Contact : Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myconnect"].ConnectionString);
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

            try
            {
                //    string _username = Request.Form["username"];

                //    string _email = Request.Form["email"];

                //    string _password = Request.Form["password"];

                SqlCommand cmd = new SqlCommand("insert into regForm values(@u, @p,@e)", con);

                con.Open();
                cmd.Parameters.AddWithValue("u", username.Text);
                cmd.Parameters.AddWithValue("p",hash_pass);
                cmd.Parameters.AddWithValue("e", email.Text);
                cmd.ExecuteNonQuery();
                Session["username"] = username.Text;
                Response.Redirect("Login.aspx");
                con.Close();
            }
            catch (Exception ex)
            {
                error_msg.ForeColor = System.Drawing.Color.Red;
                
                error_msg.Text = ex.Message+"You have entered Invalid EmailID OR Password.";
            }

        }
    }
}