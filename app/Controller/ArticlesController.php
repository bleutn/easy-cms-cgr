<?php

require_once('AppController.php');

App::uses('ArticlesController', 'Controller');

class ArticlesController extends AppController
{
    public $helpers = array('Html', 'Form');

    public $uses = array('Article', 'Model');

    public function index()
    {
        $articles = $this->Article->find('all');
        $this->set('articles', $articles);
        debug($articles);
    }

    public function view($id = null) {
        if (!$id) {
            throw new NotFoundException(__('Invalid article'));
        }

        $article = $this->Article->findById($id);
        debug($article);
        if (!$article) {
            throw new NotFoundException(__('Invalid article'));
        }
        $this->set('article', $article);
    }

    public function add() {
        if ($this->request->is('article')) {
            $this->Article->create();
            if ($this->Article->save($this->request->data)) {
                $this->Session->setFlash(__('Your article has been saved.'));
                return $this->redirect(array('action' => 'index'));
            }
            $this->Session->setFlash(__('Unable to add your article.'));
        }
    }
}
?>