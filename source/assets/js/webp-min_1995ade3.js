/**
 * @fileOverview WebP Support Detect.
 * @author ChenCheng<sorrycc@gmail.com>
 */(function(){if(this.WebP)return;this.WebP={},WebP._cb=function(e,t){this.isSupport=function(t){t(e)},t(e),(window.chrome||window.opera&&window.localStorage)&&window.localStorage.setItem("webpsupport",e)},WebP.isSupport=function(e){if(!e)return;if(!window.chrome&&!window.opera)return WebP._cb(!1,e);if(window.localStorage&&window.localStorage.getItem("webpsupport")!==null){var t=window.localStorage.getItem("webpsupport");WebP._cb(t==="true",e);return}var n=new Image;n.src="data:image/webp;base64,UklGRjoAAABXRUJQVlA4IC4AAACyAgCdASoCAAIALmk0mk0iIiIiIgBoSygABc6WWgAA/veff/0PP8bA//LwYAAA",n.onload=n.onerror=function(){WebP._cb(n.width===2&&n.height===2,e)}},WebP.run=function(e){this.isSupport(function(t){t&&e()})}})();