package com;



import com.wolper.dto.Grossbuch;
import com.wolper.repositories.GrossbuchRepo;
import com.wolper.service.impl.GrossbuchServiceImpl;
import lombok.extern.log4j.Log4j2;
import model.MapOfIndicators;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.ActiveProfiles;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;


import static org.junit.Assert.assertEquals;


@Log4j2
@ActiveProfiles("test")
@ExtendWith(MockitoExtension.class)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class MockDBServiceTest {


    @Mock
    private GrossbuchRepo grossbuchRepo;

    private GrossbuchServiceImpl grossbuchService;

    private static List<Grossbuch> gbList = null;


    @BeforeAll
    private static void setup() {
        createGrossbuchesList();
    }

    @BeforeEach
    private void tuneup() {
        this.grossbuchService=new GrossbuchServiceImpl(grossbuchRepo);
    }



    @Test
    void repositoryWorks() {
        Mockito.when(grossbuchRepo.findAll()).thenReturn(gbList);
        List<Grossbuch> all = grossbuchRepo.findAll();
        assertEquals(all.get(0).getId().longValue(), 1);
    }

    @Test
    void serviceWorks()  {
        Mockito.when(grossbuchRepo.findAllYears()).thenReturn(gbList.stream().map(Grossbuch::getDate).map(LocalDate::getYear).collect(Collectors.toList()));
        List<Integer> allYearsList = grossbuchService.getAllYearsList();
        assertEquals(allYearsList.get(0).longValue(), 2001);
    }

    @Test
    void serviceMethodWorks()  {
        Mockito.when(grossbuchRepo.findAllByCountryAndSectorAndActivity(Mockito.anyString(), Mockito.anyString(), Mockito.anyString())).thenReturn(gbList);
        MapOfIndicators list = grossbuchService.getDataForOneCountry("X","Y","Z");
        assertEquals(list.get(0).getIname(), "IEPGS");
    }


    private static void createGrossbuchesList() {
        Grossbuch grossbuch1 = new Grossbuch(1L, LocalDate.of(2001, 12, 12), BigDecimal.valueOf(0.0),"UPP","PYEAR","BNO","LKA","AEG","SWB","SPS","IEPGS","III","BSS","EG.ELC.NGAS.ZS");
        List<Grossbuch> grossbuches = List.of(grossbuch1);
        gbList=grossbuches;
    }
}
