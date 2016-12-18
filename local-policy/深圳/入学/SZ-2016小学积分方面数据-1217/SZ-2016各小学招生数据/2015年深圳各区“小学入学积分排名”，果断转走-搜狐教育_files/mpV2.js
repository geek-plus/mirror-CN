function mp_show(c){
    var ele = document.getElementById("mparea");
    if(ele == 'undefined')
	    return;
    ele.innerHTML = c;
}
function mp_load(id){
	if(id == 'undefined') return false;
	if(id < 100000) return false;
	try{
		var idstr = id.toString();
		var a=idstr.slice(-2);
		var b=idstr.slice(-4,-2);
		var url= "http://s0.mp.sohu.com/areaV2/" + a + "/" + b + "/" + id + ".inc";			
		
        var script = document.createElement ('script');
		script.type = 'text/javascript';
		script.src = url;
		document.getElementsByTagName ('head')[0].appendChild (script);
	}catch(e){
	}	
}
mp_load(mpId);

/**
 * 媒体入驻平台pv统计js
 * author:taowangbj8824
 */
var CMS_MP_PV = function(entity_id, media_id, channel_id) {
	CMS_MP_PV.entity_id = entity_id;//cms id
	CMS_MP_PV.meida_id = media_id;//媒体 id
	CMS_MP_PV.channel_id = channel_id;
	
	/**
	 * 初始化
	 */
	this.init = function() {
		//非嵌入页面
		if (top.location == self.location) {
			this.sendPv();
			this.addEvent(document.getElementById('mparea'), 'mousedown', this.sendAd);
		}	
	}
	
	/**
	 * 发送页面数据
	 */
	this.sendPv = function() {		
		var referrer = (typeof(encodeURI)=='function') ? encodeURI(document.referrer) : document.referrer;
			
		var script_src = "//pv.mp.sohu.com/pv.gif?e?=" + CMS_MP_PV.entity_id + "?m?=" + CMS_MP_PV.meida_id + "?c?=" + CMS_MP_PV.channel_id + '?r?=' + referrer;
			
		var _head = document.getElementsByTagName("head")[0];
		var _body = document.body;
		var d = _head || _body;
			
		if (d) {
			var script = document.createElement('script');
			script.src = script_src;
			d.appendChild(script);
		} else {
			document.write("<script type='text/javascript' src='" + script_src + "'/></script>");
		}					
	}
	
	/**
	 * 绑定事件
	 */
	this.addEvent = function(obj, type, fn) {
		if (obj.addEventListener) {
			obj.addEventListener(type, fn, false);
	    } else if (obj.attachEvent) {
	    	obj["e" + type + fn] = fn;
	    	obj[type + fn] = function() { 
	    		obj["e" + type + fn](window.event);
	    	};
	    	obj.attachEvent("on" + type, obj[type + fn]);
	    }
	}
	
	/**
	 * 发送点击数据
	 */
	this.sendAd = function(e) {
		if (!e) { e = window.event; }
	    var target = e.target || e.srcElement;
	    if (target.nodeName == 'A') {
	      var url = target.href;
	      url = (typeof(encodeURI) == 'function') ? encodeURI(url) : url; 
	      var title = target.innerHTML;
	      var referrer = (typeof(encodeURI)=='function') ? encodeURI(document.referrer) : document.referrer;
	      var script_src = "//pv.mp.sohu.com/ad.gif?e?=" + CMS_MP_PV.entity_id + "?m?=" + CMS_MP_PV.meida_id + '?u?=' + url + '?t?=' + title + '?r?=' + referrer;
	      var newScript = document.createElement("script");
	      newScript.src = script_src;
	      newScript.id="mp_ad_" + (new Date()).getTime();
	      document.body.appendChild(newScript);		      
	    }					
	}	
}
var cms_mp_pv_flag;
if (!cms_mp_pv_flag) {
	cms_mp_pv = new CMS_MP_PV((typeof entityId != "undefined") ? entityId : "0", (typeof mpId != "undefined") ? mpId : "0", (typeof channelId != "undefined") ? channelId : "0");
	cms_mp_pv.init();
}
cms_mp_pv_flag = 1;
