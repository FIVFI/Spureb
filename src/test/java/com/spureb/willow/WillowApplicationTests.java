package com.spureb.willow;

import org.junit.Test;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class WillowApplicationTests {

    @Test
    public void contextLoads() {
        String password = "12345";
        String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println(hashed);

        String hashed01 = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println(hashed01);

        String hashed02 = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println(hashed02);


        String hashed03 = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println(hashed03);


        String hashed04 = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println(hashed04);

        String hashed05 = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println(hashed05);
    }

}
