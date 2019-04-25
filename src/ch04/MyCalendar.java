package ch04;

import java.util.Calendar;

public class MyCalendar {
	public static String getTime()
	{
	Calendar c = Calendar.getInstance();
	int hour = c.get(Calendar.HOUR_OF_DAY);
	int minute = c.get(Calendar.MINUTE);
	int second = c.get(Calendar.SECOND);
	return "현재 시간은 "+ hour + "시 " + minute + "분 " + second + "초입니다.";
	}
}
