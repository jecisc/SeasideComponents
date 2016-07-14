rendering
renderButtonWithIconNamed: aSymbol callback: aBlock disabledIf: aBoolean on: html
	html anchor
		callback: aBlock;
		with: [ html mdlButton
				accentColor;
				icon;
				disabled: aBoolean;
				with: [ html mdlIcon: aSymbol ] ]