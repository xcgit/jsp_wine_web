package copyPicture;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class CopyPict {
	//°Ñ\×ª³É/
	
	public static String change(String s){
		String s_=s;
		//System.out.println(s_);
		
		s_=s_.replace("\\", "/");  
		//System.out.println(s_);
		return s_;
		
	}
	
	public static void copyFile(String sourceFile,String targetFile) throws IOException
	{
			BufferedInputStream inBuff = null;
			BufferedOutputStream outBuff = null;
			
		
	try{
		inBuff = new BufferedInputStream(new FileInputStream(sourceFile));
		
		outBuff = new BufferedOutputStream(new FileOutputStream(targetFile));
		
		byte[] b = new byte[1024*5];
		
		int len;
		
		while((len = inBuff.read(b))!=-1){
			outBuff.write(b, 0, len);
		}
		outBuff.flush();
	
	}finally{
		if(inBuff!=null)
			inBuff.close();
		if(outBuff!=null)
			outBuff.close();
	}
	
	
}
}
