
<!-- begin of generated class -->
<?php
/*
*
* -------------------------------------------------------
* CLASSNAME:        User
* GENERATION DATE:  22.07.2015
* CLASS FILE:       C:\xampp\htdocs\sql_class_generator-2006-01-02/generated_classes/class.User.php
* FOR MYSQL TABLE:  tbluser
* FOR MYSQL DB:     easy-cms-bdd
* -------------------------------------------------------
* CODE GENERATED BY:
* MY PHP-MYSQL-CLASS GENERATOR
* from: >> www.voegeli.li >> (download for free!)
* -------------------------------------------------------
*
*/

include_once("../../lib/sql_class_generator-2006-01-02/resources/class.database.php");

// **********************
// CLASS DECLARATION
// **********************

//App::uses('User', 'Model');

class User  extends AppModel
{ // class : begin


// **********************
// ATTRIBUTE DECLARATION
// **********************

var $UserID;   // KEY ATTR. WITH AUTOINCREMENT

var $Password;   // (normal Attribute)
var $Name;   // (normal Attribute)
var $Surname;   // (normal Attribute)
var $Adress;   // (normal Attribute)
var $PostalCode;   // (normal Attribute)

var $database; // Instance of class database


// **********************
// CONSTRUCTOR METHOD
// **********************

function User()
{

$this->database = new Database();

}


// **********************
// GETTER METHODS
// **********************


function getUserID()
{
return $this->UserID;
}

function getPassword()
{
return $this->Password;
}

function getName()
{
return $this->Name;
}

function getSurname()
{
return $this->Surname;
}

function getAdress()
{
return $this->Adress;
}

function getPostalCode()
{
return $this->PostalCode;
}

// **********************
// SETTER METHODS
// **********************


function setUserID($val)
{
$this->UserID =  $val;
}

function setPassword($val)
{
$this->Password =  $val;
}

function setName($val)
{
$this->Name =  $val;
}

function setSurname($val)
{
$this->Surname =  $val;
}

function setAdress($val)
{
$this->Adress =  $val;
}

function setPostalCode($val)
{
$this->PostalCode =  $val;
}

// **********************
// SELECT METHOD / LOAD
// **********************

function select($id)
{

$sql =  "SELECT * FROM tbluser WHERE UserID = $id;";
$result =  $this->database->query($sql);
$result = $this->database->result;
$row = mysql_fetch_object($result);


$this->UserID = $row->UserID;

$this->Password = $row->Password;

$this->Name = $row->Name;

$this->Surname = $row->Surname;

$this->Adress = $row->Adress;

$this->PostalCode = $row->PostalCode;

}

// **********************
// DELETE
// **********************

function delete($id)
{
$sql = "DELETE FROM tbluser WHERE UserID = $id;";
$result = $this->database->query($sql);

}

// **********************
// INSERT
// **********************

function insert()
{
$this->UserID = ""; // clear key for autoincrement

$sql = "INSERT INTO tbluser ( Password,Name,Surname,Adress,PostalCode ) VALUES ( '$this->Password','$this->Name','$this->Surname','$this->Adress','$this->PostalCode' )";
$result = $this->database->query($sql);
$this->UserID = mysql_insert_id($this->database->link);

}

// **********************
// UPDATE
// **********************

function update($id)
{



$sql = " UPDATE tbluser SET  Password = '$this->Password',Name = '$this->Name',Surname = '$this->Surname',Adress = '$this->Adress',PostalCode = '$this->PostalCode' WHERE UserID = $id ";

$result = $this->database->query($sql);



}


} // class : end

?>
<!-- end of generated class -->
