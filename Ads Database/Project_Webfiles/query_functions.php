<?php

  // Subjects

  function find_customer_past_year() {
    global $db;


    $sql = "SELECT CUSTOMER.fname, CUSTOMER.lname, CUSTOMER.Company, CUSTOMER.Address, SUM(ORDERS.Cost) AS Total_spend ";
    $sql .= "FROM CUSTOMER INNER JOIN ORDERS ON CUSTOMER.Customer_id = ORDERS.Customer_id ";
    $sql .= "WHERE YEAR(ORDERS.Date_purchased) = (YEAR(current_date) - 1) ";
    $sql .= "GROUP BY ORDERS.Customer_id;";
  
    $result = mysqli_query($db, $sql);
    confirm_result_set($result);
    return $result;
  }

  function customer_purchased_mass_market_via_email() {
    global $db;
      $sql = "SELECT DISTINCT CUSTOMER.fname, CUSTOMER.lname "; 
      $sql .= "FROM ((CUSTOMER INNER JOIN ORDERS ON CUSTOMER.Customer_id = ORDERS.Customer_id ) ";
      $sql .= "INNER JOIN PRODUCT ON ORDERS.Product_id = PRODUCT.Product_id) ";
      $sql .= "WHERE PRODUCT.Ad_template = 'mass market' AND PRODUCT.Medium = 'email'";
 
    $result = mysqli_query($db, $sql);
    confirm_result_set($result);
    return $result;
  }

  function product_sold_25_units_200_revenue() {
    global $db;

      $sql = "SELECT PRODUCT.Name, PRODUCT.Type, Manufacturer_name ";
      $sql .= "FROM ((PRODUCT INNER JOIN ORDERS ON PRODUCT.Product_id = ORDERS.Product_id) ";
      $sql .= "INNER JOIN MANUFACTURERS ON MANUFACTURERS.Manufacturer_id = PRODUCT.Manufacturer_id) ";
      $sql .= "GROUP BY ORDERS.Product_id ";
      $sql .= "HAVING COUNT(ORDERS.Order_id) >= 25 AND SUM(ORDERS.Cost) > 200;";

    $result = mysqli_query($db, $sql);
    confirm_result_set($result);
    return $result;
  }




?>
