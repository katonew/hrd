package Dto;

public class MoneyDto {
	private String custno;
	private String custname;
	private String grade;
	private int sum;
	
	public MoneyDto() {
		// TODO Auto-generated constructor stub
	}

	public MoneyDto(String custno, String custname, String grade, int sum) {
		super();
		this.custno = custno;
		this.custname = custname;
		this.grade = grade;
		this.sum = sum;
	}

	public String getCustno() {
		return custno;
	}

	public void setCustno(String custno) {
		this.custno = custno;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		grade = grade;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	@Override
	public String toString() {
		return "moneyDto [custno=" + custno + ", custname=" + custname + ", grade=" + grade + ", sum=" + sum + "]";
	}
	
	

}
