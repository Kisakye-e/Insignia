<%-- 
    Document   : customer_login
    Created on : Jul 31, 2022, 10:13:49 AM
    Author     : KISAKYE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insignia</title>
    </head>
    <body>
        <div class="form_body">
            <div class="logo">
                <img src="./images/logo_no_BG.png" alt="logo">
            </div>
            <div class="form_details">
                <form method="post">
                    <h3>Sign-In</h3>
                    <h3>Email or phone number</h3>
                    <input type="text" name="email" />
                    <h3>Password</h3>
                    <input type="password" name="password" />
                    <hr>
                    <br>
                    <input type="submit" name="submit" value="Sign-In"/>
                    <h4>By continuing you agree to Insignia's conditions of use and privacy Notice</h4>
                    <a href="">Need help?</a>
                </form>             
            </div>
            <h3>New to Insignia?</h3>
            <a href="create_Account.jsp"> <button>Create your Insignia Account</button> </a>
            <div>
                footer here
            </div>
        </div>
    </body>
</html>
