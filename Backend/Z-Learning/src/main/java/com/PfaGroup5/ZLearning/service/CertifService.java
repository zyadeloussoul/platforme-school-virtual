package com.PfaGroup5.ZLearning.service;

import com.PfaGroup5.ZLearning.model.Category;
import com.PfaGroup5.ZLearning.model.Certif;
import com.PfaGroup5.ZLearning.repository.CategoryRepo;
import com.PfaGroup5.ZLearning.repository.CertifRepo;
import org.bson.types.ObjectId;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class CertifService {

    private final CertifRepo certifRepo;
    private final CategoryRepo categoryRepo;

    public CertifService(CertifRepo certifRepo, CategoryRepo categoryRepo) {
        this.certifRepo = certifRepo;
        this.categoryRepo = categoryRepo;
    }

    public void addCertif(Certif certif) {
        certifRepo.insert(certif);
        Certif savedCertif = certifRepo.findByName(certif.getName()).orElseThrow(() -> new RuntimeException(
                String.format("Cannot Find Certif by Name %s", certif.getName())));


        String categoryName = certif.getCategoryName();
        Category category = categoryRepo.findByName(categoryName);
        if (category == null) {
            // Create a new category
            category = new Category();
            category.setName(categoryName);
            category.getCertifId().add(savedCertif.getId());
            categoryRepo.insert(category);
        } else {
            // Add the certificate to the existing category
            category.getCertifId().add(savedCertif.getId());
            categoryRepo.save(category);
        }




    }
    public List<Certif> getAllCertif(){
        return certifRepo.findAll();
    }

    public Certif getCertifByName(String name){
        return certifRepo.findByName(name).orElse(null);
    }

    public void updateCertif(Certif certif) {
        // when updating a certificate, we need to update the category as well if the category name has changed
        // so we need to check if the category name has changed
        Certif savedCertif = certifRepo.findByName(certif.getName())
                .orElseThrow(() -> new RuntimeException(
                        String.format("Cannot Find Certif by Name %s", certif.getName())));
        String oldCategoryName = savedCertif.getCategoryName();
        String newCategoryName = certif.getCategoryName();
        Category cat = categoryRepo.findByName(newCategoryName);
        if(cat == null) {
            Category category = new Category();
            category.setName(newCategoryName);
            categoryRepo.insert(category);
        }

        if(!Objects.equals(oldCategoryName ,newCategoryName )){

            Category cat1 = categoryRepo.findByName(oldCategoryName);
            cat1.getCertifId().remove(savedCertif.getId());
            categoryRepo.save(cat1);
          //categoryRepo.findByName(newCategoryName).getCertifId().add(savedCertif.getId());
            Category cat2 = categoryRepo.findByName(newCategoryName);
            cat2.getCertifId().add(savedCertif.getId());
            categoryRepo.save(cat2);

        }
        savedCertif.setName(certif.getName());
        savedCertif.setCategoryName(certif.getCategoryName());
        savedCertif.setPrice(certif.getPrice());
        savedCertif.setMainimage(certif.getMainimage());
        savedCertif.setDescription(certif.getDescription());

        certifRepo.save(savedCertif);



    }
    public void storeImage(String certifId, byte[] image) {
        Certif certif = certifRepo.findById(certifId).orElseThrow(() -> new RuntimeException(
                String.format("Cannot Find Certif by ID %s", certifId)));

        if (certif != null) {
            certif.setMainimage(image);
            certifRepo.save(certif);
        }
    }

    public byte[] loadImage(String id) {
        Certif certif = certifRepo.findById(id)
                .orElseThrow(() -> new RuntimeException(
                        String.format("Cannot Find Certif by ID %s", id)));

        return certif.getMainimage();
    }
    public ArrayList<Certif> getAllCertifsByIds(ArrayList<String> ids){
        ArrayList<Certif> certifs = new ArrayList<>();
        for (String id : ids){
            certifs.add(certifRepo.findById(id).orElse(null));
        }
        return certifs;
    }
    public void deleteCertif(String id){
        certifRepo.deleteById(id);
    }
}
