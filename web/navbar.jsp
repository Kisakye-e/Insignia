<%-- 
    Document   : navbar
    Created on : Jul 31, 2022, 8:03:11 PM
    Author     : KISAKYE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="reset_css.css" rel="stylesheet" >
        <link href="navbar.css" rel="stylesheet" >
        <!-- Font Awesome -->
        <link
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
        rel="stylesheet"
        />
        <!-- Google Fonts -->
        <link
        href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
        rel="stylesheet"
        />
        <!-- MDB -->
        <link
        href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css"
        rel="stylesheet"
        />
        <!-- MDB -->
        <script
        type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.js"
        ></script>
    </head>
    <body>
        <nav class="header">           
                <a href=""> <img class="header_logo" src="./images/logo_white_noBG.png" alt="logo"> </a>         
                <div class="input-group rounded">
                <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
                <span class="input-group-text border-0" id="search-addon">
                <i class="fas fa-search"></i>
                </span>
                </div>  
                <div class="header_nav">
                    <a href="customer_login.jsp" class="header_link">
                    <div class="header_option">
                    <span class="header_option_line1">Hello</span>
                    <span class="header_option_line2">Sign In</span>
                    </div>
                    </a>
                    <a href="" class="header_link">
                    <div class="header_option">
                    <span class="header_option_line1">Returns</span>
                    <span class="header_option_line2">&Orders</span>
                    </div>
                    </a>
                    <a href="checkout.jsp" class="header_link">
                    <div class="header_optionBasket">
                    <span class="header_option_line1">0</span>
                    <span class="header_option_line2"><i class="fa-solid fa-cart-shopping fa-3x"></i></span>
                    </div>
                    </a>                    
                </div>
                
                
        </nav>        
    </body>
</html>
 