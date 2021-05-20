<?
include_once ("dbconnect.php");
$encoded_string = $POST['encoded_string'];
$productname = $POST["productname"];
$producttype = $POST['producttype'];
$productquantity = $POST["productquantity"];
$productprice = $POST["productprice"];
 
 $sqlinsert = "INSERT INTO tbl_products(product_name,product_type,product_quantity,product_price)VALUES ('$productname','$producttype','$productquantity','$productprice',)";
 if ($conn->query($sqlinsert) === TRUE){
    
     $filename =mysqli_insert_id($conn);
     $decoded_string =base64_decode($encoded_string);
     $path ='.../images/productimage'.$filename."png";
     $is_written = file_put_contents($path, $decoded_string);
     echo "success";
 }
 ?>