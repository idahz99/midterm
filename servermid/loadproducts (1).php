<?php
include_once("dbconnect.php");
 
   
  $sqlloadproducts= "SELECT * FROM tbl_products";
  $result = $conn->query($sqlloadproducts);
if ($result->num_rows > 0){
    $response["products"] = array();
    while ($row = $result -> fetch_assoc()){
        $prlist = array();
        $prlist[productid] = $row['productid'];
        $prlist[productname] = $row['productname'];
        $prlist[producttype ]= $row['producttype'];
        $prlist[productprice] = $row['productprice'];
        $prlist[productquantity] = $row['productquantity'];
        $prlist[datecreated] = $row['datecreated'];
       
       array_push($response["products"],$prlist);
    }
    echo json_encode($response);
}else{
    echo "nodata";
}
