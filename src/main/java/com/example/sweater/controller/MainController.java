package com.example.sweater.controller;

import com.example.sweater.domain.Messages;
import com.example.sweater.domain.User;
import com.example.sweater.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Controller
public class MainController {
    @Autowired
    private MessageRepo messageRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(
            @RequestParam(name="name", required=false, defaultValue="World") String name,
            Map<String, Object> model
    ) {
        model.put("name", name);
        return "greeting";
    }

    @GetMapping("/main")
    public String main(Map<String, Object> model) {
        Iterable<Messages> messages = messageRepo.findAll();

        model.put("messages", messages);

        return "main";
    }

    @PostMapping("/")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Messages message,
            BindingResult bindingResult,
            @RequestParam int year,
            @RequestParam String colour,
            Model model,
            @RequestParam ("file")MultipartFile file
    ) throws IOException {
        message.setAuthor(user);

        if (bindingResult.hasErrors()){
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);
        } else {

            if (file != null && !file.getOriginalFilename().isEmpty()) {
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                String uuidFile = UUID.randomUUID().toString();
                String resultFileName = uuidFile + "." + file.getOriginalFilename();

                file.transferTo(new File(uploadPath + "/" + resultFileName));

                message.setFilename(resultFileName);
            }

            model.addAttribute("message", null);
            messageRepo.save(message);
        }
        Iterable<Messages> messages = messageRepo.findAll();

        model.addAttribute("messages", messages);

        return "Dobavleno";
    }


    // delete button logic
    @PostMapping("deleted")
    public String delete(@RequestParam Long deleteId,  Map<String, Object> model ){

        messageRepo.delete(messageRepo.findById(deleteId));
        Iterable<Messages> messages;

        messages = messageRepo.findAll();
        model.put("messages", messages);
        return "deleted";
    }

    @PostMapping("filter")
    public String filter(@RequestParam String filter, Map<String, Object> model) {
        Iterable<Messages> messages;

        if (filter != null && !filter.isEmpty()){
            messages = messageRepo.findByTag(filter);
            model.put("filter", filter);
            model.put("messages", messages);
            return "filter";
        }
        else
            model.put("filter", "Модель не была ведена");
        return "main";
    }
    @PostMapping("db")
    public String db(Map<String, Object> model) {
        Iterable<Messages> messages;


            messages = messageRepo.findAll();
            model.put("messages", messages);

        return "db";
    }
}