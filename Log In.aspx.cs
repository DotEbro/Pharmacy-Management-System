using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Log_In : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=ABRAR-KHAN;Initial Catalog=CareFare;Integrated Security=True");
    

    bool flag = true;
    int idx = 0;
    int[] emp_id = new int[100];
    string[] UserName = new string[100];
    string[] Password = new string[100];
    string[] Status = new string[100];

    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (con.State== ConnectionState.Open)
        {
            con.Close();
        }
        
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        //SELECT empolyee_id, userName, password, status FROM Log_in UNION
        //SELECT emp_id, emp_username, emp_password, emp_jobstatus FROM Employee;
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT emp_id, emp_username, emp_password, emp_jobtitle from Employee", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        cmd.ExecuteNonQuery();
        if(dt.Rows.Count>0)
        {
            foreach(DataRow dtRow in dt.Rows)
            {
                emp_id[idx] = (int)dtRow["emp_id"];
                UserName[idx] = dtRow["emp_username"].ToString();
                Password[idx] = dtRow["emp_password"].ToString();
                Status[idx] = dtRow["emp_jobtitle"].ToString();
                idx++;
            }
        }
        cmd = new SqlCommand("select * from Customer", con);
        da = new SqlDataAdapter(cmd);
        dt = new DataTable();
        da.Fill(dt);
        cmd.ExecuteNonQuery();
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dtRow in dt.Rows)
            {
                UserName[idx] = dtRow["cust_Name"].ToString();
                Password[idx] = dtRow["cust_pass"].ToString();
                Status[idx] = "Customer";
                idx++;
            }
        }
        for (int i = 0; i < idx; i++)
        {
            if (login.Text == UserName[i] && password.Text == Password[i] && Status[i] == "Super Admin")
            {
                Application["Name"] = UserName[i];
                Application["status"] = Status[i];
                Session["Username"] = login.Text;
                Session["Password"] = password.Text;
                Response.Redirect("Add_Employee.aspx");
                flag = false;
            }
            if (login.Text == UserName[i] && password.Text == Password[i] && Status[i] == "Admin")
            {
                Application["Name"] = UserName[i];
                Application["status"] = Status[i];
                Session["Username"] = login.Text;
                Session["Password"] = password.Text;
                Response.Redirect("Add_Employee.aspx");
                flag = false;
            }
            if (login.Text == UserName[i] && password.Text == Password[i] && Status[i] == "Accountant")
            {
                Application["Name"] = UserName[i];
                Application["status"] = Status[i];
                Session["Username"] = login.Text;
                Session["Password"] = password.Text;
                Response.Redirect("Add_Employee.aspx");
                flag = false;
            }
            if (login.Text == UserName[i] && password.Text == Password[i] && Status[i] == "Pharmacist")
            {
                Application["Name"] = UserName[i];
                Application["status"] = Status[i];
                Session["Username"] = login.Text;
                Session["Password"] = password.Text;
                Response.Redirect("Add_Product.aspx");
                flag = false;
            }
            if (login.Text == UserName[i] && password.Text == Password[i] && Status[i] == "Dlivery")
            {
                Application["Name"] = UserName[i];
                Application["status"] = Status[i];
                Session["Username"] = login.Text;
                Session["Password"] = password.Text;
                Response.Redirect("Add_Employee.aspx");
                flag = false;
            }
            if (login.Text == UserName[i] && password.Text == Password[i] && Status[i] == "Customer")
            {
                Application["Name"] = UserName[i];
                Application["status"] = Status[i];
                Session["Username"] = login.Text;
                Session["Password"] = password.Text;
                Response.Redirect("Add_Employee.aspx");
                flag = false;
            }
        }
        
        if(flag == true)
        {
            login.Text = "";
            password.Text = "";
            string display = "Invalid Caredentials";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

        }
    }
}