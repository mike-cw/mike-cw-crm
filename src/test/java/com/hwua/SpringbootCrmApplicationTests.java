package com.hwua;

import com.hwua.service.LuceneProductService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SpringbootCrmApplicationTests {
    @Autowired
    private LuceneProductService luceneProductService;
    @Test
    void contextLoads()throws Exception {
        luceneProductService.createIndex();
    }

}
