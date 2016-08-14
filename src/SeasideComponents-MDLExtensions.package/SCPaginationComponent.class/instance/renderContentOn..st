rendering
renderContentOn: html
	html div
		class: #'mdl-pagination';
		with: [ self renderPaginationComponentOn: html ]