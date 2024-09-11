using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToDo_List
{
    public partial class _Default : Page
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myconnect"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {

            Label1.Text = Session["email"].ToString();
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

       

        protected void Button1_Click(object sender, EventArgs e)
        {

            string description = Request.Form["Description"];
            
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Tasks (TaskDescr, IsCompleted) VALUES (@Description, @IsCompleted)", conn);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@IsCompleted", false);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            
            BindGrid();
        }
        protected void TaskGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int taskId = Convert.ToInt32(e.CommandArgument);
        
            {
                if (e.CommandName == "Complete")
                {
                    SqlCommand cmd = new SqlCommand("UPDATE Tasks SET IsCompleted = ~IsCompleted WHERE ID = @ID", conn);
                    cmd.Parameters.AddWithValue("@ID", taskId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                else if (e.CommandName == "Delete")
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM Tasks WHERE ID = @ID", conn);
                    cmd.Parameters.AddWithValue("@ID", taskId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            BindGrid();
        }

        private void BindGrid()
        {
            
            {
                SqlCommand cmd = new SqlCommand("SELECT ID, TaskDescr, IsCompleted FROM Tasks", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                TaskGridView.DataSource = dt;
                TaskGridView.DataBind();
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Login.aspx");
        }
    }
}