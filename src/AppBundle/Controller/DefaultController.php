<?php
namespace AppBundle\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)    {
        // replace this example code with whatever you need
        return $this->render('frontal/index.html.twig');
    }

    /**
     * @Route("/nosotros", name="nosotros")
     */
    public function nosotrosAction(Request $request)    {
        // replace this example code with whatever you need
        return $this->render('frontal/nosotros.html.twig');

    }

    /**
     * @Route("/bares/{ciudad}", name="bares")
     */
    public function baresAction(Request $request, $ciudad="todos")    {
        // replace this example code with whatever you need
        return $this->render('frontal/bares.html.twig', array("ciudad"=>$ciudad));
    }



      //*******************************************



    /**
     * @Route("/productos", name="productos")
     */
    public function productosAction(Request $request)    {
        // replace this example code with whatever you need
        return $this->render('frontal/index.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.project_dir')).DIRECTORY_SEPARATOR,
        ]);
    }

    /**
     * @Route("/reservas", name="reservas")
     */
    public function reservasAction(Request $request)    {
        // replace this example code with whatever you need
        return $this->render('frontal/index.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.project_dir')).DIRECTORY_SEPARATOR,
        ]);
    }
}
