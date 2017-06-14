package com.korail.client.paging;

public class PagingComponent {
	private int totalPage = 1;		// 총 페이지 수
	private int listSize = 10;		//화면에 출력되는 게시물 수
	private int curruntPage = 0; 	//현재 페이지
	private int startPage = 1;		//게시물 시작 번호
	private int endPage = 10;		//게시물 끝 번호
	private int totalContent =0;	//총 게시물
	public int getTotalContent() {
		return totalContent;
	}
	public void setTotalContent(int totalContent) {
		this.totalContent = totalContent;
	}
	public int getTotalPage() {
		/*
		 * 총 게시물 수
		 * 총 게시물 수  = 전체 게시물 수 % 화면에 출력되는 게시물수 == 0 이 아닐 경우 totalPage++
		 * */
		
		totalPage = totalContent/listSize;
		totalPage = totalContent % listSize == 0 ? totalPage : totalPage+1;
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	
	public int getCurruntPage() {
		return curruntPage;
	}
	public void setCurruntPage(int curruntPage) {
		this.curruntPage = curruntPage;
	}
	public int getStartPage() {
			startPage =  curruntPage * listSize + 1;
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		/*
		 * 시작페이지 = 1, 화면에 보여질 수 = 10 일 경우
		 * 끝 페이지 = 시작페이지 + 화면에 보여질 수 -1
		 * 끝 페이지 = 1 + 10 - 1;
		 * 끝페이지는 = 10;
		 * */
		endPage =  (startPage + listSize - 1);
		if(endPage > totalContent){
			endPage = totalContent;
		}
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
}
