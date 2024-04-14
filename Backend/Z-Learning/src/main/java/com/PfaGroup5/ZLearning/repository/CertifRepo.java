package com.PfaGroup5.ZLearning.repository;

import com.PfaGroup5.ZLearning.model.Certif;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import java.util.Optional;

public interface CertifRepo extends MongoRepository<Certif,String> {
    @Query("{'name': ?0}")
    Optional<Certif> findByName(String name);

}
