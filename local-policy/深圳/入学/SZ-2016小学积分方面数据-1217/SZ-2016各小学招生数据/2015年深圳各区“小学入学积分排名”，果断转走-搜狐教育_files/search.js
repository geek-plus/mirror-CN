var genTime = function(time) {
	var d = new Date(time);
	var year = d.getFullYear();
	//getMonth 0-11 
	var month = d.getMonth() + 1 > 9 ? d.getMonth() + 1 : ('0' + (d.getMonth() + 1));
	//getDate 1-31 
	var date = d.getDate() > 9 ? d.getDate() : '0' + d.getDate();
	var hour = d.getHours() > 9 ? d.getHours() : '0' + d.getHours();
	var minute = d.getMinutes() > 9 ? d.getMinutes() : '0' + d.getMinutes();
	var formatdate = year + "��" + month + "��" + date + "�� " + hour + ":" + minute;
	return formatdate;
};
var genHTML = function(entry, word) {
	var html = ['<li>',
		'<div class="introduction" mid="' + entry.mediaId + '">',
		'<a class="img-wrapper" href="" target="_blank"><img src=""/></a>',
		'<div class="img-name">',
		'<a class="per-name" href="" target="_blank"></a>',
		'</div></div><div class="published"> <h3>',
		'<span class="com-num"><a href="#" target="_blank">0</a></span>',
		'<span class="content-title"><a href="' + entry.url + '" target="_blank">',
		entry.title + '</a></span>',
		'</h3>'
	];
	var pic = [];
	if (entry.img != undefined) {
		pic.push('<div class="content-pic"><img src="' + entry.img + '"/></div>');
	}
	var html2 = ['<p class="content-words">',
		subtract(entry.content, word) + '...</p>',
		'<p class="publish-footer"><span class="time">',
		genTime(entry.time),
		'</span>'
	];
	var tags = [];
	if (entry.tags.length > 0) {
		tags.push('<span class="link">');
		if (entry.tags[0].url != undefined && entry.tags[0].url != "") {
			tags.push('<em class="now"><a target="_blank" href=' + entry.tags[0].url + '>' + entry.tags[0].name + '</a></em>');
		}
		for (var i = 1; i < entry.tags.length; i++) {
			if (entry.tags[i].url != undefined && entry.tags[i].url != "") {
				tags.push('<a target="_blank" href=' + entry.tags[i].url + '>' + entry.tags[i].name + '</a>');
			}
		}
		tags.push('</span>');
	}
	var html3 = ['</p></div></li>'];
	var all = html.concat(pic).concat(html2).concat(tags).concat(html3);
	return all.join('');

};

var doPage = function(word, cur, max) {
	if (max <= 1) return false;
	var pre = (cur - 1 > 1) ? cur - 1 : 1;
	var next = (cur + 1 < max) ? cur + 1 : max;
	var page = ['<div class="pages"><table><tbody><tr><td nowrap="">',
		'<a href="#" onclick="doSearch(\'' + word + '\',',
		'1);">��ҳ</a>&nbsp;<a href="#" onclick="javascript:doSearch(\'' + word + '\',' + pre,
		');return false;">��һҳ</a>&nbsp;<a href="#" onclick="javascript:doSearch(\'' + word + '\',' + next,
		');return false;">��һҳ</a>&nbsp;<a href="#" onclick="javascript:doSearch(\'' + word + '\',' + max,
		');return false;">ĩҳ</a>&nbsp;',
		'</td></tr></tbody></table></div>'
	];
	$(".list-box").after(page.join(''));

};

var getUrlParam = function(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //����һ������Ŀ�������������ʽ����
	var r = window.location.search.substr(1).match(reg); //ƥ��Ŀ�����
	if (r != null)
	//return unescape(r[2]);
		return r[2];
	return ''; //���ز���ֵ
};

var subtract = function(content, wd) {
	content = content.replace(/<span style='color:red'>/g, '');
	content = content.replace(/<\/span>/g, '');
	content = content.substr(0, 130);
	var reg = new RegExp(wd, "g");
	content = content.replace(reg, '<span style=\'color:red\'>' + wd + '</span>');
	return content;
};

var doSearch = function(word, page) {
	$("#mediaSearch").hide();
	$("#newsSearch").show();
	$("#mediaUrl").val("");
	$("#mediaSearch").val("��������ý������").css("color", "#CDCDCD");;
	if (word == '')
		word = $("#newsSearch").val();
	if (word == search.newsPlaceHolder)
		word = '';
	if (word == '' && window.location.search != '') {
		word = decodeURIComponent(getUrlParam('wd'));
	}
	if (word == '' || word == undefined || word == null) {
		return false;
	}

	if (window.location.pathname.indexOf(search.newsUrlPart) == -1) {
		window.open(search.newsUrl + encodeURIComponent(word.replace(/</g, "&lt;").replace(/>/g, "&gt;")));
		return false;
	}

	$("#newsSearch").val(word); //��д�������
	if (page == '' || page == undefined || page == null) {
		page = 1;
	}
	var currentpage = page;
	var maxpage = 0;
	var pagesize = 10;
	var url = "http://mp.sohu.com/es/search.action?callback=?";
	$.getJSON(url, {
		wd: word,
		chid: search.channelId,
		caid: -1,
		size: pagesize,
		from: pagesize * (currentpage - 1)
	}, function(data) {
		$(".list-box li").remove();
		$(".result-yes").remove();
		$(".result-no").remove();
		$(".pages").remove();
		$(".data-tag").hide();
		if (data.status && data.result && data.result.total > 0) {
			var r = '<div class="result-yes">���� <span class="result-red">' + word.replace(/</g, "&lt;").replace(/>/g, "&gt;") +
				'</span> ����������� <span class="result-red">' + data.result.total +
				'</span> ��</div>';
			maxpage = parseInt(data.result.total / pagesize);
			if (data.result.total % pagesize != 0) {
				maxpage = maxpage + 1;
			}
			$(".data-tag .now .num").text("(" + data.result.total + ")");
			$(".data-tag").show();
			$(".main-content").prepend(r);
		} else {
			var r = '<div class="result-no">��Ǹ��δ�ҵ�����<span class="result-red">' + word.replace(/</g, "&lt;").replace(/>/g, "&gt;") +
				'</span>��������������������������ؼ���������鿴�·������Ƽ���</div>';
			$(".main-content").prepend(r);
			return false;
		}

		if (data.result != undefined && data.result.list != undefined) {
			$.each(data.result.list, function(i, item) {
				var li = genHTML(item, word.replace(/</g, "&lt;").replace(/>/g, "&gt;"));
				$(".list-box").append(li);
			});
		}
		loadMediaInfo();
		setCommentNum();
		doPage(word.replace(/</g, "&lt;").replace(/>/g, "&gt;"), currentpage, maxpage);
	});
};

/**
media search functions
**/
var highlightMedia = function(content, wd) {
	content = decodeURIComponent(content);
	var reg = new RegExp(wd, "g");
	content = content.replace(reg, '<span class=\'result-red\'>' + wd + '</span>');
	return content;
};

var gradeMedia = function(grade) {
	if (isNaN(grade)) {
		return "";
	}
	var em = '';
	switch (grade) {
		case '70':
			em = '<em class="grade-icon grade-iconA"  title="��������"></em>';
			break;
		case '80':
			em = '<em class="grade-icon grade-iconB"  title="��������"></em>';
			break;
	}
	return em;
};

var genNum = function(num) {
	if (isNaN(num)) {
		return 0;
	}
	if (num >= 10000) {
		return Math.round(num * 10 / 10000) / 10 + "��";
	}
	return num;
};

var genMediaHtml = function(item, word) {
	var mediaUrl = item.mediaUrl == undefined ? "javascript:void(0);" : decodeURIComponent(item.mediaUrl);
	var mediaLogo = item.logo == undefined ? "http://s0.mp.sohu.com/asset/defaultlogo.gif" : decodeURIComponent(item.logo);
	var mediaDesc = (item.desc == undefined || item.desc == null) ? "" : decodeURIComponent(item.desc);
	var li = '<li><div class="author-img">';
	li += '<a href="' + mediaUrl + '" target="_blank"><img src="' + mediaLogo + '"'+
	' onerror="this.onerror=null;this.src=\'http://s0.mp.sohu.com/asset/defaultlogo.gif\';"></a></div><div class="intro">';
	li += '<h3><span class="tt"><a href="' + mediaUrl + '" target="_blank">';
	li += highlightMedia(item.mediaName, word) + '</a></span>';
	li += gradeMedia(item.mediaGrade) + '</h3>';
	li += '<p>' + mediaDesc + '</p>';
	li += '<h5>�Ķ���<span class="num">' + genNum(item.mediaPV) +
		'</span>|��������<span class="num">' + genNum(item.newsCount) +
		'</span>|��������<span class="num">' + genNum(item.cmtCount) +
		'</span></h5></div></li>';

	return li;
};
var doMediaSearch = function() {
	$("#newsSearch").hide();
	$("#mediaSearch").show();
	$("#newsSearch").val(search.newsPlaceHolder).css("color", "#CDCDCD");
	var word = $("#mediaSearch").val();
	if (word == '��������ý������')
		word = '';
	if (word == '' && window.location.search != '') {
		word = decodeURIComponent(getUrlParam('wd'));
	}
	if (word == '' || word == undefined || word == null) {
		return false;
	}
	if (window.location.pathname.indexOf(search.mediaUrlPart) == -1) {
		window.open(search.mediaUrl + encodeURIComponent(word.replace(/</g, "&lt;").replace(/>/g, "&gt;")));
		return false;
	}
	$("#mediaSearch").val(word);
	var url = "http://mp.sohu.com/openapi/mediaFull?callback=?";
	$.getJSON(url, {
		mediaName: word
	}, function(data) {
		//console.log(data);
		$(".result-yes").remove();
		$(".result-no").remove();
		$(".author-list li").remove();

		if (data && data.success && data.data.count > 0) {
			var r = '<div class="result-yes">�����ǹ��� <span class="result-red">' + word.replace(/</g, "&lt;").replace(/>/g, "&gt;") + '</span> ���������</div>';
			$(".main-content").prepend(r);
			$.each(data.data.list, function(index, item) {
				var li = genMediaHtml(item, word.replace(/</g, "&lt;").replace(/>/g, "&gt;"));
				$(".author-list").append(li);
			});
		} else {
			var r = '<div class="result-no">��Ǹ��δ�ҵ������к���<span class="result-red">' + word.replace(/</g, "&lt;").replace(/>/g, "&gt;") + '</span>�����ߣ��������Թ�ע�����������ߡ�</div>';
			$(".main-content").prepend(r);
			return false;
		}

	});
};
/**
typeahead
**/
$(function() {
	var queryFlag = 1;
	var mediaName = new Bloodhound({
		datumTokenizer: Bloodhound.tokenizers.obj.whitespace('mediaName'),
		queryTokenizer: Bloodhound.tokenizers.whitespace,
		limit: 20,
		remote: {
			url: 'http://mp.sohu.com/openapi/mediaTip?',
			replace: function(url, query) {
				return url + 'mediaName=' + encodeURIComponent(query) + '&token=' + queryFlag;
			},
			filter: function(parsedResponse) {
				if (parsedResponse.token != queryFlag - 1) {
					return [];
				} else {
					if(parsedResponse.data!=undefined && parsedResponse.data.list!=undefined){
						$.each(parsedResponse.data.list, function(index, val) {
							parsedResponse.data.list[index].mediaId = decodeURIComponent(parsedResponse.data.list[index].mediaId);
							parsedResponse.data.list[index].mediaName = decodeURIComponent(parsedResponse.data.list[index].mediaName);
						});
						return parsedResponse.data.list;
					}else{
						return [];
					}
				}
			},
			ajax: {
				type: "GET",
				dataType: "jsonp",
				beforeSend: function() {
					queryFlag = queryFlag + 1;
					$("#mediaUrl").val("");
				}
			}
		}
	});

	mediaName.initialize();

	$('.typeahead').typeahead({
			hint: true,
			highlight: true,
			minLength: 1
		}, {
			name: 'mediaName',
			displayKey: 'mediaName',
			source: mediaName.ttAdapter()
		})
		.bind("typeahead:selected", function(obj, datum, name) {
			if (datum.mediaUrl != undefined && datum.mediaUrl.length > 0) {
				$('#mediaUrl').val(decodeURIComponent(datum.mediaUrl));
				$('#mediaSearch').val(datum.mediaName);
				$('#mediaSearch').blur();
				window.open(decodeURIComponent(datum.mediaUrl));
			}
		})
		.bind("typeahead:autocompleted", function(obj, datum, name) {
			if (datum.mediaUrl != undefined && datum.mediaUrl.length > 0) {
				$('#mediaUrl').val(decodeURIComponent(datum.mediaUrl));
				$('#mediaSearch').val(datum.mediaName);
				$('#mediaSearch').blur();
				window.open(decodeURIComponent(datum.mediaUrl));
			}
		});
});
/**
ready invoke 
**/
$(document).ready(function() {
	if (window.location.search != '') {
		var type = getUrlParam('t');
		if (type != undefined && type == 'news')
			doSearch('', '');
		else if (type != undefined && type == 'media') {
			doMediaSearch();
		}
	}
	var sel = $(".cur-res").text();
	$("#sele-ul li").on('click', function() {
		$("#sele-id .cur-res").text($(this).text());
		$("#sele-ul").hide();
		sel = $(this).text();
		if ($(this).text().indexOf('����') > -1) {
			$("#mediaSearch").val("��������ý������").css("color", "#CDCDCD");
			$("#mediaUrl").val("");
			$(".typeahead").hide();
			$("#mediaSearch").hide();
			$("#newsSearch").show();
		} else if ($(this).text().indexOf('����') > -1) {
			$("#newsSearch").val(search.newsPlaceHolder).css("color", "#CDCDCD");
			$("#newsSearch").hide();
			$("#mediaSearch").show();
		}
	});
	$(".search-btn").on("click", function() {
		if (sel.indexOf("����") > -1) {
			doSearch('', '');
		} else {
			var url = $("#mediaUrl").val();
			if (url != undefined && url.length > 0) {
				window.open(url);
			} else {
				doMediaSearch();
			}
		}
	});
	$(".search-txt").keypress(function(event) {
		if (event.which == 13) {
			if (sel.indexOf("����") > -1) {
				doSearch('', '');
			} else {
				var url = $("#mediaUrl").val();
				if (url != undefined && url.length > 0) {
					window.open(url);
				} else {
					doMediaSearch();
				}
			}
		}
	});

	//�������
	$("#sele-id").hover(function() {
		$(this).find("ul").show();
	}, function() {
		$(this).find("ul").hide();
	});

	var searchId = $("#newsSearch");
	var searchValue = searchId.val();
	searchId.focus(function() {
		$(this).val("").css("color", "#333");
	}).blur(function() {
		if ($(this).val() == "") {
			$(this).val(searchValue);
		}
		$(this).css("color", "#CDCDCD");
	});

	var searchMedia = $("#mediaSearch");
	var searchMediaValue = searchMedia.val();
	searchMedia.focus(function() {
		$(this).val("").css("color", "#333");
	}).blur(function() {
		if ($(this).val() == "") {
			$(this).val(searchMediaValue);
		}
		$(this).css("color", "#CDCDCD");
	});
});