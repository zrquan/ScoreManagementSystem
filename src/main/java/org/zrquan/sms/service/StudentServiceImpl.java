package org.zrquan.sms.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zrquan.sms.dao.CourseDao;
import org.zrquan.sms.dao.ScoreDao;
import org.zrquan.sms.dao.StudentDao;
import org.zrquan.sms.dao.TempScoreDao;
import org.zrquan.sms.entity.Course;
import org.zrquan.sms.entity.Major;
import org.zrquan.sms.entity.Score;
import org.zrquan.sms.entity.Student;
import org.zrquan.sms.service.interfaces.StudentService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	StudentDao studentDao;
	@Autowired
	ScoreDao scoreDao;
	@Autowired
	CourseDao courseDao;
	@Autowired
	TempScoreDao tempScoreDao;

	@Override
	public Student getStudentInfo(String number) {
		Student student = studentDao.getStudentByNumber(number);

		return student;
	}

	@Override
	public String getScoreInfo(String number) {
		List<Score> scores = scoreDao.getScoreByStudentNumber(number);
		for (Score score : scores) {
			// 课程排名
			int sid = score.getStudent().getId();
			Course course = score.getCourse();
			int cid = course.getId();
			score.setCrank(getCourseRank(sid, cid));
			// 课程人数
			int count = scoreDao.getCourseStudentCount(cid);
			course.setStudentCount(count);
		}

		String result = JSON.toJSONString(scores);
		return result;
	}

	@Override
	public String getCreditInfo(String number) {
		JSONObject result = new JSONObject();
		HashMap<String, String> types = new HashMap<String, String>() {{
			put("pncredit", "专必");
			put("cncredit", "公必");
			put("pscredit", "专选");
			put("cscredit", "公选");
		}};
		Major major = studentDao.getStudentByNumber(number).getMajor();
		List<Score> scores = scoreDao.getScoreByStudentNumber(number);
		List<Score> tscores = tempScoreDao.getScoreByStudentNumber(number);

		for (Map.Entry<String, String> type : types.entrySet()) {
			JSONObject attr = new JSONObject();
			ArrayList<Integer> clist = getTypeCreditList(scores, type.getValue());
			ArrayList<Integer> tclist = getTypeCreditList(tscores, type.getValue());
			// 已获学分
			int obtainCredit = getListSum(clist);
			attr.put("obtainCredit", obtainCredit);
			// 已修学分
			attr.put("totalCredit", obtainCredit + getListSum(tclist));
			// 已获学分课程数
			attr.put("courseCount", clist.size());

			result.put(type.getKey(), attr);
		}

		return result.toJSONString();
	}

	@Override
	public Major getMajorInfo(String number) {
		return studentDao.getStudentByNumber(number).getMajor();
	}

	private int getListSum(ArrayList<Integer> list) {
		int sum = 0;
		for (Integer integer : list) sum += integer;

		return sum;
	}

	private ArrayList<Integer> getTypeCreditList(List<Score> scores, String type) {
		ArrayList<Integer> result = new ArrayList<>();
		for (Score score : scores) {
			if (score.getCourse().getType().equals(type))
				result.add(score.getCourse().getCredit());
		}
		return result;
	}


	/**
	 * 获取某学生在某课程的排名
	 */
	private int getCourseRank(int sid, int cid) {
		List<Double> total = courseDao.getValueList(cid);
		Double myScore = studentDao.getCourseScore(cid, sid);
		if (total.contains(myScore)) {
			return total.indexOf(myScore) + 1;
		}
		return -1;
	}
}
