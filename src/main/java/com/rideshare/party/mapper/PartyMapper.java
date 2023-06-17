package com.rideshare.party.mapper;

import com.rideshare.party.domain.PartyDTO;
import com.rideshare.party.domain.Party;
import com.rideshare.party.domain.ScrollDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PartyMapper {
    void partySave(PartyDTO party);

    List<Party> listPage(ScrollDTO scrollDTO);

    Party findById(int pId);

    void clearAllStore();

    void deleteById(int pId);

    void updateById(PartyDTO inputData);

    void onConfirm(int pId);

    void onFinish(int pId);

    void increaseCurrentHeadcnt(int pId);

    String checkCurrentHeadcnt(int pId);
}
