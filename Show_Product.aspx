<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Show_Product.aspx.cs" Inherits="Show_Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pharmacist</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;1,200&display=swap"/>
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css"/>
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/font-awesome-line-awesome/css/all.min.css"/>
    <style>
         @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;1,200&display=swap');
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
            --main-back: #aaabb8;
            --form-back: #25274d;
            --side-color: #463866;
            --card-color: #29648a;
            --hover-color: #2e9cca;
            --containter-text: #66fcf1;
        }
        *{
            padding: 0;
            margin:0;
            box-sizing: border-box;
            list-style-type: none;
            text-decoration: none;
            font-family: 'Poppins', sans-serif;
        }
        .sidebar{
            transition: width 300ms; 
            width:345px;
            position: fixed;
            left:0;
            top:0;
            height: 100%;
            background: var(--side-color);
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
            background: var(--hover-color);
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
            background: var(--form-back);
        }
        header h2{
            color: var(--hover-color);
        }
        header label span{
            font-size:1.7rem;
            padding-right: 1rem;
        }
        .search-wrapper{
            border: 1px solid var(--hover-color);
            border-radius: 30px;
            height: 50px;
            display: flex;
            align-items: center;
            overflow-x: hidden;
            color: var(--hover-color);
            background: var(--form-back);
        }
        .search-wrapper input{
            height: 100%;
            padding: .5rem;
            border: none;
            outline:none;
            color: var(--hover-color);
            background: var(--form-back);
        }
        .search-wrapper span{
            color: var(--hover-color);
            display: inline-block;
            padding: 0rem 1rem;
            font-size: 1.5rem;
        }
        .user-wrapper{
            color: var(--hover-color);
            display: flex;
            align-items: center;
        }
        .user-wrapper img{
            border-radius:50%;
            margin-right:1rem;
        }
        .user-wrapper small{
            display: inline-block;
            color: var(--hover-color);
        }
        main{
            margin-top: 85px;
            padding: 2rem 1.5rem;
            background: var(--main-back);
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
            background: var(--card-color);
            padding: 2rem;
            border-radius: 10px;
        }
        .card-single div:last-child span{
            font-size: 3rem;
            color: var(--hover-color);
        }
        .card-single div:first-child span{
            color: var(--color-dark);
        }
        .card-single:hover,
        .card-single:hover h1,
        .card-single:hover div small,
        .card-single:hover div span{
            color: var(--color-dark);
            Background: var(--hover-color);
        }
        main .gridView{
            margin: 40px 0px;
            max-width: 1500px;
            width: 100%;
            background: var(--form-back);
            padding: 25px 30px;
            border-radius:10px;
            box-shadow: 3px 5px 5px 5px rgba(0,0,0,0.5);
            display:flex;
            justify-content: center;
            align-items: center;
            border-width: 2px;
        }
        .gridView table{
            border-width: 2px;
            border-color: #9b786f;
        }
        .gridView table > tbody > tr > td{
            justify-content: center;
            text-align: center;
            padding: 5px 0;
            z-index: 3;
            background: none;
            color: #fff;
            cursor: default;   
        }
        .GridPager a, 
        .GridPager span{
            display: block;
            height: 23px;
            width: 23px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }
        .GridPager a{
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }
        .GridPager span{
            background-color: #A1DCF2;
            color: #000;
            border: 1px solid #3AC0F2;
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
                    <a href="Add_Employee.aspx"><span class="las la-user-plus"></span><span>Add Product</span></a>
                </li>
                <li>
                    <a href="Show_Product.aspx" class="active"><span class="las la-edit"></span><span>Update Product</span></a>
                </li>
                <li>
                    <a href="P_Expire_Product.aspx"><span class="las la-radiation"></span><span>Close to expire</span></a>
                </li>
                <li>
                    <a href="P_Low_Stock.aspx"><span class="las la-download"></span><span>Low Stock</span></a>
                </li>
                <li>
                    <a href="Ph_Account.aspx"><span class="las la-user-circle"></span><span>My Account</span></a>
                </li>
                <li>
                    <asp:LinkButton ID="btnSignOut" CssClass ="" runat="server" Font-Names="Poppins" OnClick="btnSignOut_Click"  ><span class="las la-sign-out-alt"></span>Sign Out</asp:LinkButton>
                </li>
            </ul>
        </div>
        
    </div>
    <div class="main-content">
        <header>
            <h2>
                Modify Product
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
               
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderColor="#25274d" BorderWidth="2px" DataSourceID="SqlDataSource1" PageSize="5">
                    <Columns>
                        <asp:BoundField DataField="P_id" HeaderText="Product ID" HeaderStyle-Width="150px" SortExpression="P_id" />
                        <asp:BoundField DataField="P_Name" HeaderText="Product Name" HeaderStyle-Width="150px"  SortExpression="P_Name" />
                        <asp:BoundField DataField="P_Formula" HeaderText="Product Formula" HeaderStyle-Width="150px"  SortExpression="P_Formula" />
                        <asp:BoundField DataField="P_Category" HeaderText="Product Category" HeaderStyle-Width="150px"  SortExpression="P_Category" />
                        <asp:BoundField DataField="P_Qmg" HeaderText="Quantity per Milli gram" HeaderStyle-Width="150px"  SortExpression="P_Qmg" />
                        <asp:BoundField DataField="P_MFGdate" HeaderText="Manufacturing Date" HeaderStyle-Width="150px"  SortExpression="P_MFGdate" />
                        <asp:BoundField DataField="P_EXPdate" HeaderText="Expire_Date" HeaderStyle-Width="150px"  SortExpression="P_EXPdate" />
                        <asp:BoundField DataField="P_Company" HeaderText="Company" HeaderStyle-Width="150px"  SortExpression="P_Company" />
                        <asp:BoundField DataField="P_Price" HeaderText="Price" HeaderStyle-Width="150px"  SortExpression="P_Price" />
                        <asp:BoundField DataField="P_Tax" HeaderText="Tax" HeaderStyle-Width="150px"  SortExpression="P_Tax" />
                        <asp:BoundField DataField="P_SalesPrice" HeaderText="SalesPrice" HeaderStyle-Width="150px"  SortExpression="P_SalesPrice" />
                        <asp:BoundField DataField="P_Quantity" HeaderText="Quantity" HeaderStyle-Width="150px"  SortExpression="P_Quantity" />
                        <asp:HyperLinkField HeaderText="Edit" NavigateUrl="Modify_Product.aspx" Text="Edit" HeaderStyle-Width="150px"  ControlStyle-ForeColor="#2E9CCA" />
                    </Columns>
                    <HeaderStyle BackColor="#2e9cca" BorderWidth="2px" BorderColor ="#463866"   />
                    <RowStyle BorderWidth="2px" BorderColor ="#463866" />
                    <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CareFareConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
               
            </div>
        </main>
    </div>
    </form>
</body>
</html>


