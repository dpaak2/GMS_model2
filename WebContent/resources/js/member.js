/**
 * member javaScript
 */
var app=(function(){ /*god 을 만드는것 */
	var init = function(ctx){
		session.init(ctx);
	};
	var ctx=function(){
		return session.getContextPath();
	};
	var js=function(){
		return session.getJavaScriptPath();
	};
	var img=function(){
		return session.getImgPath();
	};
	var css=function(){};
	return session.getCSSPath();
})();

var session =(function(){
	/*생성자*/
	var init=function(ctx){
		/*setter*/
		sessionStorage.setItem('ctx',ctx);
		sessionStorage.setItem('js','/resources/js');
		sessionStorage.setItem('img','/resources/img');
		sessionStorage.setItem('css','/resources/css');
	};
	/*getter*/
	var getContextPath=function(){
		return sessionStorage.getItem('ctx');
	};
	var getJavaScriptPath= function(){
		return sessionStorage.getItem('js');
	};
	var getImgPath= function(){
		return sessionStorage.getItem('img');
	};
	var getCSSPath= function(){
		return sessionStorage.getItem('css');
	};
	
	/*객체 리턴   closure 에 대한 개념이다 */
	return {
		/*key : value*/
		init:init,
		getContextPath:getContextPath,
		getJavaScriptPath:getJavaScriptPath,
		getImgPath:getImgPath,
		getCSSPath:getCSSPath
	}
})();


