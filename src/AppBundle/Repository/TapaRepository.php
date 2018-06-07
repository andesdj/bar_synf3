<?php

namespace AppBundle\Repository;

/**
 * TapaRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class TapaRepository extends \Doctrine\ORM\EntityRepository
{

//Generar funcion para que sea reutilizable

public function paginaTapas($pagina=1, $numTapas=3){

  $query = $this->createQueryBuilder('t')
    ->where('t.top = 1 ')
    ->setFirstResult($numTapas*($pagina-1))
    ->setMaxResults($numTapas)
    ->getQuery();
    return $query->getResult();
}

}
