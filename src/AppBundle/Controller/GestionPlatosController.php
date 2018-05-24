<?php
namespace AppBundle\Controller;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Entity\Tapa;
use AppBundle\Form\TapaType;

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


    //Crear nuevo objeto de tipo tapa para construir el formulario
    $tapa = new Tapa();
    //Construccion del formulario
    $form = $this->createForm(TapaType::class, $tapa);

    //Recoger la informacion del REQUEST de los datos que envia el Formulario
    $form->handleRequest($request);

    //Comprobar si el formulario hizo SUBMIT y si se validaron los datos
    if($form->isSubmitted() && $form->isValid()){
        //Capturar la informacion del Objeto $tapa creado previamente.
        $tapa=$form->getData();
        //Aun faltan elementos que se agregaran manualmente por ahora
        //Se pone desde el formulario los ingredientes
        // $tapa->setIngredientes("");
        $tapa->setFoto("");
        //Se desmarca ya que el formulario lo valida
      //  $tapa->setTop(0);
        // Se pone \ Para que ponga los elementos del PHP PÜRo y no del Symfony
        $tapa->setFechaCreacion(new \DateTime());

        // *******Almacenar Nueva Tapa
        // Crear el Entity Manager para tareas de lectura/escritura de datos en la DB
         $em = $this->getDoctrine()->getManager();
         $em->persist($tapa);
         $em->flush();
         return $this->redirectToRoute('plato', array('id'=>$tapa->getId()));
    }


     $repository = $this->getDoctrine()->getRepository(Tapa::class);
     $tapas = $repository->findAll();
     echo '<div class="h2">GestionPlatos </div>';
      return $this->render('gestionPlatos/nuevoPlato.html.twig', array("form"=>$form->createView()));
  }












}
