javascript
jsAjaxPageChangedCallback: callback on: html
	^ html jQuery ajax
		callback: callback;
		context: (JSStream on: 'this');
		onSuccess:
			(html jQuery
				script: [ :s | 
					s
						<<
							((html jQuery this parents: #'.mdl-pagination') load
								html: [ :ajaxHtml | self renderPaginationComponentOn: ajaxHtml ]).
					self updateBlock value: s value: html ])