<%-- 
    Document   : create_Account
    Created on : Jul 31, 2022, 11:21:14 AM
    Author     : KISAKYE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
    </head>
    <div class="form_body">
            <div class="logo">
                <img src="./images/logo_no_BG.png" alt="logo">
            </div>
            <div class="form_details">
                <form method="post">
                    <h3>Create Account</h3>
                    <h3>First Name</h3>
                    <input type="text" name="fname" />
                    <h3>Last Name</h3>
                    <input type="text" name="lname" />
                    <h3>Email</h3>
                    <input type="text" name="email" />
                    <h3>Phone number</h3>
                    <input type="text" name="phoneNo" />
                    <h3>Password</h3>
                    <input type="password" name="password" placeholder="Password must be atleast 6 characters."/>
                    <h3>Re-enter password</h3>
                    <input type="text" name="rpassword" />
                    <br>
                    <hr>
                    <input type="submit" name="submit"  value="Create Account"/>
                    <h4>By creating an account you agree to Insignia's conditions of use and privacy Notice</h4>
                    <a href="">Need help?</a>
                </form>             
            </div>
           <h3>Already have an account</h3><a href="customer_login.jsp">
           <a href="customer_login.jsp"><button>Sign-In here ></button></a>            
            <div>
                footer here
            </div>
        </div>
    </body>
</html>
