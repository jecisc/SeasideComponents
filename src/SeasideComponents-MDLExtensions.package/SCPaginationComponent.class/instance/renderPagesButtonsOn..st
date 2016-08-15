rendering
renderPagesButtonsOn: html
	self pagesButtonsToRender
		do: [ :int | 
			html button
				class: #'mdl-color-text--accent mdl-pagination__current' if: self currentPage = int;
				onClick: (self ajaxPageChangedCallback: [ self currentPage: int ] from: html) if: self updateBlock isNotNil;
				with: int ]