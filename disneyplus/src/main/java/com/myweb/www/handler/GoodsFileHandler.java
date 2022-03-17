package com.myweb.www.handler;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.tika.Tika;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.www.domain.GFileVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;

@Slf4j
@AllArgsConstructor
@Component
public class GoodsFileHandler {
	private final String UP_DIR = "/codingman875/tomcat/webapps/fileUpload";
	
	
	public List<GFileVO> uploadGFiles(MultipartFile[] files) {
		LocalDate date = LocalDate.now();
		String today = date.toString();
		today = "goods" + File.separator + today.replace("-", File.separator);
		
		File folders = new File(UP_DIR, today);
		
		if (!folders.exists()) {
			folders.mkdirs();
		}
		List<GFileVO> gfList = new ArrayList<GFileVO>();
		for (MultipartFile file : files) {
			GFileVO gfvo = new GFileVO();
			gfvo.setSaveDir(today);
			gfvo.setFileSize(file.getSize());
			
			String originalFileName = file.getOriginalFilename();
			String onlyFileName = originalFileName.substring(originalFileName.lastIndexOf("\\")+1);
			gfvo.setFileName(onlyFileName);
			
			UUID uuid = UUID.randomUUID();
			gfvo.setUuid(uuid.toString());
			
			String fullFileName = uuid.toString() + "_" + onlyFileName;
			File storeFile = new File(folders, fullFileName);
			
			try {
				file.transferTo(storeFile);
				if (isImageFile(storeFile)) {
					gfvo.setFileType(1);
					File thumbNail = new File(folders,
							uuid.toString() + "_th_" + onlyFileName);
					Thumbnails.of(storeFile).size(640, 480).toFile(thumbNail);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			gfList.add(gfvo);
		}
		return gfList;
	}

	private boolean isImageFile(File storeFile) throws IOException {
		String mimeType = new Tika().detect(storeFile);
		return mimeType.startsWith("image") ? true : false;
	}
}
