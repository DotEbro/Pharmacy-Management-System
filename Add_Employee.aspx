<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Employee.aspx.cs" Inherits="Add_Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manager</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;1,200&display=swap');
    </style>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;1,200&display=swap"/>
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css"/>
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/font-awesome-line-awesome/css/all.min.css"/>
    <style>
        .logo{
            margin-left: 60px;
            margin-top: 15px;
            width:230px;
            height:75px;
        }
        :root{
            --main-color: #dcbd29;
            --color-dark: #1d2231;
            --text-grey: #8390A2;
        }
        *{
            padding: 0;
            margin:0;
            box-sizing: border-box;
            list-style-type: none;
            text-decoration:none;
            font-family: 'Poppins', sans-serif;
        }
        .sidebar{
            transition: width 300ms; 
            width:345px;
            position: fixed;
            left:0;
            top:0;
            height: 100%;
            background: #5a5560;
            z-index: 100;
        }
        .sidebar-menu{
            margin-top: 2rem;
        }
        .sidebar-menu li{
            width: 100%;
            margin-bottom: 1.7rem;
            padding-left: 2rem;
        }
        .sidebar-menu a,
        .sidebar-menu .btnSignOut{
            padding-left: 1rem;
            display: block;
            color: #fff;
            font-size: 1.2rem;
        }
        .sidebar-menu a span:first-child,
        .btnSignOut span:first-child{
            font-size: 1.5rem;
            padding-right: 1rem;
        }
        .sidebar-menu a.active{
            background: #faed26;
            padding-top: 1rem;
            padding-bottom: 1rem;
            color: var(--color-dark);
            border-radius: 30px 0px 0px 30px;
        }
        .main-content{
            transition: margin-left 300ms;
            margin-left:345px;
        }
        header{
            display: flex;
            justify-content: space-between;
            padding: 1rem 1.5rem;
            box-shadow: 4px 4px 20px #a64ac9;
            position: fixed;
            left: 345px;
            width: calc(100% - 345px);
            top: 0;
            z-index:100;
            transition: left 300ms;
            background: #46344e;
        }
        header h2{
            color: #faed26;
        }
        header label span{
            font-size:1.7rem;
            padding-right: 1rem;
        }
        .search-wrapper{
            border: 1px solid #faed26;
            border-radius: 30px;
            height: 50px;
            display: flex;
            align-items: center;
            overflow-x: hidden;
            color: #faed26;
            background: #46344e;
        }
        .search-wrapper input{
            height: 100%;
            padding: .5rem;
            border: none;
            outline:none;
            color: #faed26;
            background: #46344e;
        }
        .search-wrapper span{
            color:#faed26;
            display: inline-block;
            padding: 0rem 1rem;
            font-size: 1.5rem;
        }
        .user-wrapper{
            color: #faed26;
            display: flex;
            align-items: center;
        }
        .user-wrapper img{
            border-radius:50%;
            margin-right:1rem;
        }
        .user-wrapper small{
            display: inline-block;
            color: #faed26;
        }
        main{
            margin-top: 85px;
            padding: 2rem 1.5rem;
            background: #d8c3a5;
            min-height: calc(100vh - 90px);
        }
        .cards{
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-gap: 2rem;
            margin-top: 1rem;
        }
        .card-single{
            display:flex;
            justify-content:space-between;
            background:#9d8d8f;
            padding: 2rem;
            border-radius: 10px;
        }
        .card-single div:last-child span{
            font-size: 3rem;
            color: #46344e;
        }
        .card-single div:first-child span{
            color: var(--color-dark);
        }
        .card-single:hover,
        .card-single:hover h1,
        .card-single:hover div small,
        .card-single:hover div span{
            color: var(--color-dark);
            Background: #faed26;
        }
        .container{
            color: var(--main-color);
            margin: 50px 70px;
            max-width: 900px;
            width: 100%;
            background: #46344e;
            padding: 25px 30px;
            border-radius:10px;
            box-shadow: 3px 5px 5px 5px rgba(0,0,0,0.5);
            
        }
        .container .title{
            text-align: center;
            font-size: 25px;
            font-weight: 500;
            margin-bottom: 5px;
            position:relative;
        }
        .container .title::before{
            content:'';
            position:absolute;
            left: 35%;
            bottom: 0;
            height: 3px;
            width:250px;
            background: var(--text-grey);
        }
        .container .user-details{
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        .user-details .input-box{
            margin-bottom: 15px;
            width: calc(100%/2 - 20px);
        }
        .user-details .input-box .span{
            font-weight: 500;
            margin-bottom: 5px;
            display: block;
        }
        .user-details .input-box .span:after{
            content:" *";
            color: red;
        }
        .user-details .input-box .input{
            height: 45px;
            width: 100%;
            outline: none;
            border-radius: 5px;
            border: 2px solid #ccc;
            padding-left: 15px;
            font-size: 16px;
            border-bottom-width: 2px;
        }
        .user-details .input-box .input:focus,
        .user-details .input-box .input:valid{
            border-color: var(--main-color);
        }
        .Btn{
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-end;
        }
        .container .BtnAdd,
        .container .BtnCancel{
            position: relative;
            height: 40px;
            width: 150px;
            font-size: 25px;
            background: var(--main-color);
            color: #fff;
            border: none;
            border-radius: 10px;
            margin: 0 7px;
        }
        .container .BtnAdd:hover,
        .container .BtnCancel:hover{
            background: var(--color-dark);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <input type="checkbox" id="nav-toggle" />
    <div class="sidebar">
        <div class="sidebar-brand">
            <img src="pic/Logo.png" class ="logo" />
        </div>
        <div class="sidebar-menu">
            <ul>
                <li>
                    <a href="Add_Employee.aspx" class="active"><span class="las la-user-plus"></span><span>Add Employee</span></a>
                </li>
                <li>
                    <a href="Show_Employees.aspx"><span class="las la-edit"></span><span>Update Employee</span></a>
                </li>
                <li>
                    <a href="Salaries.aspx"><span class="las la-wallet"></span><span>View Salaries</span></a>
                </li>
                <li>
                    <a href="Expire_Product.aspx"><span class="las la-radiation"></span><span>Close to expire</span></a>
                </li>
                <li>
                    <a href="Low_Stock.aspx"><span class="las la-download"></span><span>Low Stock</span></a>
                </li>
                <li>
                    <a href="My_Account.aspx"><span class="las la-user-circle"></span><span>My Account</span></a>
                </li>
                <li>
                    <asp:LinkButton ID="btn" CssClass ="" runat="server" Font-Names="Poppins" OnClick="btnSignOut_Click"><span class="las la-sign-out-alt"></span>Sign Out</asp:LinkButton>
                </li>
            </ul>
        </div>
        
    </div>
    <div class="main-content">
        <header>
            <h2>
                Add Employee
            </h2>
            <div class="search-wrapper">
                <span class="las la-search"></span>
                <input type="search" placeholder="Search here" />
            </div>

            <div class ="user-wrapper">
                <img src="pic/user.png" style="width:40px; height:40px;" alt="" />
                <div>
                    <asp:Label ID="userName" CssClass="small" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="status" CssClass="small" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </header>
        <main>
            <div class="cards">
                <div class="card-single">
                    <div>
                        <h1>54</h1>
                        <span>Customers</span>
                    </div>
                    <div>
                        <span class="las la-users"></span>
                    </div>
                </div>

                <div class="card-single">
                    <div>
                        <h1>78</h1>
                        <span>Projects</span>
                    </div>
                    <div>
                        <span class="las la-clipboard-list"></span>
                    </div>
                </div>

                <div class="card-single">
                    <div>
                        <h1>124</h1>
                        <span>Orders</span>
                    </div>
                    <div>
                        <span class="las la-shopping-bag"></span>
                    </div>
                </div>

                <div class="card-single">
                    <div>
                        <h1>$6K</h1>
                        <span>Income</span>
                    </div>
                    <div>
                        <span class="lab la-google-wallet"></span>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="title">Add Employee Form</div>
                <div class="user-details">
                    <div class="input-box">
                        <asp:Label ID="Label16" CssClass="span" runat="server" Text="Enter Employee ID"></asp:Label>
                        <asp:TextBox ID="txtid" type="text" CssClass="input" placeholder="Employee ID" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label" CssClass="span" runat="server" Text="First Name"></asp:Label>
                        <asp:TextBox ID="txtFName" type="text" CssClass="input" placeholder="Enter First Name" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label1" CssClass="span" runat="server" Text="Last Name"></asp:Label>
                        <asp:TextBox ID="txtLName" type="text" CssClass="input" placeholder="Enter Last Name" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label2" CssClass="span" runat="server" Text="CNIC"></asp:Label>
                        <asp:TextBox ID="txtCNIC" type="text" CssClass="input" placeholder="Enter CNIC" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label3" CssClass="span" runat="server" Text="Date of Birth"></asp:Label>
                        <asp:TextBox ID="txtDOB" type="text" CssClass="input" placeholder="DD-MM-YYYY" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label4" CssClass="span" runat="server" Text="Contact Number"></asp:Label>
                        <asp:TextBox ID="txtContact" type="text" CssClass="input" placeholder="Enter Contact Number" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label17" CssClass="span" runat="server" Text="Enter your Email"></asp:Label>
                        <asp:TextBox ID="txtemail" type="text" CssClass="input" placeholder="abc@email.com" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label15" CssClass="span" runat="server" Text="Select Gender"></asp:Label>
                        <asp:DropDownList ID="txtGender" type="text" CssClass="input" runat="server">
                            <asp:ListItem Value="">Select Gender</asp:ListItem>
                            <asp:ListItem >Male</asp:ListItem>
                            <asp:ListItem >Female</asp:ListItem>
                            <asp:ListItem >Others</asp:ListItem>
                            <asp:ListItem >Prefer not say</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label13" CssClass="span" runat="server" Text="Marital Status"></asp:Label>
                        <asp:DropDownList ID="txtMaritalStatus" type="text" CssClass="input" runat="server">
                            <asp:ListItem Value="">Marital Status</asp:ListItem>
                            <asp:ListItem >Single</asp:ListItem>
                            <asp:ListItem >Engage</asp:ListItem>
                            <asp:ListItem >Married</asp:ListItem>
                            <asp:ListItem >Divorce</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label14" CssClass="span" runat="server" Text="Religion"></asp:Label>
                        <asp:DropDownList ID="txtReligion" type="text" CssClass="input" runat="server">
                            <asp:ListItem Value="">Select Religion</asp:ListItem>
                            <asp:ListItem >Muslim</asp:ListItem>
                            <asp:ListItem >Chritian</asp:ListItem>
                            <asp:ListItem >Jew</asp:ListItem>
                            <asp:ListItem >Hindu</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label7" CssClass="span" runat="server" Text="Starting Date"></asp:Label>
                        <asp:TextBox ID="txtStartingDate" type="text" CssClass="input" placeholder="DD-MM-YYYY" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label6" CssClass="span" runat="server" Text="Highest Qualification"></asp:Label>
                        <asp:TextBox ID="txtqulification" type="text" CssClass="input" placeholder="Enter Qualification" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label5" CssClass="span" runat="server" Text="Address"></asp:Label>
                        <asp:TextBox ID="txtAddress" type="text" CssClass="input" placeholder="Enter Address" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label11" CssClass="span" runat="server" Text="User Name"></asp:Label>
                        <asp:TextBox ID="txtUserName" type="text" CssClass="input" placeholder="Enter User Name" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label12" CssClass="span" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="txtPassword" type="text" CssClass="input" placeholder="Enter Password" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label9" CssClass="span" runat="server" Text="Job Title"></asp:Label>
                        <asp:DropDownList ID ="txtJobTitle" type="text" CssClass="input" runat="server">
                            <asp:ListItem Value="">Job Title</asp:ListItem>
                            <asp:ListItem >Admin</asp:ListItem>
                            <asp:ListItem >Accountant</asp:ListItem>
                            <asp:ListItem >Pharmacist</asp:ListItem>
                            <asp:ListItem >Dlivery</asp:ListItem>
                        </asp:DropDownList>                        
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label8" CssClass="span" runat="server" Text="Salary"></asp:Label>
                        <asp:TextBox ID="txtSalary" type="text" CssClass="input" placeholder="Enter Salary" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label10" CssClass="span" runat="server" Text="Job Stuts"></asp:Label>
                        <asp:DropDownList ID="txtJobStatus" type="text" CssClass="input" runat="server">
                            <asp:ListItem Value="">Job Status</asp:ListItem>
                            <asp:ListItem >Working</asp:ListItem>
                            <asp:ListItem >Fired</asp:ListItem>
                            <asp:ListItem >On Leave</asp:ListItem>
                            <asp:ListItem >Sick</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                 </div>
                <div class="Btn">
                    <div>
                        <asp:Button ID="btnAddEmployee" CssClass="BtnAdd" runat="server" Text="Submit" OnClick="btnAddEmployee_Click" />
                    </div>
                    <div>
                        <asp:Button ID="btnCancel" CssClass="BtnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>
        </main>
    </div>
    </form>
</body>
</html>
