<?php
namespace AppBundle\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Entity\Tapa;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)    {
      // Capturar el repositiorio de la tabla con la DB ,Tapa es la entidad q trae los datos
       $repository = $this->getDoctrine()->getRepository(Tapa::class);
       // finds *all* products trae todo
      // $tapas = $repository->findAll();
      //     para filtrar los recetas TOP se debe usar un findBY
      $tapas = $repository->findByTop(1);

//       var_dump($tapas);
        return $this->render('frontal/index.html.twig', array("tapas"=>$tapas));
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
        return $this->render('frontal/bares.html.twig', array("ciudad"=>$ciudad));
    }

    /**
     * @Route("/plato/{id}", name="plato")
     */
    public function platoAction(Request $request, $id=null)    {

      if($id!=null){
          $repository = $this->getDoctrine()->getRepository(Tapa::class);
          $plato = $repository->find($id);
          return $this->render('frontal/plato.html.twig', array("plato"=>$plato));
      } else {
        return $this->redirectToRoute('homepage');
      }

                // return $this->render('frontal/plato.html.twig', array("plato"=>$plato));
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
