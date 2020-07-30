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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
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

    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();

    @PostMapping("/")
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Messages message,
            BindingResult bindingResult,
            @RequestParam int year,
            @RequestParam String colour,
            Model model,
            @RequestParam ("file")MultipartFile file,
            @RequestParam ("file2")MultipartFile file2,
            @RequestParam ("file3")MultipartFile file3,
            @RequestParam("myTextArea") String comment
    ) throws IOException {
        message.setAuthor(user);

        if ( !comment.equals(""))
            message.setComment(comment + "\n" + "Updated: " + dateFormat.format(date));
        else
            message.setComment("Chubaka moy geroy");

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
             if (file2 != null && !file2.getOriginalFilename().isEmpty()) {


                String uuidFile = UUID.randomUUID().toString();
                String resultFileName2 = uuidFile + "." + file2.getOriginalFilename();

                file2.transferTo(new File(uploadPath + "/" + resultFileName2));

                message.setFilename2(resultFileName2);
            }
             if (file3 != null && !file3.getOriginalFilename().isEmpty()) {

                String uuidFile = UUID.randomUUID().toString();
                String resultFileName3 = uuidFile + "." + file3.getOriginalFilename();

                file3.transferTo(new File(uploadPath + "/" + resultFileName3));

                message.setFilename3(resultFileName3);
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

    // refresh button logic
    @PostMapping("refresh")
    public String refresh(@RequestParam("id") Long id, @RequestParam("myTextArea") String comment, Map<String, Object> model ){

        Messages message = messageRepo.findById(id);
        message.setComment(comment);
        messageRepo.save(message);

        Iterable<Messages> messages = messageRepo.findAll();
        model.put("messages", messages);
        return "db";
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