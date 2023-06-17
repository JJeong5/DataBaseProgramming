package com.rideshare.member.mapper;

import com.rideshare.member.domain.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    void join(Member inputData);

    Integer findAuthCodeById(String id);

    void updateAuthStatus(String id);

}
