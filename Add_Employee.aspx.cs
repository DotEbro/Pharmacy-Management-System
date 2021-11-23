using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Add_Employee : System.Web.UI.Page
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

    protected void btnAddEmployee_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection("Data Source=ABRAR-KHAN;Initial Catalog=CareFare;Integrated Security=True");
            con.Open();
            string Cmd = "insert into dbo.Employee (emp_id, emp_FName, emp_LName, emp_cnic, emp_dob, emp_contact, emp_email, emp_gender, emp_martialstatus," +
                " emp_religion, emp_startdate, emp_qualification, emp_address, emp_username, emp_password, emp_jobtitle, emp_salary, emp_jobstatus)" +
                " values (@emp_id, @emp_FName, @emp_LName, @emp_cnic, @emp_dob, @emp_contact, @emp_email, @emp_gender, @emp_martialstatus, @emp_religion, @emp_startdate," +
                " @emp_qualification, @emp_address, @emp_username, @emp_password, @emp_jobtitle, @emp_salary, @emp_jobstatus)";
            SqlCommand cmd = new SqlCommand(Cmd, con);
            cmd.Parameters.AddWithValue("@emp_id", txtid.Text);
            cmd.Parameters.AddWithValue("@emp_FName", txtFName.Text);
            cmd.Parameters.AddWithValue("@emp_LName", txtLName.Text);
            cmd.Parameters.AddWithValue("@emp_cnic", txtCNIC.Text);
            cmd.Parameters.AddWithValue("@emp_dob", txtDOB.Text);
            cmd.Parameters.AddWithValue("@emp_contact", txtContact.Text);
            cmd.Parameters.AddWithValue("@emp_email", txtemail.Text);
            cmd.Parameters.AddWithValue("@emp_gender", txtGender.Text);
            cmd.Parameters.AddWithValue("@emp_martialstatus", txtMaritalStatus.Text);
            cmd.Parameters.AddWithValue("@emp_religion", txtReligion.Text);
            cmd.Parameters.AddWithValue("@emp_startdate", txtStartingDate.Text);
            cmd.Parameters.AddWithValue("@emp_qualification", txtqulification.Text);
            cmd.Parameters.AddWithValue("@emp_address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@emp_username", txtUserName.Text);
            cmd.Parameters.AddWithValue("@emp_password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@emp_jobtitle", txtJobTitle.Text);
            cmd.Parameters.AddWithValue("@emp_salary", txtSalary.Text);
            cmd.Parameters.AddWithValue("@emp_jobstatus", txtJobStatus.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            clearBox(this);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Emloyee add Sucessfully!');", true);
        }
        catch
        {
            if (txtid.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Employee ID Field!');", true);
            }
            if (txtFName.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the First Name Field!');", true);
            }
            else if (txtLName.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Last Name Field!');", true);
            }
            else if (txtCNIC.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the CNIC Field!');", true);
            }
            else if (txtDOB.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Date of Birth Field!');", true);
            }
            else if (txtContact.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Contact Field!');", true);
            }
            else if (txtemail.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Email Field!');", true);
            }
            else if (txtGender.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Gender Field!');", true);
            }
            else if (txtMaritalStatus.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Marital Status Field!');", true);
            }
            else if (txtReligion.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Religion Field!');", true);
            }
            else if (txtStartingDate.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Strating Date Field!');", true);
            }
            else if (txtqulification.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Qaulification Field!');", true);
            }
            else if (txtAddress.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Address Field!');", true);
            }
            else if (txtUserName.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the User Name Field!');", true);
            }
            else if (txtPassword.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Password Field!');", true);
            }
            else if (txtJobTitle.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Job Title Field!');", true);
            }
            else if (txtSalary.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Salary Field!');", true);
            }
            else if (txtJobStatus.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Job Status Field!');", true);
            }
            else
            { ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Your data does not saved!');", true); }
            
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clearBox(this);
    }

    private void clearBox(Control con)
    {
        txtid.Text = string.Empty;
        txtFName.Text = string.Empty;
        txtLName.Text = string.Empty;
        txtCNIC.Text = string.Empty;
        txtDOB.Text = string.Empty;
        txtContact.Text = string.Empty;
        txtemail.Text = string.Empty;
        txtGender.ClearSelection();
        txtMaritalStatus.ClearSelection();
        txtReligion.ClearSelection();
        txtStartingDate.Text = string.Empty;
        txtqulification.Text = string.Empty;
        txtAddress.Text = string.Empty;
        txtUserName.Text = string.Empty;
        txtPassword.Text = string.Empty;
        txtJobTitle.ClearSelection();
        txtSalary.Text = string.Empty;
        txtJobStatus.ClearSelection();
    }
}