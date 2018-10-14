rendering
renderPagesButtonsOn: html
	self pagesButtonsToRender
		do: [ :int | 
			html button
				class: #'mdl-color-text--accent mdl-pagination__current' if: self currentPage = int;
				onClick: [ self jsAjaxPageChangedCallback: [ self currentPage: int ] on: html ] if: self updateBlock isNotNil;
				with: int ]