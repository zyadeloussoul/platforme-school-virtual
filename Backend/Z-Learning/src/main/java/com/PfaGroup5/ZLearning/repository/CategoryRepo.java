package com.PfaGroup5.ZLearning.repository;

import com.PfaGroup5.ZLearning.model.Category;
import com.PfaGroup5.ZLearning.model.Certif;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import java.util.Optional;

public interface CategoryRepo extends MongoRepository<Category,String> {
    Category findByName(String name);
}
