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
}
