package com.rideshare.member.domain;

import lombok.Data;

@Data
public class AuthDTO {
    private String id;
    private int authCode;
}
