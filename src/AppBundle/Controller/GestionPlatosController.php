<?php
namespace AppBundle\Controller;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use AppBundle\Entity\Tapa;
use AppBundle\Entity\Categoria;
use AppBundle\Form\TapaType;
use AppBundle\Form\CategoriaType;
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
        $fototype=$tapa->getFoto();
        // Fuincion creada para genrar nomrbes unicos
        $fileName= $this->generateUniqueFileName().'.'. $fototype->guessExtension();
        $fototype->move($this->getParameter('plato_img_directory'),
          $fileName
        );
        $tapa->setFoto($fileName);
        // Se pone del Filename
        //  $tapa->setFoto("");
        // Se desmarca ya que el formulario lo valida
        //  $tapa->setTop(0);
        // Se pone \ Para que ponga los elementos del PHP PÜRo y no del Symfony
        $tapa->setFechaCreacion(new \DateTime());

        // *******Almacenar Nueva Tapa
        // Crear el Entity Manager para tareas de lectura/escritura de datos en la DB
         $em = $this->getDoctrine()->getManager();
         $em->persist($tapa);
         $em->flush();

       //  return $this->render('test/test/html.twig');
         return $this->redirectToRoute('plato', array('id'=>$tapa->getId()));
    }


     $repository = $this->getDoctrine()->getRepository(Tapa::class);
     $tapas = $repository->findAll();
      return $this->render('gestionPlatos/nuevoPlato.html.twig', array("form"=>$form->createView()));
  }

  /**
   * @Route("/nuevacategoria", name="nuevaCategoria")
   */
   public function nuevaCategoriaAction(Request $request)
   {
     $categoria = new Categoria();
     $form = $this->createForm(CategoriaType::class, $categoria);
     $form->handleRequest($request);
     if($form->isSubmitted() && $form->isValid()){
         $categoria=$form->getData();
         $fototype=$categoria->getFoto();
         $fileName= $this->generateUniqueFileName().'.'. $fototype->guessExtension();
         $fototype->move($this->getParameter('categoria_img_directory'),
           $fileName
         );
         $categoria->setFoto($fileName);
          $em = $this->getDoctrine()->getManager();
          $em->persist($categoria);
          $em->flush();
          return $this->redirectToRoute('categoria', array('id'=>$categoria->getId()));
     }
      $repository = $this->getDoctrine()->getRepository(Categoria::class);
      $categorias = $repository->findAll();
       return $this->render('gestionPlatos/nuevaCategoria.html.twig', array("form"=>$form->createView()));
   }












  /**
   * @return string
 */
  private function generateUniqueFileName()
  {

      return md5(uniqid());
  }












}
