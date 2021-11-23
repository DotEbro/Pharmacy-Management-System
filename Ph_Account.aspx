<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ph_Account.aspx.cs" Inherits="Ph_Account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Account</title>
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
        .account-view{
            color: var(--containter-text);
            margin: 50px 70px;
            max-width: 900px;
            width: 100%;
            background: var(--form-back);
            padding: 25px 30px;
            border-radius:10px;
            box-shadow: 3px 5px 5px 5px rgba(0,0,0,0.5);
        }
        .account-view .Ename{
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }
        .Labels{
            padding-left: 20px;
            justify-content: center;
            text-align: center;
            font-size: 2rem;
        }
        .account-view img{
            border-radius: 50%;
            height: 100px;
            width: 100px;
        }
        .Epersonal, .EWorking, .Econtact{
            display: flex;
            flex-wrap: wrap;
            padding: 10px;
            justify-content: space-between;
            margin-bottom: 30px;
            border: 3px solid var(--main-back);
            border-radius: 5px;
        }
        .account-view .Epersonal .Einfo, 
        .account-view .EWorking .Einfo, 
        .account-view .Econtact .Einfo{
            font-size: 1.2rem;
            width: calc(100%/2 - 20px);
            margin: 8px 0;
            height: 40px;
            border-radius: 10px;
            background: none;
            color: var(--containter-text);
            padding: 5px 5px;
        }
        .Btn{
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-end;
        }
        .BtnEdit,
        .BtnSave,
        .BtnCancel{
            position: relative;
            height: 40px;
            width: 150px;
            font-size: 25px;
            background: var(--side-color);
            color: #fff;
            border: none;
            border-radius: 10px;
            margin: 0 7px;
        }
        .BtnEdit:hover,
        .BtnSave:hover,
        .BtnCancel:hover{
            background: var(--hover-color);
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
                    <a href="Add_Product.aspx"><span class="las la-user-plus"></span><span>Add Employee</span></a>
                </li>
                <li>
                    <a href="Show_Product.aspx"><span class="las la-edit"></span><span>Update Employee</span></a>
                </li>
                <li>
                    <a href="P_Expire_Product.aspx"><span class="las la-radiation"></span><span>Close to expire</span></a>
                </li>
                <li>
                    <a href="P_Low_Stock.aspx"><span class="las la-download"></span><span>Low Stock</span></a>
                </li>
                <li>
                    <a href="Ph_Account.aspx" class="active"><span class="las la-user-circle"></span><span>My Account</span></a>
                </li>
                <li>
                    <asp:LinkButton ID="btnSignOut" CssClass ="btnSignOut" runat="server" Font-Names="Poppins" OnClick="btnSignOut_Click"><span class="las la-sign-out-alt"></span>Sign Out</asp:LinkButton>
                </li>
            </ul>
        </div>
    </div>
    <div class="main-content">
        <header>
            <h2>
                <label for ="nav-toggle">
                    <span class="las la-bars"></span>
                </label>
                My account
            </h2>
            <div class="search-wrapper">
                <span class="las la-search"></span>
                <input type="search" placeholder="Search here" />
            </div>

            <div class ="user-wrapper">
                <img src="pic/user.png" style="width:40px; height:40px;" alt="" />
                <div>
                    <asp:Label ID="EName" CssClass="small" runat="server" Text=""></asp:Label><br />
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

            <div class="account-view">
                <div class="Ename">
                    <img src="pic/user.png" />
                    <div class="Labels">
                        <asp:Label ID="lblID" runat="server" Text="536546"></asp:Label><br />
                        <asp:Label ID="lblAcc" runat="server" Text="Abrar Khan"></asp:Label>
                    </div>
                </div>
                <asp:Label ID="Peronal" runat="server" Text="Personal Infomation"></asp:Label>
                <div class="Epersonal">
                    <asp:TextBox ID="FName" CssClass="Einfo" runat="server"></asp:TextBox>
                    <asp:TextBox ID="LName" CssClass="Einfo" runat="server"></asp:TextBox>
                    <asp:TextBox ID="CNIC" CssClass="Einfo" runat="server"></asp:TextBox>
                    <asp:TextBox ID="DOB" CssClass="Einfo" runat="server"></asp:TextBox>
                    <asp:DropDownList ID="Gender" CssClass="Einfo" runat="server">
                            <asp:ListItem Value="">Select Gender</asp:ListItem>
                            <asp:ListItem >Male</asp:ListItem>
                            <asp:ListItem >Female</asp:ListItem>
                            <asp:ListItem >Others</asp:ListItem>
                            <asp:ListItem >Prefer not say</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="Marital" CssClass="Einfo" runat="server" >
                            <asp:ListItem Value="">Marital Status</asp:ListItem>
                            <asp:ListItem >Single</asp:ListItem>
                            <asp:ListItem >Engage</asp:ListItem>
                            <asp:ListItem >Married</asp:ListItem>
                            <asp:ListItem >Divorce</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="Religion" CssClass="Einfo" runat="server">
                            <asp:ListItem Value="">Select Religion</asp:ListItem>
                            <asp:ListItem >Muslim</asp:ListItem>
                            <asp:ListItem >Chritian</asp:ListItem>
                            <asp:ListItem >Jew</asp:ListItem>
                            <asp:ListItem >Hindu</asp:ListItem>
                        </asp:DropDownList>
                </div>
                <asp:Label ID="Label1" runat="server" Text="Contact Infomation"></asp:Label>
                <div class="Econtact">
                    <asp:TextBox ID="Contact" CssClass="Einfo" runat="server"></asp:TextBox>
                    <asp:TextBox ID="Email" CssClass="Einfo" runat="server"></asp:TextBox>
                    <asp:TextBox ID="Address" CssClass="Einfo" runat="server"></asp:TextBox>
                </div>
                <asp:Label ID="Label2" runat="server" Text="Job Infomation"></asp:Label>
                <div class="EWorking">
                    <asp:TextBox ID="UserName" CssClass="Einfo" runat="server"></asp:TextBox>
                    <asp:TextBox ID="Password" CssClass="Einfo" runat="server"></asp:TextBox>
                    <asp:TextBox ID="StartDate" CssClass="Einfo" runat="server"></asp:TextBox>
                    <asp:TextBox ID="Salary" CssClass="Einfo" runat="server"></asp:TextBox>
                    <asp:TextBox ID="JobTitle" CssClass="Einfo" runat="server"></asp:TextBox>
                    <asp:TextBox ID="JobStatus" CssClass="Einfo" runat="server"></asp:TextBox>
                </div>
                <div class="Btn">
                <div>
                    <asp:Button ID="btnEidt" CssClass="BtnEdit" runat="server" Text="Edit" OnClick="btnEidt_Click"/>
                </div>
                <div>
                    <asp:Button ID="btnSave" CssClass="BtnSave" runat="server" Text="Save" OnClick="btnSave_Click"/>
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

