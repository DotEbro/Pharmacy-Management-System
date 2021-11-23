using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class My_Account : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=ABRAR-KHAN;Initial Catalog=CareFare;Integrated Security=True");

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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["Password"] == null)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Your session ended!" + "');", true);
            Response.Redirect("Main_Page.aspx");
        }
        if (Application["Name"] != null && Application["status"] != null)
        {
            EName.Text = Application["Name"].ToString();
            status.Text = Application["status"].ToString();
        }
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
            if (emp_FName[i].ToString() == EName.Text)
            {
                lblID.Text = emp_id[i].ToString();
                lblAcc.Text = emp_FName[i] + " " + emp_LName[i];
                FName.Text = emp_FName[i];
                LName.Text = emp_LName[i];
                CNIC.Text = emp_cnic[i];
                DOB.Text = emp_dob[i];
                Contact.Text = emp_contact[i];
                Email.Text = emp_email[i];
                Gender.Text = emp_gender[i];
                Marital.Text = emp_martialstatus[i];
                Religion.Text = emp_religion[i];
                StartDate.Text = emp_startdate[i];
                Address.Text = emp_address[i];
                UserName.Text = emp_username[i];
                Password.Text = emp_password[i];
                JobTitle.Text = emp_jobtitle[i];
                Salary.Text = emp_salary[i];
                JobStatus.Text = emp_jobstatus[i];
            }
        }
        FName.ReadOnly = true;
        LName.ReadOnly = true;
        CNIC.ReadOnly = true;
        DOB.ReadOnly = true;
        Contact.ReadOnly = true;
        Email.ReadOnly = true;
        Gender.Enabled = false;
        Marital.Enabled = false;
        Religion.Enabled = false;
        StartDate.ReadOnly = true;
        Address.ReadOnly = true;
        UserName.ReadOnly = true;
        Password.ReadOnly = true;
        JobTitle.ReadOnly = true;
        Salary.ReadOnly = true;
        JobStatus.ReadOnly = true;


        FName.BackColor = System.Drawing.Color.Gray;
        LName.BackColor = System.Drawing.Color.Gray;
        CNIC.BackColor = System.Drawing.Color.Gray;
        DOB.BackColor = System.Drawing.Color.Gray;
        Contact.BackColor = System.Drawing.Color.Gray;
        Email.BackColor = System.Drawing.Color.Gray;
        Gender.BackColor = System.Drawing.Color.Gray;
        Marital.BackColor = System.Drawing.Color.Gray;
        Religion.BackColor = System.Drawing.Color.Gray;
        StartDate.BackColor = System.Drawing.Color.Gray;
        Address.BackColor = System.Drawing.Color.Gray;
        UserName.BackColor = System.Drawing.Color.Gray;
        Password.BackColor = System.Drawing.Color.Gray;
        JobTitle.BackColor = System.Drawing.Color.Gray;
        Salary.BackColor = System.Drawing.Color.Gray;
        JobStatus.BackColor = System.Drawing.Color.Gray;
        con.Close();
    }


    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session.Remove("Username");
        Session.Remove("Password");
        Session.RemoveAll();
        Response.Redirect("Main_Page.aspx");
    }

    protected void btnEidt_Click(object sender, EventArgs e)
    {
        FName.BackColor = System.Drawing.Color.Empty;
        LName.BackColor = System.Drawing.Color.Empty;
        CNIC.BackColor = System.Drawing.Color.Empty;
        DOB.BackColor = System.Drawing.Color.Gray;
        Contact.BackColor = System.Drawing.Color.Empty;
        Email.BackColor = System.Drawing.Color.Empty;
        Gender.BackColor = System.Drawing.Color.Empty;
        Marital.BackColor = System.Drawing.Color.Empty;
        Religion.BackColor = System.Drawing.Color.Empty;
        StartDate.BackColor = System.Drawing.Color.Gray;
        Address.BackColor = System.Drawing.Color.Empty;
        UserName.BackColor = System.Drawing.Color.Empty;
        Password.BackColor = System.Drawing.Color.Empty;
        JobTitle.BackColor = System.Drawing.Color.Gray;
        Salary.BackColor = System.Drawing.Color.Gray;
        JobStatus.BackColor = System.Drawing.Color.Gray;

        FName.ReadOnly = false;
        LName.ReadOnly = false;
        CNIC.ReadOnly = false;
        DOB.ReadOnly = true;
        Contact.ReadOnly = false;
        Email.ReadOnly = false;
        Gender.Enabled = true;
        Marital.Enabled = true;
        Religion.Enabled = true;
        StartDate.ReadOnly = true;
        Address.ReadOnly = false;
        UserName.ReadOnly = false;
        Password.ReadOnly = false;
        JobTitle.ReadOnly = true;
        Salary.ReadOnly = true;
        JobStatus.ReadOnly = true;
    }

    protected void btnSave_Click(object sender, EventArgs e)
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
                          "emp_email=@empemail," +
                          "emp_gender=@empgender, " +
                          "emp_martialstatus=@empmartialstatus, " +
                          "emp_religion=@empreligion, " +
                          "emp_startdate=@empstartdate, " +
                          "emp_address=@empaddress, " +
                          "emp_username=@empusername, " +
                          "emp_password=@emppassword, " +
                          "emp_jobtitle=@empjobtitle, " +
                          "emp_salary=@empsalary, " +
                          "emp_jobstatus=@empjobstatus " +
                          "WHERE emp_id='" + lblID.Text + "'";
            SqlCommand cmd = new SqlCommand(Cmd, con);
            cmd.Parameters.AddWithValue("@empFName", FName.Text);
            cmd.Parameters.AddWithValue("@empLName", LName.Text);
            cmd.Parameters.AddWithValue("@empcnic", CNIC.Text);
            cmd.Parameters.AddWithValue("@empdob", DOB.Text);
            cmd.Parameters.AddWithValue("@empcontact", Contact.Text);
            cmd.Parameters.AddWithValue("@empemail", Email.Text);
            cmd.Parameters.AddWithValue("@empgender", Gender.Text);
            cmd.Parameters.AddWithValue("@empmartialstatus", Marital.Text);
            cmd.Parameters.AddWithValue("@empreligion", Religion.Text);
            cmd.Parameters.AddWithValue("@empstartdate", StartDate.Text);
            cmd.Parameters.AddWithValue("@empaddress", Address.Text);
            cmd.Parameters.AddWithValue("@empusername", UserName.Text);
            cmd.Parameters.AddWithValue("@emppassword", Password.Text);
            cmd.Parameters.AddWithValue("@empjobtitle", JobTitle.Text);
            cmd.Parameters.AddWithValue("@empsalary", Salary.Text);
            cmd.Parameters.AddWithValue("@empjobstatus", JobStatus.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Your Data updated Sucessfully!');", true);
        }

        catch
        {
            if (lblID.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Employee ID Field!');", true);
            }
            if (FName.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the First Name Field!');", true);
            }
            else if (LName.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Last Name Field!');", true);
            }
            else if (CNIC.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the CNIC Field!');", true);
            }
            else if (DOB.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Date of Birth Field!');", true);
            }
            else if (Contact.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Contact Field!');", true);
            }
            else if (Email.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Email Field!');", true);
            }
            else if (Gender.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Gender Field!');", true);
            }
            else if (Marital.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Marital Status Field!');", true);
            }
            else if (Religion.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Religion Field!');", true);
            }
            else if (StartDate.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Strating Date Field!');", true);
            }
            else if (Address.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Address Field!');", true);
            }
            else if (UserName.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the User Name Field!');", true);
            }
            else if (Password.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Password Field!');", true);
            }
            else if (JobTitle.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Job Title Field!');", true);
            }
            else if (Salary.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Salary Field!');", true);
            }
            else if (JobStatus.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Job Status Field!');", true);
            }
            else
            { ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Your data does not saved!');", true); }
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        FName.ReadOnly = true;
        LName.ReadOnly = true;
        CNIC.ReadOnly = true;
        DOB.ReadOnly = true;
        Contact.ReadOnly = true;
        Email.ReadOnly = true;
        Gender.Enabled = false;
        Marital.Enabled = false;
        Religion.Enabled = false;
        StartDate.ReadOnly = true;
        Address.ReadOnly = true;
        UserName.ReadOnly = true;
        Password.ReadOnly = true;
        Salary.ReadOnly = true;
        JobStatus.ReadOnly = true;
    }
}