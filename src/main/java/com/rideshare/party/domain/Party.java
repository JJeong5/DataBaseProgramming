package com.rideshare.party.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Party {
    private int pId;
    private String type;
    private String startDate;
    private String startTime;
    private String startPoint;
    private String startLat;
    private String startLng;
    private String endPoint;
    private int currentHeadcnt;
    private int totalHeadcnt;
    private Boolean isConfirm;
    private Boolean isFinish;
    private String carNumber;
    private String content;

//    // 날짜 반환
//    public String getStartDateStr() {
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//        return sdf.format(startTime);
//    }
//
//    // 시간 반환
//    public String getStartTimeStr() {
//        SimpleDateFormat sdf = new SimpleDateFormat("a KK:mm");
//        return sdf.format(startTime);
//    }
}
