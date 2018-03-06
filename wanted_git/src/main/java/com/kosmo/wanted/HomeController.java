package com.kosmo.wanted;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import wanted.sell.dao.AttachedFileDAO;
import wanted.sell.dao.AttachedFileDAOImpl;
import wanted.sell.dao.SellDAOImpl;
import wanted.sell.dao.SeqImpl;
import wanted.sell.dto.AttachedFileDTO;
import wanted.sell.dto.SellDTO;

// 판매글에 관련된 기능과, 파일 업다운로드, 삭제, 수정에 관련된 기능
@Controller
public class HomeController 
{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) 
	{
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping("fileUpload.do")
	public String fileUploadTest()
	{
		return "fileUploadTest";
	}
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("sellList.do")
	public String list(Model model)
	{
		SellDAOImpl dao = sqlSession.getMapper(SellDAOImpl.class);
		ArrayList<SellDTO> lists = dao.list();
		
		model.addAttribute("lists", lists);
		System.out.println("리스트 출력 완료");
		
		return "sell/sellList";
	}
	
	@RequestMapping("sellWrite.do")
	public String writeForm()
	{
		return "sell/sellForm";
	}
	
	@RequestMapping("sellWriteAction.do")
	public String writeAction(Model model, HttpServletRequest req) 
			throws IllegalStateException, IOException
	{
		// 시퀀스 생성
		SeqImpl seq = sqlSession.getMapper(SeqImpl.class);
		seq.insert();
		//==============================================================//
		// 파일 업로드
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
		//==============================================================//
		SellDAOImpl dao = sqlSession.getMapper(SellDAOImpl.class);
		
		dao.write(req.getParameter("brand"), req.getParameter("model"), req.getParameter("grade"), req.getParameter("year"),
				req.getParameter("km"), req.getParameter("fuel"), req.getParameter("transmission"), 
				req.getParameter("title"), req.getParameter("contents"), req.getParameter("price"), 
				req.getParameter("id"));
		
		System.out.println("판매글 등록 완료");
		
		return "redirect:sellList.do";
	}
	
	@RequestMapping("/sellView.do")
	public String sellView(HttpServletRequest req, Model model)
	{
		String idx = req.getParameter("idx");
		SellDAOImpl dao = sqlSession.getMapper(SellDAOImpl.class);
		SellDTO dto = dao.view(idx);
		
		AttachedFileDAOImpl fileDAO = sqlSession.getMapper(AttachedFileDAOImpl.class);
		ArrayList<AttachedFileDTO> fileDTO = fileDAO.select(idx);
		
		// 줄 바꿈 처리
		dto.setContents(dto.getContents().replaceAll("\r\n", "<br/>"));
		
		model.addAttribute("dto", dto);
		model.addAttribute("file", fileDTO);
		
		System.out.println("상세보기 출력 완료");
		
		return "sell/sellView";
	}
	
	@RequestMapping("fileDownload.do")
	public void fileDownload(HttpServletRequest req, HttpServletResponse resp) 
			throws Exception
	{
		// 원본파일명으로 서버에 저장된 파일명을 가져온다.
		AttachedFileDAOImpl fileDAO = sqlSession.getMapper(AttachedFileDAOImpl.class);
		String serverfile = fileDAO.selectFile(req.getParameter("idx"), req.getParameter("originalfile"));
		
		// 서버의 물리적 경로
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		// 최종 경로
		String fullPath = path + "/" + serverfile;
		// 최종경로가 맞는지 찍어보기 위함
		System.out.println("최종경로 : " + fullPath);
		
		File downloadFile = new File(fullPath);
		
		if(!downloadFile.canRead())
		{
			throw new Exception("File can't read.");
		}
		
		// 다운로드를 하기 위한 type과 length 설정
		resp.setContentType("application/download; charset=UTF-8");
		resp.setContentLength((int)downloadFile.length());
		
		// 다운로드 창을 띄우기 위한 헤더조작
		resp.setHeader("Content-Disposition", "attachment; filename = " + 
				new String(req.getParameter("originalfile").getBytes(), "ISO8859_1"));
		resp.setHeader("Content-Transfer-Encoding", "binary");
		
		FileInputStream fin = new FileInputStream(downloadFile);
		ServletOutputStream sout = resp.getOutputStream();
		
		byte[] buf = new byte[1024];
		int size = -1;
		
		while((size = fin.read(buf, 0, buf.length)) != -1)
		{
			sout.write(buf, 0, size);
		}
		
		fin.close();
		sout.close();
	}
	
	@RequestMapping("/sellDelete.do")
	public String sellDelete(HttpServletRequest req)
	{
		AttachedFileDAOImpl fileDAO = sqlSession.getMapper(AttachedFileDAOImpl.class);
		List<String> list = fileDAO.selectDelete(req.getParameter("idx"));
		fileDAO.deleteFile(req.getParameter("idx"));
		
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println("삭제 경로 : " + path + "list 사이즈: " + list.size());
		
		for(int i=0; i<list.size(); i++)
		{
			String fullPath = path + "/" + list.get(i);
			System.out.println("삭제 경로 : " + fullPath);
			
			File file = new File(fullPath);
			
			if(file.exists()==true)
				file.delete();
		}
	
		SellDAOImpl dao = sqlSession.getMapper(SellDAOImpl.class);
		dao.delete(req.getParameter("idx"));
		
		System.out.println("삭제 완료");
		
		return "redirect:sellList.do";
	}
	
	@RequestMapping("/fileDelete.do")
	public String fileDelete(HttpServletRequest req)
	{
		AttachedFileDAOImpl fileDAO = sqlSession.getMapper(AttachedFileDAOImpl.class);
		// originalfile을 이용하여 서버에 저장된 파일명을 가져온다.
		String serverfile = fileDAO.selectFileDelete(req.getParameter("originalfile"));
		System.out.println(serverfile);
		// DB에서 originalfile을 지운다.
		fileDAO.deleteOneFile(req.getParameter("originalfile")); 
		
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println("삭제 경로 : " + path);
		
		String fullPath = path + "/" + serverfile;
		System.out.println("삭제 경로 : " + fullPath);
		
		File file = new File(fullPath);
		
		// 해당 경로에 파일이 존재하면 파일을 삭제
		if(file.exists()==true)
			file.delete();
		
		System.out.println("파일 삭제 완료");
		
		return "redirect:sellModifyForm.do?idx=" + req.getParameter("idx");
	}
	
	@RequestMapping("/sellModifyForm.do")
	public String sellModifyForm(HttpServletRequest req, Model model)
	{
		SellDAOImpl dao = sqlSession.getMapper(SellDAOImpl.class);
		SellDTO dto = dao.view(req.getParameter("idx"));
		
		AttachedFileDAOImpl fileDAO = sqlSession.getMapper(AttachedFileDAOImpl.class);
		ArrayList<AttachedFileDTO> fileDTO = fileDAO.select(req.getParameter("idx"));
		
		// 줄 바꿈 처리
		//dto.setContents(dto.getContents().replace("\r\n", "<br/>"));
		
		model.addAttribute("dto", dto);
		model.addAttribute("file", fileDTO);
		
		System.out.println("수정하기 출력 완료");
		
		return "sell/modifyForm";
	}
	
	@RequestMapping("/sellModifyAction.do")
	public String sellModifyAction(HttpServletRequest req, Model model)
			throws IllegalStateException, IOException
	{
		SellDAOImpl dao = sqlSession.getMapper(SellDAOImpl.class);
		
		// 첨부파일 수정
		AttachedFileDAOImpl fileDAO = sqlSession.getMapper(AttachedFileDAOImpl.class);
		
		// 만약 파일이 추가되었으면 실행되지만, 추가가 없다면 실행되지 않는다.
		//==============================================================//
		// 파일 업로드
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println("저장 경로 : " + path);
		
		// 파일업로드를 하기위한 MultipartHttpServletRequest 객체 생성
		MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
		Iterator<String> itr = mhsr.getFileNames();
		
		String fileName = "";
		File directory = new File(path);
		AttachedFileDAO aFileDAO = new AttachedFileDAO();
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
				hash = aFileDAO.insertUpdate(originalFile, serverFile, fileSize, req.getParameter("idx"));
				
				// DB에 저장
				fileDAO.insertUpdate(hash);
			}
		}
		//==============================================================//
		
		dao.modify(req.getParameter("idx"), req.getParameter("brand"), req.getParameter("model"), req.getParameter("grade"), 
				req.getParameter("year"), req.getParameter("km"), req.getParameter("fuel"), 
				req.getParameter("transmission"),req.getParameter("title"), req.getParameter("contents"), 
				req.getParameter("price"));
		
		System.out.println("수정 완료");
		
		return "redirect:sellView.do?idx=" + req.getParameter("idx");
	}
}
