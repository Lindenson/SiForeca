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
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;



@SpringBootTest(classes = {SiForeca.class})
@AutoConfigureMockMvc
@ActiveProfiles("test")


@Log4j2
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class MockRESTontrollerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    @WithMockUser(roles="USER")
    void getInfoReturnsForAuthorisedUser() throws Exception {
        MvcResult result = mockMvc.perform(get("/api/info"))
                .andExpect(status().isOk()).andReturn();
        String resp = result.getResponse().getContentAsString();
        assertTrue(resp.equals("I am working and health"));
    }

    @Test
    void getInfoFailsForAnonymousUser() throws Exception {
        MvcResult result = mockMvc.perform(get("/api/info"))
                .andExpect(status().isForbidden()).andReturn();
        String resp = result.getResponse().getContentAsString();
    }
}
