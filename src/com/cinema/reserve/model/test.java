package com.cinema.reserve.model;

public class test {
	public static void main(String[] args) {
		int[] a={1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13};
		
		int c=0;
		int d=a.length/3;
		if(a.length%3!=0)d=d+1;
		for(int b=0; b<d;b++){
			for(int i=0; i<3; i++){
				System.out.print(a[c]);
				c++;
				if(c>a.length-1)break;
			}
			System.out.println();
		}
	}
}
