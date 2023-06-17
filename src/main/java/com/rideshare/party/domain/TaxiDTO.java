package com.rideshare.party.domain;

import lombok.*;

@Data
@Setter(AccessLevel.NONE)
public class TaxiDTO {
    private int pId;
    private String startPoint;
    private String startLat;
    private String startLng;
    private String endPoint;
    private int totalHeadcnt;
    private String startDate;
    private String startTime;
}
