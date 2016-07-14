tests
testLastPageInExtremCase
	component := SCPaginationComponent numberOfPages: 0.
	component lastPage.
	self assert: component currentPage equals: 0