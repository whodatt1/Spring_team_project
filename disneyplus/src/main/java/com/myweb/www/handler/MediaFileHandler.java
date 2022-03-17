package com.myweb.www.handler;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.tika.Tika;
import org.joda.time.LocalDate;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.www.domain.MediaFileVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Slf4j
@AllArgsConstructor
@Component
public class MediaFileHandler {
	private final String UP_DIR = "/codingman875/tomcat/webapps/fileUpload";
	
	public List<MediaFileVO> uploadFiles(MultipartFile[] files){
		LocalDate date = LocalDate.now();
		String today = date.toString();
		today = "media"+File.separator + today.replace("-", File.separator);
		
		File folders = new File(UP_DIR, today);
		
		if(!folders.exists()) {
			folders.mkdirs();
		}
		
		List<MediaFileVO> mfList = new ArrayList<MediaFileVO>();
		for(MultipartFile file: files) {
			MediaFileVO mfvo = new MediaFileVO();
			mfvo.setSaveDir(today);
			mfvo.setFileSize(file.getSize());
			
			String originalFileName = file.getOriginalFilename();
			log.debug(">>> originalFileName : {}", originalFileName);
			
			String onlyFileName = originalFileName.substring(
					originalFileName.lastIndexOf("\\")+1);
			mfvo.setFileName(onlyFileName);
			
			UUID uuid = UUID.randomUUID();
			mfvo.setUuid(uuid.toString());
			
			String fullFileName = uuid.toString() + onlyFileName;
			File storeFile = new File(folders,fullFileName);
			
			try {
				file.transferTo(storeFile);
				if(isImageFile(storeFile)) {
					mfvo.setFileType(1);
					File thumbNail = new File(folders,
							uuid.toString() + "_ps_" + onlyFileName);
					Thumbnails.of(storeFile).size(232, 130).toFile(thumbNail);
				}
				
			} catch (Exception e) {
				log.debug(">>>> 파일 생성 오류!!!");
				e.printStackTrace();
			}
			mfList.add(mfvo);
		}
		return mfList;
	}
	
	private boolean isImageFile(File storeFile) throws IOException {
		String mimeType = new Tika().detect(storeFile);		
		return mimeType.startsWith("image") ? true : false;
	}
}
