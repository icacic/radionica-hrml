package hr.ericsson.radionicahrm.controllers;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hr.ericsson.radionicahrm.domain.core.User;
import hr.ericsson.radionicahrm.repository.core.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
@Log4j2
public class CoreController {
    
    private final UserRepository userRepository;


    @GetMapping("/allUsers")
    public ResponseEntity<Iterable<User>> getAllUser() {
        List<User> users = userRepository.findFirst5ByUsername("rat");
        log.info("finished with getting data from database returne number of records: {}", users.size());
        return ResponseEntity.ok(users);
    }
    
}
