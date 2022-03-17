package com.myweb.www.handler;

import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.myweb.www.domain.MediaFileVO;
import com.myweb.www.repository.MediaFileDAO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@AllArgsConstructor
public class FileSweeper {
	private final String BASE_PATH = "/codingman875/tomcat/webapps/fileUpload";
	
	private final MediaFileDAO mfdao;
	
	@Scheduled(cron = "00 00 23 * * *")
	public void fileSweeper() throws Exception{
		log.info(">>> FileSweeper Running Start : {}", LocalDateTime.now());
		
		List<MediaFileVO> dbFiles = mfdao.selectListAllMFiles();
		
		List<String> currFiles = new ArrayList<String>();
		
		for(MediaFileVO mfvo : dbFiles) {
			String filePath = mfvo.getSaveDir() + "\\" + mfvo.getUuid();
			String fileName = mfvo.getFileName();
			currFiles.add(BASE_PATH + filePath + "_" + fileName);
			
			if (mfvo.getFileType() > 0) {
				currFiles.add(BASE_PATH + filePath + "_ps_" + fileName);
			}
		}
		LocalDate now = LocalDate.now();
		String today = now.toString();
		today = "media"+File.separator + today.replace("-", File.separator);
		
		File dir = Paths.get(BASE_PATH + today).toFile();
		File[] allFileObjects = dir.listFiles();
		
		for (File file : allFileObjects) {
			String storedFileName = file.toPath().toString();
			if (!currFiles.contains(storedFileName)) {
				file.delete();
				log.info(">>> delete : {}", storedFileName);
			}
		}
		log.info(">>> FileSweeper Running Finish : {}", LocalDateTime.now());
	}
}
