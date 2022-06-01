package com;

import com.wolper.SiForeca;
import com.wolper.dto.AppUser;
import com.wolper.dto.ResetToken;
import com.wolper.dto.UserBlocked;
import com.wolper.repositories.TokenRepository;
import com.wolper.repositories.UserBlockList;
import lombok.SneakyThrows;
import lombok.extern.log4j.Log4j2;
import org.junit.After;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.condition.EnabledIfSystemProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import java.util.*;
import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;



@Log4j2
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@ActiveProfiles("test")
@ContextConfiguration(classes= SiForeca.class)



@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@EnabledIfSystemProperty(named = "run.security.tests", matches = "true")
public class RestJWTControllerTest {

    @Autowired
    TestRestTemplate restTemplate;
    @Autowired
    TokenRepository tokenRepository;

    static String tokenPersist;


    @Test
    @Order(1)
    void signUpNewUser() {
        ResponseEntity<String> responseEntity = restTemplate
                .postForEntity("/user/signup?username=delishki@ukr.net&password=danlee",
                null, String.class);
        log.warn("TEST1="+responseEntity.getBody());
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.OK);
    }


    @Test
    @Order(2)
    @SneakyThrows
    void confirmNewUserByEmail() {
        ResetToken byUsername = tokenRepository.findByUsername("delishki@ukr.net");
        ResponseEntity<String> responseEntity = restTemplate
                .getForEntity("/user/confirm?token="+byUsername.getToken(),
                        String.class);
        log.warn("TEST2="+responseEntity.getStatusCode());
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.OK);
    }


    @Test
    @Order(3)
    void enableListedUsersByAdmin() {
        ResponseEntity<String> responseEntity = restTemplate
                .postForEntity("/user/signin?username=prox@i.ua&password=danlee",
                        null, String.class);
        String token = responseEntity.getBody();

        restTemplate.getRestTemplate().setInterceptors(
                Collections.singletonList((request, body, execution) -> {
                    request.getHeaders().add("Authorization", "Bearer "+token);
                    return execution.execute(request, body);
                }));


        List<String> usersList = new ArrayList<>();
        usersList.add("delishki@ukr.net");
        ResponseEntity<String> responseEntity1 = restTemplate
                .postForEntity("/user/enable", usersList,
                        String.class);
        log.warn("TEST3="+"token");
        assertThat(responseEntity1.getStatusCode()).isEqualTo(HttpStatus.OK);
    }

    @Test
    @Order(4)
    void getAllUsersList() {
        ResponseEntity<String> responseEntity = restTemplate
                .postForEntity("/user/signin?username=delishki@ukr.net&password=danlee",
                        null, String.class);
        String token = responseEntity.getBody();

        restTemplate.getRestTemplate().setInterceptors(
                Collections.singletonList((request, body, execution) -> {
                    request.getHeaders().add("Authorization", "Bearer "+token);
                    return execution.execute(request, body);
                }));

        ResponseEntity<AppUser[]> responseEntity1 = restTemplate
                .getForEntity("/user/users",
                        AppUser[].class);
        log.warn("TEST4="+responseEntity1.getBody());
        assertTrue(responseEntity1.getBody().length>1);
        assertThat(responseEntity1.getStatusCode()).isEqualTo(HttpStatus.OK);
    }


    @Autowired
    UserBlockList userBlockList;


    @Test
    @Order(5)
    @SneakyThrows
    void logoutShouldSaveUserInBlockList() {
        ResponseEntity<String> responseEntity = restTemplate
                .postForEntity("/user/signin?username=delishki@ukr.net&password=danlee",
                        null, String.class);
        String token = responseEntity.getBody();
        tokenPersist=token;

        restTemplate.getRestTemplate().setInterceptors(
                Collections.singletonList((request, body, execution) -> {
                    request.getHeaders().add("Authorization", "Bearer "+token);
                    return execution.execute(request, body);
                }));

        responseEntity = restTemplate
                .getForEntity("/user/logout",
                        null, String.class);
        Optional<UserBlocked> user =userBlockList.findById("delishki@ukr.net");
        UserBlocked expired = user.orElse(null);
        log.warn("TEST5="+expired.toString());
        assertFalse(Objects.isNull(expired));
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.OK);
    }


    @Test
    @Order(6)
    void shouldNotWorkWithBlockListedUser() {
        restTemplate.getRestTemplate().setInterceptors(
                Collections.singletonList((request, body, execution) -> {
                    request.getHeaders().add("Authorization", "Bearer "+tokenPersist);
                    return execution.execute(request, body);
                }));

        ResponseEntity<String> responseEntity = restTemplate
                .getForEntity("/user/whoami",
                        null, String.class);
        log.warn("TEST6=rejected form blocked list");
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.BAD_REQUEST);
    }


    @Test
    @Order(7)
    void deleteUserByAdmin() {
        ResponseEntity<String> responseEntity = restTemplate
                .postForEntity("/user/signin?username=prox@i.ua&password=danlee",
                        null, String.class);
        String token = responseEntity.getBody();

        restTemplate.getRestTemplate().setInterceptors(
                Collections.singletonList((request, body, execution) -> {
                    request.getHeaders().add("Authorization", "Bearer "+token);
                    return execution.execute(request, body);
                }));

        Map<String,String> map = new HashMap<>();
        map.put("username","delishki@ukr.net");
        map.put("password","danlee");
        responseEntity = restTemplate
                .postForEntity("/user/delete?username=delishki@ukr.net",
                        null, String.class, map);
        log.warn("TEST7="+responseEntity.getBody());
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.OK);
    }

    @Test
    @Order(8)
    @SneakyThrows
    void sendingConfirmationEmailForPasswordReset() {
        Map<String,String> map = new HashMap<>();
        ResponseEntity<String> responseEntity = restTemplate
                .postForEntity("/user/reset?email=prox@i.ua",
                        null, String.class, map);
        log.warn("TEST8="+responseEntity.getBody());
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.OK);
    }


    @Test
    @Order(9)
    @SneakyThrows
    void resetPasswordAfterConfirmationEmailReceived() {
        ResetToken byUsername = tokenRepository.findByUsername("prox@i.ua");
        Map<String,String> map = new HashMap<>();
        String newPass= "danlee";
        ResponseEntity<String> responseEntity = restTemplate
                .postForEntity("/user/change?token="+byUsername.getToken()
                        +"&password="+newPass,
                        null, String.class, map);
        log.warn("TEST9="+responseEntity.getBody());
        //To get e-mail posted - UNCOMMENT IT
        //Thread.sleep(5000);
        assertThat(responseEntity.getStatusCode()).isEqualTo(HttpStatus.OK);
    }


    @After
    public void teardown() {


    }
}