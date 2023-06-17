package com.rideshare.party.domain;

import lombok.Data;

@Data
public class PartyDTO {
    private int pId;
    private String type;
    private String startPoint;
    private String startLat;
    private String startLng;
    private String endPoint;
    private int totalHeadcnt;
    private String startDate;
    private String startTime;
    private String carNumber;
    private String content;
}
