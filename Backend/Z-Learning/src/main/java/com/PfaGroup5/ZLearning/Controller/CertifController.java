package com.PfaGroup5.ZLearning.Controller;


import com.PfaGroup5.ZLearning.model.Certif;
import com.PfaGroup5.ZLearning.service.CertifService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("Api/Certif")
public class CertifController {

    private final CertifService certifService;

    public CertifController(CertifService certifService) {
        this.certifService = certifService;
    }

    @PostMapping
    public ResponseEntity addCertif(@RequestBody Certif certif) {
        certifService.addCertif(certif);
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }
}
