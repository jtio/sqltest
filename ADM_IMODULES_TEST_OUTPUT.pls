create or replace procedure adm_iModules_test_output   is

  
 

 

 f_iModules_output_test UTL_FILE.file_type;
v_record               varchar2 (32000) := null;
v_record_counter       number := 0;

f_iModules_filename_test VARCHAR2 (50) := 'Adm_iModules_Test.TXT';
f_iModules_dir_test      VARCHAR2 (100):= 'TMP';
v_separator              VARCHAR2 (50) := ',';
v_id                     VARCHAR2 (90) := '';
v_fname                  VARCHAR2 (40) := '';
v_lname                  VARCHAR2 (40) := '';
v_user                   VARCHAR2 (90) := '';
v_login                  VARCHAR2 (100):= '';
v_password               VARCHAR2 (100):= '';
 v_link VARCHAR2 (32767) := 'http://imodules.com/Web%20Services/'; 
--the below item 'http://admin.imodules.com - was https://admin.imodules.com 
v_link VARCHAR2 (32767) := 'https://api.iModules.com/ws_20/controlquery.asmx?WSDL'; -- 'http://admin.imodules.com/ws_10/MemberQuery.asmx?WSDL'; https://api.iModules.com/ws_20/controlquery.asmx
v_non_existing_ids VARCHAR2 (100) := '"false"';
v_style VARCHAR2 (5) := '"1"';
v_imod_member_id VARCHAR2 (100) := '';
v_spriden_first_name VARCHAR2 (60) := '';
req Utl_Http.req; --for posting 
resp Utl_Http.resp; --for posting 
v_msg VARCHAR2(80); --for posting 
H_Name VARCHAR2(255); --for posting 
H_Value VARCHAR2(1023); --for posting 
v_data_xml VARCHAR2(10000);


BEGIN
DBMS_OUTPUT.ENABLE(1000000);
f_iModules_output_test := UTL_FILE.fopen (f_iModules_dir_test, f_iModules_filename_test, 'w',32767);
v_record := '';
end; 
--needed for posting 
/*
-- Utl_http.set_proxy(proxy => 'xxx.yyy.com',
-- no_proxy_domains => 'xxx.com');

req := Utl_Http.begin_request(url => v_link,
method => 'POST');



-- FOR v_iModules2 IN c_iModules_main 
-- LOOP 
-- v_record_counter := v_record_counter + 1; 
-- END LOOP;


-- v_record := 'DUQ'||','||v_record_counter||','||to_char(SYSDATE,'mm/dd/yyyy');
UTL_FILE.put_line (f_iModules_output_test, v_record, false); 
v_record := null;
FOR v_iModules IN c_iModules_main
LOOP
v_id := v_imodules.sprid_id;
v_fname := v_imodules.sprid_first||'test';
v_lname := v_imodules.sprid_last; 
v_user := '"'||v_imodules.email_address||'"';
v_imodules.imod_id := '29';
v_imod_member_id := '"'||v_imodules.imod_id||'"';
v_spriden_first_name := '"SPRIDEN_FIRST_NAME"';


v_login := '"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx"';
v_password := '"xxxxxxxxxxxxxxxxxxxxxxxx"';


v_record :='<?xml version="1.0" encoding="utf-8"?>'||
'<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"'||' '||
'xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">'||
'<soap:Body>'||'<Update xmlns:m='||v_link||'>'||'<AUTHENTICATION login='||v_login||' '||
'password='||v_password||' '||'addNonExistingIDs='||v_non_existing_ids||' '||'style=''/>'||'<MemberInformation ZZRIMOD_MEMBER_ID='||v_imod_member_id||'>'||
'<SPRIDEN_FIRST_NAME>'||v_fname||'</SPRIDEN_FIRST_NAME>'||'</MemberInformation>'||'</Update>'||
'</soap:Body></soap:Envelope>';


-- v_record := v_record := v_record||'<Update xmlns:m='||v_link||'>'||'<AUTHENTICATION login='||v_user||'>'||' '||
-- 'password='||v_password||' '||'addNonExistingIDs='||v_non_existing_ids||' '||'style=''/>'||'<MemberInformation ZZRIMOD_MEMBER_ID='||v_imod_member_id||' '||
-- 'column='||'"SPRIDEN_FIRST_NAME"'||' '||'newValue='||v_fname||'/>'||'</Update>';


dbms_output.put_line('code: '||v_record);


--v_record := v_record||v_separator||v_id||v_separator||v_name||v_separator||v_email;


--Http posting calls 
Utl_Http.set_header(r => req, 
name => 'Content-Type', 
value => 'text/xml');

Utl_Http.set_header(r => req, 
name => 'Content-Length', 
value => to_char(length(v_record)) );


--JAM 03/25/08 - added to accomodate the missing soap action error 
Utl_Http.set_header(r => req, 
name => 'SOAPAction', 
value => 'http://admin.imodules.com/ws_10/MemberQuery.asmx?WSDL'); 

Utl_Http.set_header(r => req, 
name => 'MessageType', 
value => 'CALL');


-- Utl_Http.set_authentication(r => req,
-- username => 'zzz',
-- password => 'ppppp',
-- scheme => 'Basic',
-- for_proxy => FALSE);


Utl_Http.write_text(r => req, 
data => v_record); 


resp := Utl_Http.get_response(r => req, 
return_info_response => TRUE);


DBMS_OUTPUT.put_line('Status Code: ' || resp.status_code); 
DBMS_OUTPUT.put_line('Reason Phrase: ' || resp.reason_phrase);
dbms_output.put_line('testing'); 


FOR i IN 1 .. Utl_Http.get_header_count(r => resp)
LOOP
Utl_Http.get_header(r => resp, 
n => i, 
name => H_Name, 
value => H_Value);

--DBMS_OUTPUT.put_line( ... );
END LOOP;*/
 
