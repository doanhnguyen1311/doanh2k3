package bo;

import java.util.ArrayList;

import bean.giohangbean;

public class giohangbo {
	public ArrayList<giohangbean> ds =
			new ArrayList<giohangbean>();
   //Viet ham Them: them 1 hang vao gio: ds
public void Them(String masach, String tensach, Long soluongmua, Long gia) {
	for(giohangbean h: ds) {
		if(h.getMasach().equals(masach)) {
			h.setSoluongmua(h.getSoluongmua()+ soluongmua);
			return;
		}
	}
	ds.add(new giohangbean(masach, tensach, soluongmua, gia));
}
public void Xoa(String masach) {	
	for(giohangbean h: ds) {
		if(h.getMasach().equals(masach)) {
			ds.remove(h);
			return;
		}
			
	}
}
public long Tong() {	
	long s=0;
	for(giohangbean h: ds) {
		s=s+h.getThanhtien();
	}
	return s;
}		
}
