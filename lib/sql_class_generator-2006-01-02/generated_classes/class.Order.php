
<!-- begin of generated class -->
<?php
/*
*
* -------------------------------------------------------
* CLASSNAME:        Order
* GENERATION DATE:  22.07.2015
* CLASS FILE:       C:\xampp\htdocs\sql_class_generator-2006-01-02/generated_classes/class.Order.php
* FOR MYSQL TABLE:  tblorder
* FOR MYSQL DB:     easy-cms-bdd
* -------------------------------------------------------
* CODE GENERATED BY:
* MY PHP-MYSQL-CLASS GENERATOR
* from: >> www.voegeli.li >> (download for free!)
* -------------------------------------------------------
*
*/

include_once("resources/class.database.php");

// **********************
// CLASS DECLARATION
// **********************

class Order
{ // class : begin


// **********************
// ATTRIBUTE DECLARATION
// **********************

var $OrderID;   // KEY ATTR. WITH AUTOINCREMENT

var $UserID;   // (normal Attribute)
var $StatusID;   // (normal Attribute)
var $OrderDate;   // (normal Attribute)

var $database; // Instance of class database


// **********************
// CONSTRUCTOR METHOD
// **********************

function Order()
{

$this->database = new Database();

}


// **********************
// GETTER METHODS
// **********************


function getOrderID()
{
return $this->OrderID;
}

function getUserID()
{
return $this->UserID;
}

function getStatusID()
{
return $this->StatusID;
}

function getOrderDate()
{
return $this->OrderDate;
}

// **********************
// SETTER METHODS
// **********************


function setOrderID($val)
{
$this->OrderID =  $val;
}

function setUserID($val)
{
$this->UserID =  $val;
}

function setStatusID($val)
{
$this->StatusID =  $val;
}

function setOrderDate($val)
{
$this->OrderDate =  $val;
}

// **********************
// SELECT METHOD / LOAD
// **********************

function select($id)
{

$sql =  "SELECT * FROM tblorder WHERE OrderID = $id;";
$result =  $this->database->query($sql);
$result = $this->database->result;
$row = mysql_fetch_object($result);


$this->OrderID = $row->OrderID;

$this->UserID = $row->UserID;

$this->StatusID = $row->StatusID;

$this->OrderDate = $row->OrderDate;

}

// **********************
// DELETE
// **********************

function delete($id)
{
$sql = "DELETE FROM tblorder WHERE OrderID = $id;";
$result = $this->database->query($sql);

}

// **********************
// INSERT
// **********************

function insert()
{
$this->OrderID = ""; // clear key for autoincrement

$sql = "INSERT INTO tblorder ( UserID,StatusID,OrderDate ) VALUES ( '$this->UserID','$this->StatusID','$this->OrderDate' )";
$result = $this->database->query($sql);
$this->OrderID = mysql_insert_id($this->database->link);

}

// **********************
// UPDATE
// **********************

function update($id)
{



$sql = " UPDATE tblorder SET  UserID = '$this->UserID',StatusID = '$this->StatusID',OrderDate = '$this->OrderDate' WHERE OrderID = $id ";

$result = $this->database->query($sql);



}


} // class : end

?>
<!-- end of generated class -->
