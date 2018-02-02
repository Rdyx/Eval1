<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;

/**
 * Annonce
 *
 * @ORM\Table(name="annonce")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\AnnonceRepository")
 * @Vich\Uploadable
 */
class Annonce
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="ann_titre", type="string", length=255)
     */
    private $annTitre;

    /**
     * @var string
     *
     * @ORM\Column(name="ann_photo", type="string", length=255, nullable=true)
     */
    private $annPhoto;

    /**
     * @var int
     *
     * @ORM\Column(name="ann_nbpieces", type="integer")
     */
    private $annNbpieces;

    /**
     * @var string
     *
     * @ORM\Column(name="ann_prix", type="integer", length=255)
     */
    private $annPrix;

    /**
     * @var string
     *
     * @ORM\Column(name="ann_description", type="text")
     */
    private $annDescription;


    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set annTitre
     *
     * @param string $annTitre
     *
     * @return Annonce
     */
    public function setAnnTitre($annTitre)
    {
        $this->annTitre = $annTitre;

        return $this;
    }

    /**
     * Get annTitre
     *
     * @return string
     */
    public function getAnnTitre()
    {
        return $this->annTitre;
    }

    /**
     * @Vich\UploadableField(mapping="annonce_images", fileNameProperty="annPhoto")
     * @var File
     */
    private $imageFile;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @var \DateTime
     */
    private $updatedAt;

    /**
     * @return \DateTime
     */
    public function getUpdatedAt()
    {
        return $this->updatedAt;
    }

    /**
     * @param \DateTime $updatedAt
     */
    public function setUpdatedAt($updatedAt)
    {
        $this->updatedAt = $updatedAt;
    }

    public function setImageFile(File $annPhoto = null)
    {
        $this->imageFile = $annPhoto;

        // VERY IMPORTANT:
        // It is required that at least one field changes if you are using Doctrine,
        // otherwise the event listeners won't be called and the file is lost
        if ($annPhoto) {
            // if 'updatedAt' is not defined in your entity, use another property
            $this->updatedAt = new \DateTime('now');
        }
    }

    public function getImageFile()
    {
        return $this->imageFile;
    }

    public function setImage($annPhoto)
    {
        $this->image = $annPhoto;
    }

    public function getImage()
    {
        return $this->image;
    }

    /**
     * Set annPhoto
     *
     * @param string $annPhoto
     *
     * @return Annonce
     */
    public function setAnnPhoto($annPhoto)
    {
        $this->annPhoto = $annPhoto;

        return $this;
    }

    /**
     * Get annPhoto
     *
     * @return string
     */
    public function getAnnPhoto()
    {
        return $this->annPhoto;
    }

    /**
     * Set annNbpieces
     *
     * @param integer $annNbpieces
     *
     * @return Annonce
     */
    public function setAnnNbpieces($annNbpieces)
    {
        $this->annNbpieces = $annNbpieces;

        return $this;
    }

    /**
     * Get annNbpieces
     *
     * @return int
     */
    public function getAnnNbpieces()
    {
        return $this->annNbpieces;
    }

    /**
     * Set annPrix
     *
     * @param string $annPrix
     *
     * @return Annonce
     */
    public function setAnnPrix($annPrix)
    {
        $this->annPrix = $annPrix;

        return $this;
    }

    /**
     * Get annPrix
     *
     * @return string
     */
    public function getAnnPrix()
    {
        return $this->annPrix;
    }

    /**
     * Set annDescription
     *
     * @param string $annDescription
     *
     * @return Annonce
     */
    public function setAnnDescription($annDescription)
    {
        $this->annDescription = $annDescription;

        return $this;
    }

    /**
     * Get annDescription
     *
     * @return string
     */
    public function getAnnDescription()
    {
        return $this->annDescription;
    }

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Admin")
     * @ORM\JoinColumn(name="adm_id", referencedColumnName="id")
     */
    private $admin;

    /**
     * @return mixed
     */
    public function getAdmin()
    {
        return $this->admin;
    }

    /**
     * @param mixed $admin
     */
    public function setAdmin($admin)
    {
        $this->admin = $admin;
    }

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Client")
     * @ORM\JoinColumn(name="cli_id", referencedColumnName="id")
     */
    private $client;

    /**
     * @return mixed
     */
    public function getClient()
    {
        return $this->client;
    }

    /**
     * @param mixed $client
     */
    public function setClient($client)
    {
        $this->client = $client;
    }

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\TypeAnnonce")
     * @ORM\JoinColumn(name="typ_id", referencedColumnName="id")
     */
    private $typeAnn;

    /**
     * @return mixed
     */
    public function getTypeAnn()
    {
        return $this->typeAnn;
    }

    /**
     * @param mixed $typeAnn
     */
    public function setTypeAnn($typeAnn)
    {
        $this->typeAnn = $typeAnn;
    }
}

