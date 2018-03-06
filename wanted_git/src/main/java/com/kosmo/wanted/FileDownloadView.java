package com.kosmo.wanted;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class FileDownloadView extends AbstractView
{
	public FileDownloadView()
	{
		setContentType("application/download; charset=UTF-8");
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, 
			HttpServletRequest req, HttpServletResponse resp) throws Exception 
	{
		File file = (File)model.get("downloadFile");
		
		// 타입 설정
		resp.setContentType(getContentType());
		// 길이 설정
		resp.setContentLength((int)file.length());
		// 헤더설정(다운로드 창을 띄운다.)
		resp.setHeader("Content-Disposition", "attachment; filename=\"" + 
				java.net.URLEncoder.encode(file.getName(), "UTF-8") + "\";");
		resp.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = resp.getOutputStream();
		FileInputStream fis = null;
		
		try 
		{
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally
		{
			if(fis != null)
			{
				try { fis.close(); } catch (IOException e) { e.printStackTrace(); }
			}
			
			out.flush();
		}
	}
}
