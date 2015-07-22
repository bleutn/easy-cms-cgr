
<!-- begin of generated class -->
<?php
/*
*
* -------------------------------------------------------
* CLASSNAME:        Article
* GENERATION DATE:  22.07.2015
* CLASS FILE:       C:\xampp\htdocs\sql_class_generator-2006-01-02/generated_classes/class.Article.php
* FOR MYSQL TABLE:  tblarticle
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
App::uses('Article', 'Model');

class Article extends AppModel
{ // class : begin


// **********************
// ATTRIBUTE DECLARATION
// **********************

var $ArticleID;   // KEY ATTR. WITH AUTOINCREMENT

var $CategoryID;   // (normal Attribute)
var $Price;   // (normal Attribute)
var $Label;   // (normal Attribute)
var $Description;   // (normal Attribute)
var $IsOrdered;   // (normal Attribute)
var $IsOnSale;   // (normal Attribute)
var $StatusID;   // (normal Attribute)

var $database; // Instance of class database


// **********************
// CONSTRUCTOR METHOD
// **********************

function Article()
{

$this->database = new Database();

}


// **********************
// GETTER METHODS
// **********************


function getArticleID()
{
return $this->ArticleID;
}

function getCategoryID()
{
return $this->CategoryID;
}

function getPrice()
{
return $this->Price;
}

function getLabel()
{
return $this->Label;
}

function getDescription()
{
return $this->Description;
}

function getIsOrdered()
{
return $this->IsOrdered;
}

function getIsOnSale()
{
return $this->IsOnSale;
}

function getStatusID()
{
return $this->StatusID;
}

// **********************
// SETTER METHODS
// **********************


function setArticleID($val)
{
$this->ArticleID =  $val;
}

function setCategoryID($val)
{
$this->CategoryID =  $val;
}

function setPrice($val)
{
$this->Price =  $val;
}

function setLabel($val)
{
$this->Label =  $val;
}

function setDescription($val)
{
$this->Description =  $val;
}

function setIsOrdered($val)
{
$this->IsOrdered =  $val;
}

function setIsOnSale($val)
{
$this->IsOnSale =  $val;
}

function setStatusID($val)
{
$this->StatusID =  $val;
}

// **********************
// SELECT METHOD / LOAD
// **********************

function select($id)
{

$sql =  "SELECT * FROM tblarticle WHERE ArticleID = $id;";
$result =  $this->database->query($sql);
$result = $this->database->result;
$row = mysql_fetch_object($result);


$this->ArticleID = $row->ArticleID;

$this->CategoryID = $row->CategoryID;

$this->Price = $row->Price;

$this->Label = $row->Label;

$this->Description = $row->Description;

$this->IsOrdered = $row->IsOrdered;

$this->IsOnSale = $row->IsOnSale;

$this->StatusID = $row->StatusID;

}

// **********************
// DELETE
// **********************

function delete($id)
{
$sql = "DELETE FROM tblarticle WHERE ArticleID = $id;";
$result = $this->database->query($sql);

}

// **********************
// INSERT
// **********************

function insert()
{
$this->ArticleID = ""; // clear key for autoincrement

$sql = "INSERT INTO tblarticle ( CategoryID,Price,Label,Description,IsOrdered,IsOnSale,StatusID ) VALUES ( '$this->CategoryID','$this->Price','$this->Label','$this->Description','$this->IsOrdered','$this->IsOnSale','$this->StatusID' )";
$result = $this->database->query($sql);
$this->ArticleID = mysql_insert_id($this->database->link);

}

// **********************
// UPDATE
// **********************

function update($id)
{



$sql = " UPDATE tblarticle SET  CategoryID = '$this->CategoryID',Price = '$this->Price',Label = '$this->Label',Description = '$this->Description',IsOrdered = '$this->IsOrdered',IsOnSale = '$this->IsOnSale',StatusID = '$this->StatusID' WHERE ArticleID = $id ";

$result = $this->database->query($sql);



}


} // class : end

?>
<!-- end of generated class -->
