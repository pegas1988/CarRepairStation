package com.example.sweater.repos;


import com.example.sweater.domain.Messages;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Map;
import java.util.Optional;


/**
 * Created by Администратор on 02.05.2020.
 */
public interface MessageRepo extends CrudRepository<Messages, Integer> {
    List <Messages> findByTag(String tag);
    Messages findById(Long id);



}
