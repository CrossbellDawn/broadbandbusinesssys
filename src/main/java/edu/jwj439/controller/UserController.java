package edu.jwj439.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.MDC;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.jwj439.entity.User;
import edu.jwj439.service.UserService;
import edu.jwj439.util.MD5Util;

@Controller
public class UserController {

	@Resource
	private UserService userService;
	private static final Logger log = Logger.getLogger(UserController.class);// 日志文件

	/**
	 * 登录
	 *
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/login")
	public String login(User user, HttpServletRequest request) {
		try {
			String MD5pwd = MD5Util.MD5Encode(user.getPassword(), "UTF-8");
			user.setPassword(MD5pwd);
		} catch (Exception e) {
			user.setPassword("");
		}
		User resultUser = userService.login(user);
		if (resultUser == null) {
			request.setAttribute("user", user);
			request.setAttribute("errorMsg", "请认真核对账号、密码！");
			return "login";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", resultUser);
			return "main";
		}
	}
	
	@RequestMapping("/main")
	public String toMain() {
		return "main";
	}
}