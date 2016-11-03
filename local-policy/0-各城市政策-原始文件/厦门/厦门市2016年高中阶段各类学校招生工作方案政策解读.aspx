<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
 
 
<!--
                       (0 0)
   +=============oOO====(_)================+
   |   Powered By wanhu - www.wanhu.com.cn |
   |   Tel:400-888-0035  020-85575672      |
   |   Creation:2015.05.18                 |
   |   ezEip v4.0.6                        |
   +==========================oOO==========+
                      |__|__|
                       || ||
                      ooO Ooo
-->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="Author" content="万户网络">
<meta content="万户网络 www.wanhu.com.cn" name="design">
<meta name="Author" content="万户网络设计制作" />
<title>厦门市招生考试委员会办公室</title>
<meta name="keywords" content="厦门市招生考试委员会办公室" />
<meta name="Description" content="厦门市招生考试委员会办公室" />

<link rel="stylesheet" type="text/css" href="/cn/css/css_whir.css"/>
<link id="PageSkin" rel="stylesheet" type="text/css" href="" />
<script type="text/javascript" src="/cn/scripts/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/cn/scripts/jquery.SuperSlide.2.1.1.js"></script>
<!--[if lt IE 9]>
  <script type="text/javascript" src="/cn/scripts/html5shiv.v3.72.min.js"></script>
<![endif]-->

<script type="text/javascript">
    var navID = "4";
   var menuID = 36;
</script>
</head>

<body>
<!--top-->
 
 
<header class="Top">
   <div class="Header">
      <div class="head">
        <div class="color_change">
            <span>颜色切换：</span>
            <ul>
                <li><a href="javascript:void(0);" class="blue"><img alt="" src="/cn/images/blue.jpg" width="14" height="4" /></a></li>
                <!--<li><a href="javascript:void(0);" class="red"><img alt="" src="/cn/images/red.jpg" width="14" height="4" /></a></li>-->
                <li><a href="javascript:void(0);" class="orange"><img alt="" src="/cn/images/orange.jpg" width="14" height="4" /></a></li>
            </ul>
        </div>
        
        <div class="site_set">
          <a href="javascript:void(0);" onclick="SetHome(this,window.location);">设为首页</a><em></em><a href="javascript:void(0);" onclick="AddFavorite(document.title,location.href)">加入收藏</a>
        </div> 
      </div>
   </div>
</header>
<script src="/cn/scripts/jquery.cookie.js" type="text/javascript"></script>
<script type="text/javascript">
   //加载css
   $(".orange").addClass("oncolor");
   $("#PageSkin").attr("href","/cn/css/skin_orange.css");
   $(function () {
       var cssID = $.cookie("Cook");
       $(".color_change li").find("a").removeClass("oncolor");
       $(".color_change li:eq(cssID)").find("a").addClass("oncolor");
       if (cssID == 0) {
           //蓝色
           $("#PageSkin").attr("href", "/cn/css/skin_blue.css");
       }
       //if (cssID == 1) {
           //红色
         //  $("#PageSkin").attr("href", "/cn/css/skin_red.css");
       //}
       if (cssID == 2) {
           //橙色
           $("#PageSkin").attr("href", "/cn/css/skin_orange.css");
       }
   });
</script>
<script type="text/javascript">
    $(".color_change li:last").css("background","none");
	$(".color_change li").each(function(index, element) {
        $(this).find("a").click( function(){
            var cssID = index;
            $.cookie("Cook", cssID);
            
			if(cssID == 0){
			   //蓝色
			    $("#PageSkin").attr("href", "/cn/css/skin_blue.css");
			   }
		   // if(cssID == 1){
			   //红色
		        //$("#PageSkin").attr("href", "/cn/css/skin_red.css");
			   //}
		    if(cssID == 2){
			   //橙色
		        $("#PageSkin").attr("href", "/cn/css/skin_orange.css");
			}
		   	$(this).parents("li").siblings().find("a").removeClass("oncolor");
			$(this).addClass("oncolor");
	    })
    });

   //导航选中
    $("#nav" + navID).addClass("onnav");
</script>

<script type="text/javascript">
    //设为首页
    function SetHome(obj, url) {
        try {
            obj.style.behavior = 'url(#default#homepage)';
            obj.setHomePage(url);
        } catch (e) {
            if (window.netscape) {
                try {
                    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                } catch (e) {
                    alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
                }
            } else {
                alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【" + url + "】设置为首页。");
            }
        }
    }

    //收藏本站
    function AddFavorite(title, url) {
        try {
            window.external.addFavorite(url, title);
        }
        catch (e) {
            try {
                window.sidebar.addPanel(title, url, "");
            }
            catch (e) {
                alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
            }
        }
    }
</script>

<script type="text/javascript">
    function GoSearchUrl() {
        var searchinput = document.getElementById("key");
        if (searchinput.value == "" || searchinput.value == "搜索") {
            alert("请输入关键字！");
            searchinput.focus();
            return false;
        }
        if (searchinput.value.length > 50) {
            alert("输入的关键字字数不要过多！");
            searchinput.focus();
            return false;
        }
        CheckString(searchinput.value);
    }

    function GoSreach(rs) {
        window.location = "/search/search.aspx?key=" + escape(rs);
        return true;
    }

    function entersearch() {
        //alert(dd);
        var event = window.event || arguments.callee.caller.arguments[0];
        if (event.keyCode == 13) {
            GoSearchUrl();
        }
    }

    function CheckString(s) {
        var pattern = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#￥……&*（）—|{}【】‘；：”“'。，、？]")
        var rs = "";
        for (var i = 0; i < s.length; i++) {
            rs = rs + s.substr(i, 1).replace(pattern, '');
        }
        if (rs == "") {
            alert("不能输入特殊字符！");
            return false;
        }
        else {
            GoSreach(rs);
        }
    }
</script>

<!--top End-->

<section class="HomContain">
   
 
<div class="Logo"></div>
<div class="Main">
  <nav class="MainNav">
      <ul>
         <li><a id="nav1" class="navA" href='/index.aspx' name="首页">首页</a></li>
         <li><a id="nav2" class="navA" href='/zbjs/list_24.aspx' name="本办概况">本办概况</a></li>
         <li><a id="nav3" class="navA" href='/gkzc/list_31.aspx' name="高考高招">高考高招 </a></li>
         <li><a id="nav4" class="navA" href='/zkzc/list_36.aspx' name="中考中招">中考中招</a></li>
         <li><a id="nav5" class="navA" href='/hkzc/list_41.aspx' name="高中会考">高中会考</a></li>
         <li><a id="nav6" class="navA" href='/zkzcKS/list_46.aspx' name="自学考试">自学考试</a></li>
         <li><a id="nav7" class="navA" href='/ckzc/list_53.aspx' name="成人高考">成人高考</a></li>
         <li><a id="nav8" class="navA" href='/zsbzc/list_58.aspx' name="专升本考试">专升本考试 </a></li>
         <li><a id="nav9" class="navA" href='/ykzc/list_64.aspx' name="研究生考试">研究生考试</a></li>
         <li><a id="nav10" class="navA" href='/jkzc/list_70.aspx' name="教师资格考试">教师资格考试 </a></li>
         <li><a id="nav11" class="navA" href='/dwgz/list_76.aspx' name="党务工作">党务工作</a></li>
         <li><a id="nav12" class="navA" href='/list_175.aspx' name="招标采购">工程采购</a></li>
         <!--<li><a id="nav13" class="navA" href='/hydl/index_79.aspx' name="内部通告">内部通告</a></li>-->
      </ul>
   </nav>
   
   <div class="nav_gg">
      <div class="top_scroll">
          <div class="bd">
               <ul>
                  
                    <li><a href='/ggl/info_29.aspx?itemid=1129'>2016年成人高考报名工作重要提示</a></li>
                  
                    <li><a href='/ggl/info_29.aspx?itemid=1124'>中考成绩证明办理办法</a></li>
                  
                    <li><a href='/ggl/info_29.aspx?itemid=354'>考生不可不知：组织考试作弊等已入罪</a></li>
                  
                    <li><a href='/ggl/info_29.aspx?itemid=252'>厦门市招生考试委员会办公室关于2015年成人...</a></li>
                  
               </ul>
          </div>
       </div>
       
       <div class="serchbox">
             <input name="" type="text" class="sreach_ipu" id="key" value="搜索" onblur="if(this.value=='')this.value='搜索';" onfocus="if(this.value=='搜索')this.value='';" onkeydown="entersearch()" />
             <a href="javascript:void(0)" onclick="return GoSearchUrl();" class="sreach_btn"></a>
       </div>
   </div>
   
</div>

<script type="text/javascript">
  $(".MainNav li:last").find("a").css("background","none");
  
  jQuery(".top_scroll").slide({ mainCell: ".bd ul", autoPage: true, effect: "topLoop",scroll:1, delaytime:1000, autoPlay: true, vis: 1 });
</script>



  <div class="FContain">
     <aside class="SildeBar">
        
 
<nav class="MenuList">
    <div class="Column_list">
      <ul>
         
            <li><a id="menu36" href="/zkzc/list_36.aspx">
                
                  <img alt="" src="/uploadfiles/icos/ico2_1.png"/>
                  
                  <span>中考政策</span>
                 </a>
            </li>
        
            <li><a id="menu37" href="/zkdt/list_37.aspx">
                
                  <img alt="" src="/uploadfiles/icos/ico2_2.png"/>
                  
                  <span>中考动态</span>
                 </a>
            </li>
        
            <li><a id="menu40" href="/cjjlqcxIY/index_40.aspx">
                
                  <img alt="" src="/uploadfiles/icos/ico2_5.png"/>
                  
                  <span>成绩及录取查询</span>
                 </a>
            </li>
        
                 
            <li>
               <a id="menu38" href="http://www.xmedu.gov.cn/zmhd/wtzx/index_7503.htm?chnlId=1"  target="_blank">
                 
                  <img alt="" src="/uploadfiles/icos/ico2_3.png"/>
                  
                  <span>互动咨询</span>
               </a>
            </li>
          
          
 
      </ul>
    </div>
   
</nav>
<script type="text/javascript">
    //菜单选中
    $("#menu" + menuID).addClass("onmenu");
	
</script>

     </aside>
     <section class="Contain">
        <div class="Current">当前位置：<a href="/index.aspx">首页</a> > <a href="http://www.xmzskszx.net//zkzc/list_36.aspx">中考中招</a> > <span>中考政策</span></div>
        <div class="Content">
           <div class="column_title"><em>中考政策</em></em></div>
           <div class="Con_Info">
              <div class="Con_title">
                 <em>转发：厦门市2016年高中阶段各类学校招生工作方案政策解读</em>
                  <h3 class="date">发布时间：2016/01/21 &nbsp;&nbsp;&nbsp;&nbsp;新闻来源：&nbsp;&nbsp;&nbsp;&nbsp; 阅读次数：
<script id="whirlabelhit" type="text/javascript">
$(function(){
            $.ajax({
                type: "POST",
                url: "/label/ajax/hit.aspx",
                data: "type=0&colid=36&itemid=898&f=Hits",
                success: function (result) { $("#whirlabelhit").before(result)  }
            });
    });

</script>
</h3>
              </div>
              <div class="Con_Text">
                 <p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	<strong style="margin:0px;padding:0px;">一、《厦门市<span style="margin:0px;padding:0px;">2016</span>年高中阶段各类学校招生工作方案》共有几部分内容？</strong></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　《厦门市<span style="margin:0px;padding:0px;">2016</span>年高中阶段各类学校招生工作方案》（以下简称《方案》）共分组织领导、报名、考试、招生、志愿填报、录取、体检、监督检查等八个部分内容。</p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<strong style="margin:0px;padding:0px;">二、与<span style="margin:0px;padding:0px;">2015</span>年高中阶段各类学校招生工作方案相比，《方案》有什么主要变化？</strong></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　《方案》主要有以下五个方面变化：</p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">（一）增加体育分值和可选项目。</span>将体育分值从去年的<span style="margin:0px;padding:0px;">25</span>分提高到<span style="margin:0px;padding:0px;">30</span>分，同时增加了<span style="margin:0px;padding:0px;">100</span>米游泳、<span style="margin:0px;padding:0px;">100</span>米跑、男生仰卧起坐、女生斜身引体、足球、篮球和排球等<span style="margin:0px;padding:0px;">7</span>个项目，男生女生均可从<span style="margin:0px;padding:0px;">12</span>项中选择<span style="margin:0px;padding:0px;">4</span>项参加考试，选择范围更广。</p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">（二）鼓励学生特长发展。</span>一是适当扩大特长竞赛加分照顾对象，增加了对初中阶段参加全国青运会获得奖牌的学生，以及参加戏剧、朗诵、戏曲、篆刻等艺术类竞赛个人获得市级一等奖以上（包括参加全国中小学生艺术现场展演的集体项目获奖）的学生给予<span style="margin:0px;padding:0px;">3</span>分加分照顾。二是完善特长招生办法。在教育部门统一组织特长测试的基础上，参照高校体育、艺术类考生的录取办法，规定“测试合格且第一志愿填报特长招生学校的，体育特长生在投档分不低于招生学校普通生最低录取分数的<span style="margin:0px;padding:0px;">65%</span>的前提下，按特长测试成绩从高分到低分录取；艺术特长生在投档分不低于招生学校普通生最低录取分数<span style="margin:0px;padding:0px;">80%</span>的前提下，按特长测试成绩从高分到低分录取。”</p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　例如某招生特长生的普通高中普通生最低录取分数为<span style="margin:0px;padding:0px;">560</span>分，体育特长生投档分只需达到<span style="margin:0px;padding:0px;">364</span>分（最低录取分数的<span style="margin:0px;padding:0px;">65%</span>）、艺术特长生只需达到<span style="margin:0px;padding:0px;">448</span>分（最低录取分数的<span style="margin:0px;padding:0px;">80%</span>），就可按特长测试成绩从高分到低分录取。</p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">（三）取消中外合作班招生。</span>为进一步规范办学行为，扩大优质高中面向本市的招生名额，取消厦门一中、双十中学、外国语学校、集美中学等四所学校中外合作课程实验班招收（包括不再面向外地市的招生），四个中外合作班的招生名额增加到普通班的招生。</p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">（四）适当调整定向生比例和降分值。</span>为了进一步落实好定向生政策，推进各初中校进一步提高教育教学质量，<span style="margin:0px;padding:0px;">防止初中学校之间定向生分数差值过大，产生新的不公平问题，同时避免高中阶段因定向生与其他普通生分差较大，影响教学进度的统一推进，经过测算和评估，</span>在保持定向生总数略有增加的情况下，今年将定向生比例从<span style="margin:0px;padding:0px;">55%</span>调整为<span style="margin:0px;padding:0px;">50%</span>，同时将<span style="margin:0px;padding:0px;">定向生投档分最多可降至招生学校的普通生最低投档线下的分值从<span style="margin:0px;padding:0px;">55</span>分调至<span style="margin:0px;padding:0px;">40</span>分。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">（五）志愿填报更加简便。</span><span style="margin:0px;padding:0px;">不设录取批次，考生可根据招生范围和填报条件选报<span style="margin:0px;padding:0px;">30</span>个志愿（至少应填报<span style="margin:0px;padding:0px;">5</span>所中等职业学校）</span>，可以充分体现学生的意愿。同时，实行网上志愿填报，学生家长在家里就可以完成志愿填报。&nbsp;</p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;"><strong style="margin:0px;padding:0px;">三、哪一些学校面向全市招生？</strong></span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">1.</span><span style="margin:0px;padding:0px;">全部面向全市招生的学校是：厦门外国语学校、集美中学、科技中学、厦门二中、厦门实验中学、英才学校、康桥中学等<span style="margin:0px;padding:0px;">7</span>所普通高中，以及五年制高职、中等职业类学校。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">2.</span><span style="margin:0px;padding:0px;">部分跨片区招生的学校和名额见下表</span></p><div align="center" style="margin:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	<table cellspacing="0" cellpadding="0" border="1" style="margin:0px auto;padding:0px;">		<tbody style="margin:0px;padding:0px;">			<tr style="margin:0px;padding:0px;">				<td width="213" style="margin:0px;padding:0px;">					<p align="center" style="margin-top:0px;margin-bottom:0px;padding:0px;">						<span style="margin:0px;padding:0px;">学校</span>					</p>				</td>				<td width="341" style="margin:0px;padding:0px;">					<p align="center" style="margin-top:0px;margin-bottom:0px;padding:0px;">						<span style="margin:0px;padding:0px;">片外招生数</span>					</p>				</td>			</tr>			<tr style="margin:0px;padding:0px;">				<td width="213" style="margin:0px;padding:0px;">					<p align="center" style="margin-top:0px;margin-bottom:0px;padding:0px;">						<span style="margin:0px;padding:0px;">厦门一中</span>					</p>				</td>				<td width="341" style="margin:0px;padding:0px;">					<p align="center" style="margin-top:0px;margin-bottom:0px;padding:0px;">						<span style="margin:0px;padding:0px;">面向集海片区和同翔片区招<span style="margin:0px;padding:0px;">30</span>人</span>					</p>				</td>			</tr>			<tr style="margin:0px;padding:0px;">				<td width="213" style="margin:0px;padding:0px;">					<p align="center" style="margin-top:0px;margin-bottom:0px;padding:0px;">						<span style="margin:0px;padding:0px;">双十中学</span>					</p>				</td>				<td width="341" style="margin:0px;padding:0px;">					<p align="center" style="margin-top:0px;margin-bottom:0px;padding:0px;">						<span style="margin:0px;padding:0px;">面向集海片区和同翔片区招<span style="margin:0px;padding:0px;">30</span>人</span>					</p>				</td>			</tr>			<tr style="margin:0px;padding:0px;">				<td width="213" style="margin:0px;padding:0px;">					<p align="center" style="margin-top:0px;margin-bottom:0px;padding:0px;">						<span style="margin:0px;padding:0px;">厦门六中</span>					</p>				</td>				<td width="341" style="margin:0px;padding:0px;">					<p align="center" style="margin-top:0px;margin-bottom:0px;padding:0px;">						<span style="margin:0px;padding:0px;">面向集海片区和同翔片区招<span style="margin:0px;padding:0px;">30</span>人</span>					</p>				</td>			</tr>			<tr style="margin:0px;padding:0px;">				<td width="213" style="margin:0px;padding:0px;">					<p align="center" style="margin-top:0px;margin-bottom:0px;padding:0px;">						<span style="margin:0px;padding:0px;">同安一中</span>					</p>				</td>				<td width="341" style="margin:0px;padding:0px;">					<p align="center" style="margin-top:0px;margin-bottom:0px;padding:0px;">						<span style="margin:0px;padding:0px;">面向集海片区和思湖片区招<span style="margin:0px;padding:0px;">50</span>人</span>					</p>				</td>			</tr>			<tr style="margin:0px;padding:0px;">				<td width="213" style="margin:0px;padding:0px;">					<p align="center" style="margin-top:0px;margin-bottom:0px;padding:0px;">						<span style="margin:0px;padding:0px;">翔安一中</span>					</p>				</td>				<td width="341" style="margin:0px;padding:0px;">					<p align="center" style="margin-top:0px;margin-bottom:0px;padding:0px;">						<span style="margin:0px;padding:0px;">除了<span style="margin:0px;padding:0px;">300</span>名面向同翔片区招生外，其余面向集海片区和思湖片区招生</span>					</p>				</td>			</tr>			<tr style="margin:0px;padding:0px;">				<td width="213" style="margin:0px;padding:0px;">					<p align="center" style="margin-top:0px;margin-bottom:0px;padding:0px;">						<span style="margin:0px;padding:0px;">集美<span style="margin:0px;padding:0px;">/</span>海沧、同安<span style="margin:0px;padding:0px;">/</span>翔安片区的普通高中</span>					</p>				</td>				<td width="341" style="margin:0px;padding:0px;">					<p align="center" style="margin-top:0px;margin-bottom:0px;padding:0px;">						<span style="margin:0px;padding:0px;">面向思湖片区招收部分普通生，具体详见招生计划册</span>					</p>				</td>			</tr>		</tbody>	</table></div><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">3.</span><span style="margin:0px;padding:0px;">面向外地市招生的学校：</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">经省教育厅批准，集美中学面向本省其他地市招收<span style="margin:0px;padding:0px;">50</span>人，科技中学“</span><span style="margin:0px;padding:0px;">创新实验班”</span><span style="margin:0px;padding:0px;">面向厦漳泉等地区招收<span style="margin:0px;padding:0px;">50</span>名学生。户籍和学籍均不在我市或学籍在我市但不符合我市普通高中报考条件的本省其他地市应届初中生可报考。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<strong style="margin:0px;padding:0px;"><span style="margin:0px;padding:0px;">四、</span>厦门一中、双十中学、外国语学校、同安一中的定向生志愿填报有什么要求？</strong></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">厦门一中、双十中学普通生招生计划的<span style="margin:0px;padding:0px;">50%</span>指标面向思明<span style="margin:0px;padding:0px;">/</span>湖里片区初中学校招收定向生；外国语学校普通生招生计划的<span style="margin:0px;padding:0px;">40%</span>指标面向集美<span style="margin:0px;padding:0px;">/</span>海沧片区初中学校招收定向生，<span style="margin:0px;padding:0px;">10%</span>指标面向思明<span style="margin:0px;padding:0px;">/</span>湖里片区初中学校招收定向生<span style="margin:0px;padding:0px;">;</span>同安一中普通生招生计划的<span style="margin:0px;padding:0px;">50%</span>指标面向同安<span style="margin:0px;padding:0px;">/</span>翔安片区初中学校招收定向生。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">符合省一级达标学校普通生填报条件且初中阶段均在学籍所在校实际就读的应届考生（不含民办学校接收的转学学生）可填报定向生。</span><span style="margin:0px;padding:0px;">定向生投档分最多可降至招生学校的普通生最低投档线下<span style="margin:0px;padding:0px;">40</span>分。</span>定向生招生计划未完成的，不再补录。</p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">在填报定向生志愿前，思明<span style="margin:0px;padding:0px;">/</span>湖里片区的考生应先填报厦门一中和双十中学的普通生；集美<span style="margin:0px;padding:0px;">/</span>海沧片区考生应先填报外国语学校的普通生，同安<span style="margin:0px;padding:0px;">/</span>翔安片区考生应先填报同安一中的普通生。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<strong style="margin:0px;padding:0px;">五、特长生如何报名？</strong></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">市级（含市级）以上体育项目传统学校或体育特色学校可以招收体育特长生，其他普通高中经批准可招收艺术特长生。普通高中招收特长生的招生方案经审核后，于<span style="margin:0px;padding:0px;">4</span>月<span style="margin:0px;padding:0px;">15</span>日前在市教育局网站、市招办网站和相关学校网站上公布。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">在艺术、体育等方面表现突出或特长明显的考生可留意相关信息，并由本人及监护人提出申请，向招生学校报名</span><span style="margin:0px;padding:0px;">，每位考生只能报考一所学校、一个项目，不得兼报。报考市直属学校特长生招生的考生须参加市教育局统一组织的特长测试，报考区属学校特长生招生的考生须参加区教育局统一组织的特长测试。</span><span style="margin:0px;padding:0px;">全市统一组织的特长测试结果于<span style="margin:0px;padding:0px;">5</span>月<span style="margin:0px;padding:0px;">20</span>日前同时在上述三个网站公示三个工作日。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;"><strong style="margin:0px;padding:0px;">六、实验班如何招生？</strong></span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">经批准，科技中学“</span><span style="margin:0px;padding:0px;">创新实验班”</span><span style="margin:0px;padding:0px;">提前招收</span><span style="margin:0px;padding:0px;">110</span><span style="margin:0px;padding:0px;">人，其中面向本市招收<span style="margin:0px;padding:0px;">60</span>人（含本校直升<span style="margin:0px;padding:0px;">20</span>人），面向漳州、泉州等地区招<span style="margin:0px;padding:0px;">50</span>人。厦门实验中学面向全市提前招收数字化实验班<span style="margin:0px;padding:0px;">70</span>人</span><span style="margin:0px;padding:0px;">。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">科技中学和实验中学的招生方案经审核后将在学校网站上发布。两所学校的招生工作将在<span style="margin:0px;padding:0px;">5</span>月<span style="margin:0px;padding:0px;">7</span>日前完成。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<strong style="margin:0px;padding:0px;">七、全市省一级、二级、三级达标高中有哪些？</strong></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　省一级达标高中（<span style="margin:0px;padding:0px;">18</span>所）：厦门一中、双十中学、厦门六中、外国语学校、科技中学（厦门大学附属科技中学）、集美中学、同安一中、厦门二中、松柏中学、湖滨中学、厦门十中、北师大厦门海沧附属实验中学、翔安一中、启悟中学、厦门第二外国语学校、厦门三中、海沧中学、灌口中学（厦门一中集美分校）。</p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　省二级达标高中（<span style="margin:0px;padding:0px;">8</span>所）：华侨中学、大同中学、禾山中学、杏南中学、乐安中学、五显中学、新店中学、内厝中学。</p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　省三级达标高中（<span style="margin:0px;padding:0px;">2</span>所）：国祺中学、英才中学。</p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　尚未定级高中（<span style="margin:0px;padding:0px;">2</span>所）：厦门实验中学、康桥中学。</p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;"><strong style="margin:0px;padding:0px;">八、今年志愿填报有什么要求？</strong></span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">今年志愿填报不设录取批次，考生可根据招生范围和填报条件选报<span style="margin:0px;padding:0px;">30</span>个志愿，其中，至少应填报<span style="margin:0px;padding:0px;">5</span>所中等职业学校。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">各类学校的填报条件如下：</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">1.&nbsp;</span><span style="margin:0px;padding:0px;">厦门一中、双十中学、集美中学、厦门二中、厦门六中、同安一中、外国语学校、科技中学、松柏中学、湖滨中学、厦门十中、北师大厦门海沧附属实验中学、翔安一中、启悟中学、厦门第二外国语学校和厦门实验中学：“九科”全部为<span style="margin:0px;padding:0px;">C</span>级以上（含<span style="margin:0px;padding:0px;">C</span>级）且至少三科达到<span style="margin:0px;padding:0px;">A</span>级；实验考试均合格；综合素质毕业总评六个维度全部达到良好以上（含良好）。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">2.</span><span style="margin:0px;padding:0px;">厦门三中、灌口中学、海沧中学，以及省二、三级达标高中：</span><span style="margin:0px;padding:0px;">“九科”</span><span style="margin:0px;padding:0px;">至少三科达到<span style="margin:0px;padding:0px;">B</span>级以上<span style="margin:0px;padding:0px;">(</span>含<span style="margin:0px;padding:0px;">B</span>级<span style="margin:0px;padding:0px;">)</span>；实验考试均合格；综合素质毕业总评中道德品质和公民素养<span style="margin:0px;padding:0px;">2</span>个维度均达合格以上（含合格）。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">3.</span><span style="margin:0px;padding:0px;">其他普通高中：</span><span style="margin:0px;padding:0px;">“九科”</span><span style="margin:0px;padding:0px;">至少三科达到<span style="margin:0px;padding:0px;">C</span>级<span style="margin:0px;padding:0px;">(</span>含<span style="margin:0px;padding:0px;">C</span>级<span style="margin:0px;padding:0px;">)</span>；实验考试均合格；综合素质毕业总评中道德品质和公民素养<span style="margin:0px;padding:0px;">2</span>个维度均达合格以上（含合格）。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">4.</span><span style="margin:0px;padding:0px;">五年制高职（艺术类、体育类除外）：“九科”至少三科达到<span style="margin:0px;padding:0px;">C</span>级<span style="margin:0px;padding:0px;">(</span>含<span style="margin:0px;padding:0px;">C</span>级<span style="margin:0px;padding:0px;">)</span>，综合素质评价毕业总评中道德品质和公民素养<span style="margin:0px;padding:0px;">2</span>个维度均达合格以上（含合格），其中师范类专业应持有本市户籍，要求面试的专业应经面试合格<span style="margin:0px;padding:0px;">(</span>面试比例为<span style="margin:0px;padding:0px;">1</span>：<span style="margin:0px;padding:0px;">1.5</span>）。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">5.</span><span style="margin:0px;padding:0px;">艺术类、体育类五年制高职：综合素质毕业总评中道德品质和公民素养<span style="margin:0px;padding:0px;">2</span>个维度均达合格以上（含合格）。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<strong style="margin:0px;padding:0px;"><span style="margin:0px;padding:0px;">九、</span>有什么需要特别注意的？</strong></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　（一）厦门六中艺术班考生的志愿填报按该生初一年入学时考生家长和学校双方签订的协议履行。</p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　（二）<span style="margin:0px;padding:0px;">被集美<span style="margin:0px;padding:0px;">/</span>海沧和同安<span style="margin:0px;padding:0px;">/</span>翔安片区学校录取的思明<span style="margin:0px;padding:0px;">/</span>湖里片区考生，不得以任何形式到思明<span style="margin:0px;padding:0px;">/</span>湖里片区内学校就读。</span></p><p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#555555;font-family:'Microsoft YaHei';font-size:14px;line-height:30px;white-space:normal;background-color:#FFFFFF;">	　　<span style="margin:0px;padding:0px;">（三）</span>本市学籍初中毕业生若要到其他地市就读高中，须参加当地设区市教育行政部门统一组织的高中阶段学校招生考试，并经设区市中招机构办理录取手续，方可取得普通高中学籍及注册电子学籍。</p>
              </div>
              
              <div class="PrevNextBox">
                <h1 class="h1"><a href="list_36.aspx">[ 返回 ]</a></h1>
                <dl><a href="/zkzc/info_36.aspx?itemid=930">Prev：关于做好厦门市2016年中招报名暨体育考试项目报考工作的通知</a></dl>
                <dl><a href="/zkzc/info_36.aspx?itemid=897">Next：转发：厦门市2016年高中阶段各类学校招生工作方案</a></dl>
             </div>
             
           </div>
        </div>
     </section>
  </div>
</section>

<!--bottom-->
 
 
<footer class="Bottom">
   <div class="BottomLinks"> <!--友情链接-->
          <a href="#" target="_blank">
           <script type="text/javascript">
               var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cspan id='cnzz_stat_icon_5084201'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "v1.cnzz.com/stat.php%3Fid%3D5084201' type='text/javascript'%3E%3C/script%3E"));
          </script>
          </a> <em>|</em><a href='/wzdt/index_118.aspx' target="_blank">网站地图	</a> <em>|</em><a href="http://www.baidu.com" target="_blank">加入关注</a><em>|</em><a href='/yqlj/index_119.aspx' target="_blank">友情链接</a><em>|</em><a href='/lxwmOS/index_120.aspx' target="_blank">联系我们</a><em>|</em><a href='/hydl/index_79.aspx' >LOGIN</a>
   </div>
   <div class="copyright">
       <span>Copyright © 2015 厦门市招生考试委员会办公室 All Rights Reserved. 闽ICP备10019568号<script type="text/javascript">document.write(unescape("%3Cspan id='_ideConac' %3E%3C/span%3E%3Cscript   src='http://dcs.conac.cn/js/14/215/0000/40695310/CA142150000406953100002.js' type='text/javascript'%3E%3C/script%3E"));</script></span>
       <span>Designed by <a href="http://www.wanhu.com">Wanhu</a></span>
   </div>

  
</footer>



<script type="text/javascript">
//    $(function () {
//        $div = null;
//        $(".Links_scroll .bd li").each(function (i) {
//            if (i % 8 == 0) {
//                $div = $('<ul></ul>');
//                $div.appendTo(".ulWrap");
//            }
//            $(this).appendTo($div);
//        });
//        var len = $(".Links_scroll .bd ul").length;
//        if (len > 1) {
//            jQuery(".Links_scroll").slide({ mainCell: ".bd .ulWrap", effect: "leftLoop", autoPlay: true, vis: 1 });
//        }
//    });


//整站无图处理
jQuery.each(jQuery("img"), function (i, n) { jQuery(n).error(function () { n.src = '/uploadfiles/nopic.jpg'; }); n.src = n.src; });

</script>




<!--bottom End-->
</body>
</html>

<script type="text/javascript">
    //news
	jQuery(".NewsBox").slide({mainCell: ".bd ul",titCell:".hd ul",effect:"fade",autoPage:true,autoPlay:true,vis:1,delayTime:2000,interTime:3000});
</script>

<script type="text/javascript">
	 
</script>
