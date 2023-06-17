package com.rideshare.member.domain;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Setter;

@Data
@AllArgsConstructor
@Setter(AccessLevel.NONE)
public class Member {
    private int mId;
    private String id;
    private String pw;
    private String nickname;
    private String email;
    private int authCode;
    private Boolean authStatus;
}
