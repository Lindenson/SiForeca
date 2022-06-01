package com.wolper.service.impl;


import com.wolper.service.EMailService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;

@Log4j2
@Service
@RequiredArgsConstructor
public class EMailServiceImpl implements EMailService {

    @Value("${application.title}")
    private String appName;
    @Value("${email.resetText}")
    private String emailText;
    private final JavaMailSender javaMailSender;


    /**
     * Constructs a e-mail object form parameters
     * @param subject
     * @param body
     * @param user
     * @return SimpleMailMessage instance
     */
    private SimpleMailMessage constructEmail(String subject, String body, String user) {
        SimpleMailMessage email = new SimpleMailMessage();
        email.setSubject(subject);
        email.setText(body);
        email.setTo(user);
        email.setFrom(appName);
        return email;
    }

    /**
     * Asynchronously sends e-mail to user. Is used to send to a user a link which leads
     * him to a controllers methods in order to confirm a e-mail or a password
     * @param subject a e-mail topic
     * @param url a path to a controller method to process a confirmation,
     *            it also contains a token as a url parameter
     * @param user is a valid e-mail address
     */
    @Override
    @Async
    public void sendEmail(String subject, String url, String user){
        try {
            SimpleMailMessage message = constructEmail(subject, emailText + " \r\n" + url, user);
            javaMailSender.send(message);
        } catch (Exception ex) {log.error("Email sending error"+ex.getMessage().substring(0,50));}
    }
}
