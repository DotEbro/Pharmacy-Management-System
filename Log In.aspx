<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Log In.aspx.cs" Inherits="Log_In" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Log In</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400&display=swap');
        :root{
            --blue: rgba(25, 124, 181);
            --dark-blue: rgba(18, 48, 130);
        }
        header{
            width:100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: fixed;
            top:0; left:0;
            z-index: 1000;
            padding:2rem;
        }

        header .logo{
            font-size: 2rem;
            width:300px;
            height:80px;
            margin-left:50px;
            color:var(--dark-blue);
        }

        header .logo span{
            color:var(--blue);
        }

        header .navbar a{
            font-size: 1.6rem;
            font-weight: bold;
            margin-right: 3rem;
            padding-left: .5rem;
            padding-right: .5rem;
            border-radius: .5rem;
            color:var(--dark-blue);
        }

        header .navbar a.active,
        header .navbar a:hover{
            background: var(--blue);
            color:#fff;
            box-shadow: 0 .5rem 1rem rgba(0,0,0,.1);
        }
  
        body {
          font-family: "Poppins", sans-serif;
          background-image: url('pic/background.png');
          background-repeat: no-repeat;
          background-position: center;
          background-size: cover;
          width:100%;
          height:100%
        }

        a {
          color: #92badd;
          display:inline-block;
          text-decoration: none;
          font-weight: 400;
        }

        h2 {
          text-align: center;
          font-size: 16px;
          font-weight: 600;
          text-transform: uppercase;
          display:inline-block;
          margin: 40px 8px 10px 8px; 
          color: #cccccc;
        }

        .wrapper {
          display: flex;
          align-items: center;
          flex-direction: column; 
          justify-content: center;
          width: 100%;
          min-height: 100%;
          padding-top: 150px;
        }

        #formContent {
          -webkit-border-radius: 10px 10px 10px 10px;
          border-radius: 10px 10px 10px 10px;
          background: #fff;
          padding: 30px;
          width: 90%;
          max-width: 450px;
          position: relative;
          padding: 0px;
          -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
          box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
          text-align: center;
        }

        #formFooter {
          background-color: #f6f6f6;
          border-top: 1px solid #dce8f1;
          padding: 25px;
          text-align: center;
          -webkit-border-radius: 0 0 10px 10px;
          border-radius: 0 0 10px 10px;
        }

        h2.inactive {
          color: #cccccc;
        }

        h2.active {
          color: #0d0d0d;
          border-bottom: 2px solid #5fbae9;
        }

        span{
            color: #b3afaf;
            float: right;
        }

        input[type=button], input[type=submit], input[type=reset]  {
          background-color: #56baed;
          border: none;
          color: white;
          padding: 15px 80px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          text-transform: uppercase;
          font-size: 13px;
          -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
          box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
          -webkit-border-radius: 5px 5px 5px 5px;
          border-radius: 5px 5px 5px 5px;
          margin: 5px 20px 40px 20px;
          -webkit-transition: all 0.3s ease-in-out;
          -moz-transition: all 0.3s ease-in-out;
          -ms-transition: all 0.3s ease-in-out;
          -o-transition: all 0.3s ease-in-out;
          transition: all 0.3s ease-in-out;
        }

        input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
          background-color: #39ace7;
        }

        input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
          -moz-transform: scale(0.95);
          -webkit-transform: scale(0.95);
          -o-transform: scale(0.95);
          -ms-transform: scale(0.95);
          transform: scale(0.95);
        }

        input[type=text], .text {
          background-color: #f6f6f6;
          border: none;
          color: #b3afaf;
          padding: 15px 32px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          font-size: 16px;
          margin: 5px;
          width: 75%;
          border: 2px solid #f6f6f6;
          -webkit-transition: all 0.5s ease-in-out;
          -moz-transition: all 0.5s ease-in-out;
          -ms-transition: all 0.5s ease-in-out;
          -o-transition: all 0.5s ease-in-out;
          transition: all 0.5s ease-in-out;
          -webkit-border-radius: 5px 5px 5px 5px;
          border-radius: 5px 5px 5px 5px;
        }

        input[type=text]:focus, 
        .text:focus{
          background-color: #fff;
          border-bottom: 2px solid #5fbae9;
        }

        input[type=text]::-webkit-input-placeholder,
        .text::-webkit-input-placeholder {
          color: #ccc;
        }

        .underlineHover:after {
            display: block;
            left: 0;
            bottom: -10px;
            width: 0;
            height: 2px;
            background-color: #56baed;
            content: "";
            transition: width 0.2s;
        }
  
        .underlineHover:hover {
            color: #0d0d0d;
        }
  
        .underlineHover:hover:after{
            width: 100%;
        }

        *:focus {
            outline: none;
        } 

        #icon {
          width:60%;
          padding:30px;
        }
        #formFooter p{
            color:grey
        }

    </style>
</head>
<body>
    <header>
        <img src="pic/Logo.png" class="logo" />
        <!--<a href="#" class="logo">c<span class="fas fa-virus"></span>vid-19</a>-->
        <nav class="navbar">
            <a href="Main_Page.aspx">Home</a>
            <a href="Main_Page.aspx">Product</a>
            <a href="Main_Page.aspx">Service</a>
            <a href="Main_Page.aspx">Contact Us</a>
            <a href="Main_Page.aspx">Doctor</a>
            <a href="Log In.aspx" class="active">Log In</a>
        </nav>
    </header>
    <main>
        <div class="wrapper fadeInDown">
          <div id="formContent">
            <!-- Tabs Titles -->

            <!-- Icon -->
            <div class="fadeIn first">
              <img src="pic/Logo.png" id="icon" alt="User Icon" />
            </div>

            <!-- Login Form -->
            <form runat="server">
                <asp:TextBox type="text" ID="login" placeholder="Username" runat="server"></asp:TextBox>
                <asp:TextBox CssClass="text" ID="password" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:Button type="submit" ID="submit" runat="server" Text="Submit" OnClick="submit_Click" />
          
            </form>

            <!-- Remind Passowrd -->
            <div id="formFooter">
              <a class="underlineHover" href="#">Forgot Password?</a>
            <br/>
                <p>Don't have an account? <a class="underlineHover" href="Sign_Up.aspx">Sign up</a></p>
            </div>
    

          </div>
        </div>
    </main>
</body>
</html>
