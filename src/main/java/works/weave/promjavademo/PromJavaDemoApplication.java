package works.weave.promjavademo;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@RestController
@EnableAutoConfiguration
@SpringBootApplication
public class PromJavaDemoApplication {

    @RequestMapping("/")
    @ResponseBody
    String home() {
        return "Hello, JavaOne '17!";
    }

    public static void main(String[] args) throws Exception {
        SpringApplication.run(PromJavaDemoApplication.class, args);
    }
}
