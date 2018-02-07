<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Annonce;
use AppBundle\Entity\TypeAnnonce;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Form\Extension\Core\Type\SearchType;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction()
    {
        return $this->redirectToRoute('annonces');
    }

    /**
     * @Route("/annonces", name="annonces")
     */
    public function annonceAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $searchType = $em->getRepository('AppBundle:TypeAnnonce')->findAll();

        $form = $this->createFormBuilder()
            ->add('search', SearchType::class,
                array('required' => false))
            ->add('searchTypeAnn', ChoiceType::class,
                [
                    'choices' => [
                        '',
                        'Catégories' => $searchType
                    ],
                    'choice_label' => function($type, $key) {
                        if($type === '' ){
                            return 'Toutes les catégories';
                        }
                        /* @var TypeAnnonce $type */
                        return $type->getType();
                    }
                ]
            )
            ->getForm();
        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid())
        {
            $data = $form->getData();
            $search = $data['search'];
            $searchTypeAnn = $data['searchTypeAnn'];
            $annonces = $this->getDoctrine()
                ->getRepository(Annonce::class)->search($em, $search, $searchTypeAnn);
        } else {
            $annonces = $em->getRepository('AppBundle:Annonce')->findAll();
        }

        return $this->render('default/annonce.html.twig', array(
            'form' => $form->createView(),
            'searchType' => $searchType,
            'annonces' => $annonces,
        ));
    }

    /**
     * @Route ("/annonce/{id}", name="selectAnnonce", requirements={"id"="\d+"})
     */
    public function selectAnnonceAction($id)
    {
        $annonce = $this->getDoctrine()
            ->getRepository(Annonce::class)->find($id);

        if(empty($annonce))
        {
            return $this->redirectToRoute('homepage');
        } else {
            return $this->render('default/selectAnnonce.html.twig', array(
                'annonce' => $annonce
            ));
        }
    }
}
