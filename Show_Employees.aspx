<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Show_Employees.aspx.cs" Inherits="Show_Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manager-Updation</title>
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
        * {
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
        .sidebar-menu a{
            padding-left: 1rem;
            display: block;
            color: #fff;
            font-size: 1.2rem;
        }
        .sidebar-menu a span:first-child{
            font-size: 1.5rem;
            padding-right: 1rem;
        }
        
        #nav-toggle:checked + .sidebar{
            width: 80px;
        }
        
        #nav-toggle:checked + .sidebar .logo,
        #nav-toggle:checked + .sidebar li a span:last-child{
            display: none;
        }
        .sidebar-menu a.active{
            background: #faed26;
            padding-top: 1rem;
            padding-bottom: 1rem;
            color: var(--color-dark);
            border-radius: 30px 0px 0px 30px;
        }
        
        #nav-toggle:checked ~ .main-content{
            margin-left: 80px;
        }
        #nav-toggle:checked ~ .main-content header{
            width: calc(100% - 80px);
            left: 80px;
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
            border:none;
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
        .user-wrapper stat{
            color:#faed26;
            display: inline-block;
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
        .gridView{
            color: #faed26;
            margin: 50px 70px;
            max-width: 1000px;
            width: 100%;
            background: #46344e;
            padding: 25px 30px;
            border-radius:10px;
            box-shadow: 3px 5px 5px 5px rgba(0,0,0,0.5);
            display:flex;
            justify-content:center;
            align-items:center;
            border-width: 2px;
        }
        .gridView table{
            border-width: 2px;
            border-color: #9b786f;
        }
        .gridView table > tbody > tr > td{
            justify-content: center;
            padding: 5px 15px;
            z-index: 3;
            background: #9d8d8f;
            color: #f7d719;
            cursor: default;   
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
                    <a href="Add_Employee.aspx"><span class="las la-user-plus"></span><span>Add Employee</span></a>
                </li>
                <li>
                    <a href="Update_Employee.aspx" class="active"><span class="las la-edit"></span><span>Update Employee</span></a>
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
                    <asp:LinkButton ID="btnSignOut" CssClass ="btnSignOut" runat="server" OnClick="btnSignOut_Click" Font-Names="Poppins"><span class="las la-sign-out-alt"></span>Sign Out</asp:LinkButton>
                </li>
            </ul>
        </div>
    </div>
    <div class="main-content">
        <header>
            <h2>
                Update Employee
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

            <div class="gridView">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="emp_id" HeaderText="Employee ID" SortExpression="emp_id" />
                        <asp:BoundField DataField="emp_FName" HeaderText="First Name" SortExpression="emp_FName" />
                        <asp:BoundField DataField="emp_LName" HeaderText="Last Name" SortExpression="emp_LName" />
                        <asp:BoundField DataField="emp_cnic" HeaderText="CNIC" SortExpression="emp_cnic" />
                        <asp:BoundField DataField="emp_contact" HeaderText="Contact" SortExpression="emp_contact" />
                        <asp:BoundField DataField="emp_gender" HeaderText="Gender" SortExpression="emp_gender" />
                        <asp:BoundField DataField="emp_address" HeaderText="Address" SortExpression="emp_address" />
                        <asp:BoundField DataField="emp_jobtitle" HeaderText="Jon Title" SortExpression="emp_jobtitle" />
                        <asp:HyperLinkField HeaderText="Edit" NavigateUrl="Update_Employee.aspx" Text="Edit" ControlStyle-ForeColor="#f7d719" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CareFareConnectionString %>" SelectCommand="SELECT [emp_id], [emp_FName], [emp_LName], [emp_cnic], [emp_contact], [emp_gender], [emp_address], [emp_jobtitle] FROM [Employee]"></asp:SqlDataSource>
            </div>
        </main>
    </div>
    </form>
</body>
</html>

