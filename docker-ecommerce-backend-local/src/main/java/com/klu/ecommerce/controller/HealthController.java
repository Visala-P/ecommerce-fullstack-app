package com.klu.ecommerce.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/actuator")
public class HealthController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/health")
    public Map<String, Object> health() {
        Map<String, Object> m = new HashMap<>();
        try {
            Integer c = jdbcTemplate.queryForObject("SELECT 1", Integer.class);
            m.put("db", c != null && c == 1 ? "up" : "unknown");
        } catch (Exception e) {
            m.put("db", "down");
            m.put("error", e.getMessage());
        }
        m.put("app", "up");
        return m;
    }
}
