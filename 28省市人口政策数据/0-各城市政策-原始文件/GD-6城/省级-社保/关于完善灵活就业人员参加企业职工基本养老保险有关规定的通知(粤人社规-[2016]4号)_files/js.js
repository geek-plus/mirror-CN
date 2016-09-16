
function keyDown(e)
{
	var e=(typeof event!="undefined")?window.event:e;   // IE : Firefox
	//var s=(document.getSelection)?document.getSelection():document.selection.createRange().text;
 	var s = getSelectedText();
	//alert(s);
	if(e.ctrlKey && e.keyCode==13){
		//alert(1);
		if (s!="") 
		{	
			if(s.length>200){
				alert("选择出错的内容片断长度不能超过200个字符，请重新选择！");
				return;
			}else{
					//editOpenDialog(s);
					var host = top.window.location.href;
					var url ='http://qysi.gov.cn/error.php?error_txt='+encodeURI(encodeURI(s))+'&error_url='+encodeURI(encodeURI(host)) ;
					window.open(url,"","width=800,height=400,scrollbars=yes");
			}
			//editOpenDialog(s);	
			
		}else{
			alert("请先用鼠标选择出错的内容片断！");
			return false;
		}
	}
}
function s(s){
	editOpenDialog(s);	
	
}
//function getSelectText(){ 
//	        //适用于IE 
//        if (document.selection && document.selection.createRange){ 
//		                return document.selection.createRange().text; 
//	        //适用于其他浏览器
//        } else if (window.getSelection){ 
//		                return window.getSelection(); 
//	    } 
//}

function getSelectedText() {

 if (window.getSelection) {
  return window.getSelection().toString();
  
 } else if (document.getSelection) {
  return document.getSelection();
  
 } else if (document.selection) {//IE
  return document.selection.createRange().text;
 }
}

function editOpenDialog(error_txt){
	var url ='url:/frontapp/error/submit_error.jsp?error_txt='+encodeURI(encodeURI(error_txt)) ;
	//var url ='http://www.qq.com' ;
	//alert(url);
	$.dialog({id: 'testID2',min: false,width: '900px',height:'450px',padding: '15px',title: '',content:url,ok: function(){
		alert(" ");
        //parent.document.getElementById("cwin").src = 'gecs_myzj_opinion_list.jsp?idx='+idx;
    } });
	
	//$.dialog({id: 'testID2'});
}

function editOpenDialog1(error_txt){
	var url ='url:/frontapp/error/submit_error.jsp?error_txt='+encodeURI(encodeURI(error_txt)) ;
	//var url ='http://www.qq.com' ;
	//alert(url);
	$.dialog({id: 'testID2',min: false,width: '900px',height:'450px',padding: '15px',title: '',content:url,ok: function(){
		//alert(" ");
        //parent.document.getElementById("cwin").src = 'gecs_myzj_opinion_list.jsp?idx='+idx;
    } });
	
	$.dialog({id: 'testID2'});
}

document.onkeydown = keyDown;
