tests
testFirstPageInExtremCase
	component := SCPaginationComponent numberOfPages: 0.
	component firstPage.
	self assert: component currentPage equals: 0