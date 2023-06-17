package com.rideshare.party.controller;

import com.rideshare.party.domain.PartyDTO;
import com.rideshare.party.domain.Party;
import com.rideshare.party.domain.ScrollDTO;
import com.rideshare.party.service.PartyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequestMapping("/parties")
@RequiredArgsConstructor
public class PartyController {

    private final PartyService partyService;

    @GetMapping //택시, 카풀 리스트 반환
    public List<Party> taxiList(@ModelAttribute ScrollDTO scrollDTO) {
        return partyService.listPage(scrollDTO);
    }

    @GetMapping("/{pId}") //id로 택시, 카풀 조회하기
    public Party allSearch(@PathVariable int pId) {
        log.info("call PartyController.allSearch");
        return partyService.findById(pId);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping
    public Party addParty(@RequestBody PartyDTO inputData) {
        log.info("{}", inputData);
        return partyService.partySave(inputData);
    }

    @DeleteMapping("/{pId}")
    public void remove(@PathVariable int pId) {
        partyService.deleteById(pId);
    }

    @PutMapping("/{pId}")
    public Party edit(@PathVariable int pId, @RequestBody PartyDTO inputData) {
        inputData.setPId(pId);
        return partyService.updateById(inputData);
    }

    @PutMapping("/{pId}/current-headcnt")
    public String increaseCurrentHeadcnt(@PathVariable int pId) {
        return partyService.increaseCurrentHeadcnt(pId);
    }

    @PutMapping("/{pId}/confirm")
    public void onConfirm(@PathVariable int pId) {
        partyService.onConfirm(pId);
    }

    @PutMapping("/{pId}/finish")
    public void onFinish(@PathVariable int pId) {
        partyService.onFinish(pId);
    }

}
