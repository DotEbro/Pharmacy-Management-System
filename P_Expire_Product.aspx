<%@ Page Language="C#" AutoEventWireup="true" CodeFile="P_Expire_Product.aspx.cs" Inherits="P_Expire_Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Expiry Stock</title>
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
        .Input-Cards{
            margin: 40px 0px;
            max-width: 1200px;
            width: 100%;
            background: none;
        }
        .Input-Cards .Two-Card{
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 7rem;
            margin: 1rem 3rem;
            border-width: 5px;
            border-color: var(--hover-color);
            background: no-repeat;
            margin-top: 50px;
        }
        .Input-Cards .Two-Card .Single-card{
            border-radius:10px;
            box-shadow: 3px 5px 5px 5px rgba(0,0,0,0.5);
            border-width: 2px;
            width: 100%;
            height: 250px;
            font-size: 1rem;
            padding: 10px 30px;
            padding-top: 20px;
            color: var(--containter-text);
            background: var(--form-back);
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        .btn-div{
            padding-left: 3rem;
            
        }
        .btn{
            padding-left: 10px;
            font-size: 17px;
            background: none;
            color: var(--form-back);
            border: none;
        }
        .Red{
            color: yellow;
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
                    <a href="Show_Product.aspx" ><span class="las la-edit"></span><span>Update Product</span></a>
                </li>
                <li>
                    <a href="P_Expire_Product.aspx" class="active"><span class="las la-radiation"></span><span>Close to expiry</span></a>
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
                Close to Expiry
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
            
            <div class="Input-Cards">
                <div class="Two-Card">
                    <div class="Single-card">
                        <div>
                            <asp:Label ID="lbName1" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbFormula1" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbCategory1" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbCompany1" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbMFG1" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbQuantity1" runat="server" Text=""></asp:Label><br />
                        </div>
                        <div class="EXP-side">
                            <asp:Label ID="lbEXP1" CssClass="Red" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbRemaning1" CssClass="Red" runat="server" Text=""></asp:Label> <br />                       
                        </div>
                    </div>
                   <div class="Single-card">
                       <div>
                            <asp:Label ID="lbName2" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbFormula2" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbCategory2" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbCompany2" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbMFG2" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbQuantity2" runat="server" Text=""></asp:Label><br />
                        </div>
                        <div class="EXP-side">
                            <asp:Label ID="lbEXP2" CssClass="Red" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbRemaning2" CssClass="Red" runat="server" Text=""></asp:Label> <br />                       
                        </div>
                    </div>
                </div>
                <div class="Two-Card">
                    <div class="Single-card">
                        <div>
                            <asp:Label ID="lbName3" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbFormula3" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbCategory3" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbCompany3" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbMFG3" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbQuantity3" runat="server" Text=""></asp:Label><br />
                        </div>
                        <div class="EXP-side">
                            <asp:Label ID="lbEXP3" CssClass="Red" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbRemaning3" CssClass="Red" runat="server" Text=""></asp:Label> <br />                       
                        </div>
                    </div>
                    <div class="Single-card">
                        <div>
                            <asp:Label ID="lbName4" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbFormula4" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbCategory4" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbCompany4" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbMFG4" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbQuantity4" runat="server" Text=""></asp:Label><br />
                        </div>
                        <div class="EXP-side">
                            <asp:Label ID="lbEXP4" CssClass="Red" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbRemaning4" CssClass="Red" runat="server" Text=""></asp:Label> <br />                     
                        </div>
                    </div>
                </div>
                <div class="Two-Card">
                    <div class="Single-card">
                        <div>
                            <asp:Label ID="lbName5" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbFormula5" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbCategory5" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbCompany5" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbMFG5" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbQuantity5" runat="server" Text=""></asp:Label><br />
                        </div>
                        <div class="EXP-side">
                            <asp:Label ID="lbEXP5" CssClass="Red" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbRemaning5" CssClass="Red" runat="server" Text=""></asp:Label> <br />                       
                        </div>
                    </div>
                    <div class="Single-card">
                        <div>
                            <asp:Label ID="lbName6" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbFormula6" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbCategory6" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbCompany6" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbMFG6" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbQuantity6" runat="server" Text=""></asp:Label><br />
                        </div>
                        <div class="EXP-side">
                            <asp:Label ID="lbEXP6" CssClass="Red" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lbRemaning6" CssClass="Red" runat="server" Text=""></asp:Label> <br />                       
                        </div>
                    </div>
                </div>
            </div>
            <div class="btn-div">
                <asp:Button ID="btn1" runat="server" CssClass="btn" Text="1" Visible="false" OnClick="btn1_Click" />
                <asp:Button ID="btn2" runat="server" CssClass="btn" Text="2" Visible="false" OnClick="btn2_Click" />
                <asp:Button ID="btn3" runat="server" CssClass="btn" Text="3" Visible="false" OnClick="btn3_Click" />
                <asp:Button ID="btn4" runat="server" CssClass="btn" Text="4" Visible="false" OnClick="btn4_Click" />
                <asp:Button ID="btn5" runat="server" CssClass="btn" Text="5" Visible="false" OnClick="btn5_Click" />
                <asp:Button ID="btn6" runat="server" CssClass="btn" Text="6" Visible="false" OnClick="btn6_Click" />
                <asp:Button ID="btn7" runat="server" CssClass="btn" Text="7" Visible="false" OnClick="btn7_Click" />
                <asp:Button ID="btn8" runat="server" CssClass="btn" Text="8" Visible="false" OnClick="btn8_Click" />
                <asp:Button ID="btn9" runat="server" CssClass="btn" Text="9" Visible="false" OnClick="btn9_Click" />
                <asp:Button ID="btn10" runat="server" CssClass="btn" Text="10" Visible="false" OnClick="btn10_Click" />
            </div>
        </main>
    </div>
    </form>
</body>
</html>



