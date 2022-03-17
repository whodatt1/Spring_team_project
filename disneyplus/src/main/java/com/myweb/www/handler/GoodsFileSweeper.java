package com.myweb.www.handler;

import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.joda.time.LocalDate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.myweb.www.domain.GFileVO;
import com.myweb.www.repository.GFileDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class GoodsFileSweeper {
	private final String BASE_PATH = "/codingman875/tomcat/webapps/fileUpload";
	
	@Inject
	private GFileDAO gfdao;
	
	@Scheduled(cron = "1 59 1 * * *")
	public void goodsFileSweeper() throws Exception {
		List<GFileVO> dbGFiles = gfdao.selectAllGFileList();
		
		List<String> currFiles = new ArrayList<String>();
		
		for (GFileVO gfvo : dbGFiles) {
			String filePath = gfvo.getSaveDir() + "\\" + gfvo.getUuid();
			String fileName = gfvo.getFileName();
			currFiles.add(BASE_PATH + filePath + "_" + fileName);
			
			if (gfvo.getFileType() > 0) {
				currFiles.add(BASE_PATH + filePath + "_th_" + fileName);
			}
		}
		
		LocalDate now = LocalDate.now().minusDays(1);
		String today = now.toString();
		today = "goods" + File.separator + today.replace("-", File.separator);
		
		File dir = Paths.get(BASE_PATH + today).toFile();
		File[] allFilesObjects = dir.listFiles();
		
		for (File file : allFilesObjects) {
			String storedFileName = file.toPath().toString();
			
			if (!currFiles.contains(storedFileName)) {
				file.delete();
			}
		}
	}
}
