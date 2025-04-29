package com.labs.vault;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

record DbInfo(String host, String name, String password) {}

@RestController
@RequestMapping("/api")
public class VaultController {

    @Value("${application.env.db-host}")
    private String host;

    @Value("${application.env.db-name}")
    private String name;

    @Value("${application.env.db-password}")
    private String password;

    @GetMapping("/db-config")
    public DbInfo getStatus() {
        return new DbInfo(host, name, password);
    }
}