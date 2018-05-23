<?php
namespace AppBundle\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Entity\Tapa;

//para indicar un prefijo
/**
 * @Route("/gestionplatos")
 */
class GestionPlatosController extends Controller
{
  /**
   * @Route("/nuevoplato", name="nuevoPlato")
   */
  public function nuevoPlatoAction(Request $request)
  {

    $tapa = new Tapa();
    $formBuilder = $this->createFormBuilder($tapa)
  

    ;
    $form = $formBuilder->getForm();

     $repository = $this->getDoctrine()->getRepository(Tapa::class);
     $tapas = $repository->findAll();
     echo '<div class="h2">GestionPlatos </div>';
      return $this->render('gestionPlatos/nuevoPlato.html.twig', array("form"=>$form->createView()));
  }












}
