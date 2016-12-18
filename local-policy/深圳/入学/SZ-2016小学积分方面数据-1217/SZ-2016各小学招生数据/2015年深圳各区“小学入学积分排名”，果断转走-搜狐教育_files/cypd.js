﻿			/*--
			  自定义核心模块，通用性等问题构建，为了解决性能
			  -as core
			  -file
			  -r fn 返回公共方法
			*/
			define("sjs/base/core", ["sjs/util/url","sjs/flash/swfobject"], function(url, swfobject){
				
				return {
					/*--
					  循环
					  -p obj obj 
					  -p obj iterator
					  -p obj context
					*/
					each : function( obj, iterator, context ){
						if (obj == null) return;
						if (obj.length === +obj.length) {
						  for (var i = 0, l = obj.length; i < l; i++) {
							iterator.call(context, i, obj[i], obj);
						  }
						} else {
						  for (var key in obj) {
							if (_.has(obj, key)) {
							  iterator.call(context, key, obj[key], obj);
							}
						  }
						}
					},
					/*--
					  继承
					  -p obj des 
					  -p obj res 
					  -r obj des
					*/
					extend : function( obj ){
						this.each(Array.prototype.slice.call(arguments, 1), function(index, source) {
						  if (source) {
							for (var prop in source) {
							  obj[prop] = source[prop];
							}
						  }
						});
						return obj;
					},
					/*--
					  getElementById
					  -p string id 
					  -r obj obj
					*/
					get_el : function( id ){
						return document.getElementById( id );
					},
					/*--
					  jsonp
					  -p obj obj 
					  -r obj null
					*/
					jsonp : function(obj){
					
						var callback = "sjs_" + (Math.random() + '').substr(2, 16),
							script = document.createElement('script'),
							head = document.getElementsByTagName('head')[0];
							
						script.unload = function(){
							script.onload = script.onreadystatechange = null;
							head.removeChild(script);
						};	
						
						script.onload = script.onreadystatechange = function () {
							if (!script.readyState || /loaded|complete/.test(script.readyState)) {
								script.unload();
								script = undefined;
							}
						};
						
						var success = obj.success || (function(){}),
							error = obj.error || (function(){}),
							complete = function(data, fun, obj){
								script && script.unload();
								fun(data);
								window.clearTimeout(obj.timepoint);
								obj.complete && obj.complete(data);
							};
						
						window[callback] = function(data){ 
							complete(data, success, obj); 
						};

						if(obj.timeout){
							obj.timepoint = window.setTimeout(
								function(){ 
									complete({'code':'timeout'}, error, obj); 
								}, 
							obj.timeout);
						}
						
						script.src = obj.url + (obj.url.indexOf('?') >= 0 ? "&" : "?") + (obj.jsonp || "callback")
							+ "=" + callback + '&' + url.param(obj.data);
						script.charset = "UTF-8";
						head.appendChild(script);
						
					},

					/*--
					  build namespace
					  -p obj obj 
					  -p string namespace
					  -p string def_val 默认值
					  -r obj obj
					*/
					using : function( obj, namespace, def_val ){

						if(typeof(obj) === "string"){
							def_val = namespace;
							namespace = obj;
							obj = window;
						}
						var nps = namespace.split(".");
						this.each(nps, function(i){
							obj[nps[i]] = obj[nps[i]] || 
								((i === (nps.length-1)) ? (def_val || {}) : {});
							obj = obj[nps[i]];
						});
						
						return obj;
					},
					/*--
					  模板
					  -p string _html 模板字符串 
					  -p obj 填充类
					  -r string html
					*/
					tmpl : function(_html, obj ){
						var arr = _html.match(/{{\w+}}/g);
						for(var i=0,j=arr.length;i<j;i++){
							var pro = arr[i].replace("{{", "").replace("}}","");
							_html = _html.replace(eval("/"+arr[i]+"/g"), obj[pro] || 0);
						}
						
						return _html;
					},
					/*--
					  获取浏览器是否支持flash
					  -r sring 0 or 1
					*/
					sflash : function(){
						var pv = swfobject.getFlashPlayerVersion();
						return (pv.major + pv.minor + pv.release) ? '1' : '0';
					},
					/*--
					  绑定事件
					  -p obj obj 
					  -p string type
					  -p fn fn
					*/
					bind : function(obj, type, fn){
					
						if ( obj.addEventListener ) {
							obj.addEventListener( type, fn, false );
						} else if ( obj.attachEvent ) {
							obj.attachEvent( "on" + type, fn );
						} else {
							this.using(obj, "events." + type, []).push(fn);
						}
						
					},
					/*--
					  取消绑定事件
					  -p obj obj 
					  -p string type
					  -p fn fn
					*/
					unbind : function(obj, type, fn){
					
						if ( obj.removeEventListener ) {
							obj.removeEventListener( type, fn, false );
						} else if ( obj.detachEvent ) {
							obj.detachEvent( "on" + type, fn);
						} else {
							this.using(obj, "events")[type] = undefined;
						}
					},
					/*--
					  触发事件
					  -p obj obj 
					  -p string type
					  -p obj args
					*/
					fire : function(obj, type, args){
					
						var events = this.using(obj, "events");
						if(events[type]){
							this.each(events[type],function(i){
								if(typeof(this) === "function"){
									this.call(obj, args);
								}
							});
						}
					},
					/*--
					  是否是数组
					  -p obj obj 
					  -r boolean true/false
					*/
					is_array : function( obj ){
						return Object.prototype.toString.call( obj ) === "[object Array]"
					},
					/*--
					  是否是对象
					  -p obj obj 
					  -r boolean true/false
					*/
					is_object : function( obj ){
						return Object.prototype.toString.call( obj ) === "[object Object]"
					},
					/*--
					  获取坐标
					  -p obj event
					  -r obj X、Y坐标
					*/
					get_Pos: function(ev){		//获取坐标
						if(ev.pageX || ev.pageY){
							return {x:ev.pageX, y:ev.pageY};
						}
						return {
							x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,
							y:ev.clientY + document.body.scrollTop  - document.body.clientTop
						};
					},
					/*--
					  添加domready事件
					  -p function 事件方法
					  -r none
					*/
					domready : function( fun ){
					
						if(document.readyState === "complete"){
						
							fun();
						
						} else if ( document.addEventListener ) {   

							document.addEventListener( "DOMContentLoaded", function(){
								document.removeEventListener( "DOMContentLoaded", arguments.callee, false );   
								fun();   
							}, false );   

						} else if ( document.attachEvent ) {   

							document.attachEvent("onreadystatechange", function(){   
								if ( document.readyState === "complete" ) {   
									document.detachEvent( "onreadystatechange", arguments.callee );   
									fun();   
								}   
							});
						}
						
					}
				};
				
			});
		
			/**
			 * @desp 产业频道广告 
			 */
			define("sjs/matrix/ad/form/cypd", 
				["sjs/matrix/ad/form/common", "sjs/matrix/ad/stat"],
				function (common, stat) {
					var $ = jQuery;
					var cypd = common.create({
						options : {
							tpl_content : "<div class=\"introduction\" mid=\"109162\">"
														+"<div class=\"c_logo\"></div>"
														+"<div class=\"img-name c_name\"></div>"
													  +"</div>"
											 +"<div class=\"published\" style=\"width:560px;\">"
											   +"<h3>"
												 +"<span class=\"content-title c_title\"></span>"
											   +"</h3>"
											   
												+"<div class=\"content-picAd c_pic1 c_pic2 c_pic3\">"
												+"</div>"
												 +"<p class=\"content-words c_desp\"></p>"
												+"		   <p class=\"publish-footer\">"
												+" <span class=\"time c_time\"></span>"
												+"						 <a class=\"extend-link l_tip\" href=\"#\" target=\"_blank\">推广</a> "          
												+"							   </p>"
											+" </div>",
								
							logo : "resource",    	//用户logo
							name : "resource1",		//用户name
							title : "resource2",	
							desp : "resource3",
							pic1 : "resource4",
							pic2 : "resource5",
							pic3 : "resource6"
							
						},
						
						init : function(){
						
							var ado = this.adObject;
							var opt = this.options = $.extend(this.options, ado.spec);

							var item = $(".list-box").find("li")[0];
							this.container = $("<li></li>"); 
							this.container.insertAfter(item);
							this.container.html(opt.tpl_content);
							
							this.write("logo");
							this.write("name");
							this.write("title");
							this.write("desp");
							this.write("pic1");
							this.write("pic2");
							this.write("pic3");
							this.write_time();
							this.write_link();
							
							this.after();
						},
						
						write : function( xxx ){
						
							var cont = this.container, opt = this.options, 
								res = this.adObject[ this.options[xxx + ""] ];
								
							cont = cont.find(".c_" + xxx);
							
							this.insert(cont, res);
								
							if(xxx === "logo"){ cont.find("a").attr("class", "img-wrapper");}
							if(xxx === "name"){ cont.find("a").attr("class", "per-name");}
						},
						
						insert : function(cont, res){
						
							if(cont.length && res){
								var old = cont.html();
								if(res["type"] === "image"){
									cont.html(old + "<a href=\"" + res["click"] + 
										"\" target=\"_blank\"><img src=\"" + 
											res["file"] + "\" width=\"" + res["width"] +  
												"\" height=\"" + res["height"] +  "\" border=\"0\" /></a>");
								}else if(res["type"] === "text"){
									cont.html(old + '<a href="' + res.click 
										+ '" target="_blank">' + decodeURIComponent(res.text) + '</a>');
								}
							}
						},
						
						write_time : function(){
							
							var getFormatStr = function(num){ if(num < 10){ num = "0" + num; } return num; };
							
							var cont = this.container.find(".c_time");
							if(cont.length){
								var date = new Date();
								var year = date.getFullYear(),
									month = date.getMonth() + 1,
									day = date.getDate(),
									hour = date.getHours(),
									minutes = date.getMinutes();
								cont.html(year + "年" + getFormatStr(month) + "月" + getFormatStr(day) + "日" + getFormatStr(hour) + ":" + getFormatStr(minutes));
							}
						},
						
						write_link : function(){
							var item = this.container.find(".l_tip");
							item.attr("href", this.adObject.resource && this.adObject.resource.click);
						},
						
						after : function(){
							var self = this;
							this.adObject.trigger("afterload");
							this.adObject.trigger("allownext");
							
							this.container.bind("mousedown", function(evt){
								var oc = /a|img/.test(evt.target.tagName.toLowerCase());
								if(oc){
									stat.get("click", self.adObject);
									stat.get(self.adObject.resource.clkm);
								}
							});
						}
					});
					
					return cypd;
				}
			);
			
			/**
			 * @desp 产业频道广告 
			 */
			define("sjs/matrix/ad/form/cypdw", 
				["sjs/matrix/ad/form/common","sjs/matrix/ad/form/cypd"],
				function (common, cypd) {
					var $ = jQuery;
					var cypdw = common.create({
						options : {},
						init : function(){
							var obj = new cypd(this.adObject);
							obj.init();
						}
					});
					
					return cypdw;
				}
			);
			
			/**
			 * @desp 产业频道广告 
			 */
			define("sjs/matrix/ad/form/cypdt", 
				["sjs/matrix/ad/form/common","sjs/matrix/ad/form/cypd"],
				function (common, cypd) {
					var $ = jQuery;
					var cypdt = common.create({
						options : {},
						init : function(){
							var obj = new cypd(this.adObject);
							obj.init();
						}
					});
					
					return cypdt;
				}
			);
		
			//产业频道图文混排
			define("sjs/matrix/ad/form/cypdr", ["sjs/matrix/ad/form/cypd", "sjs/matrix/ad/stat"], 
				function( cypd, stat ){
					var $ = jQuery;
					var cypdr = cypd.create({
						options : {
							tpl : "	<div class=\"ad-ra\">"
									+"		<div class=\"c_logo\"></div>"
									+"		<a class=\"web-link\" target=\"_blank\">官网</a>"
									+"	</div>"
									+"	<div class=\"list-ad\">"
									+"		<ul>"
									+"			<li class=\"c_txt1\"></li>"
									+"			<li class=\"c_txt2\"></li>"
									+"			<li class=\"c_txt3\"></li>"
									+"		</ul>"
									+"	</div>",
							logo : "resource",
							text1 : "resource1",
							text2 : "resource2",
							text3 : "resource3"
						},
						
						init : function(){
							var ado = this.adObject;
							var opt = this.options = $.extend(this.options, ado.spec);
				
							this.container.html(opt.tpl);
							this.write();
							this.after();
						},
						
						write : function(){
						
							var ado = this.adObject, opt = this.options,
								logo_cont = this.container.find(".c_logo"),
								txt1_cont = this.container.find(".c_txt1"),
								txt2_cont = this.container.find(".c_txt2"),
								txt3_cont = this.container.find(".c_txt3"),
								tip = this.container.find(".web-link");
								
							this.insert(logo_cont, ado[opt["logo"]]);
							this.insert(txt1_cont, ado[opt["text1"]]);
							this.insert(txt2_cont, ado[opt["text2"]]);
							this.insert(txt3_cont, ado[opt["text3"]]);
							tip.attr("href", ado[opt["logo"]] && ado[opt["logo"]].click);
						},

						after : function(){
							var self = this;
							this.adObject.trigger("afterload");
							this.adObject.trigger("allownext");
							
							this.container.bind("mousedown", function(evt){
								var oc = /a|img/.test(evt.target.tagName.toLowerCase());
								if(oc){
									stat.get("click", self.adObject);
									stat.get(self.adObject.resource.clkm);
								}
							});
						}
						
					});
					
					return cypdr;
				}
			);