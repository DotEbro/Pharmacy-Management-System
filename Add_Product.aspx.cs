using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Add_Product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*if (Session["Username"] == null && Session["Password"] == null)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Your session ended!" + "');", true);
            Response.Redirect("Main_Page.aspx");
        }*/
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

    protected void btnAddP_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection("Data Source=ABRAR-KHAN;Initial Catalog=CareFare;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO Product (P_id, P_Name, P_Formula, P_Category, P_Qmg, P_MFGdate, P_EXPdate, P_Company, P_Price, P_Tax, P_SalesPrice, P_Quantity, P_Description) VALUES " +
                                                                "(@Pid, @PName, @PFormula, @PCategory, @PQmg, @PMFGdate, @PEXPdate, @PCompany, @PPrice, @PTax, @PSalesPrice, @PQuantity, @PDescription)", con);
            cmd.Parameters.AddWithValue("@Pid", txtPid.Text);
            cmd.Parameters.AddWithValue("@PName", txtPName.Text);
            cmd.Parameters.AddWithValue("@PFormula", txtPFormula.Text);
            cmd.Parameters.AddWithValue("@PCategory", txtPCategory.Text);
            cmd.Parameters.AddWithValue("@PQmg", txtQ_mg.Text);
            cmd.Parameters.AddWithValue("@PMFGdate", txtMFGdate.Text);
            cmd.Parameters.AddWithValue("@PEXPdate", txtEXPdate.Text);
            cmd.Parameters.AddWithValue("@PCompany", txtCo.Text);
            cmd.Parameters.AddWithValue("@PPrice", txtPrice.Text);
            cmd.Parameters.AddWithValue("@PTax", txtTax.Text);
            cmd.Parameters.AddWithValue("@PSalesPrice", txtSalesPrice.Text);
            cmd.Parameters.AddWithValue("@PQuantity", txtQuantity.Text);
            cmd.Parameters.AddWithValue("@PDescription", txtDesc.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            clearBox(this);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Product add Sucessfully!');", true);
        }
        catch
        {
            if (txtPid.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Product ID Field!');", true);
            }
            else if (txtPName.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Product Name Field!');", true);
            }
            else if (txtPFormula.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Formula Field!');", true);
            }
            else if (txtPCategory.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Category Field!');", true);
            }
            else if (txtQ_mg.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Milli Gram Field!');", true);
            }
            else if (txtMFGdate.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Manufacturing Field!');", true);
            }
            else if (txtEXPdate.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Expire Field!');", true);
            }
            else if (txtCo.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Company Field!');", true);
            }
            else if (txtPrice.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Price Field!');", true);
            }
            else if (txtTax.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Tax Field!');", true);
            }
            else if (txtSalesPrice.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Sales Price Field!');", true);
            }
            else if (txtQuantity.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Quantity Field!');", true);
            }
            else if (txtDesc.Text == string.Empty)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Please Fill the Description Field!');", true);
            }
            else
            { ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Your data does not saved!');", true); }
        }
    }

    private void clearBox(Control con)
    {
        txtPid.Text = string.Empty;
        txtPName.Text = string.Empty;
        txtPFormula.Text = string.Empty;
        txtPCategory.ClearSelection();
        txtQ_mg.Text = string.Empty;
        txtMFGdate.Text = string.Empty;
        txtEXPdate.Text = string.Empty;
        txtCo.Text = string.Empty;
        txtPrice.Text = string.Empty;
        txtTax.Text = string.Empty;
        txtSalesPrice.Text = string.Empty;
        txtQuantity.Text = string.Empty;
        txtDesc.Text = string.Empty;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clearBox(this);
    }
}