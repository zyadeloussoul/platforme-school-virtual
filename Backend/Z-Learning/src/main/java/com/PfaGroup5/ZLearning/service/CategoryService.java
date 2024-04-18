package com.PfaGroup5.ZLearning.service;

import com.PfaGroup5.ZLearning.model.Category;
import com.PfaGroup5.ZLearning.repository.CategoryRepo;

public class CategoryService {
    private final CategoryRepo categoryRepo;

    public CategoryService(CategoryRepo categoryRepo) {
        this.categoryRepo = categoryRepo;
    }

    public Category findByName(String name) {
        return categoryRepo.findByName(name);
    }
    public void EditIdList(String action, String categotyName ,String certifIf){
        if (action.equals("add")){
            Category category = categoryRepo.findByName(categotyName);
            category.getCertifId().add(certifIf);
            categoryRepo.save(category);
        }else if (action.equals("remove")){
            Category category = categoryRepo.findByName(categotyName);
            category.getCertifId().remove(certifIf);
            categoryRepo.save(category);
        }
    }
}
