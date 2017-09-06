package com.grad.net.vo;

public class CounselingVo {

	
	
	private Long wrtbtNo;
	private String wrtbtText;
	private String wrtbtTypeDstnct;
	private String avlblBeginDt;
	private String avlblEndDt;
	private Long mbNo;
	private Long bbsNo;
	private String wrtbtDstnct;
	
	private Long rcmdCo;
	private Long ncmdCo;
	private Long findCo;
	private Long groupNo;
	private Long orderNo;
	private Long depth;
	private String wrtbtTitle;
	private String voteRegstDt;
	
	private Long prntsCwrNo;
	private Long prntsWrtbtNo;
	
	private String cwrDstnct;
	private String writrInfoOpngYn;
	private String conslBbsDstnct;
	private Long orgnzNo;
	
	private Long count;
	private String nknm; 
	private String birdt; 
	private String agrg; 
	
	private String infroDstnct;
	
	
	//답변수
	//닉네임
	//생년월일
	//연령대
	//공감비공감 
	
	public String getInfroDstnct() {
		return infroDstnct;
	}
	public void setInfroDstnct(String infroDstnct) {
		this.infroDstnct = infroDstnct;
	}
	public String getBirdt() {
		return birdt;
	}
	public void setBirdt(String birdt) {
		this.birdt = birdt;
	}
	public String getAgrg() {
		return agrg;
	}
	public void setAgrg(String agrg) {
		this.agrg = agrg;
	}
	public String getNknm() {
		return nknm;
	}
	public void setNknm(String nknm) {
		this.nknm = nknm;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public Long getWrtbtNo() {
		return wrtbtNo;
	}
	public void setWrtbtNo(Long wrtbtNo) {
		this.wrtbtNo = wrtbtNo;
	}
	public String getWrtbtText() {
		return wrtbtText;
	}
	public void setWrtbtText(String wrtbtText) {
		this.wrtbtText = wrtbtText;
	}
	public String getWrtbtTypeDstnct() {
		return wrtbtTypeDstnct;
	}
	public void setWrtbtTypeDstnct(String wrtbtTypeDstnct) {
		this.wrtbtTypeDstnct = wrtbtTypeDstnct;
	}
	public String getAvlblBeginDt() {
		return avlblBeginDt;
	}
	public void setAvlblBeginDt(String avlblBeginDt) {
		this.avlblBeginDt = avlblBeginDt;
	}
	public String getAvlblEndDt() {
		return avlblEndDt;
	}
	public void setAvlblEndDt(String avlblEndDt) {
		this.avlblEndDt = avlblEndDt;
	}
	public Long getMbNo() {
		return mbNo;
	}
	public void setMbNo(Long mbNo) {
		this.mbNo = mbNo;
	}
	public Long getBbsNo() {
		return bbsNo;
	}
	public void setBbsNo(Long bbsNo) {
		this.bbsNo = bbsNo;
	}
	public String getWrtbtDstnct() {
		return wrtbtDstnct;
	}
	public void setWrtbtDstnct(String wrtbtDstnct) {
		this.wrtbtDstnct = wrtbtDstnct;
	}
	public Long getRcmdCo() {
		return rcmdCo;
	}
	public void setRcmdCo(Long rcmdCo) {
		this.rcmdCo = rcmdCo;
	}
	public Long getNcmdCo() {
		return ncmdCo;
	}
	public void setNcmdCo(Long ncmdCo) {
		this.ncmdCo = ncmdCo;
	}
	public Long getFindCo() {
		return findCo;
	}
	public void setFindCo(Long findCo) {
		this.findCo = findCo;
	}
	public Long getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(Long groupNo) {
		this.groupNo = groupNo;
	}
	public Long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}
	public Long getDepth() {
		return depth;
	}
	public void setDepth(Long depth) {
		this.depth = depth;
	}
	public String getWrtbtTitle() {
		return wrtbtTitle;
	}
	public void setWrtbtTitle(String wrtbtTitle) {
		this.wrtbtTitle = wrtbtTitle;
	}
	public String getVoteRegstDt() {
		return voteRegstDt;
	}
	public void setVoteRegstDt(String voteRegstDt) {
		this.voteRegstDt = voteRegstDt;
	}
	public Long getPrntsCwrNo() {
		return prntsCwrNo;
	}
	public void setPrntsCwrNo(Long prntsCwrNo) {
		this.prntsCwrNo = prntsCwrNo;
	}
	public Long getPrntsWrtbtNo() {
		return prntsWrtbtNo;
	}
	public void setPrntsWrtbtNo(Long prntsWrtbtNo) {
		this.prntsWrtbtNo = prntsWrtbtNo;
	}
	public String getCwrDstnct() {
		return cwrDstnct;
	}
	public void setCwrDstnct(String cwrDstnct) {
		this.cwrDstnct = cwrDstnct;
	}
	public String getWritrInfoOpngYn() {
		return writrInfoOpngYn;
	}
	public void setWritrInfoOpngYn(String writrInfoOpngYn) {
		this.writrInfoOpngYn = writrInfoOpngYn;
	}
	public String getConslBbsDstnct() {
		return conslBbsDstnct;
	}
	public void setConslBbsDstnct(String conslBbsDstnct) {
		this.conslBbsDstnct = conslBbsDstnct;
	}
	public Long getOrgnzNo() {
		return orgnzNo;
	}
	public void setOrgnzNo(Long orgnzNo) {
		this.orgnzNo = orgnzNo;
	}
	@Override
	public String toString() {
		return "CounselingVo [wrtbtNo=" + wrtbtNo + ", wrtbtText=" + wrtbtText + ", wrtbtTypeDstnct=" + wrtbtTypeDstnct
				+ ", avlblBeginDt=" + avlblBeginDt + ", avlblEndDt=" + avlblEndDt + ", mbNo=" + mbNo + ", bbsNo="
				+ bbsNo + ", wrtbtDstnct=" + wrtbtDstnct + ", rcmdCo=" + rcmdCo + ", ncmdCo=" + ncmdCo + ", findCo="
				+ findCo + ", groupNo=" + groupNo + ", orderNo=" + orderNo + ", depth=" + depth + ", wrtbtTitle="
				+ wrtbtTitle + ", voteRegstDt=" + voteRegstDt + ", prntsCwrNo=" + prntsCwrNo + ", prntsWrtbtNo="
				+ prntsWrtbtNo + ", cwrDstnct=" + cwrDstnct + ", writrInfoOpngYn=" + writrInfoOpngYn
				+ ", conslBbsDstnct=" + conslBbsDstnct + ", orgnzNo=" + orgnzNo + ", count=" + count + ", nknm=" + nknm
				+ ", birdt=" + birdt + ", agrg=" + agrg + ", infroDstnct=" + infroDstnct + "]";
	}

	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
}
