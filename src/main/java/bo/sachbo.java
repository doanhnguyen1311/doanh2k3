package bo;

import java.util.ArrayList;

import bean.sachbean;
import dao.sachdao;

public class sachbo {
   sachdao sdao= new sachdao();
   ArrayList<sachbean> ds;
   public ArrayList<sachbean> getallsach() throws Exception{
	   ds=sdao.getallsach();
	   return ds;
   }
   public ArrayList<sachbean> pagingSach(int index){
	   return sdao.pagingAccount(index);  
   }
   public int totalSach(){
	   return sdao.getTotalAccount();
   }
   public ArrayList<sachbean> TimMa(String maloai) throws Exception{
	   ArrayList<sachbean> tam= new ArrayList<sachbean>();
	   for(sachbean s: ds)
		   if(s.getMaloai().trim().equals(maloai.trim()))
			   tam.add(s);
	   return tam;
   }
   public ArrayList<sachbean> Tim(String key) throws Exception{
	   ArrayList<sachbean> tam= new ArrayList<sachbean>();
	   for(sachbean s: ds)
		   if(s.getTensach().toLowerCase().trim().contains(
				key.toLowerCase().trim()) ||
		    s.getTacgia().toLowerCase().trim().contains(
							key.toLowerCase().trim())	   
				   ) 
			   tam.add(s);
	   return tam;  
   }
}
