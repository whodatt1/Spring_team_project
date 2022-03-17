package com.myweb.www.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class MediaDTO {
	
	private MediaVO mvo;
	private List<MediaFileVO> mfList;
	private SeasonVO svo;
	
	public MediaDTO(SeasonVO svo2, List<MediaFileVO> mfList2) {
		this.svo=svo2;
		this.mfList=mfList2;
	}
	
	public MediaDTO(MediaVO mvo2, List<MediaFileVO> mfList2) {
		this.mvo=mvo2;
		this.mfList=mfList2;
	}
}
