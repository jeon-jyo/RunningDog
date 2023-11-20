package com.runningdog.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class LogicTest {
	public static void main(String[] args) {
		
		ArrayList<Object> arr = new ArrayList<Object>(Arrays.asList(
			/* 0~9 */
			0,1,2,3,4,5,6,7,8,9,
			/* A~Z */
			"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
		));
		
		StringBuffer sb = new StringBuffer();
		
		for(int i=0;i<6;i++){
			Object code = arr.get((int) (Math.random() * arr.size()));
			sb.append(code);
		}

		System.out.println(sb);
		
		
		
		List<Integer> list = new ArrayList<>() {
		    {
		        add(1);
		        add(2);
		        add(3);
		    }
		};
		
		System.out.println(list);
		
		for(int i = 0; i < 8; i++) {
			System.out.println(list.get(i));
		}
		
	}
}
