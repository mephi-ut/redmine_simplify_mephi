// Is based on https://github.com/bdemirkir/sidebar_hide

if (typeof(setCookie) != 'function') {
	function setCookie(c_name, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
		document.cookie = c_name + "=" + c_value + ";path=/";
	}
}

if (typeof(getCookie) != 'function') {
	function getCookie(c_name) {
		var i;
		var x;
		var y;
		var ARRcookies = document.cookie.split(";");
		for (i = 0; i < ARRcookies.length; i++) {
			x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
			y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
			x = x.replace(/^\s+|\s+$/g, "");
			if (x == c_name)
			return unescape(y);
		}
	}
}

function hideLeftBar()
{
	if ($('#left-menu').is(':visible')) {
		$('#left-menu').addClass('leftbar_hidden');
		$('#top-menu-top').addClass('leftbar_hidden');
		$('#hideLeftbarButton').addClass('leftbar_hidden');
		setCookie('leftbar_hide', 'hide', 100);
	} else {
		$('#left-menu').removeClass('leftbar_hidden');
		$('#top-menu-top').removeClass('leftbar_hidden');
		$('#hideLeftbarButton').removeClass('leftbar_hidden');
		setCookie('leftbar_hide', 'show', 100);
	}
}

$(function() {
	$('#context-menu').appendTo('#main');
});
