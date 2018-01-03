package kr.co.vitamin.common;

public class tt {

	public static void main(String[] args) {
		
		bb dgbz2 = new bb();
		dgbz2.setAsd22g(123754674);
		dgbz2.setSag22asd(12445);
		dgbz2.setAsdg(74567);
		dgbz2.setSagasd(1236745674);
		
		aa dg = dgbz2;
		
		System.out.println(dg.getAsdg());
		System.out.println(dg.getSagasd());
		
		System.out.println();
		
		bb dgbz = (bb)dg;
		
		System.out.println(dgbz.getAsdg());
		System.out.println(dgbz.getSagasd());
		System.out.println(dgbz.getSag22asd());
		System.out.println(dgbz.getAsd22g());
		
		
		
	}

}

class aa {
	private int asdg, sagasd;

	public int getAsdg() {
		return asdg;
	}

	public void setAsdg(int asdg) {
		this.asdg = asdg;
	}

	public int getSagasd() {
		return sagasd;
	}

	public void setSagasd(int sagasd) {
		this.sagasd = sagasd;
	}
	
	
}


class bb extends aa{
	private int asd22g, sag22asd;

	public int getAsd22g() {
		return asd22g;
	}

	public void setAsd22g(int asd22g) {
		this.asd22g = asd22g;
	}

	public int getSag22asd() {
		return sag22asd;
	}

	public void setSag22asd(int sag22asd) {
		this.sag22asd = sag22asd;
	}
	
	
}
