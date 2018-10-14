rendering
renderButtonWithIconNamed: aSymbol callback: aBlock disabledIf: aBoolean on: html
	html mdlButton
		accentColor;
		icon;
		disabled: aBoolean;
		onClick: [ self jsAjaxPageChangedCallback: aBlock on: html ] if: (self updateBlock isNotNil and: [ aBoolean not ]);
		with: [ html mdlIcon: aSymbol ]