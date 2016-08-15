scripts
importCss
	"This is specific to me (Cyril Ferlicot). Since I am the only one to commit for now it is enough."

	<script>
	| file |
	file := FileSystem workingDirectory / '..' / '..' / 'GitRepositories' / 'SeasideComponents' / 'Resources' / 'Css' / 'SeasideComponents.css'.
	self addFileNamed: file basename contents: file contents.
	self class methods detect: [ :m | m selector = (self default asSelector: file basename) ] ifFound: [ :m | m protocol: #css ]