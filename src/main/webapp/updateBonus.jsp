<!doctype html>
<%@page import="com.ITP.Model.SalaryChanges"%>
<%@page import="com.ITP.Services.SalaryChangesServicesImpl"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <title>Hello, world!</title>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      .fullbody {
      	background-color: white;
      	height: 100%;
      	padding-bottom: 10px;
      }
    </style>
    <link rel="Stylesheet" href="./css/Admin.css">
    <link rel="stylesheet" href="./css/emp_attendence.css">
    <script src="./js/attendanceFormValidateion.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </head>
  <body>
    <h1>Hey Admin!</h1>
    
    
    <header class="site-header sticky-top py-1">
  <nav class="container d-flex flex-column flex-md-row justify-content-between">
    
    <a class="py-2 d-none d-md-inline-block" href="#">DashBoard</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Employees</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Customers</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Reservations</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Restaurant</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Events</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Promotions</a>
    <a class="py-2 d-none d-md-inline-block" href="#">Feedback</a>
  </nav>
</header>

        <br>
        <br>
        <!-- Rest of the page -->
        
        <%
        SalaryChanges SC = new SalaryChanges();
        //SC = (SalaryChanges)session.getAttribute("ChangeObject");
        SalaryChangesServicesImpl SCImpl = new SalaryChangesServicesImpl();
        SC = SCImpl.getSalaryChange(Integer.parseInt(request.getParameter("ChangeID")));
        %>
        

        <div class="content">
            <br>
                  <br>
                <div class="row bg-light border" style="padding: 25px; margin: 10px; width: 600px; margin: auto;">
                    <div class="col align-self-center">
                        <h4><u>Update Bonus/Deduction</u></h4>
                      </div>
                    <form action="UpdateSalaryAdjustmentsServlet" method="POST" class="row g-3">

                      <div class="col-mb-6">
                          <label for="fname" class="form-label">Adjustment Name<span>*</span></label>
                          <input class="form-control" id="fname" type="text" name="fname" value=<%=SC.getName()%> required/>
                      </div>
                      <div class="col-mb-6">
                        <label for="Department" class="form-label">Department<span>*</span></label>
                        <select name="Department" class="form-select">
                        <%if(SC.getChangeFor().equals("All")) { %>
                          <option value="House Keeping">House Keeping</option>
                          <option value="Restaurant">Restaurant</option>
                          <option value="Security">Restaurant</option>
                          <option value="All" selected>All</option>
                          <%} else if(SC.getChangeFor().equals("Restaurant")) { %>
                          <option value="House Keeping">House Keeping</option>
                          <option value="Restaurant" selected>Restaurant</option>
                          <option value="Security">Restaurant</option>
                          <option value="All">All</option>
                          <%} else if(SC.getChangeFor().equals("Security")) { %>
                          <option value="House Keeping">House Keeping</option>
                          <option value="Restaurant">Restaurant</option>
                          <option value="Security" selected>Security</option>
                          <option value="All">All</option>
                          <%} else { %>
                          <option value="House Keeping" selected>House Keeping</option>
                          <option value="Restaurant">Restaurant</option>
                          <option value="Security">Restaurant</option>
                          <option value="All">All</option>
                          <%} %>
                      </select>
                      </div>
                      <div class="col-mb-6">
                        <label for="Rate" class="form-label">Rate<span>*</span></label>
                        <input class="form-control" id="Rate" type="number" value=<%=SC.getRate() %> step="0.01"  min="0" max="100" name="Rate" required/>
                      </div>
                      <div class="col-mb-6">
                        <label for="Type"class="form-label">Type<span>*</span></label>
                        <select name="Type" class="form-select">
                        <%if(SC.getType().equals("bonus")) { %>
                          <option value="bonus" selected>Bonus</option>
                          <option value="deduction">Deduction</option>
                          <%} else { %>
                          <option value="bonus">Bonus</option>
                          <option value="deduction" selected>Deduction</option>
                          <% } %>
                      </select>  
                      </div>
                      <div class="col-mb-6">
                        <!-- <button type="submit">Submit</button> -->
                        <input type="hidden" value=<%=SC.getID() %> name="ChangeID">
                        <input type="submit" value="Submit" class="btn btn-secondary">
                      </div>
                    </form>
                  <div class="col-md-4">
    
                  </div>
                </div>
                
        		</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    -->
  </body>
</html>