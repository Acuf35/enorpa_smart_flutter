

class SelectLanguage{

  selectStrings(String language, String kod){

    String metin="";
    language == 'TR' ? metin = languageTR(kod) : metin = languageEN(kod) ;

    return metin;

  }

  languageTR(String kod){

    String metin="0kod";

    kod=='slogan' ? metin='Akıllı Endüstriyel Kazan Sistemleri ve Yönetimi' : null;
    kod=='cbox1' ? metin='Kuruluma sıfırdan başla' : null;
    kod=='cbox2' ? metin='Kurulum ayarlarını sistemden çek' : null;

    //#region TEXTVIEW

    kod=="tv1" ? metin='BAŞLANGIÇ AYARLARI' : null;
    kod=="tv2" ? metin='* Sera Adı' : null;
    kod=="tv3" ? metin='* Yerel IP' : null;
    kod=="tv4" ? metin='* Wifi Adı' : null;
    kod=="tv5" ? metin='Uzak IP' : null;
    kod=="tv6" ? metin='* Şifre' : null;
    kod=="tv7" ? metin='KAZAN-SEKTÖR AYARLARI' : null;
    kod=="tv8" ? metin='SEKTÖR 1' : null;
    kod=="tv9" ? metin='SEKTÖR 2' : null;
    kod=="tv10" ? metin='SEKTÖR 3' : null;
    kod=="tv11" ? metin='SEKTÖR 4' : null;
    kod=="tv12" ? metin='YÖNETİM PANELİ' : null;
    kod=="tv13" ? metin='Kurulum' : null;
    kod=="tv14" ? metin='YÖNETİM PANELİ' : null;
    kod=="tv15" ? metin='SICAKLIK KONTROL' : null;
    kod=="tv16" ? metin='SICAKLIK DEĞER GİRİŞİ' : null;
    kod=="tv17" ? metin='YÜZDE DEĞER GİRİŞİ' : null;
    kod=="tv18" ? metin='SET\nSIC.' : null;
    kod=="tv19" ? metin='DOĞAL\nBÖLGE' : null;
    kod=="tv20" ? metin='MAX\n%' : null;
    kod=="tv21" ? metin='KAZAN\nSIC.' : null;
    kod=="tv22" ? metin='ORT\nSIC.' : null;
    kod=="tv23" ? metin='Sektor 1' : null;
    kod=="tv24" ? metin='Sektor 2' : null;
    kod=="tv25" ? metin='Sektor 3' : null;
    kod=="tv26" ? metin='Sektor 4' : null;
    kod=="tv27" ? metin='KALİBRASYON' : null;
    kod=="tv28" ? metin='SENSÖRLER' : null;
    kod=="tv29" ? metin='3 YOLLU VANALAR' : null;
    kod=="tv30" ? metin='SENSÖR KALİBRASYON' : null;
    kod=="tv31" ? metin='DÖNÜŞ\nSU SIC.' : null;
    kod=="tv32" ? metin='KAZAN 1' : null;
    kod=="tv33" ? metin='KAZAN 2' : null;
    kod=="tv34" ? metin='NEM\n(%)' : null;
    kod=="tv35" ? metin='KUZEY\nSIC.' : null;
    kod=="tv36" ? metin='GÜNEY\nSIC.' : null;
    kod=="tv37" ? metin='ORTA\nSIC.' : null;
    kod=="tv38" ? metin='* PLC IP' : null;
    kod=="tv39" ? metin='Sn' : null;
    kod=="tv40" ? metin='KALİB.\nDURUM' : null;
    kod=="tv41" ? metin='TOTAL\nAÇ-KAPA\nSÜRESİ' : null;
    kod=="tv42" ? metin='Pasif' : null;
    kod=="tv43" ? metin='Hazırlanıyor' : null;
    kod=="tv44" ? metin='Yapılıyor' : null;
    kod=="tv45" ? metin='BAŞLAT' : null;
    kod=="tv46" ? metin='3 YOLLU VANA KALİBRASYON' : null;
    kod=="tv47" ? metin='MANUEL KONTROL' : null;
    kod=="tv48" ? metin='SİSTEM İZLEME' : null;
    kod=="tv49" ? metin='Kuzey(A)' : null;
    kod=="tv50" ? metin='Orta(B)' : null;
    kod=="tv51" ? metin='Güney(C)' : null;
    kod=="tv52" ? metin='3Y Vana Açıklığı' : null;
    kod=="tv53" ? metin='Sek. Pom.' : null;
    kod=="tv54" ? metin='Dış Sıcaklık' : null;
    kod=="tv55" ? metin='Ort.Sıc:' : null;
    kod=="tv56" ? metin='Set.Sıc' : null;
    kod=="tv57" ? metin='D.Böl.' : null;
    kod=="tv58" ? metin='Kazan Sıcaklığı' : null;
    kod=="tv59" ? metin='Dönüş Su Sıcaklığı' : null;
    kod=="tv60" ? metin='Kazan Pompası' : null;
    kod=="tv61" ? metin='Kazan Şönt Pomp.' : null;
    kod=="tv62" ? metin='ALARM TÜRÜ' : null;
    kod=="tv63" ? metin='LİMİTLER' : null;
    kod=="tv64" ? metin='Kazan Yüks. Sıc.' : null;
    kod=="tv65" ? metin='Kazan Düşük Sıc.' : null;
    kod=="tv66" ? metin='Sektör Yüks. Sıc.' : null;
    kod=="tv67" ? metin='Sektör Düş. Sıc.' : null;
    kod=="tv68" ? metin='Sektör Yüks. Nem' : null;
    kod=="tv69" ? metin='Sektör Düş. Nem' : null;
    kod=="tv70" ? metin='ALARM ADI' : null;
    kod=="tv71" ? metin='İPTAL DURUMU' : null;
    kod=="tv72" ? metin='Brülor Arızalı' : null;
    kod=="tv73" ? metin='Pompa Termik Attı' : null;
    kod=="tv74" ? metin='Mekanik Düş. Sıc.' : null;
    kod=="tv75" ? metin='Mekanik Yüks. Sıc.' : null;
    kod=="tv76" ? metin='Acil Stop Basılı' : null;
    kod=="tv77" ? metin='Faz Hatası' : null;
    kod=="tv78" ? metin='Kazan Yüks. Sıc.' : null;
    kod=="tv79" ? metin='Kazan Düş. Sıc.' : null;
    kod=="tv80" ? metin='Sektör Yüks. Sıc.' : null;
    kod=="tv81" ? metin='Sektör Düş. Sıc.' : null;
    kod=="tv82" ? metin='Sektör Yüks. Nem' : null;
    kod=="tv83" ? metin='Sektör Düş. Nem' : null;
    kod=="tv84" ? metin='Kuzey Sens. Hata' : null;
    kod=="tv85" ? metin='Orta Sens. Hata' : null;
    kod=="tv86" ? metin='Güney Sens. Hata' : null;
    kod=="tv87" ? metin='Kazan Sens. Hata' : null;
    kod=="tv88" ? metin='Dönüş Su Sens. Hata' : null;
    kod=="tv89" ? metin='ALARM LİMİT VE İPTAL AYARLARI' : null;
    kod=="tv90" ? metin='Yerel IP' : null;
    kod=="tv91" ? metin='AKTİF ALARMLAR' : null;
    kod=="tv92" ? metin='Aktif alarm yok' : null;
    kod=="tv93" ? metin='VERİLER' : null;
    kod=="tv94" ? metin='AY' : null;
    kod=="tv95" ? metin='YIL' : null;
    kod=="tv96" ? metin='GÜN' : null;
    kod=="tv97" ? metin='VERİ LİSTELEME ALANI' : null;
    kod=="tv98" ? metin='VERİ TÜRÜNÜ SEÇİNİZ' : null;
    kod=="tv99" ? metin='TARİH SEÇİNİZ' : null;
    kod=="tv100" ? metin='DEĞER' : null;
    kod=="tv101" ? metin='SAAT' : null;
    kod=="tv102" ? metin='ALARM METİN' : null;
    kod=="tv103" ? metin='ALARM NO' : null;
    kod=="tv104" ? metin='NO' : null;
    kod=="tv105" ? metin='ÜRÜNLERİMİZ' : null;
    kod=="tv106" ? metin='REFERANSLAR' : null;
    kod=="tv107" ? metin='HABERLER' : null;
    kod=="tv108" ? metin='SOSYAL MEDYA' : null;
    kod=="tv109" ? metin='İLETİŞİM' : null;
    kod=="tv110" ? metin='KEŞFET & KONTROL ET' : null;
    kod=="tv111" ? metin='Uygulamadan çıkmak istiyor musunuz?' : null;

    //#endregion

    //region BUTTON

    kod=="btn1" ? metin='BAŞLA' : null;
    kod=="btn2" ? metin='ÇEK' : null;
    kod=="btn3" ? metin='TAMAMLA' : null;
    kod=="btn4" ? metin='KAZAN AKTİF' : null;
    kod=="btn5" ? metin='KAZAN POMPASI' : null;
    kod=="btn6" ? metin='K. ŞÖNT POMPASI' : null;
    kod=="btn7" ? metin='3 YOLLU VANA' : null;
    kod=="btn8" ? metin='KAZAN 1' : null;
    kod=="btn9" ? metin='KAZAN 2' : null;
    kod=="btn10" ? metin='3 Y. VANA' : null;
    kod=="btn11" ? metin='S. POMPA' : null;
    kod=="btn12" ? metin='KALİB.' : null;
    kod=="btn13" ? metin='VERİ' : null;
    kod=="btn14" ? metin='İZLEME' : null;
    kod=="btn15" ? metin='ALARM' : null;
    kod=="btn16" ? metin='MANUEL' : null;
    kod=="btn17" ? metin='KONTROL' : null;
    kod=="btn18" ? metin='ONAY' : null;
    kod=="btn19" ? metin='İPTAL' : null;
    kod=="btn20" ? metin='SEKTÖR 1' : null;
    kod=="btn21" ? metin='SEKTÖR 2' : null;
    kod=="btn22" ? metin='SEKTÖR 3' : null;
    kod=="btn23" ? metin='SEKTÖR 4' : null;
    kod=="btn24" ? metin='ÇIKIŞ' : null;
    kod=="btn25" ? metin='SICAKLIK' : null;
    kod=="btn26" ? metin='3Y VANA SICAK' : null;
    kod=="btn27" ? metin='3Y VANA SOĞUK' : null;
    kod=="btn28" ? metin='MANUEL MOD' : null;
    kod=="btn29" ? metin='ALARM İPTAL' : null;
    kod=="btn30" ? metin='ALARM AYARLARI' : null;
    kod=="btn31" ? metin='DEVAM' : null;
    kod=="btn32" ? metin='VERİ TÜRÜNÜ SEÇ' : null;
    kod=="btn33" ? metin='VERİYİ GETİR' : null;
    kod=="btn34" ? metin='ALARM GEÇMİŞİ' : null;
    kod=="btn35" ? metin='KAZAN SICAKLIĞI' : null;
    kod=="btn36" ? metin='DÖNÜŞ SUYU SICAKLIĞI' : null;
    kod=="btn37" ? metin='ORTALAMA SICAKLIK' : null;
    kod=="btn38" ? metin='KUZEY BÖLGE SICAKLIĞI' : null;
    kod=="btn39" ? metin='ORTA BÖLGE SICAKLIĞI' : null;
    kod=="btn40" ? metin='GÜNEY BÖLGE SICAKLIĞI' : null;
    kod=="btn41" ? metin='NEM DEĞERİ' : null;
    kod=="btn42" ? metin='EVET' : null;
    kod=="btn43" ? metin='HAYIR' : null;
    
    //endregion

    //region HINT

    kod=="hint1" ? metin='Sera adı giriniz…' : null;
    kod=="hint2" ? metin='Wifi adı giriniz…' : null;
    kod=="hint3" ? metin='Şifre giriniz…' : null;

    //endregion

    //region TOAST

    kod=="toast1" ? metin='Kazanlardan en az biri aktif edilmiş olmalıdır!' : null;
    kod=="toast2" ? metin='Kazan 1 aktif ise Kazan Pompası da aktif olmalıdır!' : null;
    kod=="toast3" ? metin='Kazan 2 aktif ise Kazan Pompası da aktif olmalıdır!' : null;
    kod=="toast4" ? metin='En az bir sektör için kazanlardan biri aktif hale getirilmiş olmalıdır!' : null;
    kod=="toast5" ? metin='Önce kazan 1 aktif edilmelidir!' : null;
    kod=="toast6" ? metin='Önce kazan 2 aktif edilmelidir!' : null;
    kod=="toast7" ? metin='Sera adı alanı boş! Lütfen sera adını giriniz!' : null;
    kod=="toast8" ? metin='Lütfen geçerli bir Yerel IP giriniz!' : null;
    kod=="toast9" ? metin='Wifi adı alanı boş! Lütfen wifi adını giriniz!' : null;
    kod=="toast10" ? metin='Lütfen geçerli bir Uzak IP giriniz!' : null;
    kod=="toast11" ? metin='Lütfen geçerli bir PLC IP giriniz!' : null;


    //endregion


    return metin;
  }


  languageEN(String kod){

    String metin="0kod";

    kod=='slogan' ? metin='Smart Industrial Boiler Systems end Management' : null;
    kod=='cbox1' ? metin='Start setup installation' : null;
    kod=='cbox2' ? metin='Receive setup installation' : null;

    //region TEXTVIEW
    
    kod=="tv1" ? metin='INITIAL SETTINGS' : null;
    kod=="tv2" ? metin='* GH name' : null;
    kod=="tv3" ? metin='* Local IP' : null;
    kod=="tv4" ? metin='* Wifi Name' : null;
    kod=="tv5" ? metin='Remote IP' : null;
    kod=="tv6" ? metin='* Password' : null;
    kod=="tv7" ? metin='BOILER-SECTION SETTINGS' : null;
    kod=="tv8" ? metin='SECTION 1' : null;
    kod=="tv9" ? metin='SECTION 2' : null;
    kod=="tv10" ? metin='SECTION 3' : null;
    kod=="tv11" ? metin='SECTION 4' : null;
    kod=="tv12" ? metin='MANAGEMENT PANEL' : null;
    kod=="tv13" ? metin='SETUP' : null;
    kod=="tv14" ? metin='MANAGEMENT PANEL' : null;
    kod=="tv15" ? metin='TEMPERATURE CONTROL' : null;
    kod=="tv16" ? metin='TEMPERATURE VALUE INPUT' : null;
    kod=="tv17" ? metin='PERCENT VALUE INPUT' : null;
    kod=="tv18" ? metin='SET\nTEMP.' : null;
    kod=="tv19" ? metin='NAT\nZONE' : null;
    kod=="tv20" ? metin='MAX\n%' : null;
    kod=="tv21" ? metin='BIOLER\nTEMP.' : null;
    kod=="tv22" ? metin='AVR\nTEMP.' : null;
    kod=="tv23" ? metin='Section 1' : null;
    kod=="tv24" ? metin='Section 2' : null;
    kod=="tv25" ? metin='Section 3' : null;
    kod=="tv26" ? metin='Section 4' : null;
    kod=="tv27" ? metin='CALIBRATION' : null;
    kod=="tv28" ? metin='SENSORS' : null;
    kod=="tv29" ? metin='3 WAYS VALVE' : null;
    kod=="tv30" ? metin='SENSOR CALIBRATION' : null;
    kod=="tv31" ? metin='RETURN\nTEMP.' : null;
    kod=="tv32" ? metin='BOILER 1' : null;
    kod=="tv33" ? metin='BOILER 2' : null;
    kod=="tv34" ? metin='HUM\n(%)' : null;
    kod=="tv35" ? metin='NORTH\nTEMP.' : null;
    kod=="tv36" ? metin='SOUTH\nTEMP.' : null;
    kod=="tv37" ? metin='MIDDLE\nTEMP.' : null;
    kod=="tv38" ? metin='* PLC IP' : null;
    kod=="tv39" ? metin='Sec' : null;
    kod=="tv40" ? metin='CALIB.\nSTATUS' : null;
    kod=="tv41" ? metin='TOTAL\nOPEN-CLOSE\nTIME' : null;
    kod=="tv42" ? metin='Passive' : null;
    kod=="tv43" ? metin='Preparinh' : null;
    kod=="tv44" ? metin='Processing' : null;
    kod=="tv45" ? metin='START' : null;
    kod=="tv46" ? metin='3 WAYS VALVE CALIBRATION' : null;
    kod=="tv47" ? metin='MANUEL CONTROL' : null;
    kod=="tv48" ? metin='SYSTEM MONİTORING' : null;
    kod=="tv49" ? metin='North(A)' : null;
    kod=="tv50" ? metin='Middle(B)' : null;
    kod=="tv51" ? metin='South(C)' : null;
    kod=="tv52" ? metin='3W Valve Percent' : null;
    kod=="tv53" ? metin='Sec. Pump.' : null;
    kod=="tv54" ? metin='Outside Temp.' : null;
    kod=="tv55" ? metin='Avr.Temp:' : null;
    kod=="tv56" ? metin='Set.Temp' : null;
    kod=="tv57" ? metin='N.Zone.' : null;
    kod=="tv58" ? metin='Boiler Temp' : null;
    kod=="tv59" ? metin='Return water Temp' : null;
    kod=="tv60" ? metin='Boiler Pump' : null;
    kod=="tv61" ? metin='Boiler shunt Pump.' : null;
    kod=="tv62" ? metin='ALARM TYPE' : null;
    kod=="tv63" ? metin='LIMITS' : null;
    kod=="tv64" ? metin='Boiler High Temp.' : null;
    kod=="tv65" ? metin='Boiler Low Temp.' : null;
    kod=="tv66" ? metin='Section High. Temp.' : null;
    kod=="tv67" ? metin='Section Low Temp.' : null;
    kod=="tv68" ? metin='Section High Hum' : null;
    kod=="tv69" ? metin='Section Low Hum' : null;
    kod=="tv70" ? metin='ALARM NAME' : null;
    kod=="tv71" ? metin='CANCEL STATUS' : null;
    kod=="tv72" ? metin='Burner Fault' : null;
    kod=="tv73" ? metin='Pump Fuse Triggered' : null;
    kod=="tv74" ? metin='Mechanical Low Temp.' : null;
    kod=="tv75" ? metin='Mechanical High. Temp.' : null;
    kod=="tv76" ? metin='Emer. Stop pressed' : null;
    kod=="tv77" ? metin='Phase Fault' : null;
    kod=="tv78" ? metin='Boiler High Temp.' : null;
    kod=="tv79" ? metin='Boiler Low Temp.' : null;
    kod=="tv80" ? metin='Section High. Temp.' : null;
    kod=="tv81" ? metin='Section Low Temp.' : null;
    kod=="tv82" ? metin='Section High Hum' : null;
    kod=="tv83" ? metin='Section Low Hum' : null;
    kod=="tv84" ? metin='North Sens. Fault' : null;
    kod=="tv85" ? metin='Middle Sens. Fault' : null;
    kod=="tv86" ? metin='South Sens. Fault' : null;
    kod=="tv87" ? metin='Boiler Sens. Fault' : null;
    kod=="tv88" ? metin='Return Wat. Sens. Fault' : null;
    kod=="tv89" ? metin='ALARM LIMIT AND CANCEL SETTINGS' : null;
    kod=="tv90" ? metin='Local IP' : null;
    kod=="tv91" ? metin='ACTIVE ALARMS' : null;
    kod=="tv92" ? metin='No active alarm' : null;
    kod=="tv93" ? metin='DATA HISTORY' : null;
    kod=="tv94" ? metin='MONTH' : null;
    kod=="tv95" ? metin='YEAR' : null;
    kod=="tv96" ? metin='DAY' : null;
    kod=="tv97" ? metin='DATA LISTING FIELD' : null;
    kod=="tv98" ? metin='SELECT DATA TYPE' : null;
    kod=="tv99" ? metin='SELECT DATE' : null;
    kod=="tv100" ? metin='VALUE' : null;
    kod=="tv101" ? metin='HOUR' : null;
    kod=="tv102" ? metin='ALARM TEXT' : null;
    kod=="tv103" ? metin='ALARM NO' : null;
    kod=="tv104" ? metin='NO' : null;
    kod=="tv105" ? metin='PRODUCTS' : null;
    kod=="tv106" ? metin='REFERENCES' : null;
    kod=="tv107" ? metin='NEWS' : null;
    kod=="tv108" ? metin='SOCIAL MEDYA' : null;
    kod=="tv109" ? metin='CONTACT' : null;
    kod=="tv110" ? metin='EXPLORE & CONTROL' : null;
    kod=="tv111" ? metin='Do you want to exit from the app?' : null;
    

    //endregion

    //region BUTTON

    kod=="btn1" ? metin='START' : null;
    kod=="btn2" ? metin='GET' : null;
    kod=="btn3" ? metin='COMPLETE' : null;
    kod=="btn4" ? metin='BOILER ACTIVE' : null;
    kod=="btn5" ? metin='BOILER PUMP' : null;
    kod=="btn6" ? metin='K. SHUNT PUMP' : null;
    kod=="btn7" ? metin='3 WAYS VALVE' : null;
    kod=="btn8" ? metin='BOILER 1' : null;
    kod=="btn9" ? metin='BOILER 2' : null;
    kod=="btn10" ? metin='3 W. VALVE' : null;
    kod=="btn11" ? metin='S. PUMP' : null;
    kod=="btn12" ? metin='CALİB.' : null;
    kod=="btn13" ? metin='DATA' : null;
    kod=="btn14" ? metin='WATCH' : null;
    kod=="btn15" ? metin='ALARM' : null;
    kod=="btn16" ? metin='MANUEL' : null;
    kod=="btn17" ? metin='CONTROL' : null;
    kod=="btn18" ? metin='OK' : null;
    kod=="btn19" ? metin='CANCEL' : null;
    kod=="btn20" ? metin='SECTION 1' : null;
    kod=="btn21" ? metin='SECTION 2' : null;
    kod=="btn22" ? metin='SECTION 3' : null;
    kod=="btn23" ? metin='SECTION 4' : null;
    kod=="btn24" ? metin='QUIT' : null;
    kod=="btn25" ? metin='TEMP.' : null;
    kod=="btn26" ? metin='3W VALVE COLD' : null;
    kod=="btn27" ? metin='3W VALVE HOT' : null;
    kod=="btn28" ? metin='MANUEL MODE' : null;
    kod=="btn29" ? metin='ALARM CANCEL' : null;
    kod=="btn30" ? metin='ALARM SETTINGS' : null;
    kod=="btn31" ? metin='CONTINUE' : null;
    kod=="btn32" ? metin='SELECT DATA TYPE' : null;
    kod=="btn33" ? metin='GET DATA' : null;
    kod=="btn34" ? metin='ALARM HISTORY' : null;
    kod=="btn35" ? metin='BOILER TEMPERATURE' : null;
    kod=="btn36" ? metin='RETURN TEMPERATURE' : null;
    kod=="btn37" ? metin='AVERAGE TEMPERATURE' : null;
    kod=="btn38" ? metin='NORTH ZONE TEMPERATURE' : null;
    kod=="btn39" ? metin='MIDDLE ZONE TEMPERATURE' : null;
    kod=="btn40" ? metin='SOUTH ZONE TEMPERATURE' : null;
    kod=="btn41" ? metin='HUMIDITY VALUE' : null;
    kod=="btn42" ? metin='YES' : null;
    kod=="btn43" ? metin='NO' : null;

    //endregion

    //region HINT

    kod=="hint1" ? metin='Enter greenhouse name…' : null;
    kod=="hint2" ? metin='Enter wifi name…' : null;
    kod=="hint3" ? metin='Enter password…' : null;

    //endregion

    //region TOAST

    kod=="toast1" ? metin='One of boiler must active mode atleast!' : null;
    kod=="toast2" ? metin='If bolier 1 is active, boiler pomp must active also!' : null;
    kod=="toast3" ? metin='If bolier 2 is active, boiler pomp must active also!' : null;
    kod=="toast4" ? metin='Atleast for one section, one of boiler must be done active mode!' : null;
    kod=="toast5" ? metin='Boiler 1 must be done active mode first' : null;
    kod=="toast6" ? metin='Boiler 2 must be done active mode first' : null;
    kod=="toast7" ? metin='GH name is empty! Please enter GreenHouse name…' : null;
    kod=="toast8" ? metin='Please enter a valid Local IP' : null;
    kod=="toast9" ? metin='Wifi name is empty! Please enter Wifi name…' : null;
    kod=="toast10" ? metin='Please enter a valid Remote IP' : null;
    kod=="toast11" ? metin='Please enter a valid PLC IP' : null;


    //endregion

    return metin;
  }


}