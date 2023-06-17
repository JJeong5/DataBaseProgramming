/*
package com.rideshare;

import com.rideshare.party.domain.Party;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@RequiredArgsConstructor
public class TestDataInit {
    private final PartyRepository partyRepository;
    private final DateFormatter df;



    @EventListener(ApplicationReadyEvent.class)
    public void init() {
        partyRepository.save(createTaxiParty("기숙사", "남춘천역", "37.865506537056945", "127.7428865998153"));
        partyRepository.save(createTaxiParty("후문", "남춘천역", "37.87254023957852", "127.7428865998153"));
        partyRepository.save(createTaxiParty("천지관", "남춘천역", "37.87120749003905", "127.7431938775162"));
        partyRepository.save(createTaxiParty("백록관", "남춘천역", "37.86834802802328", "127.74089219672092"));
        partyRepository.save(createTaxiParty("정문", "남춘천역", "37.86672499720904", "127.7382393718199"));
        partyRepository.save(createTaxiParty("남춘천역", "기숙사", "37.86376055875644", "127.72378876733613"));
        partyRepository.save(createTaxiParty("남춘천역", "공쪽", "37.86376055875644", "127.72378876733613"));
        partyRepository.save(createTaxiParty("터미널", "기숙사", "37.86285302526719", "127.71898430150439"));
        partyRepository.save(createTaxiParty("터미널", "자쪽", "37.86285302526719", "127.71898430150439"));
        partyRepository.save(createTaxiParty("후평동", "후문", "37.88003084891776", "127.74978421756462"));

        partyRepository.save(createCarpoolParty("기숙사", "남양주", "37.865506537056945", "127.7428865998153"));
        partyRepository.save(createCarpoolParty("백록관", "구리", "37.86834802802328", "127.74089219672092"));
        partyRepository.save(createCarpoolParty("기숙사", "의정부", "37.865506537056945", "127.7428865998153"));
        partyRepository.save(createCarpoolParty("천지관", "동대문", "37.87120749003905", "127.7431938775162"));
        partyRepository.save(createCarpoolParty("정문", "중랑구", "37.86672499720904", "127.7382393718199"));
        partyRepository.save(createCarpoolParty("공쪽", "청량리", "37.86930605749775", "127.73753776900334"));
        partyRepository.save(createCarpoolParty("평내호평역", "정문", "37.65302401170865", "127.24385587650094"));
        partyRepository.save(createCarpoolParty("가평역", "백록관", "37.815021830134356", "127.51220335717444"));
        partyRepository.save(createCarpoolParty("남춘천역", "기숙사", "37.86376055875644", "127.72378876733613"));
        partyRepository.save(createCarpoolParty("인천", "기숙사", "37.45659898525951", "126.70519922498092"));
    }

    private Party createTaxiParty(String start, String end, String lat, String lng) {
        return Party.builder()
                .type("택시")
                .startDate(df.dateToDateStr(new Date()))
                .startTime(df.dateToTimeStr(new Date()))
                .startPoint(start)
                .startLat(lat)
                .startLng(lng)
                .endPoint(end)
                .currentHeadcnt(2)
                .totalHeadcnt(4)
                .isConfirm(false)
                .isFinish(false)
                .build();
    }

    private Party createCarpoolParty(String start, String end, String lat, String lng) {
        return Party.builder()
                .type("카풀")
                .startDate(df.dateToDateStr(new Date()))
                .startTime(df.dateToTimeStr(new Date()))
                .startPoint(start)
                .startLat(lat)
                .startLng(lng)
                .endPoint(end)
                .currentHeadcnt(4)
                .totalHeadcnt(4)
                .isConfirm(true)
                .isFinish(true)
                .content("카풀내용예제asdfghjkdsfjdfjk")
                .carNumber("12가3456")
                .build();
    }
}
*/
