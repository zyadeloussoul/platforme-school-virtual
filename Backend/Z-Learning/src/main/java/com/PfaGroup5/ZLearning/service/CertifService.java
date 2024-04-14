package com.PfaGroup5.ZLearning.service;

import com.PfaGroup5.ZLearning.model.Category;
import com.PfaGroup5.ZLearning.model.Certif;
import com.PfaGroup5.ZLearning.repository.CategoryRepo;
import com.PfaGroup5.ZLearning.repository.CertifRepo;
import org.springframework.stereotype.Service;

@Service
public class CertifService {

    private final CertifRepo certifRepo;
    private final CategoryRepo categoryRepo;

    public CertifService(CertifRepo certifRepo, CategoryRepo categoryRepo) {
        this.certifRepo = certifRepo;
        this.categoryRepo = categoryRepo;
    }

    public void addCertif(Certif certif) {
        String categoryName = certif.getCategoryName();
        Category category = categoryRepo.findByName(categoryName);
        if (category == null) {
            // Create a new category
            category = new Category();
            category.setName(categoryName);
            category.getCertifs().add(certif);
            categoryRepo.insert(category);
        } else {
            // Add the certificate to the existing category
            category.getCertifs().add(certif);
            categoryRepo.save(category);
        }



        certifRepo.insert(certif);
    }
}
