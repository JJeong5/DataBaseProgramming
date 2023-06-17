package com.rideshare.party.service;

import com.rideshare.party.domain.PartyDTO;
import com.rideshare.party.domain.Party;
import com.rideshare.party.domain.ScrollDTO;
import com.rideshare.party.mapper.PartyMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class PartyService {

    private final PartyMapper partyMapper;

    public Party partySave(PartyDTO party) {
        partyMapper.partySave(party);
        return partyMapper.findById(party.getPId());
    }

    public List<Party> listPage(ScrollDTO scrollDTO) {
        return partyMapper.listPage(scrollDTO);
    }

    public Party findById(int pId) {
        return partyMapper.findById(pId);
    }

    public void clearAllStore() {
        partyMapper.clearAllStore();
    }

    public void deleteById(int pId) {
        partyMapper.deleteById(pId);
    }

    public Party updateById(PartyDTO inputData) {
        partyMapper.updateById(inputData);
        return partyMapper.findById(inputData.getPId());
    }

    public void onConfirm(int pId) {
        partyMapper.onConfirm(pId);
    }

    public void onFinish(int pId) {
        partyMapper.onFinish(pId);
    }

    public String increaseCurrentHeadcnt(int pId) {
        partyMapper.increaseCurrentHeadcnt(pId);
        return partyMapper.checkCurrentHeadcnt(pId);
    }
}
