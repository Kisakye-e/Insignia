<%-- 
    Document   : newjsp
    Created on : Aug 5, 2022, 6:02:02 AM
    Author     : CONRAD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%!Integer ls[]={};%>
<%!String ps[]={};%>
<%ArrayList<Integer> likes=new ArrayList<Integer>(Arrays.asList(ls));%>
<%ArrayList<String> Product=new ArrayList<String>(Arrays.asList(ps));%>
<%!ResultSet res;%>

<%!Integer y[]={};%>
<%!String x[]={};%>
<%ArrayList<Integer> sales=new ArrayList<Integer>(Arrays.asList(y));%>
<%ArrayList<String> Products=new ArrayList<String>(Arrays.asList(x));%>
<%!ResultSet ress;%>

<%!Integer cs[]={};%>
<%!String ds[]={};%>
<%ArrayList<Integer> Customers=new ArrayList<Integer>(Arrays.asList(cs));%>
<%ArrayList<String> Dates=new ArrayList<String>(Arrays.asList(ds));%>
<%!ResultSet resc;%>

<%!Integer emp[]={};%>
<%!String pct[]={};%>
<%ArrayList<Integer> Employees=new ArrayList<Integer>(Arrays.asList(emp));%>
<%ArrayList<String> Products1=new ArrayList<String>(Arrays.asList(pct));%>
<%!ResultSet rest;%>

<%!Integer cID[]={};%>
<%!String fN[]={};%>
<%!String lN[]={};%>
<%!String uN[]={};%>
<%!String lcn[]={};%>
<%!String stat[]={};%>
<%!String rD[]={};%>
<%ArrayList<Integer> customerID=new ArrayList<Integer>(Arrays.asList(cID));%>
<%ArrayList<String> userName=new ArrayList<String>(Arrays.asList(uN));%>
<%ArrayList<String> firstName=new ArrayList<String>(Arrays.asList(fN));%>
<%ArrayList<String> lastName=new ArrayList<String>(Arrays.asList(lN));%>
<%ArrayList<String> location=new ArrayList<String>(Arrays.asList(lcn));%>
<%ArrayList<String> status=new ArrayList<String>(Arrays.asList(stat));%>
<%ArrayList<String> registrationDate=new ArrayList<String>(Arrays.asList(rD));%>
<%!ResultSet rs1;%>

<%!Integer sID[]={};%>
<%!String q[]={};%>
<%!String dt[]={};%>
<%!String pID[]={};%>
<%ArrayList<Integer> saleID=new ArrayList<Integer>(Arrays.asList(sID));%>
<%ArrayList<String> quantity=new ArrayList<String>(Arrays.asList(q));%>
<%ArrayList<String> datte=new ArrayList<String>(Arrays.asList(dt));%>
<%ArrayList<String> productIDD=new ArrayList<String>(Arrays.asList(pID));%>
<%!ResultSet rss;%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/grid.css"/>
        <style>
            h2{
            text-align:center;
            color: #176fad;
            }
            .tablle{
            align-content:center;
            margin-left: auto;
            margin-right: auto;
            }
            th{
                align-content:center;
                background-color: #32a852;
            }
        
            tr{
                background-color: #176fad;
            }
        </style>
        
    </head>
    <body>
        <h1 style="text-align:center; color: #176fad">Customer, Product And Staff Reports</h1>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/insigni", "root", "");
                    Statement st = conn.createStatement();
                    
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/insigni", "root", "");
                    Statement stt = con.createStatement();
                    //out.println("Connected!");
                    
                    //BAR CHART for product preferrences
                    String query="select * from preferences";
                    res=st.executeQuery(query);

                     while(res.next()){
                        Product.add("'"+res.getString("productID")+"'");
                        likes.add(res.getInt("Likes"));
                    }

                    //BAR CHART for product sales
                    ress=st.executeQuery("select * from sales");
                    
                    while(ress.next()){
                        Products.add("'"+ress.getString("productID")+"'");
                        sales.add(ress.getInt("quantity"));
                    }
                    //out.println(sales);

                    //Pie chart for staff on products
                    rest=st.executeQuery("select * from staff");
                    //out.println("Hi Mom");

                     while(rest.next()){
                        Products1.add("'"+rest.getString("productLineID")+"'");
                        Employees.add(rest.getInt("StaffTotal"));
                    }
                    
                    
                    //LINE CHART for customers per day WHERE DATE(date_column) BETWEEN '2022-08-01' AND '2022-08-31'
                    resc=st.executeQuery("SELECT * FROM `customer` ORDER BY `customer`.`date_of_signup` ASC ");
                    
                     while(resc.next()){
                        Dates.add("'"+resc.getString("date_of_signup")+"'");
                        Customers.add(resc.getInt("CustomerNo"));
                    }
                    
                    //Table for Sales
                     rss=stt.executeQuery("SELECT * FROM sales");

                     //table for customer registration
                     rs1=st.executeQuery("SELECT * FROM customer");

                      
            } catch (SQLException e) {
                    e.printStackTrace();
                }
            } catch(ClassNotFoundException e) {
                e.printStackTrace();
            }
        %>
        <div>
        <div class="main">
            <div class="charts" style="align-content:center ">
           
            <div class="chart">
                <div>
            <canvas id="bars"></canvas>
                </div>
            </div>
            
            <div class="chart">
                <div>
            <canvas id="lines"></canvas>
                </div>
            </div>
            
            <div class="chart">
                <div>
            <canvas id="clines"></canvas>
                </div>
            </div>
          
            <div class="chart">
                <div>
            <canvas id="circle"></canvas>
                </div>
            </div>
                <div class="tablle" style="text-align: center">
                <h2>Customer Records</h2>
                <table border="1" class="table table-dark" style="text-align: center">
                    <tr style="border-color: #2F4254">
                <th>Customer Id</th>
                <th>User Name</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Location</th>
                <th>Status</th>
                <th>Registration Date</th>
            </tr>
            <%
                while(rs1.next()){
                %>
                <tr>
                    <td><%=rs1.getInt("customerID")%></td>
                    <td><%=rs1.getString("userName")%></td>
                    <td><%=rs1.getString("firstName")%></td>
                    <td><%=rs1.getString("lastName")%></td>
                    <td><%=rs1.getString("location")%></td>
                    <td><%=rs1.getString("status")%></td>
                    <td><%=rs1.getString("date_of_signup")%></td>
                </tr>
            <%
                
            }
        %>
        </table>	
	</div>
        <div class="tablle" style="text-align: center">
                <h2>Sales Records</h2>
                <table border="1"class="table table-dark" style="text-align: center">
                    <tr style="border-color: #2F4254">
                <th>Sale Id</th>
                <th>Product ID</th>
                <th>Quantity</th>
                <th>Date</th>
            </tr>
            <%
                while(rss.next()){
                %>
                <tr>
                    <td><%=rss.getInt("saleID")%></td>
                    <td><%=rss.getString("productID")%></td>
                    <td><%=rss.getInt("quantity")%></td>
                    <td><%=rss.getString("dateBought")%></td>
                </tr>
            <%
                
            }
        %>
        </table>	
	</div>
        
	</div>
        </div>
        
        <script src="./js/chart.min.js"></script>
        
        <script>
    
var ctx = document.getElementById("bars").getContext("2d");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <%out.println(Product);%>,
        datasets: [{
            label: 'Product Preferences',
            data: <%out.println(likes);%>,
            backgroundColor: [
                'rgba(0,255,0)'

            ],
            borderColor: 'rgb(41, 155, 99)',
            borderWidth: 1
        }
        
    ]
    },
    options: {
        responsive: true,
        scales:{
        y:{
            title:{
                display:true,
                text:"Likes"
            }
        },
        x:{
            title:{
                display:true,
                text:"Products"
            }
        }
        }
    }
});


        </script>
        
        <script>
        var ctx1 = document.getElementById("lines").getContext("2d");
var myChart1 = new Chart(ctx1, {
    type: 'bar',
    data: {
        labels: <%out.println(Products);%>,
        datasets: [{
            label: 'Product Purchases',
            data: <%out.println(sales);%>,
            backgroundColor: [
                'rgba(0,255,0)'

            ],
            borderColor: 'rgb(41, 155, 99)',
            borderWidth: 1
        }
        
    ]
    },
    options: {
        responsive: true,
        scales:{
        y:{
            title:{
                display:true,
                text:"Sales"
            }
        },
        x:{
            title:{
                display:true,
                text:"Products"
            }
        }
        }
    }
});

        </script>
        
        <script>
    var ctx2 = document.getElementById('circle').getContext('2d');
    var myChart2 = new Chart(ctx2, {
    type: 'doughnut',
    data: {
        labels: <%out.println(Products1);%>,
        datasets: [{
                
            label: "Employees needed",
            data: <%out.println(Employees);%>,
            backgroundColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderWidth: 1
        }]

    },
    options: {
        responsive: true,
        indexAxis: 'y',
        "maintainAspectRatio": false
    }
});
</script>

  <script>
  var ctx3 = document.getElementById('clines').getContext('2d');
var myChart3 = new Chart(ctx3, {
    type: 'line',
    data: {
        labels: <%out.println(Dates);%>,

        datasets: [{
            label: 'Customer rates',
            data: <%out.println(Customers);%>,
            backgroundColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderWidth: 1
        }]

    },
    options: {
        responsive: true,
        scales:{
        y:{
            title:{
                display:true,
                text:"Customers"
            }
        },
        x:{
            title:{
                display:true,
                text:"Dates"
            }
        }
        }
    }
});
    </script>

    </div>
    </body>
</html>
