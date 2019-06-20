package org.zrquan.sms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.zrquan.sms.entity.*;
import org.zrquan.sms.service.CommonServiceImpl;
import org.zrquan.sms.service.ManagerServiceImpl;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("manager")
public class ManagerController {
	@Autowired
	CommonServiceImpl commonService;
	@Autowired
	ManagerServiceImpl managerService;

	/**
	 * 设置用户基本信息
	 */
	@ModelAttribute
	public void setUserInfo(Model model,
							HttpSession session) {

		User user = (User) session.getAttribute("user");

		model.addAttribute("name", user.getUserName());
		model.addAttribute("number", user.getAccountNumber());
	}

	/**
	 * 个人信息页面
	 */
	@RequestMapping(value = {"profile"})
	public String getManagerProfile(Model model,
									HttpSession session) {

		User user = (User) session.getAttribute("user");
		Manager manager = managerService.getPersonalInfo(user.getAccountNumber());

		model.addAttribute("managerInfo", manager);

		return "manager/managerProfile";
	}

	/**
	 * 成绩审核页面
	 */
	@RequestMapping("score")
	public String auditScore(Model model) {
		String courses = managerService.getAuditCourse();
		model.addAttribute("courses", courses);

		return "manager/managerScore";
	}

	@RequestMapping("detail")
	public String auditScoreDetail(Model model,
								   @RequestParam int cid) {

		String scores = managerService.getAuditStudent(cid);
		model.addAttribute("scores", scores);

		return "manager/managerDetail";
	}

	@RequestMapping(value = {"submitScore"}, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String submitScore(@RequestParam String scores) {
		boolean success = managerService.submitScore(scores);

		if (success)
			return "成绩提交成功！";
		else
			return "提交失败！";
	}

	/**
	 * 课程管理页
	 */
	@RequestMapping(value = {"course", "main"})
	public String manageCourseInfo(Model model,
								   @RequestParam(value = "message", required = false) String message) {
		String courseJson = managerService.getCourseInfo();
		if (message != null && !message.equals(""))
			model.addAttribute("message", message);
		model.addAttribute("courses", courseJson);

		return "manager/managerCourse";
	}

	/**
	 * 教师管理页
	 */
	@RequestMapping("teacher")
	public String manageTeacherInfo(Model model,
									@RequestParam(value = "message", required = false) String message) {
		String teacherJson = managerService.getTeacherInfo();
		model.addAttribute("teachers", teacherJson);

		return "manager/managerTeacher";
	}

	/**
	 * 学生管理页
	 */
	@RequestMapping("student")
	public String manageStudentInfo(Model model,
									@RequestParam(value = "message", required = false) String message) {
		String studentJson = managerService.getStudentInfo();
		model.addAttribute("students", studentJson);

		return "manager/managerStudent";
	}

	/**
	 * 查询功能
	 *
	 * @param key     查询对象（课程、用户等）
	 * @param value   查询条件（名字、类型等）
	 * @param content 检索词
	 * @return Json
	 */
	@RequestMapping(value = "search/{key}/{value}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String search(@PathVariable String key,
						 @PathVariable String value,
						 @RequestParam String content) {

		String result = "";
		if (key.equals("course")) {
			result = managerService.searchCourse(value, content);
		}
		if (key.equals("user")) {
			result = managerService.searchUser(value, content);
		}

		return result;
	}

	/**
	 * 增加课程
	 */
	@RequestMapping("add/course")

	public String addCourse(Model model,
							@ModelAttribute Course course,
							@RequestParam String teacherName) {

		boolean success = managerService.addCourse(course, teacherName);
		if (success) {
			model.addAttribute("message", "添加成功");
		} else {
			model.addAttribute("message", "添加失败，务必先完善教师信息");
		}

		return "redirect:/manager/course";
	}

	/**
	 * 增加教师
	 */
	@RequestMapping("add/teacher")
	public String addTeacher(Model model,
							 @ModelAttribute Teacher teacher,
							 @RequestParam int deptId,
							 @RequestParam(required = false) String email,
							 @RequestParam(required = false) String phone) {

		boolean success = false;
		try {
			success = managerService.addTeacher(teacher, deptId, email, phone);
			if (success) {
				model.addAttribute("message", "添加成功");
			} else {
				model.addAttribute("message", "添加失败");
			}
		} catch (DuplicateKeyException e) {
			model.addAttribute("message", "账号已存在");
		} catch (Exception e) {
			model.addAttribute("message", "未知错误");
		}

		return "redirect:/manager/user";
	}

	/**
	 * 增加学生
	 */
	@RequestMapping("add/student")
	public String addStudent(Model model,
							 @ModelAttribute Student student,
							 @RequestParam int majorId,
							 @RequestParam(required = false) String email,
							 @RequestParam(required = false) String phone) {

		boolean success = false;
		try {
			success = managerService.addStudent(student, majorId, email, phone);
			if (success) {
				model.addAttribute("message", "添加成功");
			} else {
				model.addAttribute("message", "添加失败");
			}
		} catch (DuplicateKeyException e) {
			model.addAttribute("message", "账号已存在");
		} catch (Exception e) {
			model.addAttribute("message", "未知错误");
		}

		return "redirect:/manager/user";
	}

	@RequestMapping("add/manager")
	public String addManager(Model model,
							 @ModelAttribute Manager manager,
							 @RequestParam int deptId,
							 @RequestParam String email,
							 @RequestParam String phone) {

		boolean success = false;
		try {
			success = managerService.addManager(manager, deptId, email, phone);
			if (success) {
				model.addAttribute("message", "添加成功");
			} else {
				model.addAttribute("message", "添加失败");
			}
		} catch (DuplicateKeyException e) {
			model.addAttribute("message", "账号已存在");
		}

		return "redirect:/manager/user";
	}

	/**
	 * 用户管理页
	 */
	@RequestMapping("user")
	public String manageUserInfo(Model model,
								 @RequestParam(value = "message", required = false) String message) {
		String userJson = managerService.getUserInfo();
		String deptJson = commonService.retrieveDept();
		String majorJson = commonService.retrieveMajor();
		model.addAttribute("users", userJson);
		model.addAttribute("depts", deptJson);
		model.addAttribute("majors", majorJson);

		if (message != null && !message.equals(""))
			model.addAttribute("message", message);

		return "manager/managerUser";
	}

	@RequestMapping("searchTeacher")
	public String searchTeacher(Model model, @RequestParam String content) {
		String teacherJson = managerService.searchTeacher(content);
		model.addAttribute("teachers", teacherJson);

		return "manager/managerTeacher";
	}

	@RequestMapping("searchStudent")
	public String searchStedent(Model model, @RequestParam String content) {
		String studentJson = managerService.searchStudent(content);
		model.addAttribute("students", studentJson);
		return "manager/managerStudent";
	}

	@RequestMapping("feedback")
	public String handleFeedback(Model model) {
		String feedback = managerService.getFeedback();
		model.addAttribute("feedback", feedback);
		return "manager/manegerFeedback";
	}

	@RequestMapping("deleteFeedback")
	public String deleteFeedback(@RequestParam int id) {
		managerService.deleteFeedback(id);
		return "redirect:/manager/feedback";
	}
}
