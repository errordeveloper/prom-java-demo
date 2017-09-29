package works.weave.promjavademo;

import org.springframework.boot.*;
import org.springframework.boot.autoconfigure.*;
import org.springframework.web.bind.annotation.*;

@RestController
@EnableAutoConfiguration
@SpringBootApplication
public class PromJavaDemoApplication {
    static int counter = 0;

    @RequestMapping("/")
    @ResponseBody
    String home() {
        counter++;
        return "Hello, JavaOne '17!";
    }

    @RequestMapping("/hits")
    @ResponseBody
    String hits() {
        return String.valueOf(counter);
    }

    public static void main(String[] args) throws Exception {
        SpringApplication.run(PromJavaDemoApplication.class, args);
    }
}
