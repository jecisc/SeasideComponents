rendering
renderPagesButtonsOn: html
	self pagesButtonsToRender
		do: [ :int | 
			html button
				class: #current if: self currentPage = int;
				onClick: (self ajaxPageChangedCallback: [ self currentPage: int ] from: html) if: self updateBlock isNotNil;
				with: int ]