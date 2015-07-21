<?php
    require_once('AppModel.php');

    class Article extends AppModel
    {
        private $ArticleID;
        private $Description;
        private $Price;


        public function index()
        {
            $this->set('Articles', $this->Articles->find('All'));
        }
    }

?>