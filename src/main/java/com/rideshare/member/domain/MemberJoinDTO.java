package com.rideshare.member.domain;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;

@Data
@Setter(AccessLevel.NONE)
public class MemberJoinDTO {
    private String id;
    private String pw;
    private String nickname;
    private String email;
}
