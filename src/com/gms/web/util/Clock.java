package com.gms.web.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Clock {
   public String getNow(){
      String now = "";
/*      SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 a hh:mm:ss");//a가 있으면 5 없으면 15로 나온다
      now = sdf.format(new Date());
      return now;*/
      return new SimpleDateFormat("yyyy년MM월dd일 a hh:mm:ss").format (new Date());
   }
}