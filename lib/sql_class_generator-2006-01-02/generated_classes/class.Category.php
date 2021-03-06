
<!-- begin of generated class -->
<?php
/*
*
* -------------------------------------------------------
* CLASSNAME:        Category
* GENERATION DATE:  22.07.2015
* CLASS FILE:       C:\xampp\htdocs\sql_class_generator-2006-01-02/generated_classes/class.Category.php
* FOR MYSQL TABLE:  tblcategory
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

class Category
{ // class : begin


// **********************
// ATTRIBUTE DECLARATION
// **********************

var $CategoryID;   // KEY ATTR. WITH AUTOINCREMENT

var $Label;   // (normal Attribute)

var $database; // Instance of class database


// **********************
// CONSTRUCTOR METHOD
// **********************

function Category()
{

$this->database = new Database();

}


// **********************
// GETTER METHODS
// **********************


function getCategoryID()
{
return $this->CategoryID;
}

function getLabel()
{
return $this->Label;
}

// **********************
// SETTER METHODS
// **********************


function setCategoryID($val)
{
$this->CategoryID =  $val;
}

function setLabel($val)
{
$this->Label =  $val;
}

// **********************
// SELECT METHOD / LOAD
// **********************

function select($id)
{

$sql =  "SELECT * FROM tblcategory WHERE CategoryID = $id;";
$result =  $this->database->query($sql);
$result = $this->database->result;
$row = mysql_fetch_object($result);


$this->CategoryID = $row->CategoryID;

$this->Label = $row->Label;

}

// **********************
// DELETE
// **********************

function delete($id)
{
$sql = "DELETE FROM tblcategory WHERE CategoryID = $id;";
$result = $this->database->query($sql);

}

// **********************
// INSERT
// **********************

function insert()
{
$this->CategoryID = ""; // clear key for autoincrement

$sql = "INSERT INTO tblcategory ( Label ) VALUES ( '$this->Label' )";
$result = $this->database->query($sql);
$this->CategoryID = mysql_insert_id($this->database->link);

}

// **********************
// UPDATE
// **********************

function update($id)
{



$sql = " UPDATE tblcategory SET  Label = '$this->Label' WHERE CategoryID = $id ";

$result = $this->database->query($sql);



}


} // class : end

?>
<!-- end of generated class -->
