package com.action;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.bean.News;
import com.dao.NewsDao;
import com.impl.NewsImp;

public class NewsAction extends SuperAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private File pic;
	private String picFileName;
	private News news;
	
	
	/*
	 *新闻发布
	 */
	public void add(){
		NewsDao newsDao=new NewsImp();
		News n=new News();
		File destFile1=new File(ServletActionContext.getServletContext().getRealPath("/upload")+"/"+picFileName);
		System.out.println(picFileName);
		System.out.println(news.getContent());
		n.setContent(news.getContent());
		n.setAdress(news.getAdress());
		n.setImg(picFileName);
		n.setTime(news.getTime());
		n.setTitle(news.getTitle());
		newsDao.Add(n);
		try {
			FileUtils.copyFile(pic, destFile1);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("shibai");
		}
	}

/*
 * 
 * 新闻显示
 */
	public String news(){
		NewsDao newsDao=new NewsImp();
		request.setAttribute("News", newsDao.All());
		return "News";
	}
	
	
	public File getPic() {
		return pic;
	}


	public void setPic(File pic) {
		this.pic = pic;
	}


	public String getPicFileName() {
		return picFileName;
	}


	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}


	public News getNews() {
		return news;
	}


	public void setNews(News news) {
		this.news = news;
	}
}
