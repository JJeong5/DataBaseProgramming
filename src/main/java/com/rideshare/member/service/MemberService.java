package com.rideshare.member.service;

import com.rideshare.member.domain.AuthDTO;
import com.rideshare.member.domain.Member;
import com.rideshare.member.domain.MemberJoinDTO;
import com.rideshare.member.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.util.Random;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberService {

    private final MemberMapper memberMapper;
    private final JavaMailSender javaMailSender;

    public void join(MemberJoinDTO inputData) throws MessagingException {
        int authCode = new Random().nextInt(888888) + 111111; //111111 ~ 999999 6자리 난수 생성
        Member member = new Member(0, inputData.getId(), inputData.getPw(), inputData.getNickname(), inputData.getEmail(), authCode, false);
        memberMapper.join(member);
        sendMail(member);
        log.info("member = {}", member);
    }

    public void sendMail(Member member) throws MessagingException {
        String fromMail = "knu.rideshare@gmail.com"; //email-config에 설정한 자신의 이메일 주소(보내는 사람)
        String toMail = member.getEmail(); //받는 사람
        String title = "RideShare 회원가입 인증 링크"; //제목
        String authLink = "http://localhost:8080/members/auth?id=" + member.getId() + "&authCode=" + member.getAuthCode();
        String text =
                "<!DOCTYPE html>\n" +
                "<html>\n" +
                "<body>\n" +
                "<div style=\"margin:100px;\">\n" +
                "    <h1> 안녕하세요.</h1>\n" +
                "    <h1> 택시팟/카풀 매칭 서비스 RideShare 입니다.</h1>\n" +
                "    <br>\n" +
                "        <p> 아래 링크를 클릭해 회원가입을 완료해 주세요.</p>\n" +
                "    <br>\n" +
                "    <div align=\"center\" style=\"border:1px solid black; font-family:verdana;\">\n" +
                "    <h3> " + "<a href=\"" + authLink + "\">" + authLink + "</h3>\n" +
                "    </div>\n" +
                "    <br/>\n" +
                "</div>\n" +
                "</body>\n" +
                "</html>";

        MimeMessage message = javaMailSender.createMimeMessage();
        message.setFrom(fromMail); //보내는 이메일
        message.addRecipients(MimeMessage.RecipientType.TO, toMail); //보낼 이메일 설정
        message.setSubject(title); //제목 설정
        message.setText(text, "utf-8", "html");

        javaMailSender.send(message);
    }

    public String auth(AuthDTO inputData) {
        log.info("AuthDTO={}", inputData);
        Integer dbAuthCode = memberMapper.findAuthCodeById(inputData.getId()); //데이터베이스에 저장된 authCode
        if (dbAuthCode == null || inputData.getAuthCode() != dbAuthCode) {
            return "failure";
        } else {
            memberMapper.updateAuthStatus(inputData.getId());
            return "success";
        }
    }
}
