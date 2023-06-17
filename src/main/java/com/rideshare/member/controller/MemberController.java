package com.rideshare.member.controller;

import com.rideshare.member.domain.AuthDTO;
import com.rideshare.member.domain.MemberJoinDTO;
import com.rideshare.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;

@RestController
@RequestMapping("/members")
@RequiredArgsConstructor
@Slf4j
public class MemberController {

    private final MemberService memberService;

    @PostMapping
    public void join(@RequestBody MemberJoinDTO inputData) throws MessagingException {
        log.info("call MemberController.join");
        memberService.join(inputData);
    }

    @GetMapping("/auth")
    public String auth(@ModelAttribute AuthDTO inputData) {
        log.info("email={}, authCode={}", inputData.getId(), inputData.getAuthCode());
        return memberService.auth(inputData);
    }
}
