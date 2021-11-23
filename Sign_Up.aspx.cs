using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Sign_Up : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submit_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(@"Data Source=ABRAR-KHAN;Initial Catalog=CareFare;Integrated Security=True");
            con.Open();
            string Cmd = "insert into dbo.Customer (cust_Name, cust_email, cust_pass) values (@cust_Name, @cust_email, @cust_pass)";
            SqlCommand cmd = new SqlCommand(Cmd, con);
            cmd.Parameters.AddWithValue("@cust_Name", Username.Text);
            cmd.Parameters.AddWithValue("@cust_email", email.Text);
            cmd.Parameters.AddWithValue("@cust_pass", password.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Username.Text = "";
            email.Text = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Sign up Sucessfully');", true);

        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('There was some error, Please try again');", true);

        }
    }
}