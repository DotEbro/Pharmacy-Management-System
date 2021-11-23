using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Modify_Product : System.Web.UI.Page
{

    int[] Pid = new int[100];
    string[] PName = new string[100];
    string[] PFormula = new string[100];
    string[] PCategory = new string[100];
    int[] Q_mg = new int[100];
    string[] MFGdate = new string[100];
    string[] EXPdate = new string[100];
    string[] Company = new string[100];
    double[] Price = new double[100];
    double[] Tax = new double[100];
    double[] SalesPrice = new double[100];
    int[] Quantity = new int[100];
    string[] Desc = new string[100];
    int idx = 0;

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

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Data Source=ABRAR-KHAN;Initial Catalog=CareFare;Integrated Security=True");
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Product", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        cmd.ExecuteNonQuery();
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dtRow in dt.Rows)
            {
                Pid[idx] = (int)dtRow["P_id"];
                PName[idx] = dtRow["P_Name"].ToString();
                PFormula[idx] = dtRow["P_Formula"].ToString();
                PCategory[idx] = dtRow["P_Category"].ToString();
                Q_mg[idx] = (int)dtRow["P_Qmg"];
                MFGdate[idx] = dtRow["P_MFGdate"].ToString();
                EXPdate[idx] = dtRow["P_EXPdate"].ToString();
                Company[idx] = dtRow["P_Company"].ToString();
                Price[idx] = (double)dtRow["P_Price"];
                Tax[idx] = (double)dtRow["P_Tax"];
                SalesPrice[idx] = (double)dtRow["P_SalesPrice"];
                Quantity[idx] = (int)dtRow["P_Quantity"];
                Desc[idx] = dtRow["P_Description"].ToString();
                idx++;
            }
        }
        for (int i = 0; i < idx; i++)
        {
            if (Pid[i].ToString() == txtSearchID.Text)
            {
                txtPid.Text = Pid[i].ToString();
                txtPName.Text = PName[i];
                txtPFormula.Text = PFormula[i];
                txtPCategory.Text = PCategory[i];
                txtQ_mg.Text = Q_mg[i].ToString();
                txtMFGdate.Text = MFGdate[i];
                txtEXPdate.Text = EXPdate[i];
                txtCo.Text = Company[i];
                txtPrice.Text = Price[i].ToString();
                txtTax.Text = Tax[i].ToString();
                txtSalesPrice.Text = SalesPrice[i].ToString();
                txtQuantity.Text = Quantity[i].ToString();
                txtDesc.Text = Desc[i];
            }
        }
        con.Close();
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Show_Product.aspx");
    }

    protected void btnAddP_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection("Data Source=ABRAR-KHAN;Initial Catalog=CareFare;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE Product SET P_id=@pid, P_Name=@pname, P_Formula=@pformula, P_Category=@pcategory, " +
                "P_Qmg=@pqmg, P_MFGdate=@pmfgdate, P_EXPdate=@pexpdate, P_Company=@pcompany, P_Price=@pprice, P_Tax=@ptax, " +
                "P_SalesPrice=@psalesprice, P_Quantity=@pquantity, P_Description=@pdescription WHERE P_id='" + txtSearchID.Text + "'", con);
            cmd.Parameters.AddWithValue("@pid", txtPid.Text);
            cmd.Parameters.AddWithValue("@pname", txtPName.Text);
            cmd.Parameters.AddWithValue("@pformula", txtPFormula.Text);
            cmd.Parameters.AddWithValue("@pcategory", txtPCategory.Text);
            cmd.Parameters.AddWithValue("@pqmg", txtQ_mg.Text);
            cmd.Parameters.AddWithValue("@pmfgdate", txtMFGdate.Text);
            cmd.Parameters.AddWithValue("@pexpdate", txtEXPdate.Text);
            cmd.Parameters.AddWithValue("@pcompany", txtCo.Text);
            cmd.Parameters.AddWithValue("@pprice", txtPrice.Text);
            cmd.Parameters.AddWithValue("@ptax", txtTax.Text);
            cmd.Parameters.AddWithValue("@psalesprice", txtSalesPrice.Text);
            cmd.Parameters.AddWithValue("@pquantity", txtQuantity.Text);
            cmd.Parameters.AddWithValue("@pdescription", txtDesc.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "scripit", "alert('Product updated Sucessfully!');", true);
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

    protected void btnCancel_Click(object sender, EventArgs e)
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
}