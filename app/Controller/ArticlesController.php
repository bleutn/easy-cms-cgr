<?php

require_once('AppController.php');

App::uses('ArticlesController', 'Controller');

class ArticlesController extends AppController
{
    public $helpers = array('Html', 'Form');

    public $uses = array('Article', 'Model');

    public function index()
    {
        $this->set('Articles', $this->Article->find('all'));
    }

    public function view($id = null) {
        if (!$id) {
            throw new NotFoundException(__('Invalid post'));
        }

        $article = $this->article->findById($id);
        if (!$article) {
            throw new NotFoundException(__('Invalid post'));
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