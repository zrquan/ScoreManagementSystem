package org.zrquan.sms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.zrquan.sms.entity.User;
import org.zrquan.sms.service.UserServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@SessionAttributes("user")
public class UserController {

	@Autowired
	UserServiceImpl userService;

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@RequestParam String accountNumber,
						@RequestParam String password,
						Model model) {

		boolean valid = userService.verify(accountNumber, password);

		if (valid) {
			User user = userService.getUer(accountNumber);

			model.addAttribute("user", user);

			return String.format("redirect:%s/main", user.getUserType());
		} else {
			model.addAttribute("message", "Account number or password is not correct!");
			return "loginPage";
		}
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "loginPage";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public void register(HttpServletRequest request,
						 @ModelAttribute User user,
						 Model model) {
		//TODO: 注册用户，可设置头像
	}
}
