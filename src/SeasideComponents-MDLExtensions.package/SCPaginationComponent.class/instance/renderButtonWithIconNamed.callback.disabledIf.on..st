rendering
renderButtonWithIconNamed: aSymbol callback: aBlock disabledIf: aBoolean on: html
	html mdlButton
		accentColor;
		icon;
		disabled: aBoolean;
		onClick: (self ajaxPageChangedCallback: aBlock from: html) if: (self updateBlock isNotNil and: [ aBoolean not ]);
		with: [ html mdlIcon: aSymbol ]