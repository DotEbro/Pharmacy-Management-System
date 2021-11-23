<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Product.aspx.cs" Inherits="Add_Product" %>

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
        .container{
            color: var(--containter-text);
            margin: 50px 70px;
            max-width: 900px;
            width: 100%;
            background: var(--form-back);
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
            left: 40%;
            bottom: 0;
            height: 3px;
            width:170px;
            background: var(--text-grey);
        }
        .container .user-details{
            border: 3px solid var(--main-back);
            border-radius: 10px;
            padding: 25px 25px;
            margin-top: 30px;
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
            color: #fff;
            background: none;
            border: 2px solid #ccc;
            padding-left: 15px;
            font-size: 16px;
            border-bottom-width: 2px;
        }
        .user-details .input-box .input:focus,
        .user-details .input-box .input:valid{
            border-color: var(--main-back);
            background-color: none;
        }
        .user-details .input-box .description{
            height: 200px;
            width: calc(200% + 40px);
            outline: none;
            border-radius: 5px;
            color: #fff;
            background: none;
            border: 2px solid #ccc;
            padding-left: 15px;
            font-size: 16px;
            border-bottom-width: 2px;
        }
        .user-details .input-box .description:focus,
        .user-details .input-box .description:valid{
            border-color: var(--main-back);
            background-color: none;
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
            background: var(--side-color);
            color: #fff;
            border: none;
            border-radius: 10px;
            margin-top: 250px;
            margin-left: 7px;
        }
        .container .BtnAdd:hover,
        .container .BtnCancel:hover{
            background: var(--hover-color);
        }
        .container .input-box .input::placeholder,
        .container .input-box .description::placeholder{
            color: #fff;
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
                    <a href="Add_Employee.aspx" class="active"><span class="las la-user-plus"></span><span>Add Product</span></a>
                </li>
                <li>
                    <a href="Show_Product.aspx"><span class="las la-edit"></span><span>Update Product</span></a>
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
                    <asp:LinkButton ID="btnSignOut" CssClass ="" runat="server" Font-Names="Poppins" OnClick="btnSignOut_Click" ><span class="las la-sign-out-alt"></span>Sign Out</asp:LinkButton>
                </li>
            </ul>
        </div>
        
    </div>
    <div class="main-content">
        <header>
            <h2>
                Add Product
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
                <div class="title">Add Product</div>
                <div class="user-details">
                    <div class="input-box">
                        <asp:Label ID="Label16" CssClass="span" runat="server" Text="Enter Product ID"></asp:Label>
                        <asp:TextBox ID="txtPid" type="number" CssClass="input" placeholder="Product ID" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label" CssClass="span" runat="server" Text="Product Name"></asp:Label>
                        <asp:TextBox ID="txtPName" type="text" CssClass="input" placeholder="Enter Product Name" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label1" CssClass="span" runat="server" Text="Product Formula"></asp:Label>
                        <asp:TextBox ID="txtPFormula" type="text" CssClass="input" placeholder="Enter Product Formula" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label18" CssClass="span" runat="server" Text="Category"></asp:Label>
                        <asp:DropDownList ID="txtPCategory" type="text" CssClass="input" runat="server" BackColor="#25274d" ForeColor="#FFFFFF">
                            <asp:ListItem Value="">Category</asp:ListItem>
                            <asp:ListItem >Syrup</asp:ListItem>
                            <asp:ListItem >Tablet</asp:ListItem>
                            <asp:ListItem >Capsules</asp:ListItem>
                            <asp:ListItem >Cream</asp:ListItem>
                            <asp:ListItem >ointments</asp:ListItem>
                            <asp:ListItem >Drops</asp:ListItem>
                            <asp:ListItem >Inhaler</asp:ListItem>
                            <asp:ListItem >Injection</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label11" CssClass="span" runat="server" Text="Quantity Per Milli Gram"></asp:Label>
                        <asp:TextBox ID="txtQ_mg" type="number" CssClass="input" placeholder="Quantity/mg" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label3" CssClass="span" runat="server" Text="Manufacturing date"></asp:Label>
                        <asp:TextBox ID="txtMFGdate" type="text" CssClass="input" placeholder="DD-MM-YYYY" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label4" CssClass="span" runat="server" Text="Expire date"></asp:Label>
                        <asp:TextBox ID="txtEXPdate" type="text" CssClass="input" placeholder="DD-MM-YYYY" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label17" CssClass="span" runat="server" Text="Company Name"></asp:Label>
                        <asp:TextBox ID="txtCo" type="text" CssClass="input" placeholder="Company Name" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label7" CssClass="span" runat="server" Text="Price"></asp:Label>
                        <asp:TextBox ID="txtPrice" type="number" CssClass="input" placeholder="Product Price" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label6" CssClass="span" runat="server" Text="Tax"></asp:Label>
                        <asp:TextBox ID="txtTax" type="number" CssClass="input" placeholder="Product Tax" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label111" CssClass="span" runat="server" Text="Sales Price"></asp:Label>
                        <asp:TextBox ID="txtSalesPrice" type="number" CssClass="input" placeholder="Sales Price" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label5" CssClass="span" runat="server" Text="Quantity (In Box)"></asp:Label>
                        <asp:TextBox ID="txtQuantity" type="text" CssClass="input" placeholder="Enter Address" runat="server"></asp:TextBox>
                    </div>
                    <div class="input-box">
                        <asp:Label ID="Label12" CssClass="span" runat="server" Text="Description"></asp:Label>
                        <asp:TextBox ID="txtDesc" type="text" CssClass="description" runat="server" placeholder="Description" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="Btn">
                        <div>
                            <asp:Button ID="btnAddP" CssClass="BtnAdd" runat="server" Text="Add" OnClick="btnAddP_Click" />
                        </div>
                        <div>
                            <asp:Button ID="btnCancel" CssClass="BtnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    </form>
</body>
</html>

