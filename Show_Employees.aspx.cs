using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Show_Employees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["Username"] == null && Session["Password"] == null)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Your session ended!" + "');", true);
            Response.Redirect("Main_Page.aspx");
        }
        if (Application["Name"] != null && Application["status"] != null)
        {
            userName.Text = Application["Name"].ToString();
            status.Text = Application["status"].ToString();
        }

    }
    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session.Remove("Username");
        Session.Remove("Password");
        Session.RemoveAll();
        Response.Redirect("Main_Page.aspx");
    }

    protected void lnkEidt_Click(object sender, EventArgs e)
    {
        Response.Redirect("Update_Employee.aspx");
    }
}