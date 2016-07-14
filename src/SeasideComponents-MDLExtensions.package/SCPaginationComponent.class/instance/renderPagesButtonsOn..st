rendering
renderPagesButtonsOn: html
	self pagesButtonsToRender do: [ :int | 
			self currentPage = int
				ifFalse: [ html anchor
						callback: [ self currentPage: int ];
						with: [ html button with: int; yourself ] ]
				ifTrue: [ html button class: #current; with: int ] ]