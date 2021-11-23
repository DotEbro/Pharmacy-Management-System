using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

public partial class P_Expire_Product : System.Web.UI.Page
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
    int[] RemaningDays = new int[100];
    int[] index = new int[100];
    int idx = 0;
    int count = 0;

    

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Data Source=ABRAR-KHAN;Initial Catalog=CareFare;Integrated Security=True");


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

        for(int i = 0; i < 100; i++)
        {
            index[i] = -1;
        }
        for(int i = 0; i < idx; i++)
        {
            DateTime MFG = DateTime.ParseExact(MFGdate[i], "dd-MM-yyyy", null);
            DateTime EXP = DateTime.ParseExact(EXPdate[i], "dd-MM-yyyy", null);

            if ((EXP - MFG).TotalDays == 0)
            {
                RemaningDays[count] = 0;
                index[count] = i;
                count++;
            }
            else if((EXP - MFG).TotalDays == 1)
            {
                RemaningDays[count] = 1;
                index[count] = i;
                count++;
            }
            else if ((EXP - MFG).TotalDays == 2)
            {
                RemaningDays[count] = 2;
                index[count] = i;
                count++;
            }
            else if ((EXP - MFG).TotalDays == 3)
            {
                RemaningDays[count] = 3;
                index[count] = i;
                count++;
            }
            else if ((EXP - MFG).TotalDays == 4)
            {
                RemaningDays[count] = 4;
                index[count] = i;
                count++;
            }
            else if ((EXP - MFG).TotalDays == 5)
            {
                RemaningDays[count] = 5;
                index[count] = i;
                count++;
            }
            else if ((EXP - MFG).TotalDays == 6)
            {
                RemaningDays[count] = 6;
                index[count] = i;
                count++;
            }
            else if ((EXP - MFG).TotalDays == 7)
            {
                RemaningDays[count] = 7;
                index[count] = i;
                count++;
            }
        }

        int totalPages = (count / 6) + 1;

        
        if(totalPages == 1)
        {
            btn1.Visible = true;
        }
        if (totalPages == 2)
        {
            btn1.Visible = true;
            btn2.Visible = true;
        }
        if (totalPages == 3)
        {
            btn1.Visible = true;
            btn2.Visible = true;
            btn3.Visible = true;
        }
        if (totalPages == 4)
        {
            btn1.Visible = true;
            btn2.Visible = true;
            btn3.Visible = true;
            btn4.Visible = true;
        }
        if (totalPages == 5)
        {
            btn1.Visible = true;
            btn2.Visible = true;
            btn3.Visible = true;
            btn4.Visible = true;
            btn5.Visible = true;
        }
        if (totalPages == 6)
        {
            btn1.Visible = true;
            btn2.Visible = true;
            btn3.Visible = true;
            btn4.Visible = true;
            btn5.Visible = true;
            btn6.Visible = true;
        }
        if (totalPages == 7)
        {
            btn1.Visible = true;
            btn2.Visible = true;
            btn3.Visible = true;
            btn4.Visible = true;
            btn5.Visible = true;
            btn6.Visible = true;
            btn7.Visible = true;
        }
        if (totalPages == 8)
        {
            btn1.Visible = true;
            btn2.Visible = true;
            btn3.Visible = true;
            btn4.Visible = true;
            btn5.Visible = true;
            btn6.Visible = true;
            btn7.Visible = true;
            btn8.Visible = true;
        }
        if (totalPages == 9)
        {
            btn1.Visible = true;
            btn2.Visible = true;
            btn3.Visible = true;
            btn4.Visible = true;
            btn5.Visible = true;
            btn6.Visible = true;
            btn7.Visible = true;
            btn8.Visible = true;
            btn9.Visible = true;
        }
        if (totalPages == 10)
        {
            btn1.Visible = true;
            btn2.Visible = true;
            btn3.Visible = true;
            btn4.Visible = true;
            btn5.Visible = true;
            btn6.Visible = true;
            btn7.Visible = true;
            btn8.Visible = true;
            btn9.Visible = true;
            btn10.Visible = true;
        }

        if(index[0] != -1)
        {
            lbName1.Text = PName[index[0]];
            lbFormula1.Text = PFormula[index[0]];
            lbCategory1.Text = PCategory[index[0]];
            lbCompany1.Text = Company[index[0]];
            lbMFG1.Text = "MFG Date: " + MFGdate[index[0]];
            lbQuantity1.Text = "Quantity: " + Quantity[index[0]].ToString();
            lbEXP1.Text = "EXP Date: " + EXPdate[index[0]];
            lbRemaning1.Text = "Remaninig Days: " + RemaningDays[index[0]].ToString();
        }
        if(index[1] != -1)
        {
            lbName2.Text = PName[index[1]];
            lbFormula2.Text = PFormula[index[1]];
            lbCategory2.Text = PCategory[index[1]];
            lbCompany2.Text = Company[index[1]];
            lbMFG2.Text = "MFG Date: " + MFGdate[index[1]];
            lbQuantity2.Text = "Quantity: " + Quantity[index[1]].ToString();
            lbEXP2.Text = "EXP Date: " + EXPdate[index[1]];
            lbRemaning2.Text = "Remaninig Days: " + RemaningDays[index[1]].ToString();
        }
        if(index[2] != -1)
        {
            lbName3.Text = PName[index[2]];
            lbFormula3.Text = PFormula[index[2]];
            lbCategory3.Text = PCategory[index[2]];
            lbCompany3.Text = Company[index[2]];
            lbMFG3.Text = "MFG Date: " + MFGdate[index[2]];
            lbQuantity3.Text = "Quantity: " + Quantity[index[2]].ToString();
            lbEXP3.Text = "EXP Date: " + EXPdate[index[2]];
            lbRemaning3.Text = "Remaninig Days: " + RemaningDays[index[2]].ToString();
        }
        if(index[3] != -1)
        {
            lbName4.Text = PName[index[3]];
            lbFormula4.Text = PFormula[index[3]];
            lbCategory4.Text = PCategory[index[3]];
            lbCompany4.Text = Company[index[3]];
            lbMFG4.Text = "MFG Date: " + MFGdate[index[3]];
            lbQuantity4.Text = "Quantity: " + Quantity[index[3]].ToString();
            lbEXP4.Text = "EXP Date: " + EXPdate[index[3]];
            lbRemaning4.Text = "Remaninig Days: " + RemaningDays[index[3]].ToString();
        }
        if(index[4] != -1)
        {
            lbName5.Text = PName[index[4]];
            lbFormula5.Text = PFormula[index[4]];
            lbCategory5.Text = PCategory[index[4]];
            lbCompany5.Text = Company[index[4]];
            lbMFG5.Text = "MFG Date: " + MFGdate[index[4]];
            lbQuantity5.Text = "Quantity: " + Quantity[index[4]].ToString();
            lbEXP5.Text = "EXP Date: " + EXPdate[index[4]];
            lbRemaning5.Text = "Remaninig Days: " + RemaningDays[index[4]].ToString();
        }
        if(index[5] != -1)
        {
            lbName6.Text = PName[index[5]];
            lbFormula6.Text = PFormula[index[5]];
            lbCategory6.Text = PCategory[index[5]];
            lbCompany6.Text = Company[index[5]];
            lbMFG6.Text = "MFG Date: " + MFGdate[index[5]];
            lbQuantity6.Text = "Quantity: " + Quantity[index[5]].ToString();
            lbEXP6.Text = "EXP Date: " + EXPdate[index[5]];
            lbRemaning6.Text = "Remaninig Days: " + RemaningDays[index[5]].ToString();
        }
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session.Remove("Username");
        Session.Remove("Password");
        Session.RemoveAll();
        Response.Redirect("Main_Page.aspx");
    }

    protected void btn1_Click(object sender, EventArgs e)
    {
        if (index[0] != -1)
        {
            lbName1.Text = PName[index[0]];
            lbFormula1.Text = PFormula[index[0]];
            lbCategory1.Text = PCategory[index[0]];
            lbCompany1.Text = Company[index[0]];
            lbMFG1.Text = "MFG Date: " + MFGdate[index[0]];
            lbQuantity1.Text = "Quantity: " + Quantity[index[0]].ToString();
            lbEXP1.Text = "EXP Date: " + EXPdate[index[0]];
            lbRemaning1.Text = "Remaninig Days: " + RemaningDays[index[0]].ToString();
        }
        if (index[1] != -1)
        {
            lbName2.Text = PName[index[1]];
            lbFormula2.Text = PFormula[index[1]];
            lbCategory2.Text = PCategory[index[1]];
            lbCompany2.Text = Company[index[1]];
            lbMFG2.Text = "MFG Date: " + MFGdate[index[1]];
            lbQuantity2.Text = "Quantity: " + Quantity[index[1]].ToString();
            lbEXP2.Text = "EXP Date: " + EXPdate[index[1]];
            lbRemaning2.Text = "Remaninig Days: " + RemaningDays[index[1]].ToString();
        }
        if (index[2] != -1)
        {
            lbName3.Text = PName[index[2]];
            lbFormula3.Text = PFormula[index[2]];
            lbCategory3.Text = PCategory[index[2]];
            lbCompany3.Text = Company[index[2]];
            lbMFG3.Text = "MFG Date: " + MFGdate[index[2]];
            lbQuantity3.Text = "Quantity: " + Quantity[index[2]].ToString();
            lbEXP3.Text = "EXP Date: " + EXPdate[index[2]];
            lbRemaning3.Text = "Remaninig Days: " + RemaningDays[index[2]].ToString();
        }
        if (index[3] != -1)
        {
            lbName4.Text = PName[index[3]];
            lbFormula4.Text = PFormula[index[3]];
            lbCategory4.Text = PCategory[index[3]];
            lbCompany4.Text = Company[index[3]];
            lbMFG4.Text = "MFG Date: " + MFGdate[index[3]];
            lbQuantity4.Text = "Quantity: " + Quantity[index[3]].ToString();
            lbEXP4.Text = "EXP Date: " + EXPdate[index[3]];
            lbRemaning4.Text = "Remaninig Days: " + RemaningDays[index[3]].ToString();
        }
        if (index[4] != -1)
        {
            lbName5.Text = PName[index[4]];
            lbFormula5.Text = PFormula[index[4]];
            lbCategory5.Text = PCategory[index[4]];
            lbCompany5.Text = Company[index[4]];
            lbMFG5.Text = "MFG Date: " + MFGdate[index[4]];
            lbQuantity5.Text = "Quantity: " + Quantity[index[4]].ToString();
            lbEXP5.Text = "EXP Date: " + EXPdate[index[4]];
            lbRemaning5.Text = "Remaninig Days: " + RemaningDays[index[4]].ToString();
        }
        if (index[5] != -1)
        {
            lbName6.Text = PName[index[5]];
            lbFormula6.Text = PFormula[index[5]];
            lbCategory6.Text = PCategory[index[5]];
            lbCompany6.Text = Company[index[5]];
            lbMFG6.Text = "MFG Date: " + MFGdate[index[5]];
            lbQuantity6.Text = "Quantity: " + Quantity[index[5]].ToString();
            lbEXP6.Text = "EXP Date: " + EXPdate[index[5]];
            lbRemaning6.Text = "Remaninig Days: " + RemaningDays[index[5]].ToString();
        }
    }

    protected void btn2_Click(object sender, EventArgs e)
    {
        if (index[6] != -1)
        {
            lbName1.Text = PName[index[6]];
            lbFormula1.Text = PFormula[index[6]];
            lbCategory1.Text = PCategory[index[6]];
            lbCompany1.Text = Company[index[6]];
            lbMFG1.Text = "MFG Date: " + MFGdate[index[6]];
            lbQuantity1.Text = "Quantity: " + Quantity[index[6]].ToString();
            lbEXP1.Text = "EXP Date: " + EXPdate[index[6]];
            lbRemaning1.Text = "Remaninig Days: " + RemaningDays[index[6]].ToString();
        }
        if (index[7] != -1)
        {
            lbName2.Text = PName[index[7]];
            lbFormula2.Text = PFormula[index[7]];
            lbCategory2.Text = PCategory[index[7]];
            lbCompany2.Text = Company[index[7]];
            lbMFG2.Text = "MFG Date: " + MFGdate[index[7]];
            lbQuantity2.Text = "Quantity: " + Quantity[index[7]].ToString();
            lbEXP2.Text = "EXP Date: " + EXPdate[index[7]];
            lbRemaning2.Text = "Remaninig Days: " + RemaningDays[index[7]].ToString();
        }
        if (index[8] != -1)
        {
            lbName3.Text = PName[index[8]];
            lbFormula3.Text = PFormula[index[8]];
            lbCategory3.Text = PCategory[index[8]];
            lbCompany3.Text = Company[index[8]];
            lbMFG3.Text = "MFG Date: " + MFGdate[index[8]];
            lbQuantity3.Text = "Quantity: " + Quantity[index[8]].ToString();
            lbEXP3.Text = "EXP Date: " + EXPdate[index[8]];
            lbRemaning3.Text = "Remaninig Days: " + RemaningDays[index[8]].ToString();
        }
        if (index[9] != -1)
        {
            lbName4.Text = PName[index[9]];
            lbFormula4.Text = PFormula[index[9]];
            lbCategory4.Text = PCategory[index[9]];
            lbCompany4.Text = Company[index[9]];
            lbMFG4.Text = "MFG Date: " + MFGdate[index[9]];
            lbQuantity4.Text = "Quantity: " + Quantity[index[9]].ToString();
            lbEXP4.Text = "EXP Date: " + EXPdate[index[9]];
            lbRemaning4.Text = "Remaninig Days: " + RemaningDays[index[9]].ToString();
        }
        if (index[10] != -1)
        {
            lbName5.Text = PName[index[10]];
            lbFormula5.Text = PFormula[index[10]];
            lbCategory5.Text = PCategory[index[10]];
            lbCompany5.Text = Company[index[10]];
            lbMFG5.Text = "MFG Date: " + MFGdate[index[10]];
            lbQuantity5.Text = "Quantity: " + Quantity[index[10]].ToString();
            lbEXP5.Text = "EXP Date: " + EXPdate[index[10]];
            lbRemaning5.Text = "Remaninig Days: " + RemaningDays[index[10]].ToString();
        }
        if (index[11] != -1)
        {
            lbName6.Text = PName[index[11]];
            lbFormula6.Text = PFormula[index[11]];
            lbCategory6.Text = PCategory[index[11]];
            lbCompany6.Text = Company[index[11]];
            lbMFG6.Text = "MFG Date: " + MFGdate[index[11]];
            lbQuantity6.Text = "Quantity: " + Quantity[index[11]].ToString();
            lbEXP6.Text = "EXP Date: " + EXPdate[index[11]];
            lbRemaning6.Text = "Remaninig Days: " + RemaningDays[index[11]].ToString();
        }
    }

    protected void btn3_Click(object sender, EventArgs e)
    {
        if (index[12] != -1)
        {
            lbName1.Text = PName[index[12]];
            lbFormula1.Text = PFormula[index[12]];
            lbCategory1.Text = PCategory[index[12]];
            lbCompany1.Text = Company[index[12]];
            lbMFG1.Text = "MFG Date: " + MFGdate[index[12]];
            lbQuantity1.Text = "Quantity: " + Quantity[index[12]].ToString();
            lbEXP1.Text = "EXP Date: " + EXPdate[index[12]];
            lbRemaning1.Text = "Remaninig Days: " + RemaningDays[index[12]].ToString();
        }
        if (index[13] != -1)
        {
            lbName2.Text = PName[index[13]];
            lbFormula2.Text = PFormula[index[13]];
            lbCategory2.Text = PCategory[index[13]];
            lbCompany2.Text = Company[index[13]];
            lbMFG2.Text = "MFG Date: " + MFGdate[index[13]];
            lbQuantity2.Text = "Quantity: " + Quantity[index[13]].ToString();
            lbEXP2.Text = "EXP Date: " + EXPdate[index[13]];
            lbRemaning2.Text = "Remaninig Days: " + RemaningDays[index[13]].ToString();
        }
        if (index[14] != -1)
        {
            lbName3.Text = PName[index[14]];
            lbFormula3.Text = PFormula[index[14]];
            lbCategory3.Text = PCategory[index[14]];
            lbCompany3.Text = Company[index[14]];
            lbMFG3.Text = "MFG Date: " + MFGdate[index[14]];
            lbQuantity3.Text = "Quantity: " + Quantity[index[14]].ToString();
            lbEXP3.Text = "EXP Date: " + EXPdate[index[14]];
            lbRemaning3.Text = "Remaninig Days: " + RemaningDays[index[14]].ToString();
        }
        if (index[15] != -1)
        {
            lbName4.Text = PName[index[15]];
            lbFormula4.Text = PFormula[index[15]];
            lbCategory4.Text = PCategory[index[15]];
            lbCompany4.Text = Company[index[15]];
            lbMFG4.Text = "MFG Date: " + MFGdate[index[15]];
            lbQuantity4.Text = "Quantity: " + Quantity[index[15]].ToString();
            lbEXP4.Text = "EXP Date: " + EXPdate[index[15]];
            lbRemaning4.Text = "Remaninig Days: " + RemaningDays[index[15]].ToString();
        }
        if (index[16] != -1)
        {
            lbName5.Text = PName[index[16]];
            lbFormula5.Text = PFormula[index[16]];
            lbCategory5.Text = PCategory[index[16]];
            lbCompany5.Text = Company[index[16]];
            lbMFG5.Text = "MFG Date: " + MFGdate[index[16]];
            lbQuantity5.Text = "Quantity: " + Quantity[index[16]].ToString();
            lbEXP5.Text = "EXP Date: " + EXPdate[index[16]];
            lbRemaning5.Text = "Remaninig Days: " + RemaningDays[index[16]].ToString();
        }
        if (index[17] != -1)
        {
            lbName6.Text = PName[index[17]];
            lbFormula6.Text = PFormula[index[17]];
            lbCategory6.Text = PCategory[index[17]];
            lbCompany6.Text = Company[index[17]];
            lbMFG6.Text = "MFG Date: " + MFGdate[index[17]];
            lbQuantity6.Text = "Quantity: " + Quantity[index[17]].ToString();
            lbEXP6.Text = "EXP Date: " + EXPdate[index[17]];
            lbRemaning6.Text = "Remaninig Days: " + RemaningDays[index[17]].ToString();
        }
    }

    protected void btn4_Click(object sender, EventArgs e)
    {
        if (index[18] != -1)
        {
            lbName1.Text = PName[index[18]];
            lbFormula1.Text = PFormula[index[18]];
            lbCategory1.Text = PCategory[index[18]];
            lbCompany1.Text = Company[index[18]];
            lbMFG1.Text = "MFG Date: " + MFGdate[index[18]];
            lbQuantity1.Text = "Quantity: " + Quantity[index[18]].ToString();
            lbEXP1.Text = "EXP Date: " + EXPdate[index[18]];
            lbRemaning1.Text = "Remaninig Days: " + RemaningDays[index[18]].ToString();
        }
        if (index[19] != -1)
        {
            lbName2.Text = PName[index[19]];
            lbFormula2.Text = PFormula[index[19]];
            lbCategory2.Text = PCategory[index[19]];
            lbCompany2.Text = Company[index[19]];
            lbMFG2.Text = "MFG Date: " + MFGdate[index[19]];
            lbQuantity2.Text = "Quantity: " + Quantity[index[19]].ToString();
            lbEXP2.Text = "EXP Date: " + EXPdate[index[19]];
            lbRemaning2.Text = "Remaninig Days: " + RemaningDays[index[19]].ToString();
        }
        if (index[20] != -1)
        {
            lbName3.Text = PName[index[20]];
            lbFormula3.Text = PFormula[index[20]];
            lbCategory3.Text = PCategory[index[20]];
            lbCompany3.Text = Company[index[20]];
            lbMFG3.Text = "MFG Date: " + MFGdate[index[20]];
            lbQuantity3.Text = "Quantity: " + Quantity[index[20]].ToString();
            lbEXP3.Text = "EXP Date: " + EXPdate[index[20]];
            lbRemaning3.Text = "Remaninig Days: " + RemaningDays[index[20]].ToString();
        }
        if (index[21] != -1)
        {
            lbName4.Text = PName[index[21]];
            lbFormula4.Text = PFormula[index[21]];
            lbCategory4.Text = PCategory[index[21]];
            lbCompany4.Text = Company[index[21]];
            lbMFG4.Text = "MFG Date: " + MFGdate[index[21]];
            lbQuantity4.Text = "Quantity: " + Quantity[index[21]].ToString();
            lbEXP4.Text = "EXP Date: " + EXPdate[index[21]];
            lbRemaning4.Text = "Remaninig Days: " + RemaningDays[index[21]].ToString();
        }
        if (index[22] != -1)
        {
            lbName5.Text = PName[index[22]];
            lbFormula5.Text = PFormula[index[22]];
            lbCategory5.Text = PCategory[index[22]];
            lbCompany5.Text = Company[index[22]];
            lbMFG5.Text = "MFG Date: " + MFGdate[index[22]];
            lbQuantity5.Text = "Quantity: " + Quantity[index[22]].ToString();
            lbEXP5.Text = "EXP Date: " + EXPdate[index[22]];
            lbRemaning5.Text = "Remaninig Days: " + RemaningDays[index[22]].ToString();
        }
        if (index[23] != -1)
        {
            lbName6.Text = PName[index[23]];
            lbFormula6.Text = PFormula[index[23]];
            lbCategory6.Text = PCategory[index[23]];
            lbCompany6.Text = Company[index[23]];
            lbMFG6.Text = "MFG Date: " + MFGdate[index[23]];
            lbQuantity6.Text = "Quantity: " + Quantity[index[23]].ToString();
            lbEXP6.Text = "EXP Date: " + EXPdate[index[23]];
            lbRemaning6.Text = "Remaninig Days: " + RemaningDays[index[23]].ToString();
        }
    }

    protected void btn5_Click(object sender, EventArgs e)
    {
        if (index[24] != -1)
        {
            lbName1.Text = PName[index[24]];
            lbFormula1.Text = PFormula[index[24]];
            lbCategory1.Text = PCategory[index[24]];
            lbCompany1.Text = Company[index[24]];
            lbMFG1.Text = "MFG Date: " + MFGdate[index[24]];
            lbQuantity1.Text = "Quantity: " + Quantity[index[24]].ToString();
            lbEXP1.Text = "EXP Date: " + EXPdate[index[24]];
            lbRemaning1.Text = "Remaninig Days: " + RemaningDays[index[24]].ToString();
        }
        if (index[25] != -1)
        {
            lbName2.Text = PName[index[25]];
            lbFormula2.Text = PFormula[index[25]];
            lbCategory2.Text = PCategory[index[25]];
            lbCompany2.Text = Company[index[25]];
            lbMFG2.Text = "MFG Date: " + MFGdate[index[25]];
            lbQuantity2.Text = "Quantity: " + Quantity[index[25]].ToString();
            lbEXP2.Text = "EXP Date: " + EXPdate[index[25]];
            lbRemaning2.Text = "Remaninig Days: " + RemaningDays[index[25]].ToString();
        }
        if (index[26] != -1)
        {
            lbName3.Text = PName[index[26]];
            lbFormula3.Text = PFormula[index[26]];
            lbCategory3.Text = PCategory[index[26]];
            lbCompany3.Text = Company[index[26]];
            lbMFG3.Text = "MFG Date: " + MFGdate[index[26]];
            lbQuantity3.Text = "Quantity: " + Quantity[index[26]].ToString();
            lbEXP3.Text = "EXP Date: " + EXPdate[index[26]];
            lbRemaning3.Text = "Remaninig Days: " + RemaningDays[index[26]].ToString();
        }
        if (index[27] != -1)
        {
            lbName4.Text = PName[index[27]];
            lbFormula4.Text = PFormula[index[27]];
            lbCategory4.Text = PCategory[index[27]];
            lbCompany4.Text = Company[index[27]];
            lbMFG4.Text = "MFG Date: " + MFGdate[index[27]];
            lbQuantity4.Text = "Quantity: " + Quantity[index[27]].ToString();
            lbEXP4.Text = "EXP Date: " + EXPdate[index[27]];
            lbRemaning4.Text = "Remaninig Days: " + RemaningDays[index[27]].ToString();
        }
        if (index[28] != -1)
        {
            lbName5.Text = PName[index[28]];
            lbFormula5.Text = PFormula[index[28]];
            lbCategory5.Text = PCategory[index[28]];
            lbCompany5.Text = Company[index[28]];
            lbMFG5.Text = "MFG Date: " + MFGdate[index[28]];
            lbQuantity5.Text = "Quantity: " + Quantity[index[28]].ToString();
            lbEXP5.Text = "EXP Date: " + EXPdate[index[28]];
            lbRemaning5.Text = "Remaninig Days: " + RemaningDays[index[28]].ToString();
        }
        if (index[29] != -1)
        {
            lbName6.Text = PName[index[29]];
            lbFormula6.Text = PFormula[index[29]];
            lbCategory6.Text = PCategory[index[29]];
            lbCompany6.Text = Company[index[29]];
            lbMFG6.Text = "MFG Date: " + MFGdate[index[29]];
            lbQuantity6.Text = "Quantity: " + Quantity[index[29]].ToString();
            lbEXP6.Text = "EXP Date: " + EXPdate[index[29]];
            lbRemaning6.Text = "Remaninig Days: " + RemaningDays[index[29]].ToString();
        }
    }

    protected void btn6_Click(object sender, EventArgs e)
    {
        if (index[30] != -1)
        {
            lbName1.Text = PName[index[30]];
            lbFormula1.Text = PFormula[index[30]];
            lbCategory1.Text = PCategory[index[30]];
            lbCompany1.Text = Company[index[30]];
            lbMFG1.Text = "MFG Date: " + MFGdate[index[30]];
            lbQuantity1.Text = "Quantity: " + Quantity[index[30]].ToString();
            lbEXP1.Text = "EXP Date: " + EXPdate[index[30]];
            lbRemaning1.Text = "Remaninig Days: " + RemaningDays[index[30]].ToString();
        }
        if (index[31] != -1)
        {
            lbName2.Text = PName[index[31]];
            lbFormula2.Text = PFormula[index[31]];
            lbCategory2.Text = PCategory[index[31]];
            lbCompany2.Text = Company[index[31]];
            lbMFG2.Text = "MFG Date: " + MFGdate[index[31]];
            lbQuantity2.Text = "Quantity: " + Quantity[index[31]].ToString();
            lbEXP2.Text = "EXP Date: " + EXPdate[index[31]];
            lbRemaning2.Text = "Remaninig Days: " + RemaningDays[index[31]].ToString();
        }
        if (index[32] != -1)
        {
            lbName3.Text = PName[index[32]];
            lbFormula3.Text = PFormula[index[32]];
            lbCategory3.Text = PCategory[index[32]];
            lbCompany3.Text = Company[index[32]];
            lbMFG3.Text = "MFG Date: " + MFGdate[index[32]];
            lbQuantity3.Text = "Quantity: " + Quantity[index[32]].ToString();
            lbEXP3.Text = "EXP Date: " + EXPdate[index[32]];
            lbRemaning3.Text = "Remaninig Days: " + RemaningDays[index[32]].ToString();
        }
        if (index[33] != -1)
        {
            lbName4.Text = PName[index[33]];
            lbFormula4.Text = PFormula[index[33]];
            lbCategory4.Text = PCategory[index[33]];
            lbCompany4.Text = Company[index[33]];
            lbMFG4.Text = "MFG Date: " + MFGdate[index[33]];
            lbQuantity4.Text = "Quantity: " + Quantity[index[33]].ToString();
            lbEXP4.Text = "EXP Date: " + EXPdate[index[33]];
            lbRemaning4.Text = "Remaninig Days: " + RemaningDays[index[33]].ToString();
        }
        if (index[34] != -1)
        {
            lbName5.Text = PName[index[34]];
            lbFormula5.Text = PFormula[index[34]];
            lbCategory5.Text = PCategory[index[34]];
            lbCompany5.Text = Company[index[34]];
            lbMFG5.Text = "MFG Date: " + MFGdate[index[34]];
            lbQuantity5.Text = "Quantity: " + Quantity[index[34]].ToString();
            lbEXP5.Text = "EXP Date: " + EXPdate[index[34]];
            lbRemaning5.Text = "Remaninig Days: " + RemaningDays[index[34]].ToString();
        }
        if (index[35] != -1)
        {
            lbName6.Text = PName[index[35]];
            lbFormula6.Text = PFormula[index[35]];
            lbCategory6.Text = PCategory[index[35]];
            lbCompany6.Text = Company[index[35]];
            lbMFG6.Text = "MFG Date: " + MFGdate[index[35]];
            lbQuantity6.Text = "Quantity: " + Quantity[index[35]].ToString();
            lbEXP6.Text = "EXP Date: " + EXPdate[index[35]];
            lbRemaning6.Text = "Remaninig Days: " + RemaningDays[index[35]].ToString();
        }
    }

    protected void btn7_Click(object sender, EventArgs e)
    {
        if (index[36] != -1)
        {
            lbName1.Text = PName[index[36]];
            lbFormula1.Text = PFormula[index[36]];
            lbCategory1.Text = PCategory[index[36]];
            lbCompany1.Text = Company[index[36]];
            lbMFG1.Text = "MFG Date: " + MFGdate[index[36]];
            lbQuantity1.Text = "Quantity: " + Quantity[index[36]].ToString();
            lbEXP1.Text = "EXP Date: " + EXPdate[index[36]];
            lbRemaning1.Text = "Remaninig Days: " + RemaningDays[index[36]].ToString();
        }
        if (index[37] != -1)
        {
            lbName2.Text = PName[index[37]];
            lbFormula2.Text = PFormula[index[37]];
            lbCategory2.Text = PCategory[index[37]];
            lbCompany2.Text = Company[index[37]];
            lbMFG2.Text = "MFG Date: " + MFGdate[index[37]];
            lbQuantity2.Text = "Quantity: " + Quantity[index[37]].ToString();
            lbEXP2.Text = "EXP Date: " + EXPdate[index[37]];
            lbRemaning2.Text = "Remaninig Days: " + RemaningDays[index[37]].ToString();
        }
        if (index[38] != -1)
        {
            lbName3.Text = PName[index[38]];
            lbFormula3.Text = PFormula[index[38]];
            lbCategory3.Text = PCategory[index[38]];
            lbCompany3.Text = Company[index[38]];
            lbMFG3.Text = "MFG Date: " + MFGdate[index[38]];
            lbQuantity3.Text = "Quantity: " + Quantity[index[38]].ToString();
            lbEXP3.Text = "EXP Date: " + EXPdate[index[38]];
            lbRemaning3.Text = "Remaninig Days: " + RemaningDays[index[38]].ToString();
        }
        if (index[39] != -1)
        {
            lbName4.Text = PName[index[39]];
            lbFormula4.Text = PFormula[index[39]];
            lbCategory4.Text = PCategory[index[39]];
            lbCompany4.Text = Company[index[39]];
            lbMFG4.Text = "MFG Date: " + MFGdate[index[39]];
            lbQuantity4.Text = "Quantity: " + Quantity[index[39]].ToString();
            lbEXP4.Text = "EXP Date: " + EXPdate[index[39]];
            lbRemaning4.Text = "Remaninig Days: " + RemaningDays[index[39]].ToString();
        }
        if (index[40] != -1)
        {
            lbName5.Text = PName[index[40]];
            lbFormula5.Text = PFormula[index[40]];
            lbCategory5.Text = PCategory[index[40]];
            lbCompany5.Text = Company[index[40]];
            lbMFG5.Text = "MFG Date: " + MFGdate[index[40]];
            lbQuantity5.Text = "Quantity: " + Quantity[index[40]].ToString();
            lbEXP5.Text = "EXP Date: " + EXPdate[index[40]];
            lbRemaning5.Text = "Remaninig Days: " + RemaningDays[index[40]].ToString();
        }
        if (index[41] != -1)
        {
            lbName6.Text = PName[index[41]];
            lbFormula6.Text = PFormula[index[41]];
            lbCategory6.Text = PCategory[index[41]];
            lbCompany6.Text = Company[index[41]];
            lbMFG6.Text = "MFG Date: " + MFGdate[index[41]];
            lbQuantity6.Text = "Quantity: " + Quantity[index[41]].ToString();
            lbEXP6.Text = "EXP Date: " + EXPdate[index[41]];
            lbRemaning6.Text = "Remaninig Days: " + RemaningDays[index[41]].ToString();
        }
    }

    protected void btn8_Click(object sender, EventArgs e)
    {
        if (index[42] != -1)
        {
            lbName1.Text = PName[index[42]];
            lbFormula1.Text = PFormula[index[42]];
            lbCategory1.Text = PCategory[index[42]];
            lbCompany1.Text = Company[index[42]];
            lbMFG1.Text = "MFG Date: " + MFGdate[index[42]];
            lbQuantity1.Text = "Quantity: " + Quantity[index[42]].ToString();
            lbEXP1.Text = "EXP Date: " + EXPdate[index[42]];
            lbRemaning1.Text = "Remaninig Days: " + RemaningDays[index[42]].ToString();
        }
        if (index[43] != -1)
        {
            lbName2.Text = PName[index[43]];
            lbFormula2.Text = PFormula[index[43]];
            lbCategory2.Text = PCategory[index[43]];
            lbCompany2.Text = Company[index[43]];
            lbMFG2.Text = "MFG Date: " + MFGdate[index[43]];
            lbQuantity2.Text = "Quantity: " + Quantity[index[43]].ToString();
            lbEXP2.Text = "EXP Date: " + EXPdate[index[43]];
            lbRemaning2.Text = "Remaninig Days: " + RemaningDays[index[43]].ToString();
        }
        if (index[44] != -1)
        {
            lbName3.Text = PName[index[44]];
            lbFormula3.Text = PFormula[index[44]];
            lbCategory3.Text = PCategory[index[44]];
            lbCompany3.Text = Company[index[44]];
            lbMFG3.Text = "MFG Date: " + MFGdate[index[44]];
            lbQuantity3.Text = "Quantity: " + Quantity[index[44]].ToString();
            lbEXP3.Text = "EXP Date: " + EXPdate[index[44]];
            lbRemaning3.Text = "Remaninig Days: " + RemaningDays[index[44]].ToString();
        }
        if (index[45] != -1)
        {
            lbName4.Text = PName[index[45]];
            lbFormula4.Text = PFormula[index[45]];
            lbCategory4.Text = PCategory[index[45]];
            lbCompany4.Text = Company[index[45]];
            lbMFG4.Text = "MFG Date: " + MFGdate[index[45]];
            lbQuantity4.Text = "Quantity: " + Quantity[index[45]].ToString();
            lbEXP4.Text = "EXP Date: " + EXPdate[index[45]];
            lbRemaning4.Text = "Remaninig Days: " + RemaningDays[index[45]].ToString();
        }
        if (index[46] != -1)
        {
            lbName5.Text = PName[index[46]];
            lbFormula5.Text = PFormula[index[46]];
            lbCategory5.Text = PCategory[index[46]];
            lbCompany5.Text = Company[index[46]];
            lbMFG5.Text = "MFG Date: " + MFGdate[index[46]];
            lbQuantity5.Text = "Quantity: " + Quantity[index[46]].ToString();
            lbEXP5.Text = "EXP Date: " + EXPdate[index[46]];
            lbRemaning5.Text = "Remaninig Days: " + RemaningDays[index[46]].ToString();
        }
        if (index[47] != -1)
        {
            lbName6.Text = PName[index[47]];
            lbFormula6.Text = PFormula[index[47]];
            lbCategory6.Text = PCategory[index[47]];
            lbCompany6.Text = Company[index[47]];
            lbMFG6.Text = "MFG Date: " + MFGdate[index[47]];
            lbQuantity6.Text = "Quantity: " + Quantity[index[47]].ToString();
            lbEXP6.Text = "EXP Date: " + EXPdate[index[47]];
            lbRemaning6.Text = "Remaninig Days: " + RemaningDays[index[47]].ToString();
        }
    }

    protected void btn9_Click(object sender, EventArgs e)
    {
        if (index[48] != -1)
        {
            lbName1.Text = PName[index[48]];
            lbFormula1.Text = PFormula[index[48]];
            lbCategory1.Text = PCategory[index[48]];
            lbCompany1.Text = Company[index[48]];
            lbMFG1.Text = "MFG Date: " + MFGdate[index[48]];
            lbQuantity1.Text = "Quantity: " + Quantity[index[48]].ToString();
            lbEXP1.Text = "EXP Date: " + EXPdate[index[48]];
            lbRemaning1.Text = "Remaninig Days: " + RemaningDays[index[48]].ToString();
        }
        if (index[49] != -1)
        {
            lbName2.Text = PName[index[49]];
            lbFormula2.Text = PFormula[index[49]];
            lbCategory2.Text = PCategory[index[49]];
            lbCompany2.Text = Company[index[49]];
            lbMFG2.Text = "MFG Date: " + MFGdate[index[49]];
            lbQuantity2.Text = "Quantity: " + Quantity[index[49]].ToString();
            lbEXP2.Text = "EXP Date: " + EXPdate[index[49]];
            lbRemaning2.Text = "Remaninig Days: " + RemaningDays[index[49]].ToString();
        }
        if (index[50] != -1)
        {
            lbName3.Text = PName[index[50]];
            lbFormula3.Text = PFormula[index[50]];
            lbCategory3.Text = PCategory[index[50]];
            lbCompany3.Text = Company[index[50]];
            lbMFG3.Text = "MFG Date: " + MFGdate[index[50]];
            lbQuantity3.Text = "Quantity: " + Quantity[index[50]].ToString();
            lbEXP3.Text = "EXP Date: " + EXPdate[index[50]];
            lbRemaning3.Text = "Remaninig Days: " + RemaningDays[index[50]].ToString();
        }
        if (index[51] != -1)
        {
            lbName4.Text = PName[index[51]];
            lbFormula4.Text = PFormula[index[51]];
            lbCategory4.Text = PCategory[index[51]];
            lbCompany4.Text = Company[index[51]];
            lbMFG4.Text = "MFG Date: " + MFGdate[index[51]];
            lbQuantity4.Text = "Quantity: " + Quantity[index[51]].ToString();
            lbEXP4.Text = "EXP Date: " + EXPdate[index[51]];
            lbRemaning4.Text = "Remaninig Days: " + RemaningDays[index[51]].ToString();
        }
        if (index[52] != -1)
        {
            lbName5.Text = PName[index[52]];
            lbFormula5.Text = PFormula[index[52]];
            lbCategory5.Text = PCategory[index[52]];
            lbCompany5.Text = Company[index[52]];
            lbMFG5.Text = "MFG Date: " + MFGdate[index[52]];
            lbQuantity5.Text = "Quantity: " + Quantity[index[52]].ToString();
            lbEXP5.Text = "EXP Date: " + EXPdate[index[52]];
            lbRemaning5.Text = "Remaninig Days: " + RemaningDays[index[52]].ToString();
        }
        if (index[53] != -1)
        {
            lbName6.Text = PName[index[53]];
            lbFormula6.Text = PFormula[index[53]];
            lbCategory6.Text = PCategory[index[53]];
            lbCompany6.Text = Company[index[53]];
            lbMFG6.Text = "MFG Date: " + MFGdate[index[53]];
            lbQuantity6.Text = "Quantity: " + Quantity[index[53]].ToString();
            lbEXP6.Text = "EXP Date: " + EXPdate[index[53]];
            lbRemaning6.Text = "Remaninig Days: " + RemaningDays[index[53]].ToString();
        }
    }

    protected void btn10_Click(object sender, EventArgs e)
    {
        if (index[54] != -1)
        {
            lbName1.Text = PName[index[54]];
            lbFormula1.Text = PFormula[index[54]];
            lbCategory1.Text = PCategory[index[54]];
            lbCompany1.Text = Company[index[54]];
            lbMFG1.Text = "MFG Date: " + MFGdate[index[54]];
            lbQuantity1.Text = "Quantity: " + Quantity[index[54]].ToString();
            lbEXP1.Text = "EXP Date: " + EXPdate[index[54]];
            lbRemaning1.Text = "Remaninig Days: " + RemaningDays[index[54]].ToString();
        }
        if (index[55] != -1)
        {
            lbName2.Text = PName[index[55]];
            lbFormula2.Text = PFormula[index[55]];
            lbCategory2.Text = PCategory[index[55]];
            lbCompany2.Text = Company[index[55]];
            lbMFG2.Text = "MFG Date: " + MFGdate[index[55]];
            lbQuantity2.Text = "Quantity: " + Quantity[index[55]].ToString();
            lbEXP2.Text = "EXP Date: " + EXPdate[index[55]];
            lbRemaning2.Text = "Remaninig Days: " + RemaningDays[index[55]].ToString();
        }
        if (index[56] != -1)
        {
            lbName3.Text = PName[index[56]];
            lbFormula3.Text = PFormula[index[56]];
            lbCategory3.Text = PCategory[index[56]];
            lbCompany3.Text = Company[index[56]];
            lbMFG3.Text = "MFG Date: " + MFGdate[index[56]];
            lbQuantity3.Text = "Quantity: " + Quantity[index[56]].ToString();
            lbEXP3.Text = "EXP Date: " + EXPdate[index[56]];
            lbRemaning3.Text = "Remaninig Days: " + RemaningDays[index[56]].ToString();
        }
        if (index[57] != -1)
        {
            lbName4.Text = PName[index[57]];
            lbFormula4.Text = PFormula[index[57]];
            lbCategory4.Text = PCategory[index[57]];
            lbCompany4.Text = Company[index[57]];
            lbMFG4.Text = "MFG Date: " + MFGdate[index[57]];
            lbQuantity4.Text = "Quantity: " + Quantity[index[57]].ToString();
            lbEXP4.Text = "EXP Date: " + EXPdate[index[57]];
            lbRemaning4.Text = "Remaninig Days: " + RemaningDays[index[57]].ToString();
        }
        if (index[58] != -1)
        {
            lbName5.Text = PName[index[58]];
            lbFormula5.Text = PFormula[index[58]];
            lbCategory5.Text = PCategory[index[58]];
            lbCompany5.Text = Company[index[58]];
            lbMFG5.Text = "MFG Date: " + MFGdate[index[58]];
            lbQuantity5.Text = "Quantity: " + Quantity[index[58]].ToString();
            lbEXP5.Text = "EXP Date: " + EXPdate[index[58]];
            lbRemaning5.Text = "Remaninig Days: " + RemaningDays[index[58]].ToString();
        }
        if (index[59] != -1)
        {
            lbName6.Text = PName[index[59]];
            lbFormula6.Text = PFormula[index[59]];
            lbCategory6.Text = PCategory[index[59]];
            lbCompany6.Text = Company[index[59]];
            lbMFG6.Text = "MFG Date: " + MFGdate[index[59]];
            lbQuantity6.Text = "Quantity: " + Quantity[index[59]].ToString();
            lbEXP6.Text = "EXP Date: " + EXPdate[index[59]];
            lbRemaning6.Text = "Remaninig Days: " + RemaningDays[index[59]].ToString();
        }
    }
}