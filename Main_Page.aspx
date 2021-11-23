<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main_Page.aspx.cs" Inherits="Main_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Pharmacy Management System Main_Page</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <style>

        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400&display=swap');

        :root{
            --blue: rgba(25, 124, 181);
            --dark-blue: rgba(18, 48, 130);
            --back: rgba(199, 131, 14);
        }

        *{
            font-family: 'Poppins', sans-serif;
            margin:0; padding:0;
            box-sizing: border-box;
            text-decoration: none;
            outline: none;
            border:none;
            text-transform: capitalize;
            transition: all .3s cubic-bezier(.38,1.15,.7,1.12);
        }

        *::selection{
            background:var(--dark-blue);
            color:#fff;
        }

        html{
            font-size: 62.5%;
            overflow-x: hidden;
        }

        section{
            min-height: 100vh;
            padding:1rem 9%;
            padding-top: 8rem;
        }

        .heading{
            text-align: center;
            color:var(--blue);
            font-size: 3.5rem;
            text-transform: uppercase;
            font-weight: normal;
            padding:1rem;
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
            font-size: 2.5rem;
            width:300px;
            height:80px;
            margin-left:50px;
            color:var(--dark-blue);
        }

        header .logo span{
            color:var(--blue);
        }

        header .navbar a{
            font-size: 2rem;
            font-weight: bold;
            margin-left: .7rem;
            padding:.5rem 2rem;
            border-radius: .5rem;
            color:var(--dark-blue);
        }

        header .navbar a.active,
        header .navbar a:hover{
            background: var(--blue);
            color:#fff;
            box-shadow: 0 .5rem 1rem rgba(0,0,0,.1);
        }

        header.sticky{
            background:#fff;
            box-shadow: 0 .5rem 1rem rgba(0,0,0,.1);
        }

        #menu{
            font-size: 3rem;
            color:var(--blue);
            cursor: pointer;
            display: none;
        }

        .home{
            background:url(pic/home-bg.jpg) no-repeat;
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .home .content{
            text-align: center;
            padding-top: 3rem;
        }

        .home .content h1{
            font-size: 5rem;
            color:var(--dark-blue);
        }

        .home .content h3{
            font-size: 4rem;
            color:var(--blue);
            font-weight: normal;
        }

        .home .content .btn{
            display: inline-block;
            padding:.7rem 3rem;
            color:#fff;
            background:var(--blue);
            border-radius: .5rem;
            box-shadow: 0 .5rem 1rem rgba(0,0,0,.1);
            margin-top: 1rem;
            font-size: 1.7rem;
        }

        .home .content .btn:hover{
            background:var(--dark-blue);
        }

        .prevent .box-container{
            display: flex;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
        }

        .prevent .box-container .box{
            flex:1 1 30rem;
            border-radius: .5rem;
            margin:1rem;
            padding:1rem;
            text-align: center;
        }

        .prevent .box-container .box img{
            height:12rem;
            padding:1rem;
        }

        .prevent .box-container .box h3{
            color:var(--blue);
            font-size: 2rem;
        }

        .prevent .box-container .box p{
            color:var(--dark-blue);
            font-size: 1.4rem;
            padding:1rem;
        }

        .prevent .box-container .box:hover{
            box-shadow: 0 .5rem 1rem rgba(0,0,0,.1);
        }

        .symptoms{
            background:url(pic/background-img.jpg) no-repeat;
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .symptoms .column{
            display: flex;
            padding: 1rem 1.5rem;
            justify-content: space-evenly;
        }
        .symptoms .column .main-image img{
            width: 500px;
            height: 570px;
        }
        .symptoms .column .box-container h3{
            margin-bottom: 50px;
            margin-top: 50px;
            text-align: center;
            font-size: 2rem;
            color:var(--dark-blue);
        }

        .symptoms .column .box-container p{
            font-size: 1.5rem;
            color: var(--blue);
            text-align: left;
        }

        .precautions .column{
            display: flex;
            justify-content: left;
            flex-wrap: wrap;
        }

        .precautions .column .first,
        .precautions .column .second{
            margin:1.5rem;
            flex:1 1 50rem;
            border:.1rem solid rgba(0,0,0,.1);
            box-shadow: 0 .5rem 1rem rgba(0,0,0,.1);
            border-radius: .5rem;
        }

        .precautions .column .first .title,
        .precautions .column .second .title{
            padding:1.5rem .5rem;
            text-align: center;
            font-size: 2.5rem;
            background-color: var(--dark-blue);
            color:#fff;
        }

        .precautions .column .first .box,
        .precautions .column .second .box{
            display: flex;
            justify-content: left;
            align-items: flex-start;
            padding:1rem;
        }

        .precautions .column .first .box img{
            margin-top:20px;
            float:left;
            width:7rem;
            padding-left:1.3rem;
            padding-right: 2rem;
        }

        .precautions .column .first .box h3{
            margin-top: 20px;
            font-size: 2rem;
            color:var(--blue);
        }
        .precautions .column .second .box h3{
            text-align: center;
            font-size: 2rem;
            color:var(--blue);
        }

        .precautions .column .first .box p,
        .precautions .column .first .box a{
            text-transform: none;
            font-size: 1.2rem;
            color:var(--dark-blue);
        }

        .doctor{
            background:url(../images/background-img.jpg) no-repeat;
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .doctor .box-container{
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
        }

        .doctor .box-container .box{
            border-radius: .5rem;
            box-shadow: 0 .5rem 1rem rgba(0,0,0,.1);
            padding:1rem;
            margin:1.5rem;
            text-align: center;
            background:#fff;
            border:.1rem solid rgba(0,0,0,.1);
            width:33rem;
        }

        .doctor .box-container .box img{
            margin:1rem;
            border-radius: 50%;
            height:20rem;
            width:20rem;
            object-fit: cover;
            background:var(--blue);
        }

        .doctor .box-container .box h3{
            font-size: 2rem;
            color:var(--blue);
        }

        .doctor .box-container .box span{
            font-size: 1.5rem;
            color:var(--dark-blue);
        }

        .doctor .box-container .box .share{
            border-top: .1rem solid rgba(0,0,0,.1);
            padding:1rem;
            margin-top: 1rem;
        }

        .doctor .box-container .box .share a{
            border-radius: 50%;
            height: 4.5rem;
            width:4.5rem;
            line-height: 4.5rem;
            font-size: 2rem;
            margin: .4rem;
            background:#eee;
            color:var(--blue);
        }

        .doctor .box-container .box .share a:hover{
            background:var(--blue);
            color:#fff;
            transform: rotate(360deg);
        }  

        .footer .credit{
            font-size: 2rem;
            font-weight: normal;
            text-align: center;
            border-top: .1rem solid rgba(0,0,0,.1);
            padding:2.5rem 1rem;
            color:var(--dark-blue);
        }

        .footer .credit a:hover{
            text-decoration: underline;
        }
        .footer .credit a{
            color:var(--blue);
        }

        .scroll-top{
            position: fixed;
            bottom:7.5rem; right:1.5rem;
            z-index: 1000;
        }

        .scroll-top img{
            width:8rem;
            animation: float 3s linear infinite;
        }

        .box-container a{
            color: var(--dark-blue);
            display:inline-block;
            text-decoration: none;
            font-weight: 400;
        }

        .underlineHover:after {
            display: block;
            left: 0;
            bottom: -10px;
            width: 0;
            height: 2px;
            content: "";
            transition: width 0.2s;
        }
  
        .underlineHover:hover {
            color: #ffffff;
            background-color: var(--blue);
            padding-left: 3px;
            padding-right: 3px;
            border-radius: 3px;
        }
        

        @keyframes float{
            100%, 0%{
                transform: translateY(0rem);
            }

            50%{
                transform: translateY(-3rem);
            }

        }

        /* media queries  */

        @media (max-width:1200px){

            html{
                font-size: 55%;
            }

        }

        @media (max-width:991px){

            section{
                padding:1rem 3%;
                padding-top: 8rem;
            }

            #menu{
                display: block;
            }

            header .navbar{
                position: absolute;
                top:100%; left: 0;
                width:100%;
                background:#fff;
                padding:2rem;
                border-top: .1rem  solid rgba(0,0,0,.1);
                transform-origin: top;
                transform: scaleY(0);
                opacity: 0;
            }

            header .navbar.nav-toggle{
                transform: scaleY(1);
                opacity: 1;
            }

            header .navbar a{
                display: block;
                margin:1.5rem 0;
                font-size: 2rem;
            }

            .fa-times{
                transform: rotate(180deg);
            }

            .symptoms .column .main-image img{
                display: none;
            }

            .hand-wash .column .main-image img{
                display: none;
            }

        }

        @media (max-width:768px){

            html{
                font-size: 50%;
            }

            .home .content h1{
                font-size: 4rem;
            }

            .home .content h3{
                font-size: 3.5rem;
            }

        }

        @media (max-width:450px){

            .home .content h1{
                font-size: 3.5rem;
            }

            .home .content h3{
                font-size: 2.5rem;
            }

            .symptoms .column .box-container .box img{
                width:14rem;
            }

            .precautions .column .box-container .box{
                flex-flow: column;
                text-align: center;
            }

            .doctor .box-container .box{
                width:100%;
            }

        }
    </style>

</head>
<body>
    <header>
        <img src="pic/Logo.png" class="logo" />
        <div id="menu" class="fas fa-bars"></div>
        <nav class="navbar">
            <a href="#Home">Home</a>
            <a href="#Product">Product</a>
            <a href="#Service">Service</a>
            <a href="#Contact">Contact Us</a>
            <a href="#Doctor">Doctor</a>
            <a href="Log In.aspx">Log In</a>
        </nav>
    </header>
    <section class="home" id="Home">

        <div class="content">
            <h1>Welcome to CareFare Pharmacy</h1>
            <h3>Serving with care</h3>
            <a href="Log In.aspx" class="btn">Log in Here</a>
        </div>

    </section>

    <section class="prevent" id="Product">

        <h1 class="heading"> The product we serve </h1>

        <div class="box-container">

            <div class="box">
                <img src="pic/med-1.png" alt=""/>
                <h3>Augmentin (Amoxicillin)</h3>
                <p>Augmentin is a prescription medicine used to treat the symptoms of many different infections caused by bacteria such as lower respiratory tract infections, chronic obstructive pulmonary disease, bacterial sinusitis, animal/human bite wounds, and skin infections. Augmentin may be used alone or with other medications.</p>
            </div>

            <div class="box">
                <img src="pic/med-2.png" alt=""/>
                <h3>Surbax-Z (Zinc, Vitamin E & C)</h3>
                <p>This product is a combination of B vitamins used to treat or prevent vitamin deficiency due to poor diet, certain illnesses, alcoholism, or during pregnancy. Vitamins are important building blocks of the body and help keep you in good health.</p>
            </div>

            <div class="box">
                <img src="pic/med-3.png" alt=""/>
                <h3>Arinac (Ibuprofen)</h3>
                <p>For the relief of the symptoms of cold and cold with associated congestion, including aches and pains, headache, fever, sore throat, runny or blocked nose and sinuses.</p>
            </div>

            <div class="box">
                <img src="pic/med-4.png" alt=""/>
                <h3>Loprin (Asprin)</h3>
                <p>Loprin 75mg Tablet is an antiplatelet medicine that contains acetylsalicylic acid (also known as aspirin). It is used to prevent blood clot formation within the body. This tablet is also used to prevent heart attacks, stroke and heart-related chest pain (angina).</p>
            </div>

            <div class="box">
                <img src="pic/med-5.png" alt=""/>
                <h3>Esso 40 (Esomeprazole)</h3>
                <p>Esso 40 esomeprazole is used to treat the symptoms of gastroesophageal reflux disease (GERD), a condition in which backward flow of acid from the stomach causes heartburn and possible injury of the esophagus (the tube between the throat and stomach) in adults and children 1 year of age and older.</p>
            </div>

            <div class="box">
                <img src="pic/med-6.png" alt=""/>
                <h3>Zeemox (Amoxicillin B.P)</h3>
                <p>Zeemox 500mg Capsule is used to treat a variety of bacterial infections. It is effective in infections of the throat, ear, nasal sinuses, respiratory tract (e.g., pneumonia), urinary tract, skin and soft tissue, and typhoid fever.</p>
            </div>

        </div>

    </section>


    <section class="symptoms" id="Service">

        <h1 class="heading">Our Service for Customer</h1>

        <div class="column">

            <div class="main-image">
                <img src="pic/side-service.png" alt=""/>
            </div>

            <div class="box-container">
            
                <div><h3>For Customer we offer number of service.</h3></div>
                <div><p>Our website is very descriptive, as you can see. We offer online/delivery to our customers. For the purchase of the product a customer should first sign up to our website if he or she does an account in our website, if customer have an account then he/she can <a href="Log In.aspx" class="underlineHover">Log in Here</a></p><br />
                    <p>This website is operated by CareFair. Throughout the site, the terms “we”, “us” and “our” refer to CareFair. CareFair offers this website, including all information, tools and services available from this site to you, the user, conditioned upon your acceptance of all terms, conditions, policies and notices stated here.</p><br />
                    <p>By visiting our site and/ or purchasing something from us, you engage in our “Service” and agree to be bound by the following terms and conditions (“Terms of Service”, “Terms”), including those additional terms and conditions and policies referenced herein and/or available by hyperlink. These Terms of Service apply to all users of the site, including without limitation users who are browsers, vendors, customers, merchants, and/ or contributors of content.</p><br />
                    <p>Please read these Terms of Service carefully before accessing or using our website. By accessing or using any part of the site, you agree to be bound by these Terms of Service. If you do not agree to all the terms and conditions of this agreement, then you may not access the website or use any services. If these Terms of Service are considered an offer, acceptance is expressly limited to these Terms of Service.</p><br />
                </div>

            </div>

        </div>

    </section>

    <!-- symptoms section ends -->

    <!-- precautions section starts  -->

    <section class="precautions" id="Contact">

        <h1 class="heading">Contact Us for More information</h1>

        <div class="column">

            <div class="first">

                <h3 class="title">our contact</h3>

                <div class="box">
                    <img src="pic/phone.png" alt=""/>
                    <div class="info">
                        <h3>Our contact numbers</h3>
                        <p>Admin: <a href="#" class="underlineHover">+92 301 3344532</a></p>
                        <p>salesperson: <a href="#" class="underlineHover">+92 321 4646589</a></p>
                        <p>Accountant: <a href="#" class="underlineHover">+92 344 6772400</a></p>
                        <p>HelpLine: <a href="#" class="underlineHover">+92 303 7875324</a></p>
                    </div>
                </div>

                <div class="box">
                    <img src="pic/email.png" alt=""/>
                    <div class="info">
                        <h3>our email</h3>
                        <p>Admin: <a href="#" class="underlineHover">admin@carefair.com</a></p>
                        <p>salesperson: <a href="#" class="underlineHover">salesperson@carefair.com</a></p>
                        <p>Accountant: <a href="#" class="underlineHover">accountant@carefir.com</a></p>
                        <p>HelpLine: <a href="#" class="underlineHover">helpline@carefair.com</a></p>
                    </div>
                </div>

                <div class="box">
                    <img src="pic/address.jpg" alt=""/>
                    <div class="info">
                        <h3>our pharmacy address</h3>
                        <p>Shinwari, Khuga Khel, Ashraf Khel, Landi Kotal Bazar, District Khyber, Khyber Pakhtoonkhwa, Pakistan</p>
                        <p>Zakha Khel, Wali Khel, Bari Khel, Landi Kotal Bazar, District Khyber, Khyber Pakhtoonkhwa, Pakistan</p>
                        <p>Shalman, Gongi Khel, Sheikhmal Khel, Landi Kotal Bazar, District Khyber, Khyber Pakhtoonkhwa, Pakistan</p>
                    </div>
                </div>

            </div>

            <div class="second">

                <h3 class="title">Our live location</h3>

                <div class="box">
                    <div class="info">
                        <h3>Visit us at our location.</h3>
                        <p><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d870185.8475261198!2d74.3476929!3d31.5745649!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39191b3297a3b9c5%3A0xca38a239b2a502a9!2sGarhi%20Shahu%2C%20Lahore%2C%20Punjab!5e0!3m2!1sen!2s!4v1633514837026!5m2!1sen!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe></p>
                    </div>
                </div>

            </div>

        </div>

    </section>

    <!-- precautions section ends -->

    <!-- doctor section start  -->

    <section class="doctor" id="Doctor">

        <h1 class="heading">consult to our doctors</h1>

        <div class="box-container">

            <div class="box">
                <img src="pic/doc1.png" alt=""/>
                <h3>Imran Khan</h3>
                <span>Neurologist</span>
                <div class="share">
                    <a href="#" class="fab fa-whatsapp"></a>
                    <a href="#" class="fab fa-facebook-f"></a>
                    <a href="#" class="fab fa-twitter"></a>
                    <a href="#" class="fab fa-instagram"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                </div>
            </div>

            <div class="box">
                <img src="pic/doc1.png" alt=""/>
                <h3>Balil Khan</h3>
                <span>Cardiologist</span>
                <div class="share">
                    <a href="#" class="fab fa-whatsapp"></a>
                    <a href="#" class="fab fa-facebook-f"></a>
                    <a href="#" class="fab fa-twitter"></a>
                    <a href="#" class="fab fa-instagram"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                </div>
            </div>

            <div class="box">
                <img src="pic/doc1.png" alt=""/>
                <h3>Shah Muhammad</h3>
                <span>ENT specialist</span>
                <div class="share">
                    <a href="#" class="fab fa-whatsapp"></a>
                    <a href="#" class="fab fa-facebook-f"></a>
                    <a href="#" class="fab fa-twitter"></a>
                    <a href="#" class="fab fa-instagram"></a>
                    <a href="#" class="fab fa-linkedin"></a>
                </div>
            </div>

        </div>

    </section>

    <!-- doctor section ends -->

    <!-- footer section starts  -->

    <div class="footer">

        <h1 class="credit"> Created by <a href="#">Abrar Khan Shinwari</a> &copy; copyright @ 2021 </h1>

    </div>
        <a href="#Home" class="scroll-top"/>
            <img src="pic/scroll-img.png" alt=""/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="js/script.js"></script>
</body>
</html>
