package com.example.ASM.service;


import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class emailServiceImpl implements emailService {
    private JavaMailSender sender;

    @Autowired
    public emailServiceImpl(JavaMailSender sender) {
        this.sender = sender;
    }

    @Override
    public void sendMail(String to, String subject, String text) {
//        SimpleMailMessage message = new SimpleMailMessage();
        MimeMessage mimeMessage = sender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(text, true);
            sender.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
//        message.setTo(to);
//        message.setSubject(subject);
//        message.setText(text);
//        sender.send(message);
    }
}
