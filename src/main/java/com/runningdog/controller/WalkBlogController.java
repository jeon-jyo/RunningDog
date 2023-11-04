package com.runningdog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value="/walkBlog")
@Controller
public class WalkBlogController {
	
	
	
	
	@RequestMapping(value = "home")
	public String home() {
		return"walkBlog/walkBlogHome";
	}
	
	@RequestMapping(value = "userBlog")
	public String userBlog() {
		return"walkBlog/userBlog";
	}
	
	@RequestMapping(value = "detail")
	public String detail() {
		return"walkBlog/detail";
	}
	
}
