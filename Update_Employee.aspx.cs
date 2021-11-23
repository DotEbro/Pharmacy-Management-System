using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Update_Employee : System.Web.UI.Page
{
    int[] emp_id = new int[100];
    string[] emp_FName = new string[100];
    string[] emp_LName = new string[100];
    string[] emp_cnic = new string[100];
    string[] emp_dob = new string[100];
    string[] emp_contact = new string[100];
    string[] emp_email = new string[100];
    string[] emp_gender = new string[100];
    string[] emp_martialstatus = new string[100];
    string[] emp_religion = new string[100]; 
    string[] emp_startdate = new string[100];
    string[] emp_qulification = new string[100];
    string[] emp_address = new string[100];
    string[] emp_username = new string[100]; 
    string[] emp_password = new string[100];
    string[] emp_jobtitle = new string[100];
    string[] emp_salary = new string[100];
    string[] emp_jobstatus = new string[100];
    int idx = 0;


    SqlConnection con = new SqlConnection("Data Source=ABRAR-KHAN;Initial Catalog=CareFare;Integrated Security=True");
    
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
            con.Open();
            string Cmd = "UPDATE Employee SET " +
                          "emp_FName=@empFName, " +
                          "emp_LName=@empLName, " +
                          "emp_cnic=@empcnic, " +
                          "emp_dob=@empdob, " +
                          "emp_contact=@empcontact, " +
                          "emp_email=@empemail" +
                          "emp_gender=@empgender, " +
                          "emp_martialstatus=@empmartialstatus, " +
                          "emp_religion=@empreligion, " +
                          "emp_startdate=@empstartdate, " +
                          "emp_qualification=@empqualification, " +
                          "emp_address=@empaddress, " +
                          "emp_username=@empusername, " +
                          "emp_password=@emppassword, " +
                          "emp_jobtitle=@empjobtitle, " +
                          "emp_salary=@empsalary, " +
                          "emp_jobstatus=@empjobstatus " +
                          "WHERE emp_id='"+txtSearchID.Text+"'";
            SqlCommand cmd = new SqlCommand(Cmd, con);
            cmd.Parameters.AddWithValue("@empFName", txtFName.Text);
            cmd.Parameters.AddWithValue("@empLName", txtLName.Text);
            cmd.Parameters.AddWithValue("@empcnic", txtCNIC.Text);
            cmd.Parameters.AddWithValue("@empdob", txtDOB.Text);
            cmd.Parameters.AddWithValue("@empcontact", txtContact.Text);
            cmd.Parameters.AddWithValue("@empemail", txtemail.Text);
            cmd.Parameters.AddWithValue("@empgender", txtGender.Text);
            cmd.Parameters.AddWithValue("@empmartialstatus", txtMaritalStatus.Text);
            cmd.Parameters.AddWithValue("@empreligion", txtReligion.Text);
            cmd.Parameters.AddWithValue("@empstartdate", txtStartingDate.Text);
            cmd.Parameters.AddWithValue("@empqualification", txtqulification.Text);
            cmd.Parameters.AddWithValue("@empaddress", txtAddress.Text);
            cmd.Parameters.AddWithValue("@empusername", txtUserName.Text);
            cmd.Parameters.AddWithValue("@emppassword", txtPassword.Text);
            cmd.Parameters.AddWithValue("@empjobtitle", txtJobTitle.Text);
            cmd.Parameters.AddWithValue("@empsalary", txtSalary.Text);
            cmd.Parameters.AddWithValue("@empjobstatus", txtJobStatus.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Emloyee updated Sucessfully!');", true);
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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Employee", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        cmd.ExecuteNonQuery();
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dtRow in dt.Rows)
            {
                emp_id[idx] = (int)dtRow["emp_id"];
                emp_FName[idx] = dtRow["emp_FName"].ToString();
                emp_LName[idx] = dtRow["emp_LName"].ToString();
                emp_cnic[idx] = dtRow["emp_cnic"].ToString();
                emp_dob[idx] = dtRow["emp_dob"].ToString();
                emp_contact[idx] = dtRow["emp_contact"].ToString();
                emp_email[idx] = dtRow["emp_email"].ToString();
                emp_gender[idx] = dtRow["emp_gender"].ToString();
                emp_martialstatus[idx] = dtRow["emp_martialstatus"].ToString();
                emp_religion[idx] = dtRow["emp_religion"].ToString();
                emp_startdate[idx] = dtRow["emp_startdate"].ToString();
                emp_qulification[idx] = dtRow["emp_qualification"].ToString();
                emp_address[idx] = dtRow["emp_address"].ToString();
                emp_username[idx] = dtRow["emp_username"].ToString();
                emp_password[idx] = dtRow["emp_password"].ToString();
                emp_jobtitle[idx] = dtRow["emp_jobtitle"].ToString();
                emp_salary[idx] = dtRow["emp_salary"].ToString();
                emp_jobstatus[idx] = dtRow["emp_jobstatus"].ToString();
                idx++;
            }
        }
        for (int i = 0; i < idx; i++) 
        {
            if (emp_id[i].ToString() == txtSearchID.Text)
            {
                txtid.Text = emp_id[i].ToString();
                txtFName.Text = emp_FName[i];
                txtLName.Text = emp_LName[i];
                txtCNIC.Text = emp_cnic[i];
                txtDOB.Text = emp_dob[i];
                txtContact.Text = emp_contact[i];
                txtemail.Text = emp_email[i];
                txtGender.Text = emp_gender[i];
                txtMaritalStatus.Text = emp_martialstatus[i];
                txtReligion.Text = emp_religion[i];
                txtStartingDate.Text = emp_startdate[i];
                txtqulification.Text = emp_qulification[i];
                txtAddress.Text = emp_address[i];
                txtUserName.Text = emp_username[i];
                txtPassword.Text = emp_password[i];
                txtJobTitle.Text = emp_jobtitle[i];
                txtSalary.Text = emp_salary[i];
                txtJobStatus.Text = emp_jobstatus[i];
            }
        }
        con.Close();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clearBox(this);
    }

    private void clearBox(Control con)
    {
        txtid.Text = string.Empty;
        txtSearchID.Text = string.Empty;
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

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Show_Employees.aspx");
    }
}