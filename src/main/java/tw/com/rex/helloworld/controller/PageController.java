package tw.com.rex.helloworld.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class PageController {

    @RequestMapping(path = {"/", "/index"})
    public String index() {
        return "index";
    }

}
