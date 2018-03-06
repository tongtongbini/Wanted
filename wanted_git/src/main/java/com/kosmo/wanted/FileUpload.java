package com.kosmo.wanted;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import wanted.sell.dao.AttachedFileDAO;
import wanted.sell.dao.AttachedFileDAOImpl;

public class FileUpload
{
	public FileUpload() {}
	
	@Autowired
	private SqlSession sqlSession;
	
	public void fileUpload(HttpServletRequest req) 
			throws IllegalStateException, IOException
	{
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println("저장 경로 : " + path);
		
		// 파일업로드를 하기위한 MultipartHttpServletRequest 객체 생성
		MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
		Iterator<String> itr = mhsr.getFileNames();
		
		String fileName = "";
		File directory = new File(path);
		AttachedFileDAO fileDAO = new AttachedFileDAO();
		HashMap<String, Object> hash = null;
		
		// 업로드할 디렉토리가 있는지 확인 후
		if(!directory.isDirectory())
		{
			// 디렉토리가 없다면 생성
			directory.mkdirs();
		}
		
		// 넘어온 파일을 리스트에 저장
		List<MultipartFile> mf = null;
		
		while(itr.hasNext())
		{
			fileName = (String)itr.next();
			mf = mhsr.getFiles(fileName);
		}
		
		if(mf.size() == 1 && mf.get(0).getOriginalFilename().equals(""))
		{}
		else
		{
			for(int i=0; i<mf.size(); i++)
			{
				System.out.println("========== " + (i+1) + "번째 =========");
				// 파일명 중복안되게 처리
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				System.out.println("생성된 UUID : " + uuid);
				System.out.println("==========================");
				// 한글깨짐 방지
				String originalFile = new String(mf.get(i).getOriginalFilename().getBytes("8859_1"), "UTF-8");
				// 확장자 가져오기
				String ext = originalFile.substring(originalFile.indexOf("."));
				// 서버에 저장되는 파일명
				String serverFile = uuid + ext;
				File saveFile = new File(path + File.separator + serverFile);
				
				// 파일 사이즈
				long fileSize = mf.get(i).getSize();
				// 파일 저장
				mf.get(i).transferTo(saveFile);
				// 파일명 가져오기
				originalFile = mf.get(i).getOriginalFilename();
				System.out.println("originalFileName : " + originalFile + ", serverFileName : " + serverFile);
				System.out.println("==========================");
				
				// DB에 저장하기 위해 HashMap에 저장
				hash = fileDAO.insert(originalFile, serverFile, fileSize);
				
				// DB에 저장
				AttachedFileDAOImpl fDAO = sqlSession.getMapper(AttachedFileDAOImpl.class);
				fDAO.insert(hash);
			}
		}
	}
}
