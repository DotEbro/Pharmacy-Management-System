<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Expire_Product.aspx.cs" Inherits="Expire_Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manager-Expire</title>
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
            background: var(--main-color);
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
            background: #fff;
            padding-top: 1rem;
            padding-bottom: 1rem;
            color: var(--main-color);
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
            box-shadow: 4px 4px 10px rgba(0,0,0,0.2);
            position: fixed;
            left: 345px;
            width: calc(100% - 345px);
            top: 0;
            z-index:100;
            transition: left 300ms;
        }
        #nav-toggle{
            display: none;
        }
        header h2{
            color: #222;
        }
        header label span{
            font-size:1.7rem;
            padding-right: 1rem;
        }
        .search-wrapper{
            border: 1px solid #ccc;
            border-radius: 30px;
            height: 50px;
            display: flex;
            align-items: center;
            overflow-x: hidden;
        }
        .search-wrapper input{
            height: 100%;
            padding: .5rem;
            border:none;
            outline:none;
        }
        .search-wrapper span{
            display: inline-block;
            padding: 0rem 1rem;
            font-size: 1.5rem;
        }
        .user-wrapper{
            display: flex;
            align-items: center;
        }
        .user-wrapper img{
            border-radius:50%;
            margin-right:1rem;
        }
        .user-wrapper stat{
            display: inline-block;
            color: var(--text-grey);
        }
        main{
            margin-top: 85px;
            padding: 2rem 1.5rem;
            background: #f1f5f9;
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
            background:#fff;
            padding: 2rem;
            border-radius: 10px;
        }
        .card-single div:last-child span{
            font-size: 3rem;
            color: var(--main-color);
        }
        .card-single div:first-child span{
            color: var(--text-grey);
        }
        .card-single:hover,
        .card-single:hover h1,
        .card-single:hover div small,
        .card-single:hover div span{
            color: var(--color-dark);
            Background:var(--main-color);
        }
        .recent-grid{
            margin-top: 3.5rem;
            display: grid;
            grid-template-columns: 65% auto;
            grid-gap: 2rem;
        }
        .card{
            background: #fff;
            border-radius:5px;
        }
        .card-header{
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem;
        }
        .card-header button{
            background: var(--main-color);
            border-radius: 10px;
            color: #fff;
            font-size:.8rem;
            padding: .5rem 1rem;
            border: 1px solid var(--main-color);
        }
        table{
            border-collapse: collapse;
        }
        thead tr{
            border-top: 1px solid #f0f0f0;
            border-bottom:1px solid #f0f0f0; 
        }
        thead td{
            font-weight:700;
        }
        td{
            padding: .5rem 1rem;
            font-size:.9rem;
            color: #222;
        }
        td .status{
            display: inline-block;
            height: 10px;
            width: 10px;
            border-radius: 50%;
        }
        tr td:last-child{
            display: flex;
            align-items:center;
        }
        .status.purple{
            background: rebeccapurple;
        }
        .status.pink{
            background: deeppink;
        }
        .status.orange{
            background: orangered;
        }
        .table-rensposive{
            width: 100%;
            overflow-x: auto;
        }
        .customer{
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: .5rem 1rem;
        }
        .info{
            display: flex;
            align-items:center;
        }
        .info img{
            border-radius: 50%;
            margin-right: 1rem;
        }
        .info h4{
            font-size: .8rem;
            font-weight: 700;
            color: #222;
        }
        .info small{
            font-weight: 600;
            color: var(--text-grey);
        }
        .contact span{
            font-size: 1.2rem;
            display: inline-block;
            margin-left:1.25rem;
            color: var(--main-color);
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
                    <a href="Show_Employees.aspx"><span class="las la-edit"></span><span>Update Employee</span></a>
                </li>
                <li>
                    <a href="Salaries.aspx"><span class="las la-wallet"></span><span>View Salaries</span></a>
                </li>
                <li>
                    <a href="Expire_Product.aspx" class="active"><span class="las la-radiation"></span><span>Close to expire</span></a>
                </li>
                <li>
                    <a href="Low_Stock.aspx"><span class="las la-download"></span><span>Low Stock</span></a>
                </li>
                <li>
                    <a href="My_Account.aspx"><span class="las la-user-circle"></span><span>My Account</span></a>
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
                View Product close to Expire
            </h2>
            <div class="search-wrapper">
                <span class="las la-search"></span>
                <input type="search" placeholder="Search here" />
            </div>

            <div class ="user-wrapper">
                <img src="pic/user.png" style="width:40px; height:40px;" alt="" />
                <div>
                    <h4>Abrar Khan</h4>
                    <small>Super admin</small>
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

            <div class="recent-grid">
                <div class="projects">
                    <div class="card">
                        <div class="card-header">
                            <h3>Receent Projects</h3>
                            <button>See all<span class="las la-arrow-right"></span></button>
                        </div>
                        <div class="card-body">
                            <div class ="table-rensposive">
                                <table width ="100% ">
                                    <thead>
                                        <tr>
                                            <td>Project Title</td>
                                            <td>Department</td>
                                            <td>Status</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>UI/UX Design</td>
                                            <td>UI Team</td>
                                            <td>
                                                <span class="status purple"></span>
                                                Review
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Web Development</td>
                                            <td>Frontend</td>
                                            <td>
                                                <span class="status pink"></span>
                                                In progress
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ushop app</td>
                                            <td>Mobile Team</td>
                                            <td>
                                                <span class="status orange"></span>
                                                Pending
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>UI/UX Design</td>
                                            <td>UI Team</td>
                                            <td>
                                                <span class="status purple"></span>
                                                Review
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Web Development</td>
                                            <td>Frontend</td>
                                            <td>
                                                <span class="status pink"></span>
                                                In progress
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ushop app</td>
                                            <td>Mobile Team</td>
                                            <td>
                                                <span class="status orange"></span>
                                                Pending
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>UI/UX Design</td>
                                            <td>UI Team</td>
                                            <td>
                                                <span class="status purple"></span>
                                                Review
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Web Development</td>
                                            <td>Frontend</td>
                                            <td>
                                                <span class="status pink"></span>
                                                In progress
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Ushop app</td>
                                            <td>Mobile Team</td>
                                            <td>
                                                <span class="status orange"></span>
                                                Pending
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class ="customers">
                    <div class="card">
                        <div class="card-header">
                            <h3>New Customer</h3>
                            <button>See all<span class="las la-arrow-right"></span></button>
                        </div>
                        <div class="card-body">
                            <div class="customer">
                                <div class="info"><img src="pic/csut.png" style="width:40px; height:40px;" alt=""/>
                                    <div>
                                        <h4>Abrar Khan Shinwari</h4>
                                        <small>CEO Excerpt</small>
                                    </div>
                                    <div class="contact">
                                        <span class="las la-user-circle"></span>
                                        <span class="las la-comment"></span>
                                        <span class="las la-phone"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="customer">
                                <div class="info"><img src="pic/csut.png" style="width:40px; height:40px;" alt=""/>
                                    <div>
                                        <h4>Abrar Khan Shinwari</h4>
                                        <small>CEO Excerpt</small>
                                    </div>
                                    <div class="contact">
                                        <span class="las la-user-circle"></span>
                                        <span class="las la-comment"></span>
                                        <span class="las la-phone"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="customer">
                                <div class="info"><img src="pic/csut.png" style="width:40px; height:40px;" alt=""/>
                                    <div>
                                        <h4>Abrar Khan Shinwari</h4>
                                        <small>CEO Excerpt</small>
                                    </div>
                                    <div class="contact">
                                        <span class="las la-user-circle"></span>
                                        <span class="las la-comment"></span>
                                        <span class="las la-phone"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="customer">
                                <div class="info"><img src="pic/csut.png" style="width:40px; height:40px;" alt=""/>
                                    <div>
                                        <h4>Abrar Khan Shinwari</h4>
                                        <small>CEO Excerpt</small>
                                    </div>
                                    <div class="contact">
                                        <span class="las la-user-circle"></span>
                                        <span class="las la-comment"></span>
                                        <span class="las la-phone"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="customer">
                                <div class="info"><img src="pic/csut.png" style="width:40px; height:40px;" alt=""/>
                                    <div>
                                        <h4>Abrar Khan Shinwari</h4>
                                        <small>CEO Excerpt</small>
                                    </div>
                                    <div class="contact">
                                        <span class="las la-user-circle"></span>
                                        <span class="las la-comment"></span>
                                        <span class="las la-phone"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    </form>
</body>
</html>
