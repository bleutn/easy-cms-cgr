
<!-- begin of generated class -->
<?php
/*
*
* -------------------------------------------------------
* CLASSNAME:        Tag
* GENERATION DATE:  22.07.2015
* CLASS FILE:       C:\xampp\htdocs\sql_class_generator-2006-01-02/generated_classes/class.Tag.php
* FOR MYSQL TABLE:  tbltag
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

class Tag
{ // class : begin


// **********************
// ATTRIBUTE DECLARATION
// **********************

var $TagID;   // KEY ATTR. WITH AUTOINCREMENT

var $Label;   // (normal Attribute)

var $database; // Instance of class database


// **********************
// CONSTRUCTOR METHOD
// **********************

function Tag()
{

$this->database = new Database();

}


// **********************
// GETTER METHODS
// **********************


function getTagID()
{
return $this->TagID;
}

function getLabel()
{
return $this->Label;
}

// **********************
// SETTER METHODS
// **********************


function setTagID($val)
{
$this->TagID =  $val;
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

$sql =  "SELECT * FROM tbltag WHERE TagID = $id;";
$result =  $this->database->query($sql);
$result = $this->database->result;
$row = mysql_fetch_object($result);


$this->TagID = $row->TagID;

$this->Label = $row->Label;

}

// **********************
// DELETE
// **********************

function delete($id)
{
$sql = "DELETE FROM tbltag WHERE TagID = $id;";
$result = $this->database->query($sql);

}

// **********************
// INSERT
// **********************

function insert()
{
$this->TagID = ""; // clear key for autoincrement

$sql = "INSERT INTO tbltag ( Label ) VALUES ( '$this->Label' )";
$result = $this->database->query($sql);
$this->TagID = mysql_insert_id($this->database->link);

}

// **********************
// UPDATE
// **********************

function update($id)
{



$sql = " UPDATE tbltag SET  Label = '$this->Label' WHERE TagID = $id ";

$result = $this->database->query($sql);



}


} // class : end

?>
<!-- end of generated class -->
