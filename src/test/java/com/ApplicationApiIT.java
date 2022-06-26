package com;


import com.wolper.SiForeca;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.util.ResourceUtils;
import org.testcontainers.containers.BindMode;
import org.testcontainers.containers.GenericContainer;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.utility.DockerImageName;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;



@SpringBootTest(classes = {SiForeca.class})
@AutoConfigureMockMvc
@ActiveProfiles("test")


@Log4j2
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class ApplicationApiIT {


    private final static String POSTGRES_CONTAINER="postgres:14.4";
    private final static String POSTGRES_DB="/rowdata?";
    private final static String REDIS_CONTAINER="redis:alpine";
    private final static String INIT_SCRIPT_NAME="test.sql";
    private final static int REDIS_PORT=6379;

    static {
        String file = null;
        try {
            file = ResourceUtils.getFile("classpath:"+INIT_SCRIPT_NAME).getAbsoluteFile().toString();
            System.out.println(file);
        } catch (Exception e) {}

        PostgreSQLContainer postgres = new PostgreSQLContainer(POSTGRES_CONTAINER)
                .withDatabaseName("postgres")
                .withUsername("postgres")
                .withPassword("misha");
        postgres.withFileSystemBind(file, "/docker-entrypoint-initdb.d/init.sql",
                        BindMode.READ_ONLY)
                .start();
        String jdbcUrl = postgres.getJdbcUrl();
        jdbcUrl=jdbcUrl.replace("/postgres?", POSTGRES_DB);
        System.setProperty("DB_URL", jdbcUrl);
        System.out.println(jdbcUrl);
        System.setProperty("DB_USERNAME", postgres.getUsername());
        System.setProperty("DB_PASSWORD", postgres.getPassword());
        GenericContainer redis = new GenericContainer(DockerImageName.parse(REDIS_CONTAINER)).withExposedPorts(REDIS_PORT);
        redis.start();
        int redisPORT = redis.getFirstMappedPort();
        String redisHost = redis.getHost();
        System.setProperty("REDIS_HOST", redisHost);
        System.setProperty("REDIS_PORT", String.valueOf(redisPORT));
    }




    @Autowired
    private MockMvc mockMvc;

    @Test
    @WithMockUser(roles="USER")
    void getInfoReturnsForAuthorisedUser() throws Exception {
        MvcResult result = mockMvc.perform(get("/v1/indicators"))
                .andExpect(status().isOk()).andReturn();
    }

//    @Test
//    void getInfoFailsForAnonymousUser() throws Exception {
//        MvcResult result = mockMvc.perform(get("/v1/indicators"))
//                .andExpect(status().isForbidden()).andReturn();
//        String resp = result.getResponse().getContentAsString();
//    }
}
