package com.rideshare.party.domain;

import lombok.Data;

@Data
public class ScrollDTO {
    private Integer lastId, amount;
    private String type, keyword;
}
