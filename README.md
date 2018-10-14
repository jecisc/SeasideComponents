# SeasideComponents
Master: [![Build Status](https://travis-ci.org/jecisc/SeasideComponents.svg?branch=master)](https://travis-ci.org/jecisc/SeasideComponents) | Development: [![Build Status](https://travis-ci.org/jecisc/SeasideComponents.svg?branch=development)](https://travis-ci.org/jecisc/SeasideComponents)

For now this is just a little Bazard for some on my Seaside components.
If I have many I might push it in the seaside community.

This project is supported *at least* in Pharo 5 and 6.

## Installation

Install in your Pharo image:

```Smalltalk
    Metacello new
    	githubUser: 'jecisc' project: 'SeasideComponents' commitish: 'master' path: 'src';
    	baseline: 'SeasideComponents';
    	load
```
    	
Add to your project configuration:

```Smalltalk
    spec
    	baseline: 'SeasideComponents'
    	with: [ spec repository: 'github://jecisc/SeasideComponents:master/src' ]
```

Or

```Smalltalk
    spec
    	baseline: 'SeasideComponents'
    	with: [ spec repository: 'github://jecisc/SeasideComponents:development/src' ]
```

Then includes the file library to your application.

```Smalltalk
	(WAAdmin register: self asApplicationAt: 'myApplication')
		addLibrary: JQDeploymentLibrary;
		addLibrary: MDLLibrary;
		addLibrary: SCLibrary 
```
	
## MDL Extensions

Those components depend on the [Material Design Lite project](http://smalltalkhub.com/#!/~KevinLanvin/MaterialDesignLite) and implements some components are not covered by the `Material Design` standard.

### How to use

The components should all work as a normal Seaside component. 
All components have some examples in there class comments. 

I order to use the components you should define some colors specific rules for your application in your css. To do so, just define:

```CSS
    .mdl-pagination__current{
        box-shadow: inset 0px -4px 0px 0px #XXXXXX !important;
    }
```

Where `XXXXXX` is the hex code of the accent color of your MDL application. 
To find your code you can select the #500 color in the following page: [https://www.materialui.co/colors](https://www.materialui.co/colors) 

### Pagination Widget

The pagination widget allow the user to easily paginate some content on his page. 
You can either use it to just manage the pages then use the #currentPage to manage your page on the refresh or pass a block that will have the responsibility to update your page with some ajax. 

Here is a screen of the component in use: 

![Pagination Widget](https://raw.githubusercontent.com/jecisc/SeasideComponents/master/Resources/Screens/Pagination.png)

For more information look at the class comment of `SCPaginationWidget`.

Examples:

```Smalltalk
	| myColl |
	myColl := 1 to: 150.
	(SCPaginationComponent numberOfPages: [ myColl size / 24 roundUpTo: 1 ]) 	"Note the use of a block. If my collection change, the number of pages will be updated."
		adjacentsPagesToShow: 3;
		yourself
```
				
			
Using Ajax to refresh the page:

```Smalltalk
	SCPaginationComponent
		numberOfPages: [ self numbersOfPages ]
		updateBlock: [ :s :html | 
			(s << (html jQuery id: #'main-content') load)
				html: [ :ajaxHtml | self renderMainContentOn: ajaxHtml ];
				onComplete: 'componentHandler.upgradeDom();' ] "The onComplete will update réinitialize the MDL elements"
```
